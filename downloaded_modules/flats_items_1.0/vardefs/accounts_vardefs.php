<?php

//NEW WITH MODULE INSTALLATION
$dictionary['Account']['fields']['flats_items'] = array (
	'name'			=> 'flats_items',
	'type'			=> 'link',
	'relationship'		=> 'accounts_flats_items',
	'module'		=> 'Flats_items',
	'bean_name'		=> 'Flats_item',
	'source'		=> 'non-db',
	'vname'			=> 'LBL_FLATS_ITEMS'
	);

?>
