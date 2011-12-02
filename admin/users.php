<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * admin/users.php
 * ---------------------
 * This page handles all operations on users,
 * including editing and deleting.
 */
error_reporting(E_ALL & ~E_NOTICE);

// ################## INDEX CHECK ##################################
if (!defined('INSIDE_INDEX')) {
    require_once('../includes/config.php');
    Header ('Location: '.$siteurl.'/index.php?p=404') or die();
}

// ################## ACCESS CHECK #################################
if ($_SESSION['u_level']!=3) { // if not admin
    if (isset($_SESSION['u_id'])) {
        Header ('Location: '.$siteurl.'/index.php?p=401') or die();
    }
    // else send to login
    Header ('Location: '.$siteurl.'/index.php?p=login') or die();
}

// ################## INCLUDE FILES ################################
require_once('../includes/functions_templates.php');
require_once('../includes/functions_forum.php');

// ################## PREPARE VARS #################################
$pagetitle = "zPs Admin Panel - Users";
$errmsg = '';
$perpage = 5;

$u_id = $_GET['u_id'];
$pn = $_GET['pn'];
$a = $_GET['a'];

// get page number
if (is_numeric($pn)) {
    $pn = intval($pn);
    $begin = (($pn-1)*$perpage);
    $end = $begin + $perpage;
}
else {
    $pn = 1;
    $begin = 0;
    $end = $begin + $perpage;
}

// check $a
if ($a!='reply' && $a!='edit' && $a!='del' && $a!='mark') {
    unset($a);
}

// ################## PRE-CACHE TEMPLATES ##########################
$usedTemplates = array('template_form',
'template_display_cat',
'template_display_row',
'template_display',
'error_empty_fields',
'error_template_exists');
cacheTemplates($usedTemplates);

// ################## ACT BY ACTION ################################
if (!empty($a)) {
    if ($a=='new') {
        // display 'create new user' form

    }
    else if ($a=='edit' && !empty($f_id)) {

    }
    else if ($a=='insert') {

    }
    else if ($a=='update' && !empty($u_id)) {

    }
    else if ($a=='delete' && !empty($u_id)) {

    }
}
else {
// ################## GET USERS LIST ################################
    (empty($sort)) ? $sort = 'name' : $sort ;
    $sort = 'u_'.$sort;

    // get page count
    $query = "SELECT COUNT(*) AS usercount FROM user";
    $num_users = $DB->query_one($query);
    $num_pages = ceil(($num_users['usercount']-1)/$perpage);
    ($num_pages==0) ? $num_pages=1 : $num_pages=$num_pages;
    $num_users = $num_users['usercount'];

    // get relevant users
    $query = "SELECT * FROM user ORDER BY $sort ASC LIMIT $begin,$perpage";
    $users = $DB->query($query);

    while($user = $DB->fetch_array($users)){
        $u_name = $user['u_name'];
        $u_id = $user['u_id'];
        $u_joindate = $user['u_joindate'];
        eval('$user_rows .= "'.getTemplate('user_row').'";');
    } // while

    $pagination = makePagination($num_pages,$pn,$adminurl,$ref);

    eval('$main .= "'.getTemplate('user_list').'";');
}
?>