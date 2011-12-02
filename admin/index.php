<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * admin/index.php
 * ---------------------
 * This page creates the frame for all admin pages.
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
$init = 'admin';
require_once('../includes/init.php');
require_once('../includes/functions_templates.php');

// ################## PREPARE VARS #############################
$page=$_GET['p'];
$ref=urlencode(assoc_implode('&',$_GET));

// ################## PRE-CACHE TEMPLATES ######################
$usedTemplates = array(
'admin_headinclude',
'admin_bodytag',
'admin_header',
'admin_footer',
'admin_home',
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
	case ("templates"):
		require_once('./templates.php');
		break;
    case ("forums"):
        require_once('./forums.php');
        break;
    case ("users"):
        require_once('./users.php');
        break;
	default:
		break;
}

// ################## PREPARE BASE TEMPLATES ###################
	eval('$headinclude = "'.getTemplate('admin_headinclude').'";');
	eval('$bodytag = "'.getTemplate('admin_bodytag').'";');
	eval('$header = "'.getTemplate('admin_header').'";');
	eval('$footer = "'.getTemplate('admin_footer').'";');
	eval('$output .="' .getTemplate('admin_home'). '";');
	
printOutput($output);
?>