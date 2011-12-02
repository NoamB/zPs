<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * post.php
 * ---------------------
 * This page displays a forum thread,
 * and handles replies, edits, deletes, nukes etc.
 */
error_reporting(E_ALL & ~E_NOTICE);

// ################## INDEX CHECK ##################################
require_once('./includes/init.php');
// make sure we got here indirectly
if (!defined('INSIDE_INDEX')) {
    Header ('Location: '.$siteurl.'/index.php?p=404') or die('Page does not exist');
}

// ################## ACCESS CHECK #################################

// ################## INCLUDE FILES ################################
require_once('./includes/functions_forum.php');
require_once('./includes/functions_templates.php');

// ################## PREPARE VARS #################################
$pagetitle = "zPs Forum - Discussion Title";
$errmsg = '';
$perpage = 50;

// Get link vars
$pn = $_GET['pn']; // page number
$a = $_GET['a']; // action
$p_id = $_GET['p_id']; // post id
$d_id = $_GET['d_id']; // discussion id
$f_id = $_GET['f_id']; // forum id
$view = $_GET['view']; // view mode

// get page number
if (is_numeric($pn)) {
    $pn = intval($pn);
    $begin = (($pn-1)*$perpage);
    $end = $begin + $perpage;
}
else {
    $pn = 1;
    $begin = 0;
    $end = $begin + $perpage;
}

// check $a
if ($a!='reply' && $a!='edit' && $a!='del' && $a!='mark') {
    unset($a);
}

// check p_id
if (is_numeric($p_id)) {
    $p_id = intval($p_id);
}
else {
    $p_id = 0;
}

// check d_id
if (is_numeric($d_id)) {
    $d_id = intval($d_id);
}
else {
    $d_id = 0;
}

// make sure we got f_id
if (is_numeric($f_id)) {
    $f_id = intval($f_id);
}
else {
    $f_id = 0;
    if ($d_id) {
        $query = "SELECT f_id FROM discussion WHERE d_id = $d_id";
        $result = $DB->query_one($query);
        if (count($result)) {
            $f_id = $result['f_id'];
        }
    }
}

// get view
if ($view=='flat' || $view=='tree') {
    $_SESSION['view'] = $view;
}
else if (isset($_SESSION['view'])) {
    $view = $_SESSION['view'];
}
else {
    $view = 'tree';
}

// ################## PRE-CACHE TEMPLATES ##########################
$usedTemplates = array('error_empty_fields',
'error_invalid_user',
'error_invalid_pass',
'error_frame',
'post_edit_form',
'forum_nav_list',
'forum_nav_forum',
'forum_nav_thread',
'forum_nav',
'post_lastedited',
'post_parent',
'post_pages',
'post_current_page',
'post_lastedited',
'post_child',
'post_reply_form',
'post_thread');
// pre-cache these templates
cacheTemplates($usedTemplates);

