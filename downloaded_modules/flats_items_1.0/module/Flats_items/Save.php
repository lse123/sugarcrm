<?php

	if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');



	### FIX DATES ###

	$_REQUEST['date_received'] = $_REQUEST['date_received'] . ' 00:00';

	if( $_REQUEST['date_left'] )
	{
		$_REQUEST['date_left'] = $_REQUEST['date_left'] . ' 00:00';
	}


	### INITIALIZE OBJECT ###

	require_once('modules/Flats_items/Flats_item.php');

	$focus = new Flats_item();



	### GET ANY DATA FROM DATABASE ###

	$focus->retrieve($_REQUEST['record']);



	### ACL ACCESS ###

	if(!$focus->ACLAccess('Save'))
	{
		ACLController::displayNoAccess(true);
		sugar_cleanup(true);
	}



	### CHECK IF WE NEED LOGS WHILE POPULATING OBJECT DATA FROM POST ###

	$change_fields = array( 	'date_received',
					'date_left',
					'flats_number',
					'account_id'
					);

	$change_flags = array();

	foreach($focus->column_fields as $field)
	{
		if(isset($_REQUEST[$field]))
		{
			$value = $_REQUEST[$field];

			if( in_array( $field, $change_fields ) && $focus->$field != $value && $focus->$field )
			{
				$change_flags[$field] = $value;
			}

			$focus->$field = $value;
		}
	}



	### POPULATE ADDITIONAL OBJECT DATA FROM POST ###

	foreach($focus->additional_column_fields as $field)
	{
		if(isset($_REQUEST[$field]))
		{
			$value = $_REQUEST[$field];
			$focus->$field = $value;

		}
	}



	### BUILD INVENTORY NUMBER ###

	if( ! $focus->flats_number )
	{
		$name = explode( ' ', strtoupper($_REQUEST['account_name']) );

		if( count( $name ) == 1 )
		{
			$name = $name[0];
		}
		else
		{
			$name = $name[1] . '.' . substr( $name[0], 0, 1 );
		}

		$item_number = $focus->get_num_items( $_REQUEST['account_id'] ) + 1;

		switch( strlen( $item_number ) )
		{
			case 1 :
				$item_number = '00' . $item_number;
				break;
			case 2 :
				$item_number = '0' . $item_number;
				break;
		}

		$flats_number = str_replace( '-', '.', substr( $focus->date_received, 0, 10 ) ) . '_' . $item_number;

		$focus->flats_number = $flats_number;
	}



	### SAVE RESIZED PHOTO ###
    if( file_exists( $_FILES['photo']['tmp_name'] ) )
	{
		$dir = 'modules/Flats_items/images/';
        $new_name = $focus->flats_number;
        $photo = $_FILES['photo'];
        $filename  = $dir . $new_name . '.jpeg';
		$thumbname = $dir . $new_name . '_thumb.jpeg';
        $focus->photo = $filename;
        $image = imagecreatefromjpeg( $photo['tmp_name'] );
        $max_dimension = 700;
        $old_x = imageSX( $image );
		$old_y = imageSY( $image );
        if( $old_x > $old_y )
		{
			$x = $max_dimension;
			$y = $max_dimension * $old_y / $old_x;
		}
		else if( $old_x < $old_y )
		{
			$x = $max_dimension * $old_x / $old_y;
			$y = $max_dimension;
		}
		else
		{
			$x = $max_dimension;
			$y = $x;
		}

		$resized_image = ImageCreateTrueColor( $x, $y );
        imagecopyresampled( $resized_image, $image, 0, 0, 0, 0, $x, $y, $old_x, $old_y );
        imagejpeg( $resized_image, $filename );
        imagedestroy( $image );
        imagedestroy( $resized_image );
        ### SAVE THUMBNAIL ###
        $resized_image = imagecreatefromjpeg( $filename );
        $max_dimension = 100;
        $old_x = imageSX( $resized_image );
		$old_y = imageSY( $resized_image );
        if( $old_x > $old_y )
		{
			$x = $max_dimension;
			$y = $max_dimension * $old_y / $old_x;
		}
		else if( $old_x < $old_y )
		{
			$x = $max_dimension * $old_x / $old_y;
			$y = $max_dimension;
		}
		else
		{
			$x = $max_dimension;
			$y = $x;
		}
        $thumb = ImageCreateTrueColor( $x, $y );
        imagecopyresampled( $thumb, $resized_image, 0, 0, 0, 0, $x, $y, $old_x, $old_y );
        imagejpeg( $thumb, $thumbname );
        imagedestroy( $resized_image );
		imagedestroy( $thumb );
       }

   ### SAVE RESIZED PHOTO1 ###
        if( file_exists( $_FILES['photo1']['tmp_name'] ) )
	{
  		$dir = 'modules/Flats_items/images/';
        $new_name = $focus->flats_number;
        $photo1 = $_FILES['photo1'];
        $filename  = $dir . $new_name . '1.jpeg';
		$thumbname = $dir . $new_name . '1_thumb.jpeg';
        $focus->photo1 = $filename;
        $image = imagecreatefromjpeg( $photo1['tmp_name'] );
        $max_dimension = 700;
        $old_x = imageSX( $image );
		$old_y = imageSY( $image );
        if( $old_x > $old_y )
		{
			$x = $max_dimension;
			$y = $max_dimension * $old_y / $old_x;
		}
		else if( $old_x < $old_y )
		{
			$x = $max_dimension * $old_x / $old_y;
			$y = $max_dimension;
		}
		else
		{
			$x = $max_dimension;
			$y = $x;
		}
        $resized_image = ImageCreateTrueColor( $x, $y );
        imagecopyresampled( $resized_image, $image, 0, 0, 0, 0, $x, $y, $old_x, $old_y );
        imagejpeg( $resized_image, $filename );
        imagedestroy( $image );
        imagedestroy( $resized_image );
        ### SAVE THUMBNAIL1 ###
        $resized_image = imagecreatefromjpeg( $filename );
        $max_dimension = 100;
        $old_x = imageSX( $resized_image );
		$old_y = imageSY( $resized_image );
        if( $old_x > $old_y )
		{
			$x = $max_dimension;
			$y = $max_dimension * $old_y / $old_x;
		}
		else if( $old_x < $old_y )
		{
			$x = $max_dimension * $old_x / $old_y;
			$y = $max_dimension;
		}
		else
		{
			$x = $max_dimension;
			$y = $x;
		}
        $thumb = ImageCreateTrueColor( $x, $y );
        imagecopyresampled( $thumb, $resized_image, 0, 0, 0, 0, $x, $y, $old_x, $old_y );
        imagejpeg( $thumb, $thumbname );
        imagedestroy( $resized_image );
		imagedestroy( $thumb );
     }


   ### SAVE RESIZED PHOTO2 ###
        if( file_exists( $_FILES['photo2']['tmp_name'] ) )
	{
  		$dir = 'modules/Flats_items/images/';
        $new_name = $focus->flats_number;
        $photo2 = $_FILES['photo2'];
        $filename  = $dir . $new_name . '2.jpeg';
		$thumbname = $dir . $new_name . '2_thumb.jpeg';
        $focus->photo2 = $filename;
        $image = imagecreatefromjpeg( $photo2['tmp_name'] );
        $max_dimension = 700;
        $old_x = imageSX( $image );
		$old_y = imageSY( $image );
        if( $old_x > $old_y )
		{
			$x = $max_dimension;
			$y = $max_dimension * $old_y / $old_x;
		}
		else if( $old_x < $old_y )
		{
			$x = $max_dimension * $old_x / $old_y;
			$y = $max_dimension;
		}
		else
		{
			$x = $max_dimension;
			$y = $x;
		}
        $resized_image = ImageCreateTrueColor( $x, $y );
        imagecopyresampled( $resized_image, $image, 0, 0, 0, 0, $x, $y, $old_x, $old_y );
        imagejpeg( $resized_image, $filename );
        imagedestroy( $image );
        imagedestroy( $resized_image );
        ### SAVE THUMBNAIL2 ###
        $resized_image = imagecreatefromjpeg( $filename );
        $max_dimension = 100;
        $old_x = imageSX( $resized_image );
		$old_y = imageSY( $resized_image );
        if( $old_x > $old_y )
		{
			$x = $max_dimension;
			$y = $max_dimension * $old_y / $old_x;
		}
		else if( $old_x < $old_y )
		{
			$x = $max_dimension * $old_x / $old_y;
			$y = $max_dimension;
		}
		else
		{
			$x = $max_dimension;
			$y = $x;
		}
        $thumb = ImageCreateTrueColor( $x, $y );
        imagecopyresampled( $thumb, $resized_image, 0, 0, 0, 0, $x, $y, $old_x, $old_y );
        imagejpeg( $thumb, $thumbname );
        imagedestroy( $resized_image );
		imagedestroy( $thumb );
     }

   ### SAVE RESIZED PHOTO3 ###
        if( file_exists( $_FILES['photo3']['tmp_name'] ) )
	{
  		$dir = 'modules/Flats_items/images/';
        $new_name = $focus->flats_number;
        $photo3 = $_FILES['photo3'];
        $filename  = $dir . $new_name . '3.jpeg';
		$thumbname = $dir . $new_name . '3_thumb.jpeg';
        $focus->photo3 = $filename;
        $image = imagecreatefromjpeg( $photo3['tmp_name'] );
        $max_dimension = 700;
        $old_x = imageSX( $image );
		$old_y = imageSY( $image );
        if( $old_x > $old_y )
		{
			$x = $max_dimension;
			$y = $max_dimension * $old_y / $old_x;
		}
		else if( $old_x < $old_y )
		{
			$x = $max_dimension * $old_x / $old_y;
			$y = $max_dimension;
		}
		else
		{
			$x = $max_dimension;
			$y = $x;
		}
        $resized_image = ImageCreateTrueColor( $x, $y );
        imagecopyresampled( $resized_image, $image, 0, 0, 0, 0, $x, $y, $old_x, $old_y );
        imagejpeg( $resized_image, $filename );
        imagedestroy( $image );
        imagedestroy( $resized_image );
        ### SAVE THUMBNAIL3 ###
        $resized_image = imagecreatefromjpeg( $filename );
        $max_dimension = 100;
        $old_x = imageSX( $resized_image );
		$old_y = imageSY( $resized_image );
        if( $old_x > $old_y )
		{
			$x = $max_dimension;
			$y = $max_dimension * $old_y / $old_x;
		}
		else if( $old_x < $old_y )
		{
			$x = $max_dimension * $old_x / $old_y;
			$y = $max_dimension;
		}
		else
		{
			$x = $max_dimension;
			$y = $x;
		}
        $thumb = ImageCreateTrueColor( $x, $y );
        imagecopyresampled( $thumb, $resized_image, 0, 0, 0, 0, $x, $y, $old_x, $old_y );
        imagejpeg( $thumb, $thumbname );
        imagedestroy( $resized_image );
		imagedestroy( $thumb );
     }

   ### SAVE RESIZED PHOTO4 ###
        if( file_exists( $_FILES['photo4']['tmp_name'] ) )
	{
  		$dir = 'modules/Flats_items/images/';
        $new_name = $focus->flats_number;
        $photo4 = $_FILES['photo4'];
        $filename  = $dir . $new_name . '4.jpeg';
		$thumbname = $dir . $new_name . '4_thumb.jpeg';
        $focus->photo4 = $filename;
        $image = imagecreatefromjpeg( $photo4['tmp_name'] );
        $max_dimension = 700;
        $old_x = imageSX( $image );
		$old_y = imageSY( $image );
        if( $old_x > $old_y )
		{
			$x = $max_dimension;
			$y = $max_dimension * $old_y / $old_x;
		}
		else if( $old_x < $old_y )
		{
			$x = $max_dimension * $old_x / $old_y;
			$y = $max_dimension;
		}
		else
		{
			$x = $max_dimension;
			$y = $x;
		}
        $resized_image = ImageCreateTrueColor( $x, $y );
        imagecopyresampled( $resized_image, $image, 0, 0, 0, 0, $x, $y, $old_x, $old_y );
        imagejpeg( $resized_image, $filename );
        imagedestroy( $image );
        imagedestroy( $resized_image );
        ### SAVE THUMBNAIL4 ###
        $resized_image = imagecreatefromjpeg( $filename );
        $max_dimension = 100;
        $old_x = imageSX( $resized_image );
		$old_y = imageSY( $resized_image );
        if( $old_x > $old_y )
		{
			$x = $max_dimension;
			$y = $max_dimension * $old_y / $old_x;
		}
		else if( $old_x < $old_y )
		{
			$x = $max_dimension * $old_x / $old_y;
			$y = $max_dimension;
		}
		else
		{
			$x = $max_dimension;
			$y = $x;
		}
        $thumb = ImageCreateTrueColor( $x, $y );
        imagecopyresampled( $thumb, $resized_image, 0, 0, 0, 0, $x, $y, $old_x, $old_y );
        imagejpeg( $thumb, $thumbname );
        imagedestroy( $resized_image );
		imagedestroy( $thumb );
     }
   ### SAVE RESIZED PHOTO5 ###
        if( file_exists( $_FILES['photo5']['tmp_name'] ) )
	{
  		$dir = 'modules/Flats_items/images/';
        $new_name = $focus->flats_number;
        $photo5 = $_FILES['photo5'];
        $filename  = $dir . $new_name . '5.jpeg';
		$thumbname = $dir . $new_name . '5_thumb.jpeg';
        $focus->photo5 = $filename;
        $image = imagecreatefromjpeg( $photo5['tmp_name'] );
        $max_dimension = 700;
        $old_x = imageSX( $image );
		$old_y = imageSY( $image );
        if( $old_x > $old_y )
		{
			$x = $max_dimension;
			$y = $max_dimension * $old_y / $old_x;
		}
		else if( $old_x < $old_y )
		{
			$x = $max_dimension * $old_x / $old_y;
			$y = $max_dimension;
		}
		else
		{
			$x = $max_dimension;
			$y = $x;
		}
        $resized_image = ImageCreateTrueColor( $x, $y );
        imagecopyresampled( $resized_image, $image, 0, 0, 0, 0, $x, $y, $old_x, $old_y );
        imagejpeg( $resized_image, $filename );
        imagedestroy( $image );
        imagedestroy( $resized_image );
        ### SAVE THUMBNAIL5 ###
        $resized_image = imagecreatefromjpeg( $filename );
        $max_dimension = 100;
        $old_x = imageSX( $resized_image );
		$old_y = imageSY( $resized_image );
        if( $old_x > $old_y )
		{
			$x = $max_dimension;
			$y = $max_dimension * $old_y / $old_x;
		}
		else if( $old_x < $old_y )
		{
			$x = $max_dimension * $old_x / $old_y;
			$y = $max_dimension;
		}
		else
		{
			$x = $max_dimension;
			$y = $x;
		}
        $thumb = ImageCreateTrueColor( $x, $y );
        imagecopyresampled( $thumb, $resized_image, 0, 0, 0, 0, $x, $y, $old_x, $old_y );
        imagejpeg( $thumb, $thumbname );
        imagedestroy( $resized_image );
		imagedestroy( $thumb );
     }






	### SAVE / UPDATE ###

	if($focus->save())
	{
		global $current_user;

		foreach( $change_flags as $field => $value )
		{
			require_once 'Flats_change.php';

			$change = new Flats_change();

			$change->flats_item_id = $focus->id;
			$change->user_id = $current_user->id;
			$change->user_name = $current_user->name;
			$change->changed_field = $field;
			$change->value = $value;
			$change->date = date('Y-m-d H:i');

			$change->save();
		}
	}



	### RETURN TO INDEX PAGE ###

	$return_id = $focus->id;

	require_once('include/formbase.php');

	handleRedirect($return_id,'Flats_items');

?>
