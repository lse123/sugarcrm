<?php
$dictionary['Product'] = array(
        'table' => 'products',
        'fields' => array(
                'id' => array(
                        'name' => 'id',
                        'vname' => 'LBL_ID',
                        'type' => 'id',
                        'required' => true,
                ),
                'name' => array (
                      'name' => 'name',
                      'vname'=> 'LBL_NAME',
                      'dbtype'=> 'varchar',
                      'type' => 'name',
                      'len' => 255,
                      'required' => true,
                ),
                'short_description' => array (
                      'name' => 'short_description',
                      'vname' => 'LBL_SHORT_DESCRIPTION',
                      'dbtype' => 'varchar',
                      'type' => 'name',
                      'len' => 255,
                      'required' => true,
                      'mass_update' => true,
                ),
                'long_description' => array (
                      'name' => 'long_description',
                      'vname' => 'LBL_LONG_DESCRIPTION',
                      'type' => 'text',
                      'required' => false,
                ),
                'image' => array(
                      'name' => 'image',
                      'vname' => 'LBL_IMAGE',
                      'type' => 'varchar',
                      'len' => 200,
                      'required' => false,
                ),
                'image_filename' => array(
                      'name' => 'image_filename',
                      'vname' => 'LBL_PRODUCT_FILE',
                      'type' => 'varchar',
                      'len' => 200,
                      'required' => false,
                ), 
                'product_page_url' => array (
                      'name' => 'product_page_url',
                      'vname' => 'LBL_PRODUCT_PAGE_URL',
                      'type' => 'varchar',
                      'len' => 255,
                      'required' => false,
                ),
                'available' => array (
                      'name' => 'available',
                      'vname' => 'LBL_AVAILABLE',
                      'type' => 'bool',
                      'required' => false,
                ),
                'list_price' => array (
                      'name' => 'list_price',
                      'vname' => 'LBL_LIST_PRICE',
                      'type' => 'decimal',
                      'len' => '10,2',
                      'default' => 0,
                      'required' => true,
                ),
                'default_users' => array (
                      'name' => 'default_users',
                      'vname' => 'LBL_DEFAULT_USERS',
                      'type' => 'int',
                      'required' => false,
                ),
                'default_limit' => array (
                      'name' => 'default_limit',
                      'vname' => 'LBL_DEFAULT_LIMIT',
                      'type' => 'int',
                      'required' => false,
                ),
                'notes' => array (
                      'name' => 'notes',
                      'vname' => 'LBL_NOTES',
                      'type' => 'text',
                      'required' => false,
                ),
			    'deleted' => array (
					    'name' => 'deleted',
    					'vname' => 'LBL_DELETED',
    					'type' => 'bool',
    					'reportable'=>false,
    					'default' => '0'
  				),
			    'date_modified' => array (
    					'name' => 'date_modified',
					    'vname' => 'LBL_DATE_MODIFIED',
    					'type' => 'datetime',
  				),

        ),
      'indices' => array (
       array('name' =>'productpk', 'type' =>'primary', 'fields'=>array('id'))
      ),/*
        'relationships' => array (
        'category__product' => array('lhs_module'=> 'Products', 'lhs_table'=> 'product_category', 'lhs_key' => 'id',
                                                          'rhs_module'=> 'Products', 'rhs_table'=> 'products', 'rhs_key' => 'category_id',
                                                          'relationship_type'=>'one-to-many'),
        'brand__product' => array('lhs_module'=> 'Products', 'lhs_table'=> 'product_brand', 'lhs_key' => 'id',
                                                          'rhs_module'=> 'Products', 'rhs_table'=> 'products', 'rhs_key' => 'brand_id',
                                                          'relationship_type'=>'one-to-many'),
        'language__product' => array('lhs_module'=> 'Products', 'lhs_table'=> 'cis_language', 'lhs_key' => 'id',
                                                          'rhs_module'=> 'Products', 'rhs_table'=> 'products', 'rhs_key' => 'default_language',
                                                          'relationship_type'=>'one-to-many')
        ),*/
);

