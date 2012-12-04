<?php
// ************** sugar stuff **************
$GLOBALS['sugarEntry'] = true;
include_once('config.php');
require_once('log4php/LoggerManager.php');
require_once('include/utils.php');

clean_special_arguments();

require_once('modules/ACL/ACLController.php');

$GLOBALS['log'] = LoggerManager::getLogger('SugarCRM');

clean_special_arguments();

// ************** XAJAX stuff **************
require_once('include/xajax_0.2.3/xajax.inc.php');

$xajax = new xajax('Quotation.EditView.common.php');

$xajax->registerFunction("lookupProduct");
$xajax->registerFunction("lookupTemplate");
$xajax->registerFunction("lookupEmailTemplate");

require_once('modules/Products/Product.php');
require_once('modules/Products/PBundleItem.php');
require_once('modules/Quotation/QTemplate.php');
require_once('modules/EmailTemplates/EmailTemplate.php');

function lookupProduct($lid, $lbid)
{
	$objResponse = new xajaxResponse();

	$product = new Product();
	for ($i = 1; $i <= count ($lid); $i++)
	{
		$product->retrieve($lid[$i]);
		
		if ($product)
		{
			$objResponse->addAssign("_product_id", "value", $product->id);
			$objResponse->addAssign("_product_name", "value", $product->name);
			$objResponse->addAssign("_product_description", "value", $product->short_description);
			$objResponse->addAssign("_product_users", "value", $product->default_users);
			$objResponse->addAssign("_product_limit", "value", $product->default_limit);
			$objResponse->addAssign("_product_price", "value", $product->list_price);
			$objResponse->addScript("add_product();");
		}
	}

	$bundle_item = new PBundleItem();
	for ($i = 1; $i <= count ($lbid); $i++)
	{
		$bitems = $bundle_item->get_full_list("", " (bundle_id='".$lbid[$i]."') ");
		
		if (isset ($bundle_item))
		{
			foreach ($bitems as $bitem)
			{
				$objResponse->addAssign("_product_id", "value", $bitem->product_id);
				$objResponse->addAssign("_product_name", "value", $bitem->product_name);
				$objResponse->addAssign("_product_description", "value", $bitem->product_description);
				$objResponse->addAssign("_product_users", "value", $bitem->users);
				$objResponse->addAssign("_product_limit", "value", $bitem->ulimit);
				$objResponse->addAssign("_product_price", "value", $bitem->price);
				$objResponse->addScript("add_product();");
			}
		}
	}

	$objResponse->addAssign("select_product_btn", "value", "ADD >");
	$objResponse->addAssign("select_product_btn", "disabled", false);

	return $objResponse->getXML();
}

function lookupTemplate($id)
{
	$objResponse = new xajaxResponse();

	$template = new QTemplate();
	$template->retrieve($id);
	
	if ($template)
	{
		$objResponse->addAssign("maintenance", "value", $template->maintenance);
		$objResponse->addAssign("maintenance_percent", "value", $template->maintenance_percent);
		$objResponse->addAssign("price_multiplier", "value", $template->price_multiplier);
		$objResponse->addAssign("terms", "value", $template->terms);
		$objResponse->addAssign("notes", "value", $template->notes);
		$objResponse->addAssign("template", "disabled", false);
		$objResponse->addScript("maintenance_v = ".$template->maintenance.";maintenance_percent = ".($template->maintenance_percent?"1":"0").";price_multiplier = ".$template->price_multiplier.";applyTemplate();");
	}
	else
	{
		$objResponse->addScript("alert ('Template not found');");
	}

	return $objResponse->getXML();
}

function lookupEmailTemplate($id)
{
	$objResponse = new xajaxResponse();

	$etemplate = new EmailTemplate();
	$etemplate->retrieve($id);
	
	if ($etemplate)
	{
		$objResponse->addAssign("preview", "innerHTML", from_html($etemplate->body_html));
		$objResponse->addAssign("email_template", "disabled", false);
		$objResponse->addAssign("subject", "value", $etemplate->subject);
		$objResponse->addScript("apply_quotation();");
	}
	else
	{
		$objResponse->addScript("alert ('Email Template not found');");
	}

	return $objResponse->getXML();
}

$xajax->processRequests();

?>