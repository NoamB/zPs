<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * includes/functions.php
 * ---------------------
 * Basic functions.
 */
error_reporting(E_ALL & ~E_NOTICE);

// ###################### ASSOC_IMPLODE - implode an associative array #######################
function assoc_implode($glue, $array) {
       $output = array();
       foreach( $array as $key => $item )
               $output[] = $key . "=" . $item;

       return implode($glue, $output);
} 

// ###################### COOKIE_TO_SESSION - move cookie data to session #######################
function cookie_to_session()
{
    global $DB;

	if (isset($_COOKIE['cookie'])) {
		foreach ($_COOKIE['cookie'] as $name => $value) {
			$_SESSION[$name] = $value;
		}
        // get user access levels
        $u_id = $_SESSION['u_id'];
        $_SESSION['u_level']=getUserLevel($u_id);

	}
}

// ###################### GET_SCRIPT_TIME - calculate script time #######################
function getScriptTime($a, $b) {
   list($a_dec, $a_sec) = explode(" ", $a);
   list($b_dec, $b_sec) = explode(" ", $b);
   $duration = $b_sec - $a_sec + $b_dec - $a_dec;
   $duration = sprintf("%0.3f", $duration);
   return $duration;
}

// ###################### GET_USER_ID - get user ID by user name #######################
function getUserId($u_name)
{
	global $DB;
	static $cache;
	
	if (isset($cache[$u_name])) { // if user is in cache
		return $cache[$u_name]; // return user name from cache
	}
	else {
		$query = "SELECT u_id FROM user WHERE u_name = '$u_name'";
		$result = $DB->query_one($query);
		if (isset($result['u_id'])) {
			// put it in cache
			$cache[$u_id] = $result['u_id'];
			// return
			return $result['u_id'];
		}
	}
	// if we didn't return by now...
	return false;
}

// ###################### GET_USER_NAME - get user name by user id #######################
function getUserName($u_id)
{
	global $DB;
	static $cache;
	
	if (isset($cache[$u_id])) { // if user is in cache
		return $cache[$u_id]; // return user name from cache
	}
	else {
		$query = "SELECT u_name FROM user WHERE u_id = $u_id";
		$result = $DB->query_one($query);
		if (isset($result['u_name'])) {
			// put it in cache
			$cache[$u_id] = $result['u_name'];
			// return
			return $result['u_name'];
		}
	}
	// if we didn't return by now...
	return '';
}

// ###################### GET_USER_LEVEL - get user level by user id #######################
function getUserLevel($u_id)
{
	global $DB;
	static $cache;
	
	if (isset($cache[$u_id])) { // if user is in cache
		return $cache[$u_id]; // return user name from cache
	}
	else {
		$query = "SELECT u_level FROM user WHERE u_id = $u_id";
		$result = $DB->query_one($query);
		if (isset($result['u_level'])) {
			// put it in cache
			$cache[$u_id] = $result['u_level'];
			// return
			return $result['u_level'];
		}
	}
	// if we didn't return by now...
	return false;
}

// ###################### IS_VALID_EMAIL - checks for a valid email format #######################
function isValidEmail($email)
{
	return preg_match('#^[a-z0-9.!\#$%&\'*+-/=?^_`{|}~]+@([0-9.]+|([a-z0-9._-]+\.+[a-z]{2,4}))$#si', $email);
}

function isValidText($text)
{
	return preg_match('#^[a-zA-Z0-9à-ú.,!\#$%&\'\n\r@\\\\*+-/=?^_`{|}~ \"]+$#', $text);
}
// ###################### PRINT_OUTPUT - prints output to browser #################################
function printOutput($output)
{	
	global $DB,$starttime;
	
	$output = deAlias($output);
	
	echo $output;
	
	$querycount = $DB->query_count;
	$scripttime = getScriptTime($starttime,microtime());
	echo '<center>queries: '.$querycount.' time: '.$scripttime.'</center>';
}

// ###################### DUMP_ARRAY -  put array values in a string #######################
function dumpArray($array)
{
	if(is_array($array))
	{
		$size = count($array);
		$string = '';
		if($size)
		{
			$count = 0;
			$string .= '{ ';
			// add each element's key and value to the string
			foreach($array as $var => $value)
			{
				$string .= "$var = $value";
				if($count++ < ($size-1))
				{
					$string .= ', ';
				}
			}
			$string .= ' }';
		}
		return $string;
	}
	else
	{
		// if it is not an array, just return it
		return $array;
	}
}

// ############## CHECK_LOGIN - check user/pass input #############
function checkLogin($u_name,$u_pass){
	global $DB;
	
	// gets username and password in RAW form
	
	// prepare vars for comparison
	$u_name = addslashes(trim($u_name));
	$u_pass = addslashes(trim($u_pass));
	
	// check for empty fields
	if (empty($u_name)||empty($u_pass)) {
		return 0; // empty fields
	}
	// fields are not empty
	else { 
		// try to get user id
		$u_id = getUserId($u_name);		
		if (!$u_id) { // check for bad user name
			return -1; // bad user
		}
		else { // user name is good
			$query = "SELECT u_pass FROM user WHERE u_id = $u_id";
			$result = $DB->query_one($query);
			if ($result['u_pass'] != md5($u_pass)) { // check password
				return -2; // bad pass
			}
			else {
				return 1; // login good
			}
		}
	}
}

// ############## ZPS_COOKIE - sets or destroys cookie #############
function zpsCookie($expireTime) {
	$timenow = time();
	setcookie('cookie[u_id]',$_SESSION['u_id'],$timenow+$expireTime,'/');
	setcookie('cookie[u_name]',$_SESSION['u_name'],$timenow+$expireTime,'/');
	setcookie('cookie[u_pass]',$_SESSION['u_pass'],$timenow+$expireTime,'/');
	//setcookie('cookie[u_level]',$_SESSION['u_level'],$timenow+$expireTime,'/');
	setcookie('cookie[u_ip]',$_SESSION['u_ip'],$timenow+$expireTime,'/');
    setcookie('cookie[u_lastlogin]',$_SESSION['u_lastlogin'],$timenow+$expireTime,'/');
    setcookie('cookie[u_lastlogout]',$_SESSION['u_lastlogout'],$timenow+$expireTime,'/');
}
?>