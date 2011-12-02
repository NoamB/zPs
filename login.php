<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * login.php
 * ---------------------
 * This page handles user login,
 * cookies, sessions and such.
 */
 
// make sure we got here indirectly
require_once('./includes/config.php');
if (!defined('INSIDE_INDEX')) {
    Header ('Location: '.$siteurl.'/index.php?p=404') or die();
}

$errmsg = '';
$pagetitle = "zPs Log-In page";

// TEMP: if logged in just display cookie/session info
if (isset($_SESSION['u_id'])) { // user is already logged in
	if ($_SERVER['REMOTE_ADDR']!=$_SESSION['u_ip']) {
	    $_SESSION['u_ip'] = $_SERVER['REMOTE_ADDR'];
		$u_ip = $_SESSION['u_ip'];
		$query = "UPDATE user SET u_ip = '$u_ip' WHERE u_id = $u_id";
		$DB->query($query);
	}

	if (isset($_COOKIE['cookie'])) { // user has a cookie set
	    foreach ($_COOKIE['cookie'] as $name => $value) {
       		//echo "COOKIE : $name : $value <br />\n";
			eval('$main .="COOKIE : $name : $value <br />\n";');
  		}
	}
	else {
	    foreach ($_SESSION as $name => $value) {
       		//echo "SESSION : $name : $value <br />\n";
			eval('$main .="SESSION : $name : $value <br />\n";');
  		}	
	}
}

else if (isset($_POST['u_name'])) { // user is trying to log in
	$ref = $_POST['ref']; // referring page
	$checkLogin = checkLogin($_POST['u_name'],$_POST['u_pass']);
	
	switch($checkLogin){
			case 0: // empty fields
				eval('$errmsg ="' . getTemplate('error_empty_fields') . '";');
				eval('$main ="' . getTemplate('main_login_form') . '";');
				break;
			case -1: // bad user name
				eval('$errmsg ="' . getTemplate('error_invalid_user') . '";');
				eval('$main ="' . getTemplate('main_login_form') . '";');
				break;
			case -2: // bad password
				eval('$errmsg ="' . getTemplate('error_invalid_pass') . '";'); 
				eval('$main ="' . getTemplate('main_login_form') . '";');
				break;
			default:
				
				$u_name = $_POST['u_name'];
				$u_id = intval(getUserId($u_name));
				$u_pass = $_POST['u_pass'];
				$u_level = getUserLevel($u_id);
				$u_ip = $_SERVER['REMOTE_ADDR'];
				
				// set session vars
				$_SESSION['u_id'] = $u_id;
				$_SESSION['u_name'] = $u_name;
				$_SESSION['u_pass'] = md5($u_pass);
				$_SESSION['u_level'] = $u_level;
				$_SESSION['u_ip'] = $u_ip;
                $_SESSION['u_lastlogin'] = NOW;
                // get user info;
                $query = "SELECT u_lastlogout FROM user WHERE u_id = $u_id";
                $userinfo = $DB->query_one($query);
                $_SESSION['u_lastlogout'] =  $userinfo['u_lastlogout'];
				
				// set cookie if needed
				$login_type = addslashes(trim($_POST['login_type']));
				if ($login_type == 'const') {
				    $expireTime = 60*60*24*100; // 100 days
					zpsCookie($expireTime);
				}
				
				// update last login date
				$u_lastlogin = NOW;
				$query = "UPDATE user SET u_lastlogin = '$u_lastlogin',u_ip = '$u_ip' WHERE u_id = $u_id";
				$DB->query($query);
				
				// update online count
				$lately = NOW - 60*5;
				$o_id = $_SESSION['u_id'];
				$o_ip = $_SERVER['REMOTE_ADDR'];
				$query = "DELETE FROM online WHERE o_id = 0 AND o_ip = '$o_ip'";
				$DB->query($query);
				
				$query = "INSERT INTO online (o_date,o_ip,o_id)
				VALUES 
				('". NOW ."', '$o_ip', $o_id)";
				$DB->query($query);

				$ref = urldecode($ref);
				$location = $siteurl.'/?'.$ref;
				// take us to home page
				Header ('Location: '.$location) or die();
		} // end switch
}

else { // user is not logged in
	$ref = $_GET['ref']; // referring page
	eval('$main .="' . getTemplate('main_login_form') . '";');
}
?>