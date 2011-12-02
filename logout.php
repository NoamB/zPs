<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * logout.php
 * ---------------------
 * This page handles user logout,
 * unsetting sessions/cookies.
 */
error_reporting(E_ALL & ~E_NOTICE);

// ################## INDEX CHECK ##################################
require_once('./includes/config.php');
if (!defined('INSIDE_INDEX')) {
    Header ('Location: '.$siteurl.'/?p=404') or die();
}

// ################## INCLUDE FILES ################################

// ################## PREPARE VARS #################################
$pagetitle = "zPs Log-Out page";

// if user is logged in
if (isset($_SESSION['u_id'])) {
    $u_id = $_SESSION['u_id'];
    // update u_lastlogout
    $query = "UPDATE user SET u_lastlogout = '" . NOW . "' WHERE u_id = $u_id";
    $DB->query($query);
	// deduct from online count
	$lately = NOW - 60*20;
	$o_id = $_SESSION['u_id'];
	$query = "DELETE FROM online WHERE o_id = $o_id";
	$DB->query($query);
	
	$_SESSION = array();
	session_destroy();
}

// if the user has cookies set
if (isset($_COOKIE['cookie'])) {
	$expireTime = -3600;
	zpsCookie($expireTime);
}

$ref = urldecode($ref);
$location = $siteurl.'/?p='.$page.'&'.$ref;
// take us to home page
Header ('Location: '.$location) or die();
?>