<?php
require_once('./includes/init.php');

$query = "DELETE FROM post_header";
$DB->query($query);
$query = "DELETE FROM post_body";
$DB->query($query);
$query = "DROP TABLE IF EXISTS post_body";
$DB->query($query);
$query = "CREATE TABLE post_body (
  p_id int(10) unsigned NOT NULL auto_increment,
  p_body text NOT NULL,
  p_lang char(3) NOT NULL default 'rtl',
  PRIMARY KEY  (p_id)
) TYPE=MyISAM";
$DB->query($query);
$query = "DROP TABLE IF EXISTS post_header";
$DB->query($query);
$query = "CREATE TABLE post_header (
  p_id int(10) unsigned NOT NULL auto_increment,
  d_id int(10) unsigned NOT NULL default '0',
  u_id int(10) unsigned NOT NULL default '0',
  p_parent int(10) unsigned NOT NULL default '0',
  p_order int(10) unsigned NOT NULL default '0',
  p_date datetime NOT NULL default '0000-00-00 00:00:00',
  p_edit datetime NOT NULL default '0000-00-00 00:00:00',
  p_editby int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (p_id),
  KEY d_id (d_id),
  KEY u_id (u_id),
  KEY p_parent (p_parent)
) TYPE=MyISAM";
$DB->query($query);

$date = date('YmdHis');
$body = 'טקסט בעברית';
$timestamp = mktime();
$timestamp -= 10000;

for ($order = 0,$parent=0; $order<51; $order++){
	$timestamp++;
	$date = date('YmdHis',$timestamp);
	$user = rand(1,12);
	$p_id = $order+1;
	$query1 = "INSERT INTO post_header 
	( p_id , d_id, u_id , p_parent , p_order , p_date ) 
	VALUES (
	'$p_id', '1', '$user', '$parent', '$order', $date
	 )";
	 $query2 = "INSERT INTO post_body
	 ( p_id , p_body ) 
	 VALUES (
	 '$p_id', '$body' )";
	$DB->query($query1);
	$DB->query($query2);
	$parent = 1;
}

for ($order = 51; $order<151; $order++){
	$timestamp++;
	$date = date('YmdHis',$timestamp);
	$parent = rand(1,$order);
	$user = rand(1,12);
	$p_id = $order+1;
	$query1 = "INSERT INTO post_header 
	( p_id , d_id, u_id , p_parent , p_order , p_date ) 
	VALUES (
	'$p_id', '1', '$user', '$parent', '$order', $date
	 )";
	 $query2 = "INSERT INTO post_body
	 ( p_id , p_body ) 
	 VALUES (
	 '$p_id', '$body' )";
	$DB->query($query1);
	$DB->query($query2);
}
?>