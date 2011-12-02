<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * news.php
 * ---------------------
 * This page displays the news.
 */

require_once('./includes/init.php');
// make sure we got here indirectly
if (!defined('INSIDE_INDEX')) {
    Header ('Location: '.$siteurl.'/index.php?p=404') or die();
}

require_once('./includes/functions_forum.php');

$pagetitle = "zPs Forum - News";
$errmsg = '';
$perpage = 4;

// get page number
if (isset($_GET['pn']) && $_GET['pn']!='') {
    $pn = $_GET['pn'];
    $begin = (($pn-1)*$perpage);
    $end = $begin + $perpage;
}
else {
    $pn = 1;
    $begin = 0;
    $end = $begin + $perpage;
}

// pre-cache these templates
$usedTemplates = array(
'news_item',
'news_pages',
'news_current_page',
'news_main'
);
cacheTemplates($usedTemplates);

// get news count
$query = "SELECT COUNT(*) AS items FROM discussion WHERE f_id=$nf_id";
$newscount = $DB->query_one($query);
$num_pages = ceil(($newscount['items']-1)/$perpage);
($num_pages==0) ? $num_pages=1 : $num_pages=$num_pages;

// get latest news
$query = "SELECT d.*,ph.*,pb.* FROM discussion AS d,post_header AS ph,post_body AS pb
 WHERE d.f_id = $nf_id
  AND d.d_id = ph.d_id
   AND ph.p_parent = 0
    AND ph.p_id = pb.p_id
     ORDER BY d.d_date DESC LIMIT $begin,$perpage";
$items = $DB->query($query);

while ($item = $DB->fetch_array($items)) {
    // print first post
    $p_id = $item['p_id'];
    $u_id = $item['u_id'];
    $d_id = $item['d_id'];
    $u_name = stripslashes(getUserName($u_id));
    $d_name = stripslashes($item['d_name']);
    $p_order = $item['p_order'];
    $p_date = $item['p_date'];
    $p_body = filter($item['p_body']);
    $p_lang = $item['p_lang'];
    $p_edit = $item['p_edit'];
    $p_editby = $item['p_editby'];
    $d_replies = $item['d_replies'];
    if ($p_edit>$p_date) {
        $editor = getUserName($p_editby);
        eval('$lastedited = "'. getTemplate('post_lastedited') . '";');
    }
    else {
        $lastedited = '';
    }

    eval('$news_items .= "' . getTemplate('news_item') . '";');
}

// print page numbers
// < 3 2 1 >
$pagination = makePagination($num_pages,$pn,$siteurl,$ref);

eval('$main = "' . getTemplate('news_main') . '";');
//eval('$main .= "'.getTemplate('main_main').'";');
?>