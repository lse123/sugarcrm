<?PHP
// manifest file for information regarding application of new code
$manifest = array(
    // only install on the following regex sugar versions (if empty, no check)
    'acceptable_sugar_versions' => array(),

    // name of new code
    'name' => 'Broadlook Products Catalog',

    // description of new code
    'description' => 'Broadlook Products Catalog',

    // author of new code
    'author' => 'Maykel Rodriguez Rivero (maykelrr@marori.com)',

    // date published
    'published_date' => '2006/05/25',

    // version of code
    'version' => '2',

    // type of code (valid choices are: full, langpack, module, patch, theme )
    'type' => 'module',

    // icon for displaying in UI (path to graphic contained within zip package)
    'icon' => '',
    'is_uninstallable' => true,
);

$installdefs = array(
	'id'=> 'products',
	'image_dir'=>'<basepath>/images',
	'copy' => array(
						array('from'=> '<basepath>/module/Products',
							  'to'=> 'modules/Products',
	   			 		     ),
                        array('from'=> '<basepath>/Product_Thumbnail',
                              'to'=> 'cache/upload/Product_Thumbnail',
                             ),
                        array('from'=> '<basepath>/Product_docs',
                              'to'=> 'cache/upload/Product_docs',
                             ),
						array('from'=> '<basepath>/extras/xajax_0.2.3',
							  'to'=> 'include/xajax_0.2.3',
							  ),
						array('from'=> '<basepath>/extras/Quotation.EditView.common.php',
							  'to'=> 'Quotation.EditView.common.php',
							  ),
					),
	
	'language'=> array(array('from'=> '<basepath>/application/app_strings.php',
							 'to_module'=> 'application',
							 'language'=>'en_us'
							)
					  ),
	'beans'=> array(
					array('module'=> 'Products',
						  'class'=> 'Product',
					  	  'path'=> 'modules/Products/Product.php',
					  	  'tab'=> true,
					 	 ),
					array('module'=> 'PBundle',
						  'class'=> 'PBundle',
					  	  'path'=> 'modules/Products/PBundle.php',
					  	  'tab'=> false,
					 	 ),
					array('module'=> 'PBundleItem',
						  'class'=> 'PBundleItem',
					  	  'path'=> 'modules/Products/PBundleItem.php',
					  	  'tab'=> false,
					 	 ),
				   ),
    'relationships'=>array(
	                     array(
    		                     'module'=> 'Products',
                                 'meta_data'=>'<basepath>/relationships/products_docsMetaData.php',
                                 //'module_vardefs'=>'<basepath>/vardefs/product_translation_vardefs.php',
                                 //'module_layoutdefs'=>'<basepath>/layoutdefs/product_translationlayout_defs.php'
                              )
                           )
);
?>