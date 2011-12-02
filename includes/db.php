<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * includes/db.php
 * ---------------------
 * a wrapper class for all database operations.
 */
 
error_reporting(E_ALL & ~E_NOTICE);

define('DBARRAY_NUM', MYSQL_NUM);
define('DBARRAY_ASSOC', MYSQL_ASSOC);
define('DBARRAY_BOTH', MYSQL_BOTH);

class dbClass
{
	var $database = '';
	var $link_id = 0;
	var $error = '';
	var $errno = 0;
	var $reporterror = 1;
	var $query_count = 0;

	function connect($server, $user, $password, $usepconnect)
	{
		// connect to db server
		if (0 == $this->link_id)
		{
			if (empty($password))
			{
				if ($usepconnect == 1)
				{
					$this->link_id = @mysql_pconnect($server, $user);
				}
				else
				{
					$this->link_id = @mysql_connect($server, $user);
				}
			}
			else
			{
				if ($usepconnect == 1)
				{
					$this->link_id = @mysql_pconnect($server, $user, $password);
				}
				else
				{
					$this->link_id = @mysql_connect($server, $user, $password);
				}
			}
			
			// check if we got back a link to db
			if (!$this->link_id)
			{
				$this->halt('Link-ID == false, connect failed');
				return false;
			}
			
			//if we got a link, select db and return true
			$this->select_db($this->database);
			return true;
		}
	}

	function affected_rows()
	{
		$this->rows = mysql_affected_rows($this->link_id);
		return $this->rows;
	}

	function geterror()
	{
		$this->error = mysql_error($this->link_id);
		return $this->error;
	}

	function geterrno()
	{
		$this->errno = mysql_errno($this->link_id);
		return $this->errno;
	}

	function select_db($database = '')
	{
		// select database
		if (!empty($database))
		{
			$this->database = $database;
		}

		if(!@mysql_select_db($this->database, $this->link_id))
		{
			$this->halt('cannot use database ' . $this->database);
		}

	}

	function query($query_string)
	{
		// do query
		$query_id = mysql_query($query_string, $this->link_id);
		$this->lastquery = $query_string;
		if (!$query_id)
		{
			$this->halt('Invalid SQL: ' . $query_string);
		}
		
		$this->query_count++;
		return $query_id;
	}

	function fetch_array($query_id, $type = DBARRAY_ASSOC)
	{
		// retrieve row
		return @mysql_fetch_array($query_id, $type);
	}

	function free_result($query_id)
	{
		// retrieve row
		return @mysql_free_result($query_id);
	}

	function query_one($query_string, $type = DBARRAY_ASSOC)
	{
		// does a query and returns first row
		$query_id = $this->query($query_string);
		$returnarray = $this->fetch_array($query_id, $type);
		$this->free_result($query_id);
		$this->lastquery = $query_string;
		return $returnarray;
	}

	function data_seek($query_id, $pos)
	{
		// goes to row $pos
		return @mysql_data_seek($query_id, $pos);
	}

	function num_rows($query_id)
	{
		// returns number of rows in query
		return mysql_num_rows($query_id);
	}

	function num_fields($query_id)
	{
		// returns number of fields in query
		return mysql_num_fields($query_id);
	}

	function field_name($query_id, $columnnum)
	{
		// returns the name of a field in a query
		return mysql_field_name($query_id, $columnnum);
	}

	function insert_id()
	{
		// returns last auto_increment field number assigned
		return mysql_insert_id($this->link_id);
	}

	function close()
	{
		// closes connection to the database

		return mysql_close($this->link_id);
	}

	function escape_string($string)
	{
		// escapes characters in string depending on Characterset
		return mysql_escape_string($string);
	}

	function halt($msg)
	{
		if ($this->link_id)
		{
			$this->error = mysql_error($this->link_id);
			$this->errno = mysql_errno($this->link_id);
		}
		// prints warning message when there is an error

		if ($this->reporterror == 1)
		{
			$message  = 'Database error: ' . $msg . '<br>';
			$message .= 'mysql error: ' . $this->error . '<br>';
			$message .= 'mysql error number: ' . $this->errno . '<br>';
			$message .= 'Date: ' . date('l dS of F Y h:i:s A') . '<br>';
			$message .= 'Database = ' . $this->database;

			echo $message;
			exit;
		}
	}
}
?>