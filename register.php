<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * register.php
 * ---------------------
 * This page handles all stages of registration,
 * including displaying rules and registration form.
 */
 
// make sure we got here indirectly
require_once('./includes/config.php');
// ########## BLOCK DIRECT ACCESS #############
if (!defined('INSIDE_INDEX')) {
    Header ('Location: '.$siteurl.'/index.php?p=404') or die();
}
// ############################################

// ########### INIT STRINGS ###################
$errmsg = '';
// ############################################

// ---------------------------------------------------------
// user is already logged in!
if (isset($_SESSION['u_id'])) { 
		eval('$main ="' . getTemplate('error_already_registered') . '";');
}
// ---------------------------------------------------------
// STEP 3 - user is trying to register
else if (isset($_POST['u_name'])) { 
	// get POST vars
	$u_name = addslashes(trim($_POST['u_name']));
	$u_pass = addslashes(trim($_POST['u_pass']));
	$u_email = trim($_POST['u_email']);
	
	// check for empty fields
	if (empty($u_name)||empty($u_pass)||empty($u_email)) {
		eval('$errmsg ="' . getTemplate('error_empty_fields') . '";');
		// Define where we are
		$pagetitle = "zPs Registration page - step 2: Fill Form";
		eval('$main .="' . getTemplate('register_step_2') . '";'); 
	}
	// check for invalid email
	else if (!isValidEmail($u_email)) {
		eval('$errmsg ="' . getTemplate('error_invalid_email') . '";');
		// Define where we are
		$pagetitle = "zPs Registration page - step 2: Fill Form";
		eval('$main .="' . getTemplate('register_step_2') . '";');         
	}
	// check for duplicate users
	else if (getUserId($u_name)) {
		eval('$errmsg ="' . getTemplate('error_user_exists') . '";');
		unset($u_name); // so it won't appear in form
		$pagetitle = "zPs Registration page - step 2: Fill Form";
	    eval('$main .="' . getTemplate('register_step_2') . '";');
	}
	else { // no error in form, insert data to DB
		$u_pass = md5($u_pass);
		$u_joindate = NOW;
		$u_lastlogin = $u_joindate;
		
		$query = "INSERT INTO user 
		(u_level,u_name,u_pass,u_email,u_joindate,u_lastlogin,u_posts)
		VALUES 
		(0,'$u_name','$u_pass','$u_email','$u_joindate','$u_lastlogin',0)";
		$DB->query($query);
		
		// insert activation data
		$u_id = getUserId($u_name);
		$u_code = rand(10000,100000);
		
		$query = "INSERT INTO user_activate 
		(u_id,u_code)
		VALUES 
		($u_id,$u_code)";
		$DB->query($query);
		
		// all went well
		$errmsg = '<p><b>New User Inserted!</b></p>';
		
		// send mail to user
		$subject = 'zPs registration';
		$mailcontent = 'User Name: '.$u_name."\n"
		.'Activation Code: '.$u_code."\n";
		$fromaddress = 'From: webserver@zps.com';
		mail($u_email, $subject, $mailcontent, $fromaddress);
		
		// create page
		$pagetitle = "zPs Registration page - step 3: Activate by email";
		eval('$main .="' . addslashes(getTemplate('register_step_3')) . '";');
	}
}
// ----------------------------------------------------------------
// STEP 2 - user accepted rules
else if (isset($_POST['accepted_rules'])) { 
	$pagetitle = "zPs Registration page - step 2: Fill Form";
	eval('$main .="' . getTemplate('register_step_2') . '";'); 
}
// ----------------------------------------------------------------
// STEP 1 - user still hasn't accepted rules
else {
	$pagetitle = "zPs Registration - step 1: Read Rules";
	eval('$main .="' . getTemplate('register_step_1') . '";');
}
// ----------------------------------------------------------------
?>