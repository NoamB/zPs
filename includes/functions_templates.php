<?php
/**
 * zbro's PHP site (zPs) Alpha (c) 2004
 * includes/functions_templates.php
 * ---------------------
 * Template manipulation functions.
 */
error_reporting(E_ALL & ~E_NOTICE);

// ###################### CACHE_TEMPLATES - pre-cache page templates #######################
function cacheTemplates($usedTemplates) {
    global $DB;
    global $t_cache;

    foreach ($usedTemplates as $name) {
        $condition .= " OR t_name='".$name."'";
    }
    $query = "SELECT t_id,t_name,t_contents FROM templates WHERE t_name='boo'".$condition."";
    $rows = $DB->query($query);

    while($row = $DB->fetch_array($rows)){
        $t_id = $row['t_id'];
        $t_name = $row['t_name'];
        $template = $row['t_contents'];

        // put it in cache
        $t_cache[$t_name]['t_contents'] = $template;
        $t_cache[$t_name]['t_id'] = $t_id;
        $t_cache[$t_id]['t_contents'] = $template;
        $t_cache[$t_id]['t_name'] = $t_name;
    } // while
}

// ###################### GET_TEMPLATE - get template from DB #######################
function getTemplate($t_name, $comments = 0)
{
    global $DB;
    global $t_cache; // template cache array

    if (isset($t_cache[$t_name])) { // if template is in cache
        $template = $t_cache[$t_name]['t_contents'];    // get it from cache fool!
    }
    else { // if it's not in cache get it from DB
        $query = "SELECT t_id,t_contents FROM templates WHERE t_name='$t_name'";
        $row = $DB->query_one($query);
        $template = $row['t_contents'];
        $t_id = $row['t_id'];

        // put it in cache
        $t_cache[$t_name]['t_contents'] = $template;
        $t_cache[$t_name]['t_id'] = $t_id;
        $t_cache[$t_id]['t_contents'] = $template;
        $t_cache[$t_id]['t_name'] = $t_name;
    }

    $template = addslashes($template);

    if ($comments)
    {
        return "<!-- BEGIN $t_name : -->\n$template\n<!-- END $t_name -->";
    }

    return $template;
}

// ###################### GET_TEMPLATE_BY_ID - get template from DB by Id #######################
function getTemplateById($t_id, $comments = 0)
{
    global $DB;
    global $t_cache; // template cache array

    if (isset($t_cache[$t_id])) { // if template is in cache
        $template = $t_cache[$t_id]['t_contents'];    // get it from cache fool!
    }
    else { // if it's not in cache get it from DB
        $query = "SELECT t_name,t_contents FROM templates WHERE t_id='$t_id'";
        $row = $DB->query_one($query);
        $template = $row['t_contents'];
        $t_name = $row['t_name'];

        // put it in cache
        $t_cache[$t_name]['t_contents'] = $template;
        $t_cache[$t_name]['t_id'] = $t_id;
        $t_cache[$t_id]['t_contents'] = $template;
        $t_cache[$t_id]['t_name'] = $t_name;
    }

    $template = addslashes($template);

    if ($comments)
    {
        return "<!-- BEGIN $t_name : -->\n$template\n<!-- END $t_name -->";
    }

    return $template;
}

// ###################### SET_TEMPLATE - set new template #######################
function setTemplate($t_group,$t_name,$t_contents)
{
    global $DB;

    $t_lastedit = NOW;

    if (empty($t_group) || empty($t_name)){ // check for empty fields
        eval('$errmsg ="' . getTemplate('error_empty_fields') . '";');
    }
    else { // check if this template allready exists
        $template = getTemplate($t_name);

        if (!empty($template)) { // template exists
            $errmsg = '<p><b>Error! - Template Exists</b><br>';
        }
        else { // insert new template
             $query = "INSERT INTO templates SET
            t_group='$t_group',
            t_name='$t_name',
            t_contents='$t_contents',
            t_original='$t_contents',
            t_lastedit='$t_lastedit'";
            $DB->query($query);
            $errmsg = '<p><b>Created!</b><br>';
        }
    }

    return $errmsg;
}

// ###################### GET_TEMPLATE_ID - get t_id by t_name #######################
function getTemplateId($t_name)
{
    global $DB;
    global $t_cache; // template cache array

    if (isset($t_cache[$t_name])) { // if template is in cache
        $t_id = $t_cache[$t_name]['t_id'];    // get it from cache fool!
    }
    else { // if it's not in cache get it from DB
        $query = "SELECT t_id,t_contents FROM templates WHERE t_name='$t_name'";
        $row = $DB->query_one($query);
        $template = $row['t_contents'];
        $t_id = $row['t_id'];

        // put it in cache
        $t_cache[$t_name]['t_contents'] = $template;
        $t_cache[$t_name]['t_id'] = $t_id;
        $t_cache[$t_id]['t_contents'] = $template;
        $t_cache[$t_id]['t_name'] = $t_name;
    }

    return $t_id;
}

// ###################### UPDATE_TEMPLATE - update existing template #######################
function updateTemplate($t_id,$t_group,$t_name,$t_contents,$t_orig=FALSE)
{
    global $DB;

    $t_lastedit = NOW;

     if (empty($t_group) || empty($t_name)) { // check for empty fields
         eval('$errmsg ="' . getTemplate('error_empty_fields') . '";');
     }
     else { // check if a template with same name allready exists
        $id = getTemplateId($t_name);

        if (is_numeric($id) && $id!=$t_id) { // another template with same name already exists
            eval('$errmsg ="' . getTemplate('error_template_exists') . '";');
        }
        else { // go ahead and update
            if ($t_orig){
                $field = 't_original';
            }
            else {
                $field = 't_contents';
            }

            $query = "UPDATE templates SET t_group='$t_group',t_name='$t_name',$field='$t_contents',t_lastedit='$t_lastedit'
             WHERE t_id=$t_id";
            $DB -> query($query);
            $errmsg = '<p><b>Inserted!</b><br>';
        }
    }
    return $errmsg;
}

// ###################### RESTORE_TEMPLATE - restore original template #######################
function restoreTemplate($t_id)
{
    global $DB;

    $t_lastedit = NOW;

    $query = "SELECT t_original FROM templates WHERE t_id=$t_id";
    $row = $DB -> query_one($query);

    $t_original = addslashes($row['t_original']);
    $t_lastedit = NOW;

    $query = "UPDATE templates SET t_contents='$t_original',t_lastedit='$t_lastedit' WHERE t_id=$t_id";
    $DB -> query($query);

    $errmsg = '<p><b>Restored!</b><br>';
    return $errmsg;
}

// ###################### DE_ALIAS - replace aliases with values #######################
function deAlias($string)
{
    global $DB;

    $query = "SELECT * FROM templates WHERE t_group='Alias'";
     $alias_array = $DB->query($query);
     $alias_rows = $DB->num_rows($alias_array);
     for ($i=0;$i<$alias_rows;$i++)
     {
         $alias = $DB->fetch_array($alias_array);
         $string = str_replace('<'.$alias['t_name'].'>',$alias['t_contents'],$string);
     }
    return $string;
}
?>