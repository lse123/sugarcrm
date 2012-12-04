<?php

	if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

	$dictionary['Flats_item'] = array(

		### TABLE ###

		'table' => 'flats_items',


		### UNIFIED SEARCH ###

		'unified_search' => true,


		### FIELDS ###

		'fields' => array (

			'id' => array (
				'name' => 'id',
				'vname' => 'LBL_ID',
				'type' => 'id',
				'required' => true,
				'reportable' => false,
				'isnull' => false,
				'massupdate' => false,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'date_entered' => array (
				'name' => 'date_entered',
				'vname' => 'LBL_DATE_ENTERED',
				'type' => 'datetime',
				'required'=>true,
				'comment' => 'Date record created'
				),
			'date_modified' => array (
				'name' => 'date_modified',
				'vname' => 'LBL_DATE_MODIFIED',
				'type' => 'datetime',
				'required'=>true,
				'comment' => 'Date record last modified'
				),
			'modified_user_id' => array (
				'name' => 'modified_user_id',
				'rname' => 'user_name',
				'id_name' => 'modified_user_id',
				'vname' => 'LBL_MODIFIED',
				'type' => 'assigned_user_name',
				'table' => 'modified_user_id_users',
				'isnull' => 'false',
				'dbType' => 'varchar',
				'len' => 36,
				'required'=>true,
				'reportable'=>true,
				'comment' => 'User who last modified record'
				),
			'assigned_user_id' => array (
				'name' => 'assigned_user_id',
				'rname' => 'user_name',
				'id_name' => 'assigned_user_id',
				'vname' => 'LBL_ASSIGNED_TO',
				'type' => 'relate',
				'table' => 'users',
				'isnull' => 'false',
				'dbType' => 'varchar',
				'reportable'=>true,
				'len' => 36,
				'audited'=>true,
				'comment' => 'User assigned to record',
				'module'=>'Users',
				'duplicate_merge'=>'disabled'
				),
			'assigned_user_name' =>  array (
				'name' => 'assigned_user_name',
				'vname' => 'LBL_ASSIGNED_TO',
				'type' => 'varchar',
				'reportable'=>false,
				'source'=>'nondb',
				'table'=>'users',
				'duplicate_merge'=>'disabled'
				),
			'created_by' => array (
				'name' => 'created_by',
				'rname' => 'user_name',
				'id_name' => 'created_by',
				'vname' => 'LBL_CREATED',
				'type' => 'assigned_user_name',
				'table' => 'created_by_users',
				'isnull' => 'false',
				'dbType' => 'varchar',
				'len' => 36,
				'comment' => 'User that created the record'
				),

			'deleted' => array (
				'name' => 'deleted',
				'vname' => 'LBL_DELETED',
				'type' => 'bool',
				'required' => true,
				'reportable' => false,
				'isnull' => false,
				'massupdate' => false,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'date_entered' => array (
				'name' => 'date_entered',
				'vname' => 'LBL_DATE_ENTERED',
				'type' => 'bool',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'date_modified' => array (
				'name' => 'date_modified',
				'vname' => 'LBL_DATE_MODIFIED',
				'type' => 'datetime',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'flats_number' => array(
				'name' => 'flats_number',
				'vname' => 'LBL_FLATS_NUMBER',
				'type' => 'char',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'account_name' => array(
				'name' => 'account_name',
				'vname' => 'LBL_ACCOUNT_NAME',
				'type' => 'char',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => true,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'account_id' => array(
				'name' => 'account_id',
				'vname' => 'LBL_ACCOUNT_ID',
				'type' => 'id',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => true,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'vc' => array(
				'name' => 'vc',
				'vname' => 'LBL_VC',
				'type' => 'enum',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => true,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				'options' => 'vc_dom',
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

	  		'repair' => array(
				'name' => 'repair',
				'vname' => 'LBL_REPAIR',
				'type' => 'enum',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => true,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				'options' => 'repair_dom',
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'ulica' => array(
				'name' => 'ulica',
				'vname' => 'LBL_ULICA',
				'type' => 'char',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'title' => array(
				'name' => 'title',
				'vname' => 'LBL_TITLE',
				'type' => 'char',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'dom' => array(
				'name' => 'dom',
				'vname' => 'LBL_DOM',
				'type' => 'int',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'date_received' => array(
				'name' => 'date_received',
				'vname' => 'LBL_DATE_RECEIVED',
				'type' => 'datetime',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'date_left' => array(
				'name' => 'date_left',
				'vname' => 'LBL_DATE_LEFT',
				'type' => 'datetime',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => true,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			//'medium' => array(
			//	'name' => 'medium',
			//	'vname' => 'LBL_MEDIUM',
			//	'type' => 'enum',
			//	'required' => true,
			//	'reportable' => true,
			//	'isnull' => false,
			//	'massupdate' => false,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
			//	'options' => 'medium_dom',
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
			//	 ),

			'description' => array(
				'name' => 'description',
				'vname' => 'LBL_DESCRIPTION',
				'type' => 'char',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'height' => array(
				'name' => 'height',
				'vname' => 'LBL_HEIGHT',
				'type' => 'double',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'width' => array(
				'name' => 'width',
				'vname' => 'LBL_WIDTH',
				'type' => 'double',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'depth' => array(
				'name' => 'depth',
				'vname' => 'LBL_DEPTH',
				'type' => 'double',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'type' => array(
				'name' => 'type',
				'vname' => 'LBL_TYPE',
				'type' => 'enum',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => true,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				'options' => 'type_dom',
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'kvartira' => array(
				'name' => 'kvartira',
				'vname' => 'LBL_KVARTIRA',
				'type' => 'double',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'target' => array(
				'name' => 'target',
				'vname' => 'LBL_TARGET',
				'type' => 'enum',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => true,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				'options' => 'target_dom',
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'value' => array(
				'name' => 'value',
				'vname' => 'LBL_VALUE',
				'type' => 'char',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				//'default' => ,
				'len' => 10,
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'mebel' => array(
				'name' => 'mebel',
				'vname' => 'LBL_MEBEL',
				'type' => 'enum',
				'required' => true,
				'reportable' => false,
				'isnull' => false,
				'massupdate' => false,
				//'default' => ,
				//'len' =>
				//'sort_on' => ,
				'options' => 'mebel_dom',
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'state' => array(
				'name' => 'state',
				'vname' => 'LBL_STATE',
				'type' => 'enum',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => true,
				//'default' => ,
				//'len' => ,
				//'sort_on' => ,
				'options' => 'state_dom',
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'floor' => array(
				'name' => 'floor',
				'vname' => 'LBL_FLOOR',
				'type' => 'char',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => true,
				//'default' => ,
				//'len' => ,
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),
			'room' => array(
				'name' => 'room',
				'vname' => 'LBL_ROOM',
				'type' => 'char',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => true,
				//'default' => ,
				//'len' => ,
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'photo' => array(
				'name' => 'photo',
				'vname' => 'LBL_PHOTO',
				'type' => 'char',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				'default' => 'modules/Flats_items/images/default.jpg',
				//'len' => ,
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),
			'photo1' => array(
				'name' => 'photo1',
				'vname' => 'LBL_PHOTO',
				'type' => 'char',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				'default' => 'modules/Flats_items/images/default.jpg',
				//'len' => ,
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),
            'photo2' => array(
				'name' => 'photo2',
				'vname' => 'LBL_PHOTO',
				'type' => 'char',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				'default' => 'modules/Flats_items/images/default.jpg',
				//'len' => ,
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),
	        'photo3' => array(
				'name' => 'photo3',
				'vname' => 'LBL_PHOTO',
				'type' => 'char',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				'default' => 'modules/Flats_items/images/default.jpg',
				//'len' => ,
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),
            'photo4' => array(
				'name' => 'photo4',
				'vname' => 'LBL_PHOTO',
				'type' => 'char',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				'default' => 'modules/Flats_items/images/default.jpg',
				//'len' => ,
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),
	        'photo5' => array(
				'name' => 'photo5',
				'vname' => 'LBL_PHOTO',
				'type' => 'char',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				'default' => 'modules/Flats_items/images/default.jpg',
				//'len' => ,
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),


			'status' => array(
				'name' => 'status',
				'vname' => 'LBL_STATUS',
				'type' => 'enum',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				'default' => 'not inspected',
				//'len' => ,
				//'sort_on' => ,
				'options' => 'status_dom',
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			'year' => array(
				'name' => 'year',
				'vname' => 'LBL_YEAR',
				'type' => 'char',
				'required' => false,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				//'default' => ,
				//'len' => ,
				//'sort_on' => ,
				//'options' => ,
				//'dbtype' => ,
				//'rname' => ,
				//'id_name' => ,
				//'source' = 'nondb',
				//'fields' => ,
				//'db_concat_fields' => ,
				 ),

			// special fields to take care of relationships

			'accounts' => array(
				'name' 		=> 'accounts',
				'type' 		=> 'link',
				'relationship' 	=> 'accounts_flats_items',
				'link_tyupe' 	=> 'one',
				'source' 	=> 'non-db',
				'vname' 	=> 'LBL_ACCOUNTS',
				'dubplicate_merge' => 'disabled'
				)
			),


		### INDICES ###

		'indices' => array (

			array(
				'name' => 'flats_item_id_index',
				'type' => 'primary',
				'fields'=> array( 'id' )
				),

			array(
				'name' => 'flats_item_ulica_index',
				'type' => 'index',
				'fields' => array( 'ulica' )
				)

			),


		### RELATIONSHIPS ###

		'relationships' => array (

			// inventory_item relates to accounts and inventory_changes

			'flats_items_flats_changes' => array(
				'lhs_module'		=> 'Flats_items',
				'lhs_table'		=> 'flats_items',
				'lhs_key'		=> 'id',
				'rhs_module'		=> 'Flats_changes',
				'rhs_table'		=> 'flats_changes',
				'rhs_key'		=> 'id',
				'relationship_type' 	=> 'one-to-many',
				'join_table'		=> 'flats_items_flats_changes',
				'join_key_lhs'		=> 'flats_item_id',
				'join_key_rhs'		=> 'flats_change_id',
				)
			),

		### OPTIMISTIC LOCKING ###

		'optimistic_locking'	=> true,
		);



	$dictionary['Flats_change'] = array(

		### TABLE ###

		'table' => 'flats_changes',


		### UNIFIED SEARCH ###

		'unified_search' => true,


		### FIELDS ###

		'fields' => array (

			'id' => array (
				'name' => 'id',
				'vname' => 'LBL_ID',
				'type' => 'id',
				'required' => true,
				'reportable' => false,
				'isnull' => false,
				'massupdate' => false,
				 ),

			'date_entered' => array (
				'name' => 'date_entered',
				'vname' => 'LBL_DATE_ENTERED',
				'type' => 'datetime',
				'required'=>true,
				'comment' => 'Date record created'
				),

			'date_modified' => array (
				'name' => 'date_modified',
				'vname' => 'LBL_DATE_MODIFIED',
				'type' => 'datetime',
				'required'=>true,
				'comment' => 'Date record last modified'
				),

			'modified_user_id' => array (
				'name' => 'modified_user_id',
				'rname' => 'user_name',
				'id_name' => 'modified_user_id',
				'vname' => 'LBL_MODIFIED',
				'type' => 'assigned_user_name',
				'table' => 'modified_user_id_users',
				'isnull' => 'false',
				'dbType' => 'varchar',
				'len' => 36,
				'required'=>true,
				'reportable'=>true,
				'comment' => 'User who last modified record'
				),

		   	'assigned_user_id' => array (
				'name' => 'assigned_user_id',
				'rname' => 'user_name',
				'id_name' => 'assigned_user_id',
				'vname' => 'LBL_ASSIGNED_TO',
				'type' => 'relate',
				'table' => 'users',
				'isnull' => 'false',
				'dbType' => 'varchar',
				'reportable'=>true,
				'len' => 36,
				'audited'=>true,
				'comment' => 'User assigned to record',
				'module'=>'Users',
				'duplicate_merge'=>'disabled'
				),

			'assigned_user_name' =>  array (
				'name' => 'assigned_user_name',
				'vname' => 'LBL_ASSIGNED_TO',
				'type' => 'varchar',
				'reportable'=>false,
				'source'=>'nondb',
				'table'=>'users',
				'duplicate_merge'=>'disabled'
				),

			'created_by' => array (
				'name' => 'created_by',
				'rname' => 'user_name',
				'id_name' => 'created_by',
				'vname' => 'LBL_CREATED',
				'type' => 'assigned_user_name',
				'table' => 'created_by_users',
				'isnull' => 'false',
				'dbType' => 'varchar',
				'len' => 36,
				'comment' => 'User that created the record'
				),

			'deleted' => array (
				'name' => 'deleted',
				'vname' => 'LBL_DELETED',
				'type' => 'bool',
				'required' => true,
				'reportable' => false,
				'isnull' => false,
				'massupdate' => false,
				 ),

			'date_entered' => array (
				'name' => 'date_entered',
				'vname' => 'LBL_DATE_ENTERED',
				'type' => 'bool',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				 ),

			'date_modified' => array (
				'name' => 'date_modified',
				'vname' => 'LBL_DATE_MODIFIED',
				'type' => 'datetime',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				 ),

			'flats_item_id' => array(
				'name' => 'flats_item_id',
				'vname' => 'LBL_FLATS_ITEM_ID',
				'type' => 'id',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				 ),

			'user_id' => array(
				'name' => 'user_id',
				'vname' => 'LBL_USER_ID',
				'type' => 'id',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				 ),

			'user_name' => array(
				'name' => 'user_name',
				'vname' => 'LBL_USER_NAME',
				'type' => 'char',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				 ),

			'changed_field' => array(
				'name' => 'changed_field',
				'vname' => 'LBL_CHANGED_FIELD',
				'type' => 'enum',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				 ),

			'value' => array(
				'name' => 'value',
				'vname' => 'LBL_VALUE',
				'type' => 'char',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				 ),

			'date' => array(
				'name' => 'date',
				'vname' => 'LBL_DATE',
				'type' => 'datetime',
				'required' => true,
				'reportable' => true,
				'isnull' => false,
				'massupdate' => false,
				 ),


			// special fields to take care of relationships

			'flats_items' => array(
				'name' 		=> 'flats_items',
				'type' 		=> 'link',
				'relationship' 	=> 'flats_items_flats_changes',
				'module'	=> 'Flats_items',
				'bean_name'	=> 'Flats_change',
				'source' 	=> 'non-db',
				'vname' 	=> 'LBL_FLATS_ITEMS'
				)
			),


		### INDICES ###

		'indices' => array (

			array(
				'name' => 'flats_change_id_index',
				'type' => 'primary',
				'fields'=> array( 'id' )
				)
			),


		### RELATIONSHIPS ###

		'relationships' => array (),

		### OPTIMISTIC LOCKING ###

		'optimistic_locking'	=> true,

	);

?>
