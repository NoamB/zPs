<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * includes/functions_forum.php
 * ---------------------
 * Forum functions.
 */
error_reporting(E_ALL & ~E_NOTICE);

// ################# GET_TREE_ARRAY - convert thread to numbered array #################
function getTreeArray($p_id,$parentorder,&$arr,$depth,$begin,$end) {
	global $DB;
	static $thread;
	static $index;
	
	if(isset($arr[$p_id])) {
		foreach ($arr[$p_id] as $child) {
			// add this post to the list
			$next_pid = $child['p_id'];
			$next_parentorder = $child['p_order'];
			// if post belongs to displayed page
			$index++;
			if ($index>$begin && $index<=$end) {
				$child['p_depth'] = $depth;
				$child['p_parentorder'] = $parentorder;
				$thread[] = $child;
			}
			if ($index>$end) {
			    return $thread;
			}
			// find the sub-children
			getTreeArray($next_pid,$next_parentorder,$arr,$depth+1,$begin,$end);
		} // foreach
	}
	return $thread;
}

// #################### DEL_TREE - delete a post and its children ###########
function delTree($p_id) {
    global $DB;
    static $counter;

    $query = "SELECT p_id,u_id FROM post_header WHERE p_parent = $p_id";
    $subs = $DB->query($query);
    while($sub = $DB->fetch_array($subs)){
        $sub_id = $sub['p_id'];
        $sub_user = $sub['u_id'];
        $query = "DELETE FROM post_header,post_body
         USING post_header,post_body
         WHERE post_header.p_id = $sub_id AND post_body.p_id = $sub_id";
        $DB->query($query);
        // update user post count
        $query = "UPDATE user SET u_posts=u_posts-1 WHERE u_id=$sub_user";
        $DB->query($query);
        $counter++;
        delTree($sub_id);
    } // while
    return $counter;
}

// #################### ADD_REPLY - adds a post to a thread ###########
function addReply($d_id,$u_id,$p_parent,$p_body,&$p_order,$p_lang){
	global $DB;

    $p_body = wordwrap($p_body, 100, "\n", 1);

	// lock tables
	$query = "LOCK TABLES post_header WRITE,post_body WRITE,discussion WRITE";
	$DB->query($query);
	// get last order
	$query = "SELECT MAX(p_order) AS maxorder FROM post_header
				 WHERE d_id = $d_id";
	$order = $DB->query_one($query);
	$p_order = $order['maxorder']+1;
	// insert header
	$query = "INSERT INTO post_header 
	(p_id, d_id, u_id, p_parent, p_order, p_date, p_edit)
	VALUES
	(NULL, $d_id, $u_id, $p_parent, $p_order, '".NOW."', '".NOW."')";
	$DB->query($query);
	// insert body
	$query = "INSERT INTO post_body 
	(p_id, p_body, p_lang) 
	VALUES 
	(NULL, '$p_body', '$p_lang')";
	$DB->query($query);
	// get the p_id
	$query = "SELECT p_id FROM post_header WHERE p_order=$p_order";
	$result = $DB->query_one($query);
	$p_id = $result['p_id'];
	// get number of replies
	$query = "SELECT COUNT(*) AS replies FROM post_header WHERE d_id = $d_id";
	$num_replies = $DB->query_one($query);
	$replies = $num_replies['replies']-1;
	// update thread
	$query = "UPDATE discussion SET d_replies = $replies,d_lastdate = '".NOW."',d_lastuser = $u_id WHERE d_id = $d_id";
	$DB->query($query);
	// unlock tables
	$query = "UNLOCK TABLES";
	$DB->query($query);
	// get forum id
	$query = "SELECT f_id FROM discussion WHERE d_id = $d_id";
	$result = $DB->query_one($query);
	$f_id = $result['f_id'];
	// update forum
	$query = "UPDATE forum SET f_posts=f_posts+1 WHERE f_id=$f_id";
	$DB->query($query);
    // update user
    $query = "UPDATE user SET u_posts=u_posts+1 WHERE u_id=$u_id";
    $DB->query($query);
	
	return $p_id;
}

