<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * discussion.php
 * ---------------------
 * This page displays a forum list, 
 * or a list of threads in side a forum.
 */

require_once('./includes/init.php');
// make sure we got here indirectly
if (!defined('INSIDE_INDEX')) {
    Header ('Location: '.$siteurl.'/index.php?p=404') or die();
}

require_once('./includes/functions_forum.php');

$pagetitle = "zPs Forum - Discussions";
$errmsg = '';

// pre-cache these templates
$usedTemplates = array('forum_main',
'forum_discussion_row',
'forum_discussion',
'post_new_form',
'forum_nav_list',
'forum_nav_forum',
'forum_nav_thread',
'forum_nav',
'forum_row',
'forum_new_form',
'error_empty_fields',
'error_invalid_user',
'error_invalid_pass',
'error_invalid_input');
cacheTemplates($usedTemplates);

$f_id = $_GET['f_id'];
$a = $_GET['a'];

// ##################### INSIDE FORUM MODE ###########################
if (isset($f_id) && !empty($f_id) && empty($a)) { // show a specific forum
	
	// navbar stuff here
	$query = "SELECT f_name FROM forum WHERE f_id = $f_id";
	$foruminfo = $DB->query_one($query);
	$f_name = $foruminfo['f_name'];
	eval('$forum_nav_list = "'. getTemplate('forum_nav_list') . '";');
	eval('$forum_nav_forum = "'. getTemplate('forum_nav_forum') . '";');
	eval('$navbar = "'. getTemplate('forum_nav') . '";');
	// end navbar
	
	// select threads and order by last post date
	$query = "SELECT * FROM discussion WHERE f_id = $f_id ORDER BY d_lastdate DESC";
	$threads = $DB->query($query);
	
	$colorswitch = 2;
	while($thread = $DB->fetch_array($threads)){
		if ($colorswitch%2) {
		    $onetwo = 'one';
		}
		else {
			$onetwo = 'two';
		}
		$colorswitch++;
		$d_id = $thread['d_id'];
		$d_name = $thread['d_name'];
		$d_replies = $thread['d_replies'];
		$d_views = $thread['d_views'];
		$d_date = $thread['d_date'];
		$d_by = $thread['d_by'];
		$d_byname = addslashes(getUserName($d_by));
		$d_lastdate = $thread['d_lastdate'];
		$d_lastuser = $thread['d_lastuser'];
		$d_lastusername = addslashes(getUserName($d_lastuser));
		eval('$forum_discussion_row .= "' .getTemplate('forum_discussion_row'). '";');
	} // while
	eval('$main .= "' . getTemplate('forum_discussion') . '";');
}
// ##################### NEW DISCUSSION MODE ###########################
else if (isset($f_id) && $a=='new' && !empty($f_id)) {
	if (isset($_POST['r_body'])) { // if form was sent - process
		$r_name = addslashes(trim($_POST['r_name']));
		$r_pass = addslashes(trim($_POST['r_pass']));
		eval('$action = "$siteurl/?p=forum&f_id='.$f_id.'&a=new";');
		
		// first check login info
		$checkLogin = checkLogin($r_name,$r_pass);
		switch($checkLogin){
			case 0: // empty fields
				eval('$errmsg ="' . getTemplate('error_empty_fields') . '";');
				eval('$post_edit_form ="' . getTemplate('post_new_form') . '";');
				break;
			case -1: // bad user
				eval('$errmsg ="' . getTemplate('error_invalid_user') . '";');
				eval('$post_edit_form ="' . getTemplate('post_new_form') . '";');
				break;
			case -2: // bad password
				eval('$errmsg ="' . getTemplate('error_invalid_pass') . '";'); 
				eval('$post_edit_form ="' . getTemplate('post_new_form') . '";');
				break;
			case 1:
			default:

				$r_title = trim($_POST['r_title']);
				$r_parent = 0;
				$r_lang = $_POST['r_lang'];
				$r_body = trim($_POST['r_body']);
				$ru_id = getUserId($r_name);
				$r_date = NOW;
				
				$r_order = 0;
				$d_id = NULL;

                // wordwrap body
                $r_body = wordwrap($r_body, 150, "\n", 1);
				
				if (isValidText($r_title) && isValidText($r_body)) {
                    $r_body = htmlspecialchars(addslashes($r_body));
                    $r_title = htmlspecialchars(addslashes($r_title));
				    // create new discussion
					$query = "INSERT INTO discussion 
					(d_id,f_id,d_name,d_date,d_by,d_lastdate,d_lastuser)
					VALUES 
					(NULL,$f_id,'$r_title','$r_date',$ru_id, '".NOW."', $ru_id)";
					$DB->query($query);
					// get d_id
					$query = "SELECT d_id FROM discussion 
					WHERE f_id = $f_id AND d_name = '$r_title' AND d_date = '$r_date' AND d_by = $ru_id";
					$result = $DB->query_one($query);
					$d_id = $result['d_id'];

					// lock tables
					$query = "LOCK TABLES post_header WRITE,post_body WRITE, discussion WRITE";
					$DB->query($query);
					// insert header
					$query = "INSERT INTO post_header 
					(p_id, d_id, u_id, p_parent, p_order, p_date, p_edit)
					VALUES
					(NULL, $d_id, $ru_id, $r_parent, $r_order, '".NOW."', '".NOW."')";
					$DB->query($query);
					// insert body
					$query = "INSERT INTO post_body 
					(p_id, p_body, p_lang) 
					VALUES 
					(NULL, '$r_body', '$r_lang')";
					$DB->query($query);
					// unlock tables
					$query = "UNLOCK TABLES";
					$DB->query($query);
					
					// update forum discs/posts
					$query = "UPDATE forum SET f_discs=f_discs+1,f_posts=f_posts+1 WHERE f_id=$f_id";
					$DB->query_one($query);
                    // update user post count
                    $query = "UPDATE user SET u_posts=u_posts+1 WHERE u_id=$ru_id";
                    $DB->query($query);

					$location = $siteurl.'/?p=post&d_id='.$d_id.'&pn='.$pn;
					(isset($p_id)) ? $location .= '#'.$p_id : $location ;
					Header ('Location: '.$location) or die();
					//
				}
				else {
					eval('$errmsg ="' . getTemplate('error_invalid_input') . '";');
					eval('$post_edit_form ="' . getTemplate('post_new_form') . '";');
                    // display form for new discussion
                    eval('$action = "$siteurl/?p=forum&f_id='.$f_id.'&a=new";');
                    eval('$main .="' . getTemplate('forum_new_form') . '";');
				}
		}
	}
	else {
		// display form for new discussion
		eval('$action = "$siteurl/?p=forum&f_id='.$f_id.'&a=new";');
		eval('$main .="' . getTemplate('forum_new_form') . '";');
	}
}
// ##################### ALL FORUMS MODE ###########################
else {// show all forums
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
		eval('$forum_row .= "' . getTemplate('forum_row') . '";');
	} // while
	eval('$main .= "' . getTemplate('forum_main') . '";');
}
?>