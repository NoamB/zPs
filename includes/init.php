<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * includes/init.php
 * ---------------------
 * This page starts the DB connection
 * and prepares other required variables.
 */

// ################## PREPARE VARS ######################
define('NOW', date('Y-m-d H:i:s'));
define('UNIXNOW', time());

if ($init!='admin' && $init!='user') {die('init failed');}

$ACCESS = array();
// Admin Sections Access
$ACCESS['sections'] = array(
    'canviewsite'             => 1,
    'canreply'                => 2,
    'caneditown'              => 4,
    'candelown'               => 8,
    'candelowntree'           => 16,
    'canmakedisc'             => 32,
    'candelowndisc'           => 64,
    'caneditnews'             => 128,
    'canmakenews'             => 256
);

// Moderator Access
$ACCESS['moderator'] = array(
    'news'                   => 1,
    'templates'              => 2,
    'users'                  => 4,
    'forums'                 => 8,
    'canopenclose'           => 16,
    'canannounce'            => 32,
    'canmoderateposts'       => 64,
    'canmoderateattachments' => 128,
    'canmassmove'            => 256,
    'canmassprune'           => 512,
    'canviewips'             => 1024,
    'canviewprofile'         => 2048,
    'canbanusers'            => 4096,
    'canunbanusers'          => 8192,
    'newthreademail'         => 16384,
    'newpostemail'           => 32768,
    'cansetpassword'         => 65536,
    'canremoveposts'         => 131072,
    'caneditsigs'            => 262144,
    'caneditavatar'          => 524288,
    'caneditpoll'            => 1048576,
    'caneditprofilepic'      => 2097152,
    'caneditreputation'      => 4194304
);

// ################## INCLUDE BASE FILES ######################
// it's possible to set -(include_path = ".;C:/Program Files/Apache Group/Apache2/htdocs/site1/includes")
// in php.ini and then admin_init.php would be unneeded
if ($init==='admin') {
    require_once('../includes/config.php');
    require_once('../includes/db.php');
    require_once('../includes/functions.php');
}
else {
    require_once('./includes/config.php');
    require_once('./includes/db.php');
    require_once('./includes/functions.php');
}

// ################## CREATE DATABASE CONNECTION ##############
$DB = new dbClass;
$DB->database = $db_name;
$DB->connect($db_host, $db_username, $db_password, 1);

// ################## SESSION START ############################
session_start();
// get cookie data
cookie_to_session();

$t_cache = array();
?>