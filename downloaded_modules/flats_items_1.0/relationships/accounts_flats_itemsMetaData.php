<?php

//NEW WITH MODULE INSTALLATION

$dictionary['accounts_flats_items'] = array (
	'table' => 'accounts_flats_items',
	'fields' => array (
		array(
			'name' => 'id',
			'type' => 'varchar',
			'len'  => '36'
		),
		array(
			'name' => 'account_id',
			'type' => 'varchar',
			'len'  => '36',
		),
		array(
			'name' => 'flats_item_id',
			'type' => 'varchar',
			'len'  => '36',
		),
		array (
			'name' => 'date_modified',
			'type' => 'datetime'
		),
		array(
			'name'		=> 'deleted',
			'type'		=> 'bool',
			'len'		=> '1',
			'default'	=> '0',
			'required'	=> true
		)
	),
	'indices' => array (
		array(
			'name'	 => 'accounts_flats_itemspk',
			'type'	 => 'primary',
			'fields' => array('id')
		),
		array(
			'name'   => 'idx_acc_inve_acc',
			'type'   => 'index',
			'fields' => array('account_id')
		),
		array(
			'name'   => 'idx_acc_inve_inve',
			'type'   => 'index',
			'fields' => array('flats_item_id')
		),
		array(
			'name'	 => 'idx_account_flats_item',
			'type'	 => 'alternate_key',
			'fields' => array('account_id','flats_item_id')
		)
	),
	'relationships' => array(
		'accounts_flats_items' => array(
			'lhs_module'		=> 'Accounts',
			'lhs_table'		=> 'accounts',
			'lhs_key'		=> 'id',
			'rhs_module'		=> 'Flats_items',
			'rhs_table'		=> 'flats_items',
			'rhs_key'		=> 'id',
			'relationship_type' 	=> 'many-to-many',
			'join_table'		=> 'accounts_flats_items',
			'join_key_lhs'		=> 'account_id',
			'join_key_rhs'		=> 'flats_item_id',
		)
	)
);

?>
