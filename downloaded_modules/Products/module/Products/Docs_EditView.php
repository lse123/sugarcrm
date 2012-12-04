<?php

require_once('XTemplate/xtpl.php');
require_once('data/Tracker.php');
require_once('modules/Products/ProductDoc.php');

require_once('modules/Administration/Administration.php');
$admin = new Administration();
$admin->retrieveSettings("notify");

global $app_strings;
global $app_list_strings;
global $mod_strings;

$focus =& new ProductDoc();

if (!isset($_REQUEST['record'])) $_REQUEST['record'] = "";

if(isset($_REQUEST['record']) && isset($_REQUEST['record'])) {
    $focus->retrieve($_REQUEST['record']);
}

//if duplicate record request then clear the Primary key(id) value.
if(isset($_REQUEST['isDuplicate']) && $_REQUEST['isDuplicate'] == '1') {
	$focus->id = "";
}

echo "\n<p>\n";
echo get_module_title($mod_strings['LBL_MODULE_NAME'], $mod_strings['LBL_MODULE_NAME'].": ".$focus->filename, true);
echo "\n</p>\n";

global $theme;
$theme_path="themes/".$theme."/";
$image_path=$theme_path."images/";
require_once($theme_path.'layout_utils.php');

$log->info("Docs edit view");
$xtpl=new XTemplate ('modules/Products/Docs_EditView.html');
$xtpl->assign("MOD", $mod_strings);
$xtpl->assign("APP", $app_strings);
if (isset($_REQUEST['record'])) $xtpl->assign("RECORD", $_REQUEST['record']);
if (isset($_REQUEST['return_module'])) $xtpl->assign("RETURN_MODULE", $_REQUEST['return_module']);
if (isset($_REQUEST['return_action'])) $xtpl->assign("RETURN_ACTION", $_REQUEST['return_action']);
if (isset($_REQUEST['return_id'])) $xtpl->assign("RETURN_ID", $_REQUEST['return_id']);
$xtpl->assign("JAVASCRIPT", get_set_focus_js());
$xtpl->assign("IMAGE_PATH", $image_path);$xtpl->assign("PRINT_URL", "index.php?".$GLOBALS['request_string']);
$xtpl->assign("ID", $focus->id);

if($focus->id == null)
{
        $xtpl->assign("CANCEL_RETURN_ACTION", "DetailView");
}
else
{
        $xtpl->assign("CANCEL_RETURN_ACTION", "Docs_DetailView");
}

$xtpl->assign("FILENAME", $focus->filename);
$xtpl->assign("DESCRIPTION", $focus->description);
$xtpl->assign("DOC_ID", $_REQUEST['trans']);

if (isset($_REQUEST['product_id'])) {
	$xtpl->assign("PRODUCT_ID", $_REQUEST['product_id']);
}	
$xtpl->assign("RETURN_ACTION", "Translation_DetailView");
//Add Custom Fields
require_once('modules/DynamicFields/templates/Files/EditView.php');


$xtpl->assign("THEME", $theme);
$xtpl->parse("main");
$xtpl->out("main");

?>