<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

//this metadata file defines the popup for widgets when called by other modules
$popupMeta = array(
	'moduleMain' => 'Flats_item',
	'varName' => 'FLATS_ITEM',
	'orderBy' => 'flats_items.artist',
	'whereClauses' =>
		array(
			'title' => 'flats_items.title',
			'artist' => 'flats_items.artist'
		),
	'searchInputs' =>
		array(
			'title',
			'artist'
		)
	);
?>


