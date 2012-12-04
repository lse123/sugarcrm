<?php

function get_validate_record_js () {
global $mod_strings;
global $app_strings;

$lbl_name = $mod_strings['LBL_NAME'];
$lbl_short_description = $mod_strings['LBL_SHORT_DESCRIPTION'];
$lbl_list_price = $mod_strings['LBL_LIST_PRICE'];
$lbl_default_users = $mod_strings['LBL_DEFAULT_USERS'];
$lbl_default_limit = $mod_strings['LBL_DEFAULT_LIMIT'];
$err_missing_required_fields = $app_strings['ERR_MISSING_REQUIRED_FIELDS'];

$the_script  = <<<EOQ

<script type="text/javascript" language="Javascript">
<!--  to hide script contents from old browsers

function trim(s) {
	while (s.substring(0,1) == " ") {
		s = s.substring(1, s.length);
	}
	while (s.substring(s.length-1, s.length) == ' ') {
		s = s.substring(0,s.length-1);
	}

	return s;
}

function verify_data(form) {
	var isError = false;
	var errorMessage = "";
	if (trim(form.name.value) == "") {
		isError = true;
		errorMessage += "\\n$lbl_name";
	}
	if (trim(form.short_description.value) == "") {
		isError = true;
		errorMessage += "\\n$lbl_short_description";
	}
	if (trim(form.list_price.value) == "") {
		isError = true;
		errorMessage += "\\n$lbl_list_price";
	}
	if (trim(form.default_users.value) == "") {
		isError = true;
		errorMessage += "\\n$lbl_default_users";
	}
	if (trim(form.default_limit.value) == "") {
		isError = true;
		errorMessage += "\\n$lbl_default_limit";
	}

	if (isError == true) {
		alert("$err_missing_required_fields" + errorMessage);
		return false;
	}

	return true;
}

// end hiding contents from old browsers  -->
</script>

EOQ;

return $the_script;
}


?>