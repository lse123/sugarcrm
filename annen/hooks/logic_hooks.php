<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

$hook_array = array();
$hook_array['after_save'][] = array(
    1, // order number
    'SyncServices', // just a name
    'custom/modules/Leads/Hooks.php', // file
    'Leads_Hooks', // class
    'syncServices' // method
);
