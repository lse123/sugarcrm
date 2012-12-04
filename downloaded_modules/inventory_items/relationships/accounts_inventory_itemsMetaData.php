<?php

//NEW WITH MODULE INSTALLATION

$dictionary['accounts_inventory_items'] = array (
	'table' => 'accounts_inventory_items',
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
			'name' => 'inventory_item_id',
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
			'name'	 => 'accounts_inventory_itemspk',
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
			'fields' => array('inventory_item_id')
		),
		array(
			'name'	 => 'idx_account_inventory_item',
			'type'	 => 'alternate_key',
			'fields' => array('account_id','inventory_item_id')
		)
	),
	'relationships' => array(
		'accounts_inventory_items' => array(
			'lhs_module'		=> 'Accounts',
			'lhs_table'		=> 'accounts',
			'lhs_key'		=> 'id',
			'rhs_module'		=> 'Inventory_items',
			'rhs_table'		=> 'inventory_items',
			'rhs_key'		=> 'id',
			'relationship_type' 	=> 'many-to-many',
			'join_table'		=> 'accounts_inventory_items',
			'join_key_lhs'		=> 'account_id',
			'join_key_rhs'		=> 'inventory_item_id',
		)
	)
);

?>
