<?php

	### manifest file for information regarding the new module ###

	$manifest = array(
		'acceptable_sugar_versions' => array(),
		'name' 		=> 'Inventory Item Module',
		'description' 	=> 'inventory module for keeping track of many unique items (art, jewelry, furniture, etc)',
		'author' 	=> 'Freshout',
		'published_date'=> '2007-10-10',
		'version' 	=> '.12',
		'type' 		=> 'module',
		'icon' 		=> '',
		);



	### INSTALLATION DEFINITIONS ###

	$installdefs = array(

		'id'	=> 'inventory_items',

		'copy'	=> array(
			array(
				'from' => '<basepath>/module/Inventory_items',
				'to' => 'modules/Inventory_items'
				),
			array(
				'from' => '<basepath>/barcode',
				'to' => '../barcode'
				),
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
				'language'=>'en_us'
				),
			array(
				'from'=> '<basepath>/language/accounts_strings.php', 
				'to_module'=> 'Accounts',
				'language'=>'en_us'
				)
			),

		'layoutdefs'=> array(
			array(
				'from'=> '<basepath>/layoutdefs/accounts_layout_defs.php', 
				'to_module'=> 'Accounts'
				)
			),

		'beans' => array(

			array(	'module' => 'Inventory_items',
				'class' => 'Inventory_item',
				'path' => 'modules/Inventory_items/Inventory_item.php',
				'tab' => true
				),

			array(	'module' => 'Inventory_change',
				'class' => 'Inventory_change',
				'path' => 'modules/Inventory_items/Inventory_change.php',
				'tab' => false
				)
			),

		'relationships'=>array(

			array(	'module' 	=> 'Accounts',
				'meta_data' 	=> '<basepath>/relationships/accounts_inventory_itemsMetaData.php',
				'module_vardefs'=> '<basepath>/vardefs/accounts_vardefs.php'
				),

		/*	array(	'module' 	=> 'Inventory_items',
				'meta_data' 	=> '<basepath>/module/Inventory_items/metadata/inventory_items_inventory_changesMetaData.php',
				'module_vardefs'=> '<basepath>/module/Inventory_items/vardefs.php'
				)*/
			)
		);

?>
