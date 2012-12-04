<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');


require_once('include/MVC/View/views/view.edit.php');
require_once('modules/Iframeapp/Forms.php');
require_once('modules/Iframeapp/Iframeapp.php');

class IframeappViewEdit extends ViewEdit
{
	/**
	* @see SugarView::preDisplay()
	*/
	public function preDisplay()
	{
		
	}

	/**
	* @see SugarView::_getModuleTitleParams()
	*/
	protected function _getModuleTitleParams()
	{
		global $mod_strings;

		return array("<a href='index.php?module=Iframeapp&action=index'>".translate('LBL_MODULE_NAME','Iframeapp')."</a>");
	}

	/**
	* @see SugarView::display()
	*/
	public function display()
	{
		global $current_user, $mod_strings, $app_strings, $app_list_strings, $sugar_config, $locale,$db;
		
		$res = $db->query("select * from iframeapp where deleted=0 and created_by = '".$current_user->id."'");
		$row = $db->fetchByAssoc($res);

		$iframe_src = $row['iframe_src'];
		$iframe_height = $row['iframe_height'];
		
		if($iframe_height=='') $iframe_height = '800';
		$this->ss->assign('IFRAME_HEIGHT', $iframe_height);
		if($iframe_src!='') {
			$cipher = "rijndael-128";
			$mode = "cbc";
			$secret_key = "ge8C2mWu9jLraK5v";
			$iv = "fedcba9876543210";
			$plain_text = time();

			$td = mcrypt_module_open($cipher, "", $mode, $iv);
			mcrypt_generic_init($td, $secret_key, $iv);
			$cyper_text = mcrypt_generic($td, $plain_text);
			mcrypt_generic_deinit($td);
			mcrypt_module_close($td);
		
			$ts = bin2hex($cyper_text);
			$this->ss->assign('IFRAME_SRC', $iframe_src.'&ts='.$ts);
			$this->ss->assign('IFRAME_URL', $iframe_src);
		} else {
			$this->ss->assign('IFRAME_URL', '');
			$this->ss->assign('IFRAME_SRC', 'https://www.inbox25.com/sugarcrm_module.php');
		}	

		echo $this->getModuleTitle();
		
		$this->ss->display('modules/Iframeapp/tpls/EditView.tpl');

	}
}
