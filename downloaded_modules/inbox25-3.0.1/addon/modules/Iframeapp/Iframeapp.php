<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

require_once('data/SugarBean.php');
require_once('include/utils.php');


class Iframeapp extends SugarBean {
	
	var $field_name_map = array();
	// Stored fields
	var $date_entered;
	var $date_modified;
	var $modified_user_id;
	var $assigned_user_id;
	var $iframe_src;
	var $iframe_height;
	var $id;
    
	var $custom_fields;

	var $created_by;
	var $created_by_name;
	var $modified_by_name;

	var $assigned_user_name;
	var $module_dir = 'Iframeapp';

	var $table_name = "iframeapp";
	var $object_name = "Iframeapp";
	var $importable = true;
	var $new_schema = true;


	var $additional_column_fields = Array('assigned_user_name', 'assigned_user_id');
	var $relationship_fields = Array();
	
	function Iframeapp(){
        	parent::SugarBean();
              	$this->setupCustomFields('Iframeapp');
        
		foreach ($this->field_defs as $field) {
			$this->field_name_map[$field['name']] = $field;
		}		
	}	

	function bean_implements($interface){
		switch($interface){
			case 'ACL':return true;
		}
		return false;
	}	
	
	function get_summary_text()
	{
		return $this->iframe_src;
	}	

}
?>
