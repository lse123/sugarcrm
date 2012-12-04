<?php

global $mod_strings, $app_strings;
$module_menu = Array(
	Array("index.php?module=Products&action=ListView", $mod_strings['LNK_PRODUCT_LIST'],"Products"),
    Array("index.php?module=Products&action=EditView&return_module=Products&return_action=DetailView", $mod_strings['LNK_NEW_PRODUCT'], "CreateProducts"),
	Array("index.php?module=Products&action=PBundle_ListView", $mod_strings['LNK_PBUNDLE_LIST'],"Products"),
    Array("index.php?module=Products&action=PBundle_EditView&return_module=Products&return_action=PBundle_DetailView", $mod_strings['LNK_NEW_PBUNDLE'], "CreateProducts"),
);

?>