<?php
require_once('modules/Products/Product.php');
require_once('modules/Products/ProductDoc.php');
require_once('include/logging.php');
require_once('include/upload_file.php');
global $current_user;

$log =& LoggerManager::getLogger('save the product.');

$focus =& new ProductDoc();
$product  =& new Product();

if ($_POST['isDuplicate'] != 1) {
        $product->retrieve($_POST['record']);
}

if(isset($_REQUEST['docs']))
{
foreach ($focus->column_fields as $field) {
    if (isset($_POST[$field])) {
            $focus->$field=$_POST[$field];
    }
}
foreach ($focus->additional_column_fields as $field) {
    if (isset($_POST[$field])) {
        $focus->$field=$_POST[$field];
    }
}

$upload_file = new UploadFile('path');
if (isset($_FILES['path']) && $upload_file->confirm_upload())
{
        $upload_file->final_move("Product_docs/".$focus->id);
        $focus->path = $upload_file->get_upload_path("Product_docs/".$focus->id);
        $focus->filename=$upload_file->get_stored_file_name();
}

//die($_REQUEST['product_id']);
if(isset($_REQUEST['doc_id']) && $_REQUEST['doc_id'] != "")
{
        //die("edit");
        $focus->id = $_REQUEST['doc_id'];
        $focus->save();

        //die($_POST['return_module']."\n".$_POST['return_action']."\n".$_REQUEST['translation_edit']);
        $return_module = (!empty($_POST['return_module'])) ? $_POST['return_module'] : "Products";
        $return_action = /*(!empty($_POST['return_action'])) ? $_POST['return_action'] :*/ "Docs_DetailView";
        //$return_id = $_POST['return_id'];
        $return_id = $_REQUEST['doc_id'];
}
else
{
        //die("nuevo");
        $focus->product_id = $_REQUEST['record'];
        $focus->save();
        //die($_POST['return_module']."\n".$_POST['return_action']."\n".$translation->id);
        $return_module = (!empty($_POST['return_module'])) ? $_POST['return_module'] : "Products";
        $return_action = /*(!empty($_POST['return_action'])) ? $_POST['return_action'] :*/"Docs_DetailView";
        $return_id = $focus->id;
}

$log->debug("Saved record with id of {$return_id}");

header("Location: index.php?action={$return_action}&module={$return_module}&record={$return_id}");


$focus->save();

}
else
{
// die("prod");
foreach ($product->column_fields as $field) {
        if (isset($_POST[$field])) {
                if ($field == 'available' && $_POST[$field]=='yes') {
                        $product->$field=1;
                } else {
                        $product->$field=$_POST[$field];
                }
        }
}
foreach ($product->additional_column_fields as $field) {
        if (isset($_POST[$field])) {
                $product->$field=$_POST[$field];
        }
}

$upload_file = new UploadFile('image');
if (isset($_FILES['image']) && $upload_file->confirm_upload())
{
        $upload_file->final_move("Product_Thumbnail/".$product->id);
        $product->image = $upload_file->get_upload_path("Product_Thumbnail/".$product->id);
        $product->image_filename = $upload_file->get_stored_file_name();
}

$product->save();

$return_module = (!empty($_POST['return_module'])) ? $_POST['return_module'] : "TimePeriods";
$return_action = (!empty($_POST['return_action'])) ? $_POST['return_action'] : "DetailView";
//$return_id = $_POST['return_id'];
$return_id = $product->id;
$log->debug("Saved record with id of {$return_id}");

header("Location: index.php?action={$return_action}&module={$return_module}&record={$return_id}");
}
?>