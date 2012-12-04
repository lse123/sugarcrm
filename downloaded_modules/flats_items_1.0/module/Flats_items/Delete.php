<?php
	require_once 'modules/Flats_items/Flats_item.php';

	global $mod_strings;

	$focus = new Flats_item();

	if( ! isset( $_REQUEST['record'] ) )
	{
		sugar_die( $mod_strings['ERR_DELETE_RECORD'] );
	}

	$focus->mark_deleted( $_REQUEST['record'] );

	header("Location: index.php?module=" . $_REQUEST['return_module'] . "&action=" . $_REQUEST['return_action']);
?>
