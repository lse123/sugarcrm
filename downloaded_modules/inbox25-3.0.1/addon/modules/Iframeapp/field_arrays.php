<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

$fields_array['Iframeapp'] = array ('column_fields' => Array(
		"iframe_src"
		,"iframe_height"
		,"date_entered"
		,"date_modified"
		,"modified_user_id"
		,"assigned_user_id"
		,"id"
		, "created_by"
		),
        'list_fields' => Array('id', 'iframe_src')
);
?>
