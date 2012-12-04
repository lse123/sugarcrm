<?php

/* Include all other system or application files that you need to reference here.*/
include_once('config.php');   /*Include this file if you want to access sugar specific settings*/
require_once('include/logging.php'); /*Include this file if you want to write messages to the log file*/
require_once('data/SugarBean.php'); /*Include this file since we are extending SugarBean*/
require_once('include/utils.php'); /* Include this file if you want access to Utility methods such as return_module_language,return_mod_list_strings_language, etc ..*/

class PBundle extends SugarBean {
	/* Foreach instance of the bean you will need to access the fields in the table.
	 * So define a variable for each one of them, the varaible name should be same as the field name
	 * Use this module's vardef file as a reference to create these variables.
	 */
	
	var $id;
	var $name;
	var $available;
	
	/* End field definitions*/

	/* variable $table_name is used by SugarBean and methods in this file to constructs queries
	 * set this variables value to the table associated with this bean.
	 */
	var $table_name = 'pbundles';

	/*This  variable overrides the object_name variable in SugarBean, wher it has a value of null.*/
	var $object_name = 'PBundle';

	/**/
	var $module_dir = 'Products';

	/* This is a legacy variable, set its value to true for new modules*/
	var $new_schema = true;

	/* $column_fields holds a list of columns that exist in this bean's table. This list is referenced
	 * when fetching or saving data for the bean. As you modify a table you need to keep this up to date.
	 */
	var $column_fields = Array(
						'id'
                        ,'name'
                        ,'available'
	);
	
		
	// This is used to retrieve related fields from form posts.
	/* List forms usually show less data than the detail forms, this list is used to construct data for list forms.
	 * Fields in this list need not be database fields only, if you have some computed fields that go in the list add
	 * them to this list. Also create a variable in the bean.
	
	 var $list_fields = array('id', 'field1', 'field2', 'field3', 'field4');
	 todo remove this, since the system uses vardefs to achieve this*/

	/* This is the list of required fields, It is used by some of the utils methods to build the required fields validation JavaScript */
	/* The script is only generated for the Edit View*/
	var $required_fields =  array();

	/*This bean's constructor*/
	function PBundle () {
		/*Call the parent's constructor which will setup a database connection, logger and other settings.*/
		parent::SugarBean();
		// BEGIN SUGARCRM PRO ONLY
		$this->disable_row_level_security=true;
		// END SUGARCRM PRO ONLY
		
		
	}

	/* This method should return the summary text which is used to build the bread crumb navigation*/
	/* Generally from this method you would return value of a field that is required and is of type string*/ 
	function get_summary_text()
	{
		return "$this->name";
	}


	/* This method is used to generate query for the list form. The base implementation of this method
	 * uses the table_name and list_field varaible to generate the basic query and then  adds the custom field
	 * join and team filter. If you are implementing this function do not forget to consider the additional conditions.
	 */
	function create_list_query($order_by, $where)
	{
		//Build the join condition for custom fields, the custom field array was populated
		//when you invoked the constructor for the SugarBean.
		$custom_join = $this->custom_fields->getJOIN();
   
   		//Build the select list for the query. 
        $query = "SELECT ";
        $query .= " pbundles.* ";

		//append the WHERE clause to the $query string.
        $query .= " FROM pbundles ";

		//Append additional filter conditions.
		$where_auto = " (deleted = 0) ";

		//if the function recevied a where clause append it.
		if($where != "")
			$query .= "where $where AND ".$where_auto;
            //            $query .= "where $where";
		else
			$query .= "where ".$where_auto;

		//append the order by clause.
		if($order_by != "")
			$query .= " ORDER BY $order_by";
		else
			$query .= " ORDER BY pbundles.name";
                //die($query);
                return $query;
	}

	function create_export_query()
	{
		return $this->create_list_query();
	}
}
?>