// ################## ACT BY ACTION ################################
if (!empty($a)) {
    // ------------------ REPLY MODE ------------------------------
	if ($a=='reply') { // user sent a reply
		$r_name = addslashes(trim($_POST['r_name']));
		$r_pass = addslashes(trim($_POST['r_pass']));
		
		// first check login info
		$checkLogin = checkLogin($r_name,$r_pass);
		switch($checkLogin){
			case 0: // empty fields
				eval('$errmsg ="' . getTemplate('error_empty_fields') . '";');
                eval('$error_frame ="' . getTemplate('error_frame') . '";');
				break;
			case -1: // bad user
				eval('$errmsg ="' . getTemplate('error_invalid_user') . '";');
                eval('$error_frame ="' . getTemplate('error_frame') . '";');
				break;
			case -2: // bad password
				eval('$errmsg ="' . getTemplate('error_invalid_pass') . '";');
                eval('$error_frame ="' . getTemplate('error_frame') . '";');
				break;
			case 1:
			default:
				$r_body = htmlspecialchars(addslashes(trim($_POST['r_body'])));
                // check if body is empty
                if (empty($r_body)) {
                    eval('$errmsg ="' . getTemplate('error_empty_fields') . '";');
                    eval('$error_frame ="' . getTemplate('error_frame') . '";');
                    break;
                }
                $r_parent = $_POST['r_parent'];
                $r_lang = $_POST['r_lang'];
				$ru_id = getUserId($r_name);
				
				$r_order = 0;
				$p_id = addReply($d_id,$ru_id,$r_parent,$r_body,$r_order,$r_lang);

				$location = $siteurl.'/?p=post&d_id='.$d_id.'&pn='.$pn;
				(isset($p_id)) ? $location .= '#'.$p_id : $location ;
				Header ('Location: '.$location) or die();
				// 
		} // end switch
	} // end a=reply 
    // ------------------ DELETE MODE ------------------------------
	else if ($a=='del') { // user is trying to delete a post
		if (isset($_SESSION['u_id'])) { // user is already logged in
			// id of poster
			$query = "SELECT * FROM post_header WHERE p_id = $p_id";
			$target = $DB->query_one($query);
			if (!$target) {
				// post doesn't exist
				echo 'post doesn\'t exist<br>';
			    eval('$errmsg ="' . getTemplate('error_invalid_pass') . '";');
			}
			else {
                $poster = $target['u_id'];
				if ($poster!=$_SESSION['u_id'] && $_SESSION['u_level']<3) {
					// not your post to delete
					echo 'not your post to delete<br>';
				    eval('$errmsg ="' . getTemplate('error_invalid_pass') . '";');
				}
				else {
					// check for children
					$query = "SELECT p_id FROM post_header WHERE p_parent = $p_id";
					$subs = $DB->query($query);
					$num_subs = $DB->num_rows($subs);
					if ($num_subs && $_SESSION['u_level']!=3) {
					    // cant delete post with children
						echo 'cant delete post with children<br>';
						eval('$errmsg ="' . getTemplate('error_invalid_pass') . '";');
					}
					else {
						$query = "DELETE FROM post_header,post_body
						 USING post_header,post_body 
						 WHERE post_header.p_id = $p_id AND post_body.p_id = $p_id";
						$DB->query($query);
                        // update user post count
                        $query = "UPDATE user SET u_posts=u_posts-1 WHERE u_id=$poster";
                        $DB->query($query);
						$deleted = delTree($p_id) + 1;

                        // get forum id
                        $query = "SELECT f_id FROM discussion WHERE d_id = $d_id";
                        $result = $DB->query_one($query);
                        $f_id = $result['f_id'];

                        if ($target['p_parent']==0) {
                            $destroyed = 1;
                            // make sure we delete the discussion as well
                            $query = "DELETE FROM discussion WHERE d_id = $d_id";
                            $DB->query($query);
                            $location = $siteurl.'/?p=forum&f_id='.$f_id;
                        }
                        else {
                            $destroyed = 0;
                            // find new last post
                            $query = "SELECT u_id,p_date FROM post_header WHERE d_id=$d_id ORDER BY p_date DESC LIMIT 1";
                            $newlast = $DB->query_one($query);
                            $d_lastdate = $newlast['p_date'];
                            $d_lastuser = $newlast['u_id'];
                            // update discussion posts count
                            $query = "UPDATE discussion
                            SET d_replies = d_replies - $deleted,d_lastdate = '$d_lastdate',d_lastuser = $d_lastuser WHERE d_id = $d_id";
                            $DB->query($query);
                            $location = $siteurl.'/?p=post&d_id='.$d_id.'&pn='.$pn;
                        }


						// update forum post count
						$query = "UPDATE forum SET f_posts = f_posts - $deleted,f_discs = f_discs - $destroyed WHERE f_id = $f_id";
						$DB->query($query);
						Header ('Location: '.$location) or die();
					} // end subs

				} // end is-it-your-post
			} // end post-exists
		} // end is-logged-in
		else {
			// unlogged-in can't delete
			echo 'unlogged-in can\'t delete<br>';
			eval('$errmsg ="' . getTemplate('error_invalid_pass') . '";'); 
		}

        // print errors if there are any
        if (!empty($errmsg)) {
            eval('$error_frame ="' . getTemplate('error_frame') . '";');
        }

	} // end a=del
    // ------------------ EDIT MODE ------------------------------
	else if ($a=='edit') {
		if (empty($p_id)) {
		    $errmsg = 'No Post Specified!';
		}
		else {
			if (isset($_POST['r_body'])) { // if edit form was sent
				$p_id = $_GET['p_id']; // id of post to be edited
				$r_lang = $_POST['r_lang'];
				$r_body = trim($_POST['r_body']);
				$editor = $_POST['editor'];

                if (isValidText($r_body)) {
                    $r_body = htmlspecialchars(addslashes($r_body));
				    editReply($p_id,$r_body,$r_lang,$editor);

                    $location = $siteurl.'/?p=post&d_id='.$d_id.'&pn='.$pn;
                    (isset($p_id)) ? $location .= '#'.$p_id : $location ;
                    Header ('Location: '.$location) or die();
                }
                else {
                    eval('$errmsg ="' . getTemplate('error_invalid_input') . '";');
                    eval('$post_edit_form ="' . getTemplate('post_new_form') . '";');
                    // display form for new discussion
                    eval('$action = "$siteurl/?p=post&p_id='.$p_id.'&d_id='.$d_id.'&f_id='.$f_id.'&a=edit";');
                }

			}
			else { // display edit form
				if (isset($_SESSION['u_id'])) { // user is already logged in
					$p_id = $_GET['p_id']; // id of post to be edited
					// id of poster
					$query = "SELECT u_id FROM post_header WHERE p_id = $p_id";
					$result = $DB->query_one($query);
					if (!$result) {
						// post doesn't exist
						echo 'post doesn\'t exist<br>';
					    eval('$errmsg ="' . getTemplate('error_invalid_pass') . '";'); 
					}
					else {
						if ($result['u_id']!=$_SESSION['u_id'] && $_SESSION['u_level']<3) {
							// not your post to edit
							echo 'not your post to edit<br>';
						    eval('$errmsg ="' . getTemplate('error_invalid_pass') . '";'); 
						}
						else {
							// EDIT HAPPENS HERE
							// -----------------
							$query = "SELECT * FROM post_header,post_body WHERE post_header.p_id=$p_id AND post_body.p_id=$p_id";
							$post = $DB->query_one($query);
							$r_body = $post['p_body'];
							$r_lang = $post['p_lang'];
							if ($e_lang == "ltr") {
							    $engcheck = 'checked';
								$hebcheck = '';
							}
							else {
								$engcheck = '';
								$hebcheck = 'checked';
							}
							
							$r_parent = $post['p_parent'];
							$editselect = 'אף אחד';
								
							eval('$action = "$siteurl/?p=post&d_id=$d_id&a=edit&p_id=$p_id&pn=$pn";');
							eval('$post_edit_form = "' . getTemplate('post_edit_form') . '";');
						} // end is-it-your-post
					} // end post-exists
				} // end is-logged-in
				else {
					// unlogged-in can't delete
					echo 'unlogged-in can\'t delete<br>';
				    eval('$errmsg ="' . getTemplate('error_invalid_pass') . '";');
			    } // end else
		    }

	    }
    } // end edit
    // ------------------ MARK MODE ------------------------------
    else if ($a=='mark') {
        if (isset($_SESSION['u_id'])) { // user logged in
            $u_id = $_SESSION['u_id'];
            $query = "UPDATE user SET u_lastlogout = '". NOW ."' WHERE u_id = $u_id";
            $DB->query($query);
        }

        $_SESSION['u_lastlogout'] = NOW;
        $u_lastlogout = strtotime($_SESSION['u_lastlogout']);

        if (isset($_COOKIE['cookie'])) {
            $timenow = time();
            $expireTime = 60*60*24*100; // 100 days
            setcookie('cookie[u_lastlogout]',$_SESSION['u_lastlogout'],$timenow+$expireTime,'/');
        }

        $location = $siteurl.'/?p=post';
        Header ('Location: '.$location) or die();
    } // end mark
} // end actions

