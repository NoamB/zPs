<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * online.php
 * ---------------------
 * This page displays the online users.
 */

require_once('./includes/init.php');
// make sure we got here indirectly
if (!defined('INSIDE_INDEX')) {
    Header ('Location: '.$siteurl.'/index.php?p=404') or die();
}

require_once('./includes/functions_forum.php');

$pagetitle = "zPs Forum - Who's Online";
$errmsg = '';
$perpage = 50;

// pre-cache these templates
$usedTemplates = array(
'online_table',
'online_member_row',
'online_guest_row'
);
cacheTemplates($usedTemplates);

while ($member = $DB->fetch_array($members)) {
    $member_id = $member['o_id'];
    $member_name = getUserName($member_id);
    if ($_SESSION['u_level']==3) {
        $member_ip = $member['o_ip'];
    }
    else {
        $member_ip = 'חסוי';
    }
    $member_level = $member['u_level'];
    $member_action = '';

    $idle_time = time() - strtotime($member['o_date']);
    $member_idle = date('i:s',$idle_time);
    eval('$online_rows .= "' . getTemplate('online_member_row') . '";');
}

while ($guest = $DB->fetch_array($guests)) {
    $guest_name = 'אורח';
    $guest_ip = $guest['o_ip'];

    $idle_time = strtotime(time() - strtotime($member['o_date']));
    //echo '$guest[o_date]='.strtotime($guest['o_date']).'<br>';
    //echo '$idle_time='.$idle_time.'<br>';
    $guest_idle = date('i:s',$idle_time);
    eval('$online_rows .= "' . getTemplate('online_guest_row') . '";');
}
eval('$main .= "' . getTemplate('online_table') . '";');
?>