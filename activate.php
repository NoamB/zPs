<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * activate.php
 * ---------------------
 * This page handles user account activation.
 * 
 */
 
// make sure we got here indirectly
if (!INSIDE_INDEX) {
    Header ('Location: '.$siteurl.'/index.php?p=404') or die();
}

$errmsg = '';
$pagetitle = "zPs Activation page";

if (isset($_POST['u_name'])) { // user is trying to activate
	$u_name = addslashes(trim($_POST['u_name']));
	$u_code = trim($_POST['u_code']);
	
	// check for empty fields
	if (empty($u_name)||empty($u_code)) {
		eval('$errmsg ="' . getTemplate('error_empty_fields') . '";'); 
		eval('$main .="' . getTemplate('register_activate_step_1') . '";');  
	}
	// fields are filled
	else { 
		$u_id = getUserId($u_name);
		if (!$u_id) { // check for bad user name
			$errmsg = '<p><b>Error! - Invalid User Name</b></p>'; 
			eval('$main .="' . getTemplate('register_activate_step_1') . '";');
		}
		// check for bad (non-numeric) activation code
		else if (!is_numeric($u_code)) {
			$errmsg = '<p><b>Error! - Invalid Activation Code</b></p>';
			eval('$main .="' . getTemplate('register_activate_step_1') . '";');
		}
		// Verify activation code
		else {
			$query = "SELECT u_code FROM user_activate WHERE u_id = $u_id";
			$result = $DB->query_one($query);
			// if code doesn't match
			if ($result['u_code']!=$u_code) {
	    		$errmsg = '<p><b>Error! - Invalid Activation Code</b></p>'; 
				eval('$main .="' . getTemplate('register_activate_step_1') . '";');
			}
			// if code matches
			else {
				// get rid of activation code row
				$query = "DELETE FROM user_activate WHERE u_id = $u_id";
				$DB->query($query);
				// update user level
				$query = "UPDATE user SET u_level = 1 WHERE u_id = $u_id AND u_level = 0";
				$DB->query($query);		
				eval('$main .="' . getTemplate('register_activate_step_2') . '";');
			}
		}
	}
}
else { // user still hasn't sent the form
	$pagetitle = "zPs Activation - step 1: Fill Form";
	eval('$main .="' . getTemplate('register_activate_step_1') . '";');
}
?>