// ################## DISPLAY THREAD ###############################

if ($d_id) {

	// count thread posts
	$query = "SELECT COUNT(*) AS posts FROM post_header WHERE d_id = $d_id";
	$num_posts = $DB->query_one($query);
	$num_pages = ceil(($num_posts['posts']-1)/$perpage);
	($num_pages==0) ? $num_pages=1 : $num_pages=$num_pages;
	$num_posts = $num_posts['posts'];
	
	// navbar stuff here
	$query = "SELECT f_name FROM forum WHERE f_id = $f_id";
	$foruminfo = $DB->query_one($query);
	$f_name = $foruminfo['f_name'];
	$query = "SELECT d_name FROM discussion WHERE d_id = $d_id";
	$discussioninfo = $DB->query_one($query);
	$d_name = $discussioninfo['d_name'];
	eval('$forum_nav_list = "'. getTemplate('forum_nav_list') . '";');
	eval('$forum_nav_forum = "'. getTemplate('forum_nav_forum') . '";');
	eval('$forum_nav_thread = "'. getTemplate('forum_nav_thread') . '";');
	eval('$navbar = "'. getTemplate('forum_nav') . '";');
	// end navbar
	
	// get first post
	$query = "SELECT user.u_id,user.u_name,post_header.*,post_body.*,discussion.d_name  
	FROM user,post_header,post_body,discussion 
	 WHERE post_header.d_id = $d_id AND user.u_id = post_header.u_id 
	 AND post_header.p_id = post_body.p_id 
	 AND p_parent = '0' AND post_header.d_id = discussion.d_id 
	   LIMIT 0,1";
	$first = $DB->query_one($query);
	
	// get page posts
	$query = "SELECT u.u_id AS user_id,u.u_name,ph.*,pb.*
	FROM user AS u,post_header AS ph,post_body AS pb 
	WHERE ph.d_id = $d_id AND u.u_id = ph.u_id 
	 AND ph.p_id = pb.p_id ";
	($view == 'flat') ? $query.="AND NOT p_parent=0 ORDER BY p_date ASC LIMIT $begin,$perpage" : $query.="ORDER BY p_parent ASC,p_date ASC";
	$posts = $DB->query($query);
	//$num_posts = $DB->num_rows($posts);

	// check if we got a result
	if (!$num_posts) {
		$errmsg = '<p><b>Error! - Thread Does Not Exist</b><br>';
        eval('$error_frame = "' . getTemplate('error_main') .'";');
	}
	else if ($pn > $num_pages) {
		$errmsg = '<p><b>Error! - Invalid Page Number</b><br>';
        eval('$error_frame = "' . getTemplate('error_main') .'";');
	}
	else {
        // update views counter
        addThreadView($d_id);

        // print first post
        $p_parent = printParentPost($first);

		// print page numbers
		// < 3 2 1 >
		$pagination = makePagination($num_pages,$pn,$siteurl,$ref);

		if ($num_posts>1) { // if there are replies - print them!
			if ($view == 'tree') {
			    // create 2D-array from db result
				while($post = $DB->fetch_array($posts)){
					$parent_index = $post['p_parent'];
					//echo $parent_index.'<br>';
					$arr[$parent_index][] = $post;
					//$count++;
				}
			
				$postsarr = getTreeArray($first['p_id'],0,$arr,0,$begin,$end);
			} // end if

			else { // $view == 'flat'
				// get parent orders
				$chk = 0;
				while($post = $DB->fetch_array($posts)){
					$postsarr[] = $post;
					if ($post['p_parent']!=$chk) {
					    $chk = $post['p_parent'];
						// add to parent id's string
						$idstr .= ' OR p_id='.$post['p_parent'];
					}
				}
				$query = "SELECT p_id,p_order FROM post_header WHERE p_id=0".$idstr."";
				//echo $query.'<br>';
				$orders = $DB->query($query);
				
				// make parent_id->parent_order array
				while($order = $DB->fetch_array($orders)){
					$index = $order['p_id'];
					$orderarr[$index] = $order['p_order'];
					//echo $orderarr[$index].'<br>';
				}
				
				foreach ($postsarr as $arr) {
					$parent_id = $arr['p_parent'];
					$arr['p_parentorder'] = $orderarr[$parent_id];
					$newpostsarr[] = $arr;
				}
				
				$postsarr = array();
				$postsarr = $newpostsarr;
		
			} // end else

            $select = array();
			$p_children = printChildPosts($view,$postsarr,$select);
		} // end replies printing
		
		// make r_parent select
		$r_parent .= '<option value="'.$first['p_id'].'">#'.'0'.'</option>'."\n";
		if (isset($select)) {
		    ksort($select);
			foreach ($select as $key => $value) {
				$r_parent .= '<option value="'.$value.'">#'.$key.'</option>'."\n";
			}
		}
	}
	
	eval('$action = "$siteurl/?p=post&d_id=$d_id&a=reply&pn=$pn";');
	if ($_GET['a']!='edit') {
	    eval('$post_reply_form = "' . getTemplate('post_reply_form') . '";');
	}

    eval('$main .= "' . getTemplate('post_thread') . '";');
}
// ################## SHOW NEW POSTS ###############################
else {
    //echo 'u_lastlogout2='.$u_lastlogout.'<br>';
    /*
    $query = "SELECT d.*,ph.p_date FROM discussion AS d, post_header AS ph
    WHERE d.d_id = ph.d_id AND UNIX_TIMESTAMP(ph.p_date) > $u_lastlogout GROUP BY d.d_id ORDER BY ph.p_date DESC";
    $newposts = $DB->query($query);
    $num_newposts = $DB->num_rows($newposts);  */

    while ($newpost = $DB->fetch_array($newposts)) {
        $d_id = $newpost['d_id'];
        $d_name = $newpost['d_name'];
        $main .= '<a href="'.$siteurl.'/?p=post&d_id='.$d_id.'">'.$d_name.'</a> ('.$num.' הודעות חדשות)<br>';
    }

    if ($num_newposts) {
        $main .= '<table class="box" align="center"><tr><td>
        <a href="'.$siteurl.'/?p=post&a=mark">סמן את כל ההודעות כהודעות שנקראו</a>
        </td></tr></table>';
    }

    eval('$main .= "' . getTemplate('post_thread') . '";');
}
?>