// #################### EDIT_REPLY - modifies a post ###########
function editReply($p_id,$p_body,$p_lang,$u_id) {
	global $DB;

    $query = "SELECT p_parent FROM post_header WHERE p_id=$p_id";
    $parent = $DB->query_one($query);
    if ($parent['p_parent']==0) {
        $p_body = wordwrap($p_body, 100, "\n", 1);
    }
    else {
        $p_body = wordwrap($p_body, 100, "\n", 1);
    }

	// lock tables
	$query = "LOCK TABLES post_header WRITE,post_body WRITE";
	$DB->query($query);
	
	$query = "UPDATE post_body SET p_body='$p_body',p_lang='$p_lang' WHERE p_id=$p_id";
	$DB->query($query);

	$query = "UPDATE post_header SET p_edit='". NOW ."',p_editby=$u_id WHERE p_id=$p_id";
	$DB->query($query);
	
	// unlock tables
	$query = "UNLOCK TABLES";
	$DB->query($query);
}

// #################### PRINT_PARENT_POST - prints parent post ###########
function printParentPost($first) {
    global $siteurl,$DB,$d_id,$f_id,$pn,$u_lastlogout;

    // print first post
    $p_id = $first['p_id'];
    $u_id = $first['u_id'];
    $u_name = stripslashes($first['u_name']);
    $d_name = stripslashes($first['d_name']);
    $p_order = $first['p_order'];
    $p_date = $first['p_date'];
    $p_body = filter($first['p_body']);
    $p_lang = $first['p_lang'];
    $p_edit = $first['p_edit'];
    $p_editby = $first['p_editby'];
    if ($p_edit>$p_date) {
        $editor = getUserName($p_editby);
        eval('$lastedited = "'. getTemplate('post_lastedited') . '";');
    }
    else {
        $lastedited = '';
    }

    eval('$delpostcode = "<a href=\"$siteurl/?p=post&d_id=$d_id&f_id=$f_id&a=del&p_id=$p_id&pn=$pn\">[מחק]</a>";');
    eval('$editpostcode = "<a href=\"$siteurl/?p=post&d_id=$d_id&f_id=$f_id&a=edit&p_id=$p_id&pn=$pn\">[ערוך]</a>";');
    eval('$replycode = "<a href=\"#postform\" onClick=\"reply($p_id)\">[כתוב תגובה]</a>";');

    if (strtotime($p_date) > $u_lastlogout && !isset($_SESSION['viewed_posts'][$p_id])) {
        $_SESSION['viewed_posts'][$p_id] = TRUE;
        eval('$p_parent = "' . getTemplate('post_newparent') . '";');
    }
    else {
        eval('$p_parent = "' . getTemplate('post_parent') . '";');
    }
    return $p_parent;
}

// #################### PRINT_CHILD_POSTS - prints all child posts ###########
function printChildPosts($view,$postsarr,&$select) {
	global $siteurl,$DB,$d_id,$f_id,$pn,$u_lastlogout;
	
    // print page posts
    foreach ($postsarr as $arr){
        $p_id = $arr['p_id'];
        $u_id = $arr['u_id'];
        $u_name = $arr['u_name'];
        $parent_id = $arr['p_parent'];
        $p_parentorder = $arr['p_parentorder'];
        if ($p_parentorder>0) {
            // add "in reply to-" text
            $p_parentorder = 'בתגובה ל- <a href="#'.$parent_id.'">'.$p_parentorder.'</a>';
        }
        else {
            $p_parentorder = '';
        }
        $p_order = $arr['p_order'];
        $p_date = $arr['p_date'];
        $p_depth = $arr['p_depth'];
        $p_body = filter($arr['p_body']);
        $p_lang = $arr['p_lang'];
        $p_edit = $arr['p_edit'];
        $p_editby = $arr['p_editby'];

        // edit check
        if ($p_edit>$p_date) {
            $editor = getUserName($p_editby);
            eval('$lastedited = "'. getTemplate('post_lastedited') . '";');
        }
        else {
            $lastedited = '';
        }

        // spacer check
        if ($view == 'tree') {
            // prepare spacer
            //$spacer = str_repeat('&nbsp;&nbsp;',$p_depth);
            $spacer = 0 + ($p_depth*20);
        }

        // if you are an admin or you mod this forum
        if ($_SESSION['u_level']==3 || $_SESSION['u_level']==2) {
            eval('$delpostcode = "<a href=\"$siteurl/?p=post&d_id=$d_id&f_id=$f_id&a=del&p_id=$p_id&pn=$pn\">[מחק]</a>";');
            eval('$editpostcode = "<a href=\"$siteurl/?p=post&d_id=$d_id&f_id=$f_id&a=edit&p_id=$p_id&pn=$pn\">[ערוך]</a>";');

        }
        // if this is your post
        else if ($_SESSION['u_name']==$u_name) {
            eval('$delpostcode = "<a href=\"$siteurl/?p=post&d_id=$d_id&f_id=$f_id&a=del&p_id=$p_id&pn=$pn\">[מחק]</a>";');
            eval('$editpostcode = "<a href=\"$siteurl/?p=post&d_id=$d_id&f_id=$f_id&a=edit&p_id=$p_id&pn=$pn\">[ערוך]</a>";');
        }
        else {
            $delpostcode = '';
            $editpostcode = '';
        }

        eval('$replycode = "<a href=\"#postform\" onClick=\"reply($p_id)\">[כתוב תגובה]</a>";');
        if (strtotime($p_date) > $u_lastlogout && !isset($_SESSION['viewed_posts'][$p_id])) {
            $_SESSION['viewed_posts'][$p_id] = TRUE;
            eval('$p_children .= "'. getTemplate('post_newchild') . '";');
        }
        else {
            eval('$p_children .= "'. getTemplate('post_child') . '";');
        }

        // make a (p_order => p_id) array
        $key = intval($arr['p_order']);
        $value = $arr['p_id'];
        $select[$key] = $value;
    } // foreach
    return $p_children;
}

