<?php
include_once('config.php');
require_once('include/logging.php');
require_once('data/SugarBean.php');
require_once('include/utils.php');

class ProductDoc extends SugarBean {
	var $id;
    var $product_id;
	var $filename;
	var $path;
    var $description;
	var $date_modified;
	var $deleted;

	var $table_name = 'products_docs';
	
	/*This  variable overrides the object_name variable in SugarBean, wher it has a value of null.*/
	var $object_name = 'ProductDoc';
	
	/**/
	var $module_dir = 'Products';
	
	/* This is a legacy variable, set its value to true for new modules*/
	var $new_schema = true;

	var $column_fields = Array(
			'id'
            ,'product_id'
			,'filename'
			,'path'
			,'description'
			,'date_modified'
			,'deleted'
	);
		
	/* This is the list of required fields, It is used by some of the utils methods to build the required fields validation JavaScript */
	/* The script is only generated for the Edit View*/
	var $required_fields =  array("id"=>1, "filename"=>2, "path"=>3,);

	/*This bean's constructor*/
	function ProductDoc() {
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
		return "$this->filename";
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
        $query .= " products_docs.* ";

        //If custom fields exist append the select list here.
        if($custom_join){
            $query .= $custom_join['select'];
        }

        //append the WHERE clause to the $query string.
        $query .= " FROM products_docs INNER JOIN products ON products_docs.product_id = products.id ";

        //Add custom fields join condition.
        if($custom_join){
            $query .= $custom_join['join'];
        }

        //Append additional filter conditions.
        $where_auto = " (products_docs.deleted=0 AND products.deleted=0)";

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
            $query .= " ORDER BY products_docs.filename";

        return $query;	
	}

	function create_export_query()
	{
		return $this->create_list_query();
	}
}
?>