<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

$dictionary['Iframeapp'] = 
	array('table' => 'iframeapp', 'audited'=>true, 'unified_search' => true, 'duplicate_merge'=>true,
	'fields' => array (
		'id' => array (
			'name' => 'id',
			'vname' => 'LBL_IFRAMEAPP_ID',
			'type' => 'id',
			'required'=>false,
			'reportable'=>false,
			'audited'=>true,
			),
		'iframe_src' => array (
			'name' => 'iframe_src',
			'vname' => 'LBL_IFRAME_SRC',
			'type' => 'varchar',
			'len' => 200,
			),
		'iframe_height' =>array(
			'name'	=>'iframe_height',
			'vname' => 'LBL_IFRAME_HEIGHT',
			'type'	=>'varchar',
			'len'	=>'36',
			),		
		'created_by_link' => array (
			'name' => 'created_by_link',
			'type' => 'link',
			'relationship' => 'iframeapp_created_by',
			'vname' => 'LBL_CREATED_BY_USER',
			'link_type' => 'one',
			'module'=>'Users',
			'bean_name'=>'User',
			'source'=>'non-db',
			),
		'modified_user_link' => array (
			'name' => 'modified_user_link',
			'type' => 'link',
			'relationship' => 'iframeapp_modified_user',
			'vname' => 'LBL_MODIFIED_BY_USER',
			'link_type' => 'one',
			'module'=>'Users',
			'bean_name'=>'User',
			'source'=>'non-db',
			),
		'assigned_user_link' => array (
			'name' => 'assigned_user_link',
			'type' => 'link',
			'relationship' => 'iframeapp_assigned_user',
			'vname' => 'LBL_ASSIGNED_TO_USER',
			'link_type' => 'one',
			'module'=>'Users',
			'bean_name'=>'User',
			'source'=>'non-db',
			'duplicate_merge'=>'enabled',
			'rname' => 'user_name',
			'id_name' => 'assigned_user_id',
			'table' => 'users',
			),			
		)
	, 'indices' => array (
		array('name' =>'idx_iframeapp_id_del', 'type' =>'index', 'fields'=>array('id', 'deleted')),
		array('name' =>'idx_iframeapp_assigned_del', 'type' =>'index', 'fields'=>array( 'deleted', 'assigned_user_id')),
		)
	, 'relationships' => array (
		'iframeapp_assigned_user' => array('lhs_module'=> 'Users', 'lhs_table'=> 'users', 'lhs_key' => 'id',
					'rhs_module'=> 'Iframeapp', 'rhs_table'=> 'iframeapp', 'rhs_key' => 'assigned_user_id',
					'relationship_type'=>'one-to-many'),
		'iframeapp_modified_user' => array('lhs_module'=> 'Users', 'lhs_table'=> 'users', 'lhs_key' => 'id',
					'rhs_module'=> 'Iframeapp', 'rhs_table'=> 'iframeapp', 'rhs_key' => 'modified_user_id',
					'relationship_type'=>'one-to-many'),
		'iframeapp_created_by' => array('lhs_module'=> 'Users', 'lhs_table'=> 'users', 'lhs_key' => 'id',
					'rhs_module'=> 'Iframeapp', 'rhs_table'=> 'iframeapp', 'rhs_key' => 'created_by',
					'relationship_type'=>'one-to-many'),
		)
	,'optimistic_locking'=>true,
);

VardefManager::createVardef('Iframeapp','Iframeapp', array('default', 'assignable','',));


?>
