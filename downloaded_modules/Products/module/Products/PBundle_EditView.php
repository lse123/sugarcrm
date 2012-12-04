<?php
if (!is_admin ($current_user))
	sugar_die ('Only administrators can Add or Edit quotation templates.');

require_once('XTemplate/xtpl.php');
require_once('data/Tracker.php');
require_once('modules/Products/PBundle.php');
require_once('modules/Products/PBundleItem.php');
require_once('modules/Products/PBundle_Forms.php');
require_once('include/TimeDate.php');
require_once('include/JSON.php');

/*************** AJAX FUNCTIONS ********************/

require_once('Quotation.EditView.common.php');

/*************** END AJAX FUNCTIONS ********************/

$timedate =& new TimeDate();

require_once('modules/Administration/Administration.php');
$admin = new Administration();
$admin->retrieveSettings("notify");

global $app_strings;
global $app_list_strings;
global $mod_strings;

$focus =& new PBundle();

$isupdate = 0;

if (!isset($_REQUEST['record'])) $_REQUEST['record'] = "";
	
if(isset($_REQUEST['record'])) {
    $focus->retrieve($_REQUEST['record']);
    if ($focus->id != "")
    	$isupdate = 1;
}

//if duplicate record request then clear the Primary key(id) value.
if(isset($_REQUEST['isDuplicate']) && $_REQUEST['isDuplicate'] == '1') {
	$focus->id = "";
}

echo "\n<p>\n";
if ($focus->name != "")
	echo get_module_title($mod_strings['LBL_PBUNDLE'], $mod_strings['LBL_PBUNDLE'].": ".$focus->name, true);
else
	echo get_module_title($mod_strings['LBL_PBUNDLE'], $mod_strings['LBL_PBUNDLE'].": <i>(new product's bundle)</i>", true);
echo "\n</p>\n";

global $theme;
$theme_path="themes/".$theme."/";
$image_path=$theme_path."images/";
require_once($theme_path.'layout_utils.php');

$log->info("Products Bundle edit view");
$xtpl=new XTemplate ('modules/Products/PBundle_EditView.html');
$xtpl->assign("MOD", $mod_strings);
$xtpl->assign("APP", $app_strings);

$xtpl->assign("XAJAX", $xajax->getJavascript('include/xajax_0.2.3/'));

if (isset($_REQUEST['return_module'])) $xtpl->assign("RETURN_MODULE", $_REQUEST['return_module']);
if (isset($_REQUEST['return_action'])) $xtpl->assign("RETURN_ACTION", $_REQUEST['return_action']);
if (isset($_REQUEST['return_id'])) $xtpl->assign("RETURN_ID", $_REQUEST['return_id']);
$xtpl->assign("JAVASCRIPT", get_set_focus_js());
$xtpl->assign("IMAGE_PATH", $image_path);$xtpl->assign("PRINT_URL", "index.php?".$GLOBALS['request_string']);
$xtpl->assign("ID", $focus->id);
$xtpl->assign("ISUPDATE", $isupdate);
//todo: type_of_quote
$xtpl->assign("NAME", $focus->name);
$xtpl->assign("AVAILABLE", ($focus->available)?'<option value="yes" selected>Yes</option><option value="no">No</option>':'<option value="yes">Yes</option><option value="no" selected>No</option>');

require_once('modules/Products/Product.php');
$products = new Product();
$prod_list = $products->get_full_list();
if ($prod_list)
	foreach ($prod_list as $product)
		$plist .= "<option value='".$product->id."'>".$product->name."</option>";
$xtpl->assign("PRODUCT_LIST", $plist);

////////////////////////////////////////////////////////////////

$items = new PBundleItem();
$items_list = $items->get_full_list("", " (bundle_id='".$focus->id."') ");

$rn = 0;

$currhtml  = "<input id='_product_id' type='hidden'><input type='hidden' id='_product_name'><input id='_product_description' type='hidden'><input id='_product_users' type='hidden'><input id='_product_price' type='hidden'><input id='_product_limit' type='hidden'>";
$currhtml .= "<table id=\"items_table\" border=\"0\" cellspacing=\"1\" cellpadding=\"4\" width=\"100%\" bgcolor=\"#CCCCCC\">";
$currhtml .= "<tr bgcolor=\"White\">";
$currhtml .= "<th align=\"center\" width=\"3%\">+/-</th>";
$currhtml .= "<th align=\"center\" width=\"20%\"%\">Name</th><th align=\"center\" width=\"37%\">Description</th>";
$currhtml .= "<th align=\"center\" width=\"15%\">Users</th>";
$currhtml .= "<th align=\"center\" width=\"15%\">Limit</th>";
$currhtml .= "<th align=\"center\" width=\"15%\">Price</th></tr>";
$currhtml .= "</th>";

if (isset($items_list))
{
	foreach ($items_list as $item)
	{
		// add rows
		$rn++;
		$currhtml .= "<tr id=\"row".$rn."\" bgcolor=\"White\">";
		$currhtml .= "<td valign='top' align=\"center\"><a href=\"javascript:doDeleteRow('row".$rn."');\" title=\"Delete Row\" style=\"cursor:hand\">[-]</a>";
		$currhtml .= "<input type='hidden' id='i_id_".$rn."' name='i_id_".$rn."' value='".$item->id."'>";
		$currhtml .= "<input type='hidden' id='h_price_".$rn."' name='h_price_".$rn."' value='".$item->price."'>";
		$currhtml .= "<input type='hidden' id='i_name_".$rn."' name='i_name_".$rn."' value='".$item->product_name."'>";
		$currhtml .= "</td><td valign='top' align=\"left\">".$item->product_name."</td>";
		$currhtml .= "<td valign='top' align=\"left\"><textarea id='i_description_".$rn."' name='i_description_".$rn."' rows='5' cols='60'>".$item->product_description."</textarea></td>";
		$currhtml .= "<td valign='top' align=\"center\"><input type='text' id='i_users_".$rn."' name='i_users_".$rn."' value='".$item->users."' size='5'></td>";
		$currhtml .= "<td valign='top' align=\"center\"><input type='text' id='i_limit_".$rn."' name='i_limit_".$rn."' value='".$item->ulimit."' size='5'></td>";
		$currhtml .= "<td valign='top' align=\"right\"><input type='text' id='i_price_".$rn."' name='i_price_".$rn."' value='".$item->price."' size='7' readonly></td></tr>";
		
		//todo: hidden product_id & hidden price
	}
}

$currhtml .= "</table>";

$currhtml = "<input id='items_count' name='items_count' type='hidden' value='".$rn."'><script>	itemsCount=".$rn.";</script>" . $currhtml;
$xtpl->assign("BUNDLE_ITEMS", $currhtml);


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