<?php

$dictionary['ProductDoc'] = array(
        'table' => 'products_docs',
        'fields' => array(

        'id' => array(
            'name' => 'id',
            'vname' => 'LBL_ID',
            'required' => true,
            'type' => 'id',
            'reportable'=>false,
        ),
        'filename' => array(
            'name' => 'filename',
            'vname' => 'LBL_FILENAME',
            'required' => true,
            'type' => 'varchar',
            'len' => 100,
        ),
        'path' => array(
            'name' => 'path',
            'vname' => 'LBL_PATH',
            'required' => true,
            'type' => 'varchar',
            'len' => 100,
        ),
        'description' => array(
            'name' => 'description',
            'vname' => 'LBL_DESCRIPTION',
            'required' => false,
            'type' => 'varchar',
            'len' => 255,
        ),

        'date_modified' => array(
            'name' => 'date_modified',
            'vname' => 'LBL_DATE_MODIFIED',
            'type' => 'datetime',
            'required' => true,
        ),
        'deleted' => array(
            'name' => 'deleted',
            'vname' => 'LBL_DELETED',
            'type' => 'bool',
            'required' => true,
            'default' => '0',
        ),
        'product_id' => array(
            'name' => 'product_id',
            'required' => true,
            'type' => 'id',
        ),


        ),

        'relationships' => array ('products_docs' => array('lhs_module'=> 'Products', 'lhs_table'=> 'product', 'lhs_key' => 'id',
                                                          'rhs_module'=> 'Products', 'rhs_table'=> 'products_docs', 'rhs_key' => 'id',
                                                          'relationship_type'=>'one-to-many',
                                                          'join_table'=> 'products_docs', 'join_key_lhs'=>'product_id', 'join_key_rhs'=>'doc_id'))

);
?>