$dictionary['ProductDoc'] = array(
        'table' => 'products_docs',
        'fields' => array(

        'id' => array(
            'name' => 'id',
            'vname' => 'LBL_ID',
            'type' => 'id',
            'required' => true,
        ),
        'product_id' => array(
            'name' => 'product_id',
            'required' => true,
            'type' => 'id',
            'required' => true,
        ),
        'filename' => array(
            'name' => 'filename',
            'vname' => 'LBL_FILENAME',
            'type' => 'varchar',
            'len' => 500,
        ),
        'path' => array(
            'name' => 'path',
            'vname' => 'LBL_PATH',
            'type' => 'varchar',
            'len' => 500,
        ),
        'description' => array(
            'name' => 'description',
            'vname' => 'LBL_DESCRIPTION',
            'type' => 'varchar',
            'len' => 500,
        ),

        'date_modified' => array(
            'name' => 'date_modified',
            'vname' => 'LBL_DATE_MODIFIED',
            'type' => 'datetime',
        ),
        'deleted' => array(
            'name' => 'deleted',
            'vname' => 'LBL_DELETED',
            'type' => 'bool',
            'required' => true,
            'default' => '0',
        ),

        ),

        'relationships' => array ('products_docs' => array('lhs_module'=> 'Products', 'lhs_table'=> 'product', 'lhs_key' => 'id',
                                                          'rhs_module'=> 'Products', 'rhs_table'=> 'products_docs', 'rhs_key' => 'id',
                                                          'relationship_type'=>'one-to-many',
                                                          'join_table'=> 'products_docs', 'join_key_lhs'=>'product_id', 'join_key_rhs'=>'id'))

);

///// BUNDLES //////

$dictionary['PBundle'] = array(
        'table' => 'pbundles',
        'fields' => array(
                'id' => array(
                        'name' => 'id',
                        'vname' => 'LBL_ITEM_ID',
                        'required' => true,
                        'type' => 'id',
                ),
                'available' => array (
                      'name' => 'available',
                      'vname' => 'LBL_AVAILABLE',
                      'type' => 'bool',
                      'required' => false,
                ),
                'name' => array (
                      'name' => 'name',
                      'vname' => 'LBL_NAME',
                      'required'=>false,
                      'type' => 'text',
                ),
			    'deleted' => array (
					    'name' => 'deleted',
    					'vname' => 'LBL_DELETED',
    					'type' => 'bool',
    					'required' => true,
    					'reportable'=>false,
    					'default' => '0'
  				),
			    'date_modified' => array (
    					'name' => 'date_modified',
					    'vname' => 'LBL_DATE_MODIFIED',
    					'type' => 'datetime',
  				),
        ),
         'indices' => array (
       array('name' =>'bundlepk', 'type' =>'primary', 'fields'=>array('id'))
      ),
);

///// BUNDLE ITEMS //////

$dictionary['PBundleItem'] = array(
        'table' => 'pbundle_items',
        'fields' => array(
                'id' => array(
                        'name' => 'id',
                        'vname' => 'LBL_ITEM_ID',
                        'required' => true,
                        'type' => 'id',
                ),
                'bundle_id' => array(
                        'name' => 'bundle_id',
                        'vname' => 'LBL_ITEM_ID',
                        'required' => true,
                        'type' => 'id',
                ),
                'product_id' => array (
                      'name' => 'product_id',
                      'vname' => 'LBL_ITEM_PRODUCT_ID',
                      'required'=>false,
                      'type' => 'id',
                ),
                'product_name' => array (
                      'name' => 'product_name',
                      'vname' => 'LBL_ITEM_PRODUCT_NAME',
                      'required'=>false,
                      'type' => 'text',
                ),
                'product_description' => array (
                      'name' => 'product_description',
                      'vname' => 'LBL_ITEM_PRODUCT_DESCRIPTION',
                      'required'=>false,
                      'type' => 'text',
                ),
                'users' => array (
                      'name' => 'users',
                      'vname' => 'LBL_USERS',
                      'required'=> true,
                      'default' => 1,
                      'type' => 'int',
                ),
                'ulimit' => array (
                      'name' => 'ulimit',
                      'vname' => 'LBL_ULIMIT',
                      'required'=> false,
                      'default' => 1,
                      'type' => 'int',
                ),
                'price' => array(
                        'name' => 'price',
                        'vname' => 'LBL_ITEM_COST',
                        'required' => false,
                      'type' => 'decimal',
                      'len' => '10,2',
                ),                
			    'deleted' => array (
					    'name' => 'deleted',
    					'vname' => 'LBL_DELETED',
    					'type' => 'bool',
    					'required' => true,
    					'reportable'=>false,
    					'default' => '0'
  				),
        ),
         'indices' => array (
       array('name' =>'bitempk', 'type' =>'primary', 'fields'=>array('id'))
      ),
);

?>