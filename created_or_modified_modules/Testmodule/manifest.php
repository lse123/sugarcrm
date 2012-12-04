<?php
/*********************************************************************************
 * SugarCRM is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004 - 2009 SugarCRM Inc.
 * 
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 * 
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 * 
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU General Public License version 3.
 * 
 * In accordance with Section 7(b) of the GNU General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo. If the display of the logo is not reasonably feasible for
 * technical reasons, the Appropriate Legal Notices must display the words
 * "Powered by SugarCRM".
 ********************************************************************************/

$manifest = array (
		  'acceptable_sugar_versions' =>   array (),
		  'acceptable_sugar_flavors' =>   array('CE', 'PRO','ENT'),
		  'readme'=>'',
		  'key'=>'hw',
		  'author' => 'Source Creativity',
		  'description' => 'This is Hello World tutorial',
		  'icon' => '',
		  'is_uninstallable' => true,
		  'name' => 'Hello World',
		  'published_date' => '2010-07-28 16:37:00',
		  'type' => 'module',
		  'version' => '0.1',
		  'remove_tables' => 'prompt',
 );
		  
$installdefs = array (
  'id' => 'HelloWorld',
  'copy' => array (
		0 => array (
		'from' => '<basepath>/modules/ts_testmodule/',
		'to' => 'modules/ts_testmodule',
	  ),
	),
	
  'language'=> 
    array (
    0 => 
    array (
      'from' => '<basepath>/application/app_strings.php',
      'to_module' => 'application',
      'language' => 'en_us',
    ),
    1 => 
    array (
      'from' => '<basepath>/modules/ts_testmodule/language/en_us.lang.php',
      'to_module' => 'ts_testmodule',
      'language' => 'en_us',
    ),
  ),
  
 'beans' => 
  array (
    0 => 
    array (
      'module' => 'ts_testmodule',
      'class' => 'ts_testmodule',
      'path' => 'modules/ts_testmodule/ts_testmodule.php',
      'tab' => true,
    ),
  ),
  
  
);