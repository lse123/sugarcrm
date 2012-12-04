<?php

$GLOBALS['sugarEntry']=1;
//include_once('config.php'); 
require_once('include/logging.php'); 
require_once('data/SugarBean.php'); 
require_once('include/utils.php');

class Product extends SugarBean {
	var $id;
	var $name;
	var $short_description;
	var $long_description;
	var $image;
	var $image_filename;
	var $product_page_url;
    var $available;
    var $list_price;
	var $default_users;
	var $default_limit;
	var $notes;
    var $deleted;
    var $date_modified;
	
	/* End field definitions*/

	/* variable $table_name is used by SugarBean and methods in this file to constructs queries
	 * set this variables value to the table associated with this bean.
	 */
	var $table_name = 'products';

	/*This  variable overrides the object_name variable in SugarBean, wher it has a value of null.*/
	var $object_name = 'Product';

	/**/
	var $module_dir = 'Products';

	/* This is a legacy variable, set its value to true for new modules*/
	var $new_schema = true;

	var $column_fields = Array(
                        'id'
                        ,'name'
                        ,'short_description'
                        ,'long_description'
                        ,'image'
                        ,'image_filename'
                        ,'product_page_url'
                        ,'available'
                        ,'list_price'
                        ,'default_users'
                        ,'default_limit'
                        ,'notes'
                        ,'deleted'
                        ,'date_modified'
	);
		
	/* This is the list of required fields, It is used by some of the utils methods to build the required fields validation JavaScript */
	/* The script is only generated for the Edit View*/
	var $required_fields =  array('id'=>1,'name'=>1,'short_description'=>1,'list_price'=>1);

	/*This bean's constructor*/
	function Product() {
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
        $query .= " id, name, short_description, long_description, image, image_filename, product_page_url, if(available, 'Yes', 'No') as available, list_price, if(default_users is null, 'N/A', default_users), if(default_limit is null, 'N/A', default_limit), notes, deleted, date_modified ";

		//If custom fields exist append the select list here.
        if($custom_join){
			$query .= $custom_join['select'];
		}
		
		//append the WHERE clause to the $query string.
        $query .= " FROM products ";

		//Add custom fields join condition.
		if($custom_join){
			$query .= $custom_join['join'];
		}

		//Append additional filter conditions.
		$where_auto = " (products.deleted=0)";

		//if the function recevied a where clause append it.
		if($where != "")
			$query .= "where $where AND ".$where_auto;
		else
			$query .= "where ".$where_auto;

		//append the order by clause.
		if($order_by != "")
			$query .= " ORDER BY $order_by";
		else
			$query .= " ORDER BY products.name";
        
		return $query;
	}

	function create_export_query()
	{
		return $this->create_list_query();
	}
	
	function bean_implements($interface){
		switch($interface){
			case 'ACL':return true;
		}
		return false;
	}
	
}
?>