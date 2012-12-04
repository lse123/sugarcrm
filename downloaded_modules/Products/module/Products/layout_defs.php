<?php
/**
 * Layout definition for Accounts
 *
 * The contents of this file are subject to the SugarCRM Public License Version
 * 1.1.3 ("License"); You may not use this file except in compliance with the
 * License. You may obtain a copy of the License at http://www.sugarcrm.com/SPL
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied.  See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * All copies of the Covered Code must include on each user interface screen:
 *    (i) the "Powered by SugarCRM" logo and
 *    (ii) the SugarCRM copyright notice
 * in the same form as they appear in the distribution.  See full license for
 * requirements.
 *
 * The Original Code is: SugarCRM Open Source
 * The Initial Developer of the Original Code is SugarCRM, Inc.
 * Portions created by SugarCRM are Copyright (C) 2004-2005 SugarCRM, Inc.;
 * All Rights Reserved.
 * Contributor(s): ______________________________________.
 */
// $Id: layout_defs.php,v 1.44 2005/08/10 23:15:30 ajay Exp $

$layout_defs['ProductDocs'] = array(
	// list of what Subpanels to show in the DetailView
	'subpanel_setup' => array(
		'product_docs' => array(
			'order' => 60,
			'module' => 'ProductDocs',
			'subpanel_name' => 'default',
			'get_subpanel_data' => 'docs',
			'add_subpanel_data' => 'document_id',
			'title_key' => 'LBL_DEFAULT_SUBPANEL_TITLE',
		),
	),	
);
?>