// #################### FILTER - re-formats text ###########
function filter($txt)
{
	$endline = array("\r\n","\n","\r");
	$whitespace = " ";
	$postcodes = array("[b]","[/b]","[i]","[/i]","[u]","[/u]");
	$hebpostcodes = array("[מ]","[/מ]","[נ]","[/נ]","[ק]","[/ק]");
	$postcodeshtml = array("<b>","</b>","<i>","</i>","<u>","</u>");
	$txt = str_replace($endline,"<br>", stripslashes($txt));
	$txt = str_replace($whitespace,"&nbsp;",$txt);
	$txt = str_replace($postcodes,$postcodeshtml,$txt);
	$txt = str_replace($hebpostcodes,$postcodeshtml,$txt);
	return $txt;
}

// ############################ ADD_THREAD_VIEW ####################################
function addThreadView($d_id) {
    global $DB;

    $query = "UPDATE discussion SET d_views = d_views + 1 WHERE d_id = $d_id";
    $DB->query($query);
}

// ############################## MAKE_PAGINATION #####################################
function makePagination($num_pages,$pn,$url,$ref='') {

    $ref = urldecode($ref);

    if ($num_pages>1) {
        // make first sign
        if ($pn>1) {
            $p = 1;
            $sign = '&lt;&lt;';
            $alt = 'First';
            eval('$p_pages .= "' . getTemplate('post_page') . '";');
        }
        // make prev sign
        if ($pn>1) {
            $p = $pn-1;
            $sign = '&lt;';
            $alt = 'Previous';
            eval('$p_pages .= "' . getTemplate('post_page') . '";');
        }
        // set pagination limits
        if ($pn<=4) {
            $pstart = 1;
        }
        else {
            $pstart = $pn-4;
        }
        if ($num_pages<9) {
            $pend = $num_pages-1;
        }
        else {
            $pend = 8;
            if ($pend > ($num_pages-$pstart)) {
                $pend = $num_pages-$pstart;
            }
        }
        // make numbers
        for ($p = $pstart;$p<=$pstart+$pend;$p++) {
            $sign = $p;
            $alt = $p;
            if ($p != $pn) {
                $str1 = explode('pn=',$ref);
                $str2 = explode('&',$str1[1]);
                $str3 = 'pn='.$str2[0];
                $str4 = 'pn='.$p;
                if ($str1[0]===$ref) {
                    $ref .= '&'.$str4;
                }
                else {
                    $ref = str_replace($str3,$str4,$ref);
                }
                eval('$p_pages .= "' . getTemplate('post_page') . '";');
            }
            else {
                eval('$p_pages .= "' . getTemplate('post_current_page') . '";');
            }
        }
        // make next sign
        if ($pn<$num_pages) {
            $p = $pn+1;
            $sign = '&gt;';
            $alt = 'Next';
            eval('$p_pages .= "' . getTemplate('post_page') . '";');
        }
        // make last sign
        if ($pn<$num_pages) {
            $p = $num_pages;
            $sign = '&gt;&gt;';
            $alt = 'Last';
            eval('$p_pages .= "' . getTemplate('post_page') . '";');
        }
        eval('$pagination = "' . getTemplate('post_pages') . '";');
    }
    return $pagination;
}
?>