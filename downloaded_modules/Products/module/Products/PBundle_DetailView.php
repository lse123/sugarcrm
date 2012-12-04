<?php
require_once('XTemplate/xtpl.php');
require_once('data/Tracker.php');
require_once('modules/Products/PBundle.php');
require_once('modules/Products/PBundleItem.php');
require_once('include/logging.php');
require_once('include/ListView/ListView.php');
require_once('include/DetailView/DetailView.php');

global $mod_strings;
global $app_strings;
global $app_list_strings;
global $current_user;

$log = LoggerManager::getLogger('pbundles_detailview');

$focus =& new PBundle();

$log->info("In detail view");

if (!empty($_REQUEST['record'])) {

	$log->info("record to be fetched".$_REQUEST['record']);
	
    $result = $focus->retrieve($_REQUEST['record']);
    if($result == null)
    {
    	sugar_die("Error retrieving record.  You may not be authorized to view this record.");
    }
}
else {
	header("Location: index.php?module=Products&action=PBundle_ListView");
        //die("paso\n");
}

echo "\n<p>\n";
echo get_module_title($mod_strings['LBL_PBUNDLE'], $mod_strings['LBL_PBUNDLE']. ": " . $focus->get_summary_text(), true);
echo "\n</p>\n";
global $theme;
$theme_path="themes/".$theme."/";
$image_path=$theme_path."images/";
require_once($theme_path.'layout_utils.php');

$log->info("Product Bundle detail view");

$xtpl=new XTemplate ('modules/Products/PBundle_DetailView.html');
$xtpl->assign("MOD", $mod_strings);
$xtpl->assign("APP", $app_strings);
$xtpl->assign("THEME", $theme);
$xtpl->assign("GRIDLINE", $gridline);
$xtpl->assign("IMAGE_PATH", $image_path);$xtpl->assign("PRINT_URL", "index.php?".$GLOBALS['request_string']);
$xtpl->assign("ID", $focus->id);
$xtpl->assign("RETURN_MODULE", "Products");
$xtpl->assign("RETURN_ACTION", "PBundle_DetailView");
$xtpl->assign("ACTION", "EditView");

$xtpl->assign("NAME", $focus->name);
$xtpl->assign("AVAILABLE", ($focus->available)?'Yes':'No');

$items = new PBundleItem();
$items_list = $items->get_full_list("", " (bundle_id='".$focus->id."') ");

$currhtml  = "<table id=\"items_table\" border=\"0\" cellspacing=\"1\" cellpadding=\"4\" width=\"100%\" bgcolor=\"#CCCCCC\">";
$currhtml .= "<tr bgcolor=\"White\">";
$currhtml .= "<th align=\"center\" width=\"20%\"%\">Name</th><th align=\"center\" width=\"50%\">Description</th>";
$currhtml .= "<th align=\"center\" width=\"10%\">Users</th>";
$currhtml .= "<th align=\"center\" width=\"10%\">Limit</th>";
$currhtml .= "<th align=\"center\" width=\"10%\">Price</th></tr>";

if (isset($items_list))
{
	foreach ($items_list as $item)
	{
		// add rows
		$rn++;
		$currhtml .= "<tr id=\"row".$rn."\" bgcolor=\"White\">";
		$currhtml .= "<td align=\"left\">".$item->product_name."</td>";
		$currhtml .= "<td align=\"left\">".nl2br($item->product_description)."</td>";
		$currhtml .= "<td align=\"center\">".$item->users."</td>";
		$currhtml .= "<td align=\"center\">".$item->ulimit."</td>";
		$currhtml .= "<td align=\"right\">".$item->price."</td></tr>";
		
		//todo: hidden product_id & hidden price
	}
}

$currhtml .= "</table>";

$xtpl->assign("BUNDLE_ITEMS", $currhtml);

$xtpl->parse("main");
$xtpl->out("main");

?>