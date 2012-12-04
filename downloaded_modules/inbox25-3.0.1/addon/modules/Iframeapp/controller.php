<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

require_once('include/MVC/Controller/SugarController.php');
class IframeappController extends SugarController
{
    
	function action_listview(){
		$this->view = 'edit';
	}

	function action_saveconfig() {
		global $current_user,$db;
		
		$res = $db->query("select id from iframeapp where deleted=0 and created_by = '".$current_user->id."'");
		$row = $db->fetchByAssoc($res);
		
		if($row['id']) $this->bean->retrieve($row['id']);
		
		if($_POST['update_url']==1)
			$this->bean->iframe_src = $_POST['iframe_url'];
		
		$this->bean->iframe_height = $_POST['iframe_height'];
		$this->bean->save(false);
		
		SugarApplication::redirect('index.php?module=Iframeapp&action=index');
	}

	function action_detail()
	{
		$this->view = 'edit';
	}
}
