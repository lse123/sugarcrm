<?php

	### manifest file for information regarding the new module ###

	$manifest = array(
		'acceptable_sugar_versions' => array(),
		'name' 		=> 'Flats Objects Module',
		'description' 	=> 'Real estate module for keeping track of many unique objects (flats, houses, etc)',
		'author' 	=> 'mailfox',
		'published_date'=> '2009-04-16',
		'version' 	=> '0.1',
		'type' 		=> 'module',
		'icon' 		=> '',
		);



	### INSTALLATION DEFINITIONS ###

	$installdefs = array(

		'id'	=> 'flats_items',

		'copy'	=> array(
			array(
				'from' => '<basepath>/module/Flats_items',
				'to' => 'modules/Flats_items'
				),
			//array(
			//	'from' => '<basepath>/barcode',
			//	'to' => '../barcode'
			//	),
			array(
				'from' => '<basepath>/Accounts/Account.php',
				'to' => 'modules/Accounts/Account.php'
				),
			array(
				'from' => '<basepath>/Accounts/DetailView.php',
				'to' => 'modules/Accounts/DetailView.php'
				),
			array(
				'from' => '<basepath>/Accounts/DetailView.html',
				'to' => 'modules/Accounts/DetailView.html'
				),
			),

		'language' => array(
			array(
				'from'=> '<basepath>/application/app_strings.php',
				'to_module'=> 'application',
				'language'=>'ru_ru'
				),
			array(
				'from'=> '<basepath>/language/accounts_strings.php',
				'to_module'=> 'Accounts',
				'language'=>'ru_ru'
				)
			),

		'layoutdefs'=> array(
			array(
				'from'=> '<basepath>/layoutdefs/accounts_layout_defs.php',
				'to_module'=> 'Accounts'
				)
			),

		'beans' => array(

			array(	'module' => 'Flats_items',
				'class' => 'Flats_item',
				'path' => 'modules/Flats_items/Flats_item.php',
				'tab' => true
				),

			array(	'module' => 'Flats_change',
				'class' => 'Flats_change',
				'path' => 'modules/Flats_items/Flats_change.php',
				'tab' => false
				)
			),

		'relationships'=>array(

			array(	'module' 	=> 'Accounts',
				'meta_data' 	=> '<basepath>/relationships/accounts_flats_itemsMetaData.php',
				'module_vardefs'=> '<basepath>/vardefs/accounts_vardefs.php'
				),

		/*	array(	'module' 	=> 'Inventory_items',
				'meta_data' 	=> '<basepath>/module/Inventory_items/metadata/inventory_items_inventory_changesMetaData.php',
				'module_vardefs'=> '<basepath>/module/Inventory_items/vardefs.php'
				)*/
			)
		);

?>
