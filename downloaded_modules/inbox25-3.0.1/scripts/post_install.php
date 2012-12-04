<?php
function post_install() {

	global $db;
	
	include_once("modules/Users/User.php");
	
	$res = $db->query("truncate iframeapp");

	include("modules/ACL/install_actions.php");

	sugar_cache_reset();

}
?>
