<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * admin/forums.php
 * ---------------------
 * This page handles all operations on forums,
 * including creating and deleting.
 */

// make sure we got here indirectly
require_once('../includes/config.php');
// ########## BLOCK DIRECT ACCESS #############
if (!defined('INSIDE_INDEX')) {
    Header ('Location: '.$siteurl.'/index.php?p=404') or die();
}
// ############################################

// ########## CHECK USER LEVEL ################
if ($_SESSION['u_level']!=3) { // if not admin
    if (isset($_SESSION['u_id'])) {
        Header ('Location: '.$siteurl.'/index.php?p=401') or die();
    }
    // else send to login
    Header ('Location: '.$siteurl.'/index.php?p=login') or die();
}
// ############################################

// ########### INIT STRINGS ###################
$pagetitle = "zPs Admin Panel - Forums";
$errmsg = '';
// ############################################

require_once('../includes/functions_forum.php');

// pre-cache these templates
$usedTemplates = array('forum_admin_main','forum_admin_row','forum_admin_form','error_invalid_input');
cacheTemplates($usedTemplates);

$f_id = $_GET['f_id'];
$a = $_GET['a'];

if (isset($a) && !empty($a)) {
    if ($a=='new') {
        // display 'create new forum' form
        eval('$action = "$adminurl/?p=forums&a=insert";');
        eval('$main .= "' . getTemplate('forum_admin_form') . '";');
    }
    else if ($a=='edit' && !empty($f_id)) {
        $query = "SELECT * FROM forum WHERE f_id=$f_id";
        $target = $DB->query_one($query);

        $f_name = $target['f_name'];

        // display 'edit forum' form
        eval('$action = "$adminurl/?p=forums&a=update&f_id=$f_id";');
        eval('$main .= "' . getTemplate('forum_admin_form') . '";');
    }
    else if ($a=='insert') {
        // verify data and insert
        $f_name = $_POST['f_name'];

        if (isValidText($f_name)) {
            $query = "INSERT INTO forum (f_name) VALUES ('$f_name')";
            $DB->query($query);
            $location = $adminurl.'/?p=forums';
            Header ('Location: '.$location) or die();
        }
        else {
            eval('$errmsg ="' . getTemplate('error_invalid_input') . '";');
            eval('$action = "$adminurl/?p=forums&a=insert";');
            eval('$main .= "' . getTemplate('forum_admin_form') . '";');
        }
    }
    else if ($a=='update' && !empty($f_id)) {
        // verify data and insert
        $f_name = $_POST['f_name'];

        if (isValidText($f_name)) {
            $query = "UPDATE forum SET f_name='$f_name' WHERE f_id=$f_id";
            $DB->query($query);
            $location = $adminurl.'/?p=forums';
            Header ('Location: '.$location) or die();
        }
        else {
            eval('$errmsg ="' . getTemplate('error_invalid_input') . '";');
            eval('$action = "$adminurl/?p=forums&a=update&f_id=$f_id";');
            eval('$main .= "' . getTemplate('forum_admin_form') . '";');
        }
    }
    else if ($a=='delete' && !empty($f_id)) {
        // get all discussions
        $query = "SELECT d.d_id,ph.u_id,ph.p_id,ph.p_parent
         FROM discussion AS d,post_header AS ph
          WHERE d.f_id=$f_id AND ph.d_id=d.d_id AND ph.p_parent=0";
        $discs = $DB->query($query);

        while ($disc = $DB->fetch_array($discs)) {
            $d_id = $disc['d_id'];
            $p_id = $disc['p_id'];
            $u_id = $disc['u_id'];

            // delete 1st post and children
            $query = "DELETE FROM post_header,post_body
            USING post_header,post_body
            WHERE post_header.p_id = $p_id AND post_body.p_id = $p_id";
            $DB->query($query);

            // update user post count
            $query = "UPDATE user SET u_posts=u_posts-1 WHERE u_id=$u_id";
            $DB->query($query);
            $deleted = delTree($p_id) + 1;
            // delete all discussions
            $query = "DELETE FROM discussion WHERE d_id=$d_id";
            $DB->query($query);
        }
        // delete forum
        $query = "DELETE FROM forum WHERE f_id=$f_id";
        $DB->query($query);

        $location = $adminurl.'/?p=forums';
        Header ('Location: '.$location) or die();
    }
}
else {
    // get forum list
    $query = "SELECT * FROM forum ORDER BY f_order ASC";
    $forums = $DB->query($query);

    $colorswitch = 2;
    while($forum = $DB->fetch_array($forums)){
        if ($colorswitch%2) {
            $onetwo = 'one';
        }
        else {
            $onetwo = 'two';
        }
        $colorswitch++;
        $f_id = $forum['f_id'];
        $f_name = $forum['f_name'];
        $f_discs = $forum['f_discs'];
        $f_posts = $forum['f_posts'];
        eval('$forum_row .= "' . getTemplate('forum_admin_row') . '";');
    } // while
    eval('$main .= "' . getTemplate('forum_admin_main') . '";');
}
?>