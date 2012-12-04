<?php

require_once('modules/Products/Product.php');
require_once('modules/Products/ProductDoc.php');
require_once('modules/Products/PBundle.php');
global $mod_strings;

require_once('include/logging.php');

if(isset($_POST['doc_del']))
{
        $log = LoggerManager::getLogger('product_document_delete');

        $focus = new ProductDoc();

        if(!isset($_REQUEST['record']))
                sugar_die($mod_strings['ERR_DELETE_RECORD']);

        $focus->mark_deleted($_REQUEST['record']);

        header("Location: index.php?module=".$_REQUEST['return_module']."&action=".$_REQUEST['return_action']."&record=".$_REQUEST['return_product_id']);
}
else
if(isset($_POST['bundle_del']))
{
        $log = LoggerManager::getLogger('bundle_delete');

        $focus = new PBundle();

        if(!isset($_REQUEST['record']))
                sugar_die($mod_strings['ERR_DELETE_RECORD']);

        $focus->mark_deleted($_REQUEST['record']);

        header("Location: index.php?module=".$_REQUEST['return_module']."&action=".$_REQUEST['return_action']."&record=".$_REQUEST['return_product_id']);
}
else
{
        $log = LoggerManager::getLogger('product_delete');
        $focus = new Product();

        if(!isset($_REQUEST['record']))
	        sugar_die($mod_strings['ERR_DELETE_RECORD']);

        $focus->mark_deleted($_REQUEST['record']);

        header("Location: index.php?module=".$_REQUEST['return_module']."&action=".$_REQUEST['return_action']."&record=".$_REQUEST['return_id']);
}
?>