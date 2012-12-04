<?php
$dictionary['flats_items_flats_changes'] = array(

	'table' => 'flats_items_flats_changes',

	'fields' => array(
		array(
			'name' => 'id',
			'type' => 'varchar',
			'len'  => '36'
		),
		array(
			'name' => 'flats_item_id',
			'type' => 'varchar',
			'len'  => '36',
		),
		array(
			'name' => 'flats_change_id',
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
			'name'	 => 'flats_items_flats_changes_pk',
			'type'	 => 'primary',
			'fields' => array('id')
		),
		array(
			'name'   => 'idx_inve_invc_inve',
			'type'   => 'index',
			'fields' => array('flats_item_id')
		),
		array(
			'name'   => 'idx_inve_invc_invc',
			'type'   => 'index',
			'fields' => array('flats_change_id')
		),
		array(
			'name'	 => 'idx_flats_item_flats_change',
			'type'	 => 'alternate_key',
			'fields' => array('flats_item_id','flats_change_id')
		)
	),

	'relationships' => array(
		'accounts_flats_items' => array(
			'lhs_module'		=> 'Flats_items',
			'lhs_table'		=> 'flats_items',
			'lhs_key'		=> 'id',
			'rhs_module'		=> 'Flats_changes',
			'rhs_table'		=> 'flats_changes',
			'rhs_key'		=> 'id',
			'relationship_type' 	=> 'many-to-many',
			'join_table'		=> 'flats_items_flats_changes',
			'join_key_lhs'		=> 'flats_item_id',
			'join_key_rhs'		=> 'flats_change_id',
		)
	)
);
?>
