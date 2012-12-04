<?php

	### CHECK ENTRY POINT ###

	if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

	$GLOBALS['log']->info("Flats_item detail view");



	### INCLUDED FILES ###

	require_once('XTemplate/xtpl.php');
	require_once('data/Tracker.php');
	require_once('modules/Flats_items/Flats_item.php');
	require_once('include/DetailView/DetailView.php');


	### GLOBAL VARIABLES ###

	global $timedate;
	global $mod_strings;
	global $app_strings;
	global $app_list_strings;
	global $gridline;



	### INITIALIZE INVENTORY ITEM ###

	$focus = new Flats_item();
	$detailView = new DetailView();

	$offset=0;

	if( isset($_REQUEST['offset']) or isset($_REQUEST['record']) )
	{
		$result = $detailView->processSugarBean("FLATS_ITEM", $focus, $offset);

		if($result == null)
		{
		    sugar_die($app_strings['ERROR_NO_RECORD']);
		}

		$focus=$result;
	}
	else
	{
		header("Location: index.php?module=Flats_items&action=index");
	}


	### CHECK FOR DUPLICATES ###

	if(isset($_REQUEST['isDuplicate']) && $_REQUEST['isDuplicate'] == 'true')
	{
		$focus->id = "";
	}



	### LOAD THEME ###

	global $theme;
	$theme_path = "themes/".$theme."/";
	$image_path = $theme_path."images/";

	require_once($theme_path.'layout_utils.php');



	### DISPLAY TITLE ###

	echo "\n<p>\n";
		echo get_module_title($mod_strings['LBL_MODULE_NAME'], $mod_strings['LBL_MODULE_NAME'].": " . $focus->flats_number, true);
	echo "\n</p>\n";



	### XTemplate ###

	$xtpl = new XTemplate('modules/Flats_items/DetailView.html');

	$xtpl->assign("MOD", 			$mod_strings);
	$xtpl->assign("APP", 			$app_strings);

	$xtpl->assign("THEME", 			$theme);
	$xtpl->assign("GRIDLINE", 		$gridline);
	$xtpl->assign("IMAGE_PATH", 		$image_path);
	$xtpl->assign("PRINT_URL", 		"index.php?" . $GLOBALS['request_string']);


	// Prepend a currency symbol to this monetary value

	if($focus->value != '')
	{
		$xtpl->assign("VALUE", '$' . $focus->value);
	}

	$xtpl->assign("ID",			$focus->id );
	$xtpl->assign("DATE_ENTERED",		substr($focus->date_entered ,0,10) );
	$xtpl->assign("DATE_MODIFIED",		substr($focus->date_modified,0,10) );
	$xtpl->assign("DATE_RECEIVED",		substr($focus->date_received,0,10) );

	if( $focus->date_left != '2000-01-01 00:00' )
	{
		$xtpl->assign("DATE_LEFT",	substr($focus->date_left,0,10) );
	}

	$xtpl->assign("FLATS_NUMBER",	$focus->flats_number );
	$xtpl->assign("ACCOUNT_NAME",		$focus->account_name );
	$xtpl->assign("ACCOUNT_ID",		$focus->account_id );
	$xtpl->assign("VC",		$focus->vc );
	$xtpl->assign("REPAIR",		$focus->repair );
	$xtpl->assign("ULICA",			$focus->ulica );
	$xtpl->assign("TITLE",			$focus->title );
	$xtpl->assign("DOM",			$focus->dom );
	//$xtpl->assign("MEDIUM",			$focus->medium );
	$xtpl->assign("DESCRIPTION",		$focus->description );
	$xtpl->assign("HEIGHT",			$focus->height );
	$xtpl->assign("WIDTH",			$focus->width );
	$xtpl->assign("DEPTH",			$focus->depth);
	$xtpl->assign("TYPE",		$focus->type);
	$xtpl->assign("KVARTIRA",		$focus->kvartira);
	$xtpl->assign("TARGET",		$focus->target);
	$xtpl->assign("VALUE",			$focus->value);
	$xtpl->assign("MEBEL",		$focus->mebel);
	$xtpl->assign("STATE",		$focus->state);
	$xtpl->assign("FLOOR",		$focus->floor);
	$xtpl->assign("ROOM",		$focus->room);
	$xtpl->assign("PHOTO",			$focus->photo);
	$xtpl->assign("PHOTO1",			$focus->photo1);
	$xtpl->assign("PHOTO2",			$focus->photo2);
	$xtpl->assign("PHOTO3",			$focus->photo3);
	$xtpl->assign("PHOTO4",			$focus->photo4);
	$xtpl->assign("PHOTO5",			$focus->photo5);
	$xtpl->assign("STATUS",		$focus->status);
	$xtpl->assign("YEAR",	$focus->year);



	### IMAGE AND BARCODE ###

	$path = htmlentities( strip_tags( $_SERVER['PHP_SELF'] ) ) . dirname(__FILE__);

	$path = explode( 'index.php', $path );

	$base = $path[0];

	$base_array = explode( '/', $base );
	array_pop( $base_array );
	array_pop( $base_array );
	$base = implode( '/', $base_array );
	$base .= '/';

	$path = explode( '/modules/', $path[1] );

	//$barcode_url = $base . 'modules/' . $path[1] . '/barcode/barcode.php?num=' . $focus->inventory_number;

	//$barcode_url = $base . 'barcode/barcode_img.php?num=' . $focus->inventory_number;

	//$xtpl->assign("BARCODE_URL",		$barcode_url );
	$xtpl->assign("PHOTO_URL",		$focus->photo );
	$xtpl->assign("PHOTO_URL1",		$focus->photo1 );
	$xtpl->assign("PHOTO_URL2",		$focus->photo2 );
	$xtpl->assign("PHOTO_URL3",		$focus->photo3 );
	$xtpl->assign("PHOTO_URL4",		$focus->photo4 );
	$xtpl->assign("PHOTO_URL5",		$focus->photo5 );


	$name_array = explode( '.', $focus->photo );
	$name_array1 = explode( '.', $focus->photo1 );
	$name_array2 = explode( '.', $focus->photo2 );
	$name_array3 = explode( '.', $focus->photo3 );
	$name_array4 = explode( '.', $focus->photo4 );
	$name_array5 = explode( '.', $focus->photo5 );


	$name_array[ count( $name_array ) - 2 ] = $name_array[ count( $name_array ) - 2 ] . '_thumb';
    $thumb_name = implode( '.', $name_array );
    $xtpl->assign("THUMB_URL",		$thumb_name);
    //$thumb_name = implode( '.', $name_array );
	//$name_array[ count( $name_array ) - 2 ] = $name_array[ count( $name_array ) - 2 ] . '_thumb1';
    $name_array1[ count( $name_array1 ) - 2 ] = $name_array1[ count( $name_array1 ) - 2 ] . '_thumb';
    $thumb_name = implode( '.', $name_array1 );
    $xtpl->assign("THUMB_URL1",		$thumb_name);
    //$thumb_name = implode( '.', $name_array );
	//$name_array[ count( $name_array ) - 2 ] = $name_array[ count( $name_array ) - 2 ] . '_thumb1';
    $name_array2[ count( $name_array2 ) - 2 ] = $name_array2[ count( $name_array2 ) - 2 ] . '_thumb';
    $thumb_name = implode( '.', $name_array2 );
    $xtpl->assign("THUMB_URL2",		$thumb_name);
	//$thumb_name = implode( '.', $name_array );
	//$name_array[ count( $name_array ) - 2 ] = $name_array[ count( $name_array ) - 2 ] . '_thumb1';
    $name_array3[ count( $name_array3 ) - 2 ] = $name_array3[ count( $name_array3 ) - 2 ] . '_thumb';
  	$thumb_name = implode( '.', $name_array3 );
    $xtpl->assign("THUMB_URL3",		$thumb_name);
    //$thumb_name = implode( '.', $name_array );
	//$name_array[ count( $name_array ) - 2 ] = $name_array[ count( $name_array ) - 2 ] . '_thumb1';
    $name_array4[ count( $name_array4 ) - 2 ] = $name_array4[ count( $name_array4 ) - 2 ] . '_thumb';
  	$thumb_name = implode( '.', $name_array4 );
    $xtpl->assign("THUMB_URL4",		$thumb_name);
   	//$thumb_name = implode( '.', $name_array );
	//$name_array[ count( $name_array ) - 2 ] = $name_array[ count( $name_array ) - 2 ] . '_thumb1';
    $name_array5[ count( $name_array5 ) - 2 ] = $name_array5[ count( $name_array5 ) - 2 ] . '_thumb';
  	$thumb_name = implode( '.', $name_array5 );
    $xtpl->assign("THUMB_URL5",		$thumb_name);
    //$thumb_name = implode( '.', $name_array );
	//$name_array[ count( $name_array ) - 2 ] = $name_array[ count( $name_array ) - 2 ] . '_thumb1';
    //$name_array6[ count( $name_array6 ) - 2 ] = $name_array6[ count( $name_array6 ) - 2 ] . '_thumb';
  	//$thumb_name = implode( '.', $name_array6 );
    //$xtpl->assign("THUMB_URL6",		$thumb_name);

	### USER RELATED ###

	global $current_user;

	if(is_admin($current_user) && $_REQUEST['module'] != 'DynamicLayout' && !empty($_SESSION['editinplace']))
	{
		$xtpl->assign("ADMIN_EDIT","<a href='index.php?action=index&module=DynamicLayout&from_action=" .
				$_REQUEST['action'] . "&from_module=" . $_REQUEST['module'] . "&record=" . $_REQUEST['record']. "'>" .
				get_image( $image_path . "EditLayout", "border='0' alt='Edit Layout' align='bottom'") . "</a>");
	}


	if( isset($_REQUEST['show_logs']) )
	{
		require_once 'Flats_change.php';

		$flats_change = new Flats_change();

		$xtpl->assign("FLATS_CHANGES",	$flats_change->get_logs( $focus->id ) );
	}



	$detailView->processListNavigation($xtpl, "FLATS_ITEM", $offset, $focus->is_AuditEnabled());


	### adding custom fields ###


	require_once('modules/DynamicFields/templates/Files/DetailView.php');



	### X TEMPLATE PARSING AND OUTPUT ###

	$xtpl->parse("main.open_source");


	$xtpl->parse("main");
	$xtpl->out("main");


	### SUB PANELS PARSING AND OUTPUT ###

	$sub_xtpl = $xtpl;

	require_once('include/SubPanel/SubPanelTiles.php');

	$subpanel = new SubPanelTiles($focus, 'Flats_items');

	//echo $subpanel->display();



	### SAVED SEARCH ###

	require_once('modules/SavedSearch/SavedSearch.php');
	$savedSearch = new SavedSearch();
	$json = getJSONobj();
	$savedSearchSelects = $json->encode(array($GLOBALS['app_strings']['LBL_SAVED_SEARCH_SHORTCUT'] . '<br>' . $savedSearch->getSelect('Flats_items')));
	$str = "<script>
	YAHOO.util.Event.addListener(window, 'load', SUGAR.util.fillShortcuts, $savedSearchSelects);
	</script>";

	echo $str;

?>
