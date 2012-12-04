<?php

require_once('XTemplate/xtpl.php');
require_once('data/Tracker.php');
require_once('modules/Products/ProductDoc.php');
require_once('include/logging.php');

global $mod_strings;
global $app_strings;
global $app_list_strings;
global $current_user;

//if(isset($_REQUEST['product_id'])) die($_POST['product_id']);

$log = LoggerManager::getLogger('docs_detailview');


$focus =& new ProductDoc();

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
	header("Location: index.php?module=Products&action=ListView");
}

echo "\n<p>\n";
echo get_module_title($mod_strings['LBL_MODULE_NAME'], $mod_strings['LBL_MODULE_NAME']. ": " . $focus->get_summary_text(), true);
echo "\n</p>\n";
global $theme;
$theme_path="themes/".$theme."/";
$image_path=$theme_path."images/";
require_once($theme_path.'layout_utils.php');

$log->info("Docs detail view");

$xtpl=new XTemplate ('modules/Products/Docs_DetailView.html');
$xtpl->assign("MOD", $mod_strings);
$xtpl->assign("APP", $app_strings);
$xtpl->assign("THEME", $theme);
$xtpl->assign("GRIDLINE", $gridline);
$xtpl->assign("IMAGE_PATH", $image_path);$xtpl->assign("PRINT_URL", "index.php?".$GLOBALS['request_string']);
$xtpl->assign("ID", $focus->id);
$xtpl->assign("RETURN_MODULE", "Products");
$xtpl->assign("RETURN_ACTION", "Docs_DetailView");
$xtpl->assign("ACTION", "Docs_EditView");
$xtpl->assign("PRODUCT_ID", $focus->product_id);

$xtpl->assign("FILENAME", $focus->filename);
$xtpl->assign("DESCRIPTION", $focus->description);
$xtpl->assign("PATH", $focus->path);
$xtpl->assign("TRANS", $focus->id);

/*
$db = mysql_connect("localhost", "root", "");
mysql_select_db('sugarcrm');
$query = "select products_docs.product_id from products_docs where (products_docs.doc_id = $focus->id)" ;
$mresult = mysql_query($query);
die($mresult);
*/

//Add Custom Fields
require_once('modules/DynamicFields/templates/Files/DetailView.php');

$xtpl->parse("main");
$xtpl->out("main");

?>