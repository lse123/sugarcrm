<?php
if (!is_admin ($current_user))
	sugar_die ('Only administrators can Add or Edit products.');

require_once('XTemplate/xtpl.php');
require_once('data/Tracker.php');
require_once('modules/Products/Product.php');
require_once('modules/Products/Forms.php');

require_once('modules/Administration/Administration.php');
$admin = new Administration();
$admin->retrieveSettings("notify");

global $app_strings;
global $app_list_strings;
global $mod_strings;

$product =& new Product();

if (!isset($_REQUEST['record'])) $_REQUEST['record'] = "";

if(isset($_REQUEST['record']) && isset($_REQUEST['record'])) {
    $product->retrieve($_REQUEST['record']);
}

//if duplicate record request then clear the Primary key(id) value.
if(isset($_REQUEST['isDuplicate']) && $_REQUEST['isDuplicate'] == '1') {
	$product->id = "";
}

echo "\n<p>\n";
echo get_module_title($mod_strings['LBL_PRODUCT'], $mod_strings['LBL_PRODUCT'].": ".$product->name, true);
echo "\n</p>\n";

global $theme;
$theme_path="themes/".$theme."/";
$image_path=$theme_path."images/";
require_once($theme_path.'layout_utils.php');

$log->info("Products edit view");
$xtpl=new XTemplate ('modules/Products/EditView.html');
$xtpl->assign("MOD", $mod_strings);
$xtpl->assign("APP", $app_strings);

if (isset($_REQUEST['return_module'])) $xtpl->assign("RETURN_MODULE", $_REQUEST['return_module']);
if (isset($_REQUEST['return_action'])) $xtpl->assign("RETURN_ACTION", $_REQUEST['return_action']);
if (isset($_REQUEST['return_id'])) $xtpl->assign("RETURN_ID", $_REQUEST['return_id']);
$xtpl->assign("JAVASCRIPT", get_set_focus_js());
$xtpl->assign("IMAGE_PATH", $image_path);$xtpl->assign("PRINT_URL", "index.php?".$GLOBALS['request_string']);
$xtpl->assign("ID", $product->id);

$xtpl->assign("NAME", $product->name);
$xtpl->assign("SHORT_DESCRIPTION", $product->short_description);
$xtpl->assign("LONG_DESCRIPTION", $product->long_description);
if ($focus->image_filename != '') $xtpl->assign("IMAGE_FILENAME", $product->image_filename);
if ($focus->image != '') $xtpl->assign("IMAGE", "<br><img src='$product->image' height='100'>");
$xtpl->assign("PRODUCT_PAGE_URL", $product->product_page_url);
$xtpl->assign("AVAILABLE", ($product->available)?'<option value="yes" selected>Yes</option><option value="no">No</option>':'<option value="yes">Yes</option><option value="no" selected>No</option>');
$xtpl->assign("LIST_PRICE", $product->list_price);
$xtpl->assign("DEFAULT_USERS", $product->default_users);
$xtpl->assign("DEFAULT_LIMIT", $product->default_limit);
$xtpl->assign("NOTES", $product->notes);

//Add Custom Fields
require_once('modules/DynamicFields/templates/Files/EditView.php');

$xtpl->assign("THEME", $theme);
$xtpl->parse("main");
$xtpl->out("main");

require_once('include/javascript/javascript.php');
$javascript = new javascript();
$javascript->setFormName('EditView');
$javascript->setSugarBean($product);
$javascript->addAllFields('');
echo $javascript->getScript();
?>