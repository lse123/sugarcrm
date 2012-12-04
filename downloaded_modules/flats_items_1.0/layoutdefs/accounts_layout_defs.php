<?php

	### NEW WITH MODULE INSTALLATION ###
	//this metadata will be added to the accounts layout_def extensions during the installation

	$layout_defs['Accounts']['subpanel_setup']['flats_items'] = array(
		'order'			=> 9,
		'module'		=> 'Flats_items',
		'subpanel_name'		=> 'default',
		'get_subpanel_data'	=> 'flats_items',
		'add_subpanel_data'	=> 'flats_id',
		'title_key'		=> 'LBL_FLATS_ITEMS_SUBPANEL_TITLE',
		'top_buttons'		=> array(),
	);

?>
