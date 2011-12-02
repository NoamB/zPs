<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * user.php
 * ---------------------
 * This page displays a specific user,
 * or the entire user list.
 */

require_once('./includes/init.php');
// make sure we got here indirectly
if (!defined('INSIDE_INDEX')) {
    Header ('Location: '.$siteurl.'/index.php?p=404') or die();
}

require_once('./includes/functions_forum.php');

$pagetitle = "zPs Forum - Users";
$errmsg = '';
$perpage = 50;

// pre-cache these templates
$usedTemplates = array('user_profile','user_list','user_row');
cacheTemplates($usedTemplates);

// Get link vars
$u_id = intval($_GET['u_id']); // user id
$sort = $_GET['sort'];

if (isset($u_id) && !empty($u_id)) {
	// show specific user 
	$query = "SELECT * FROM user WHERE u_id = $u_id";
	$user = $DB->query_one($query);

	$u_name = $user['u_name'];
    $u_posts = $user['u_posts'];
    eval('$main .= "'.getTemplate('user_profile').'";');
}
else {
	// show entire users list
	(empty($sort)) ? $sort = 'name' : $sort ;
	$sort = 'u_'.$sort;
	$query = "SELECT * FROM user ORDER BY $sort ASC";
	$users = $DB->query($query);

	while($user = $DB->fetch_array($users)){
		$u_name = $user['u_name'];
		$u_id = $user['u_id'];
		$u_joindate = $user['u_joindate'];
        eval('$user_rows .= "'.getTemplate('user_row').'";');
	} // while
    eval('$main .= "'.getTemplate('user_list').'";');
}
?>