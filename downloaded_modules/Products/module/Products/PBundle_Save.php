<?php

require_once('modules/Products/PBundle.php');
require_once('modules/Products/PBundleItem.php');
require_once('include/logging.php');
global $current_user;

$log =& LoggerManager::getLogger('Saving a quote.');

$focus =& new PBundle();

if ($_POST['isUpdate'] == 1) {
	$focus->retrieve($_POST['record']);
	$focus->deleted = 1;
	$focus->save();
	$focus->id = "";
}

foreach ($focus->column_fields as $field) {
        if ($field == 'available' && $_POST[$field]=='yes')
			$focus->$field=1;
		else
			if (isset($_POST[$field]))
				$focus->$field=$_POST[$field];
}

$focus->deleted = 0;

global $current_user;

$focus->save();

$return_id = $focus->id;

// now saving items
for ($i=1; $i<=$_POST["items_count"];$i++)
{
	if (isset ($_POST["i_id_".$i]))
	{
		$bi =& new PBundleItem();
		$bi->bundle_id = $return_id;
		$bi->product_id = $_POST["i_id_".$i];
		$bi->product_name = $_POST["i_name_".$i];
		$bi->product_description = $_POST["i_description_".$i];
		$bi->users = $_POST["i_users_".$i];
		$bi->ulimit = $_POST["i_limit_".$i];
		$bi->price = $_POST["i_price_".$i];
		$bi->save();
	}
}

$return_module = (!empty($_POST['return_module'])) ? $_POST['return_module'] : "Products";
$return_action = (!empty($_POST['return_action'])) ? $_POST['return_action'] : "DetailView";
$log->debug("Saved record with id of {$return_id}");

header("Location: index.php?action={$return_action}&module={$return_module}&record={$return_id}");

?>