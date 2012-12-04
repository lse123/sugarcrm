<?PHP

// manifest file for information regarding application of new code
$manifest = array(
    // only install on the following regex sugar versions (if empty, no check)

	'acceptable_sugar_flavors' => array (
	),

	'acceptable_sugar_versions' => array (
		'regex_matches' => array (
			0 => "6\.*\.*",
		),
	),


	'is_uninstallable' => true,

    // name of new code
	'name' 				=> 'inBOX25',

    // description of new code
	'description' 		=> 'Email Marketing Campaign Module for SugarCRM',

    // author of new code
	'author' 			=> 'Bastioncoup',

    // date published
	'published_date'	=> '2012/April/20',

    // version of code
	'version' 			=> '3.0 V3.0-001',

    // type of code (valid choices are: full, langpack, module, patch, theme )
	'type' 				=> 'module',

    // icon for displaying in UI (path to graphic contained within zip package)
	'icon' 				=> ''
);


$installdefs = array(

	'id'=> 'Iframeapp',

    'copy'=> array(
		array(
			'from' => '<basepath>/addon/modules/Iframeapp',
			'to'   => 'modules/Iframeapp',
		)
	),

	'beans'=> array(
		array (
		  'module' => 'Iframeapp',
		  'class' => 'Iframeapp',
		  'path' => 'modules/Iframeapp/Iframeapp.php',
		  'tab' => true,
		)		
	),	
	'language'=> array(
		array('from'=> '<basepath>/language/application/iframeapp-en_us.lang.php',
			  'to_module'=> 'application',
			  'language'=>'en_us'
		)		
	)
);
?>
