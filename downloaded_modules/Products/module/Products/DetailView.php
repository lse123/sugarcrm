<?php
require_once('XTemplate/xtpl.php');
require_once('data/Tracker.php');
require_once('modules/Products/Product.php');
require_once('include/logging.php');
require_once('themes/'.$theme.'/layout_utils.php');
require_once('include/ListView/ListView.php');
require_once('include/DetailView/DetailView.php');
require_once('modules/Products/ProductDoc.php');
require_once('include/upload_file.php');

global $mod_strings;
global $app_strings;
global $app_list_strings;
global $current_user;

$log = LoggerManager::getLogger('categories_detailview');

$focus =& new Product();

$detailView = new DetailView();
$offset=0;
if (isset($_REQUEST['offset']) or isset($_REQUEST['record'])) {
	$result = $detailView->processSugarBean("PRODUCTS", $focus, $offset);
	if($result == null) {
		header("Location: index.php?module=Products&action=index");
	    //sugar_die("Error retrieving record.  You may not be authorized to view this record.");
	}
	$focus=$result;
} else {
	header("Location: index.php?module=Products&action=index");
}

$log->info("In detail view");

echo "\n<p>\n";
echo get_module_title($mod_strings['LBL_PRODUCT'], $mod_strings['LBL_PRODUCT']. ": " . $focus->get_summary_text(), true);
echo "\n</p>\n";
global $theme;
$theme_path="themes/".$theme."/";
$image_path=$theme_path."images/";
require_once($theme_path.'layout_utils.php');

$log->info("Products detail view");

$xtpl=new XTemplate ('modules/Products/DetailView.html');
$xtpl->assign("MOD", $mod_strings);
$xtpl->assign("APP", $app_strings);
$xtpl->assign("THEME", $theme);
$xtpl->assign("GRIDLINE", $gridline);
$xtpl->assign("IMAGE_PATH", $image_path);$xtpl->assign("PRINT_URL", "index.php?".$GLOBALS['request_string']);
$xtpl->assign("ID", $focus->id);
$xtpl->assign("RETURN_MODULE", "Products");
$xtpl->assign("RETURN_ACTION", "DetailView");
$xtpl->assign("ACTION", "EditView");

$xtpl->assign("NAME", $focus->name);
$xtpl->assign("SHORT_DESCRIPTION", nl2br($focus->short_description));
$xtpl->assign("LONG_DESCRIPTION", nl2br($focus->long_description));
$xtpl->assign("IMAGE_FILENAME", $focus->image_filename);
if ($focus->image != '') $xtpl->assign("IMAGE", "<img src='$focus->image' height='100'>");
$xtpl->assign("PRODUCT_PAGE_URL", $focus->product_page_url);
$xtpl->assign("AVAILABLE", ($focus->available)?'Yes':'No');
$xtpl->assign("LIST_PRICE", $focus->list_price);
$xtpl->assign("DEFAULT_USERS", ($focus->default_users == null?'N/A':$focus->default_users));
$xtpl->assign("DEFAULT_LIMIT", ($focus->default_limit == null?'N/A':$focus->default_limit));
$xtpl->assign("NOTES", nl2br($focus->notes));

/*
$xtpl->assign("THUMBNAIL", $focus->thumbnail);
$xtpl->assign("FILE", $focus->filename);
*/

$detailView->processListNavigation($xtpl, "PRODUCTS", $offset);
//Add Custom Fields
require_once('modules/DynamicFields/templates/Files/DetailView.php');

$xtpl->parse("main");
$xtpl->out("main");

// subpanel2
$old_contents = ob_get_clean();
echo $old_contents;
ob_start();

$document = new ProductDoc();
$ListView = new ListView();

$ListView->initNewXTemplate('modules/Products/Docs_ListView.html',$mod_strings);
$ListView->setQuery(" product_id = '$focus->id'","","","");
$ListView->setHeaderTitle($mod_strings['LBL_PRODUCTS_DOCS']);
$ListView->show_export_button=false;
$ListView->show_paging =false;
$ListView->xTemplateAssign("ID",$document->id);
$ListView->xTemplateAssign("VIEW_DOC",get_image('themes/'.$theme.'/images/view',"","",""));

if (isset($_REQUEST['return_module'])) $ListView->xTemplateAssign("RETURN_MODULE", $_REQUEST['return_module']);
if (isset($_REQUEST['return_action'])) $ListView->xTemplateAssign("RETURN_ACTION", $_REQUEST['return_action']);
if (isset($_REQUEST['return_id'])) $ListView->xTemplateAssign("RETURN_ID", $_REQUEST['return_id']);
if (isset($_REQUEST['record'])) $ListView->xTemplateAssign("RECORD", $focus->id);
$xtpl->assign("RETURN_ACTION", "Translation_DetailView");
$return_url="return_module=Products&return_action=Docs_DetailView&return_id=".$document->product_id;

$ListView->xTemplateAssign("RETURN_URL", $return_url);
$ListView->xTemplateAssign("DELETE_INLINE_PNG",  get_image($image_path.'delete_inline','align="absmiddle" alt="'.$app_strings['LNK_DELETE'].'" border="0"'));

$ListView->processListView($document, "main", "DOC");

$panelcontent= ob_get_clean();

$xtpl->assign("DOCS", $panelcontent);
//end process

$xtpl->parse("subpanel1");
$xtpl->out("subpanel1");
?>