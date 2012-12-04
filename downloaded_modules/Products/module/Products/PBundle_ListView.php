<?php

require_once('XTemplate/xtpl.php');
require_once("data/Tracker.php");
require_once('modules/Products/PBundle.php');
require_once('themes/'.$theme.'/layout_utils.php');
require_once('include/logging.php');
require_once('include/ListView/ListView.php');

global $app_strings;
global $app_list_strings;
global $current_language;
$current_module_strings = return_module_language($current_language, 'Products');

global $urlPrefix;

$log = LoggerManager::getLogger('products_bundle_list');

global $currentModule;

global $theme;

if (!isset($where)) $where = "";

$seed =& new PBundle();
require_once('modules/MySettings/StoreQuery.php');
$storeQuery = new StoreQuery();
if(!isset($_REQUEST['query'])){
	$storeQuery->loadQuery($currentModule);
	$storeQuery->populateRequest();
}else{
	$storeQuery->saveFromGet($currentModule);
}

/*
if(isset($_REQUEST['query']))
{
       if (isset($_REQUEST['name'])) $model = $_REQUEST['name'];
       if (isset($_REQUEST['available']) && ($_REQUEST['available'] != "")) $available = $_REQUEST['available'];

        $where_clauses = Array();

        if(isset($name) && $name != "") array_push($where_clauses, "pbundles.name like '%".PearDatabase::quote($name)."%'");
        if($available != "") array_push($where_clauses, "pbundles.available = ".$available);

        $seed->custom_fields->setWhereClauses($where_clauses);

	$where = "";
	foreach($where_clauses as $clause)
	{
		if($where != "")
		$where .= " and ";
		$where .= $clause;
	}

	$log->info("Here is the where clause for the list view: $where");
        //die("Here is the where clause for the list view: $where".$_REQUEST['query']);
}

//SEARCH FORM
if (!isset($_REQUEST['search_form']) || $_REQUEST['search_form'] != 'false') {
	// Stick the form header out there.
	$search_form=new XTemplate ('modules/Products/PBundle_SearchForm.html');
	$search_form->assign("MOD", $current_module_strings);
	$search_form->assign("APP", $app_strings);
	$search_form->assign("IMAGE_PATH", $image_path);
	$search_form->assign("ADVANCED_SEARCH_PNG", get_image($image_path.'advanced_search','alt="'.$app_strings['LNK_ADVANCED_SEARCH'].'"  border="0"'));
	$search_form->assign("BASIC_SEARCH_PNG", get_image($image_path.'basic_search','alt="'.$app_strings['LNK_BASIC_SEARCH'].'"  border="0"'));
	if (isset($name)) $search_form->assign("name", $name);
	if ($available == "1")
		$aop = "<option value=''></option><option value='1' selected>Yes</option><option value='0'>No</option>";
	else
		if ($available == "0")
			$aop = "<option value=''></option><option value='1'>Yes</option><option value='0' selected>No</option>";
		else
			$aop = "<option value='' selected></option><option value='1'>Yes</option><option value='0'>No</option>";
		
	$search_form->assign("AVAILABLE", $aop);
	$search_form->assign("JAVASCRIPT", get_clear_form_js());

	$header_text = '';

	echo get_form_header("Search Bundles", $header_text, false);

  
    if(isset($id) && $id != "") $search_form->assign("ID", $id);
	// adding custom fields:
	$seed->custom_fields->populateXTPL($search_form, 'search' );

	$search_form->parse("main");
	$search_form->out("main");

	echo get_form_footer();
	echo "\n<BR>\n";
}
*/

$ListView = new ListView();

$ListView->initNewXTemplate('modules/Products/PBundle_ListView.html',$current_module_strings);
$ListView->setHeaderTitle($current_module_strings['LBL_LIST_PBUNDLE_FORM_ID'] );
global $current_user;
$ListView->show_mass_update=false;
$ListView->show_export_button=false;
//$ListView->show_paging =false;
if(is_admin($current_user) && $_REQUEST['module'] != 'DynamicLayout' && !empty($_SESSION['editinplace'])){
	$ListView->setHeaderText("<a href='index.php?action=index&module=DynamicLayout&from_action=ListView&from_module=".$_REQUEST['module'] ."'>".get_image($image_path."EditLayout","border='0' alt='Edit Layout' align='bottom'")."</a>" );
}
$ListView->setQuery($where, "", "", "PBUNDLE");
$ListView->processListView($seed, "main", "PBUNDLE");
?>