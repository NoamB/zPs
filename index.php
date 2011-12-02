<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * index.php
 * ---------------------
 * This page creates the frame for all user pages.
 *
 */
error_reporting(E_ALL & ~E_NOTICE);

// ################## GET PAGE START ###########################
$starttime = microtime();

// ################## INDEX DEFINITION #########################
define('INSIDE_INDEX', true); 
// this constant lets included pages know that
// they were called as includes from index.php

// ################## INCLUDE FILES ############################
$init = 'user';
require_once('./includes/init.php');
require_once('./includes/functions_templates.php');

// ################## PREPARE VARS #############################
$page=$_GET['p'];
$ref=$_GET['ref'];
if (empty($ref)) {
    $ref=urlencode(assoc_implode('&',$_GET));
}

// get u_lastlogout
if (isset($_SESSION['u_lastlogout'])) {
    //echo 'NOW='.NOW.' and time is '.time().'<br>';
    //echo 'session='.$_SESSION['u_lastlogout'].'<br>';
    $u_lastlogout = strtotime($_SESSION['u_lastlogout']);
    //echo 'u_lastlogoutA='.$u_lastlogout.'<br>';
}
else {
    $_SESSION['u_lastlogout'] = NOW;
    $u_lastlogout = strtotime($_SESSION['u_lastlogout']);
    //echo 'u_lastlogoutB='.$u_lastlogout.'<br>';
}

$query = "SELECT d.*,ph.p_date FROM discussion AS d, post_header AS ph
WHERE d.d_id = ph.d_id AND UNIX_TIMESTAMP(ph.p_date) > $u_lastlogout GROUP BY d.d_id ORDER BY ph.p_date DESC";
$newposts = $DB->query($query);
$num_newposts = $DB->num_rows($newposts);

// ################## PRE-CACHE TEMPLATES ######################
$usedTemplates = array(
'main_headinclude',
'main_bodytag',
'main_header',
'main_footer',
'main_home',
'main_bar_logged',
'main_bar_unlogged',
'error_401',
'error_404'
);
cacheTemplates($usedTemplates);

// ################## ONLINE STATUS ############################
if (isset($_SESSION['u_id'])) {
	eval('$logincode .= "' . getTemplate('main_bar_logged') . '";');
	$o_id = $_SESSION['u_id'];
}
else {
	eval('$logincode .= "' . getTemplate('main_bar_unlogged') . '";');
	$o_id = 0;
}

$o_ip = $_SERVER['REMOTE_ADDR'];
$lately = NOW - 60*5;
$query = "SELECT * FROM online WHERE o_id = $o_id AND o_ip = '$o_ip' AND o_date>$lately";
$online = $DB->query($query);
if($DB->num_rows($online)) {
    // user is allready in online count
    $query = "UPDATE online SET o_date = '". NOW ."' WHERE o_id=$o_id AND o_ip = '$o_ip'";
    $DB->query($query);
}
else {
    // user will be added to online count
    $query = "DELETE FROM online WHERE o_id = $o_id";
    $DB->query($query);
    $query = "INSERT INTO online (o_date,o_ip,o_id)
    VALUES
    ('". NOW ."', '$o_ip', $o_id)";
    $DB->query($query);
}

$query = "SELECT o.*,u.u_name,u.u_level FROM online AS o,user AS u
 WHERE o.o_date>$lately AND o.o_id = u.u_id AND NOT o.o_id = 0
  GROUP BY o.o_ip,o.o_id ORDER BY u.u_name";
$members = $DB->query($query);
$members_num = $DB->num_rows($members);
$query = "SELECT * FROM online WHERE o_date>$lately AND o_id = 0 GROUP BY o_ip";
$guests = $DB->query($query);
$guests_num = $DB->num_rows($guests);

// ################## GET REQUESTED PAGE #######################
switch($page) {
    case ("401"):
		// no permission
		eval('$main = "'.getTemplate('error_401').'";');
		break;
	case ("404"):
		// page not found
		eval('$main = "'.getTemplate('error_404').'";');
		break;
	case ("register"):
		require_once('./register.php');
		break;
	case ("user"):
		require_once('./user.php');
		break;
	case ("login"):
		require_once('./login.php');
		break;
	case ("logout"):
		require_once('./logout.php');
		break;
	case ("activate"):
		require_once('./activate.php');
		break;
	case ("post"):
		require_once('./post.php');
		break;
	case ("forum"):
		require_once('./forum.php');
		break;
    case ("online"):
        require_once('./online.php');
        break;
    case ("news"):
    default:
        require_once('./news.php');
        break;
}

// ################## PREPARE BASE TEMPLATES ###################
	eval('$headinclude = "'.getTemplate('main_headinclude').'";');
	eval('$bodytag = "'.getTemplate('main_bodytag').'";');
	eval('$header = "'.getTemplate('main_header').'";');
	eval('$footer = "'.getTemplate('main_footer').'";');
	eval('$output .="' .getTemplate('main_home'). '";');
	
printOutput($output);
?>