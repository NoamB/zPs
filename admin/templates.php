<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * admin/templates.php
 * ---------------------
 * This page handles all operations on templates,
 * including creating and editing.
 */
error_reporting(E_ALL & ~E_NOTICE);

// ################## INDEX CHECK ##################################
if (!defined('INSIDE_INDEX')) {
    require_once('../includes/config.php');
    Header ('Location: '.$siteurl.'/index.php?p=404') or die();
}

// ################## ACCESS CHECK #################################
if ($_SESSION['u_level']!=3) { // if not admin
	if (isset($_SESSION['u_id'])) {
	    Header ('Location: '.$siteurl.'/index.php?p=401') or die();
	}
	// else send to login
	Header ('Location: '.$siteurl.'/index.php?p=login') or die();
}

// ################## INCLUDE FILES ################################
require_once('../includes/functions_templates.php');

// ################## PREPARE VARS #################################
$pagetitle = "zPs Admin Panel - Templates";
$errmsg = '';
$a = $_GET['a']; // action
$t_id = $_GET['t_id']; // template id
$orig = $_GET['orig']; // use original template
$view = $_GET['view']; // view mode

// check $a
if ($a!='edit' && $a!='new' && $a!='search' && $a!='insert' && $a!='update' && $a!='restore') {
    unset($a);
}

// check $t_id
if (is_numeric($t_id)) {
    $t_id = intval($t_id);
}
else {
    $t_id = 0;
}

// check $orig
if ($orig=='true') {
    $orig=TRUE;
}
else {
    $orig=FALSE;
}

// get view
if (!empty($view)) {
    $_SESSION['view'] = $view;
}
else if (isset($_SESSION['view'])) {
    $view = $_SESSION['view'];
}
else {
    $view = '';
}

// ################## PRE-CACHE TEMPLATES ##########################
$usedTemplates = array('template_form',
'template_display_cat',
'template_display_row',
'template_display',
'error_empty_fields',
'error_template_exists');
cacheTemplates($usedTemplates);

// ################## ACT BY ACTION ################################
if ($a == 'edit') {
    // ----------------------- EDIT MODE ---------------------------
    $template = $DB -> query_one("SELECT * FROM templates WHERE t_id=" . $t_id);
    // prepare form vars
    $t_group = stripslashes($template['t_group']);
    $t_name = stripslashes($template['t_name']);

    if (!$orig){ // if edit
        $t_action = $adminurl.'/?p=templates&a=update&view='. $view .'&t_id=' . $t_id;
        $t_contents = htmlspecialchars(stripslashes($template['t_contents']));
    }
    else { // if editorig
        $t_action = $adminurl.'/?p=templates&a=update&view='. $view .'&orig=true&t_id=' . $t_id;
        $t_contents = htmlspecialchars(stripslashes($template['t_original']));
    }

    eval('$main .= "' . getTemplate('template_form') . '";');
} // end of EDIT MODE
else if ($a == 'new'){
    // ----------------------- NEW MODE ---------------------------
     $t_action = $adminurl.'/?p=templates&view='. $view .'&a=insert';

     eval('$main .= "' . getTemplate('template_form') . '";');
} // end of NEW MODE
else if ($a == 'search') {
    // ----------------------- SEARCH MODE ------------------------
    if (isset($_POST['term'])) {
		$term = addslashes(trim($_POST['term']));
		$query = "SELECT * FROM templates
		 WHERE t_contents like '%".$term."%' 
		 ORDER BY t_group ASC, t_name ASC";  
		$result = $DB->query($query); 
		
		// Draw templates list table
	    $num_rows = $DB->num_rows($result);
	    $currentGroup = ''; // current templates class
	    
	    for ($i = 0; $i < $num_rows; $i++){
	    	// get next template
			$template = $DB -> fetch_array($result);
			
			if (!($currentGroup === $template['t_group'])){
			    $currentGroup = $template['t_group'];
			    $groupName = stripslashes($currentGroup);
			    eval('$t_display .= "' . getTemplate('template_display_cat') . '";');
			}

			$t_name = stripslashes($template['t_name']);
			$t_lastedit = $template['t_lastedit'];
			$t_id = $template['t_id'];
			
			// create restore button if needed
			$t_restore = ($template['t_contents'] === $template['t_original']) ?
             '' : '<a href="'.$adminurl.'/?p=templates&a=restore&view='. $view .'&t_id=' . $t_id . '">[Restore]</a>';

			eval('$t_display .= "' . getTemplate('template_display_row') . '";');
			
		} // end for
		
	    eval('$main .= "' . getTemplate('template_display') . '";');
    } // end if
} // end of SEARCH MODE
// ####################### DEFAULT MODE ###########################
else {
    if ($a == 'insert'){
    // ----------------------- INSERT MODE ------------------------
         $t_group = addslashes(trim($_POST['t_group']));
         $t_name = addslashes(trim($_POST['t_name']));
         $t_contents = addslashes($_POST['t_contents']);
         $t_lastedit = NOW;

         $errmsg = setTemplate($t_group,$t_name,$t_contents);
    } // end of INSERT MODE
    else if ($a == 'update'){
    // ----------------------- UPDATE MODE ------------------------
         $t_group = addslashes(trim($_POST['t_group']));
         $t_name = addslashes(trim($_POST['t_name']));
         $t_contents = addslashes($_POST['t_contents']);

         $errmsg = updateTemplate($t_id,$t_group,$t_name,$t_contents,$orig);
    } // end of UPDATE MODE
    else if ($a == 'restore') {
    // ----------------------- RESTORE MODE ------------------------
        $errmsg = restoreTemplate($t_id);
    } // end of RESTORE MODE
    
    // Draw templates list table
    $query = "SELECT * FROM templates ORDER BY t_group ASC, t_name ASC";
	$result = $DB->query($query);
    $num_rows = $DB->num_rows($result);
 
    $currentGroup = ''; // current templates class
    
    for ($i = 0; $i < $num_rows; $i++){
    	// get next template
		$template = $DB -> fetch_array($result);
		
		if (!($currentGroup === $template['t_group'])){
		    $currentGroup = $template['t_group'];
		    $groupName = stripslashes($currentGroup);
            if ($view==$groupName || $view=='all') {
                eval('$t_fields .= "' . getTemplate('template_fields_bar') . '";');
            }
            else {
                $t_fields = '';
            }
		    eval('$t_display .= "' . getTemplate('template_display_cat') . '";');
		}
		
		$t_name = stripslashes($template['t_name']);
		$t_lastedit = $template['t_lastedit'];
		$t_id = $template['t_id'];
		
		// create restore button if needed
		$t_restore = ($template['t_contents'] === $template['t_original']) ?
         '' : '<a href="'.$adminurl.'/?p=templates&a=restore&view='. $view .'&t_id=' . $t_id . '">[Restore]</a>';

        if ($view===$groupName || $view==='all') {
		    eval('$t_display .= "' . getTemplate('template_display_row') . '";');
        }
		
	} // end for
	
    eval('$main .= "' . getTemplate('template_display') . '";');
    
} // end of DEFAULT
?>