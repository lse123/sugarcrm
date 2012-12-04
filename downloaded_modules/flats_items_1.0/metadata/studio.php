<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');


### HOW STUDIO CAN EDIT THIS MODULE AND LOCATIONS OF THE FILES ###

$GLOBALS['studioDefs']['Flats_items'] = array(
	'LBL_DETAILVIEW'=>array(
		'template'=>'xtpl',
		'template_file'=>'modules/Flats_items/DetailView.html',
		'php_file'=>'modules/Flats_items/DetailView.php',
		'type'=>'DetailView',
		),
	'LBL_EDITVIEW'=>array(
		'template'=>'xtpl',
		'template_file'=>'modules/Flats_items/EditView.html',
		'php_file'=>'modules/Flats_items/EditView.php',
		'type'=>'EditView',
		),
	'LBL_LISTVIEW'=>array(
		'template'=>'listview',
		'meta_file'=>'modules/Flats_items/listviewdefs.php',
		'type'=>'ListView',
		),
	'LBL_SEARCHFORM'=>array(
		'template'=>'xtpl',
		'template_file'=>'modules/Flats_items/SearchForm.html',
		'php_file'=>'modules/Flats_items/ListView.php',
		'type'=>'SearchForm',
		)

	);
