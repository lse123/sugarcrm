<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

require_once('include/SugarFields/Fields/Base/SugarFieldBase.php');
class SugarFieldDictionary extends SugarFieldBase 
{

    function getDetailViewSmarty($parentFieldArray, $vardef, $displayParams, $tabindex) 
    {

        if (!is_array($displayParams)) 
        {
            $displayParams = array();
        }

        $query = "SELECT {$vardef['ext3']} FROM {$vardef['ext1']} WHERE {$vardef['ext2']}='{$vardef['value']}'";
        $result = $GLOBALS['db']->query($query, false);

        if (($row = $GLOBALS['db']->fetchByAssoc($result)) != null) //fetch row
		{
            $displayParams['street']= $row['name'];
        }

        $this->setup($parentFieldArray, $vardef, $displayParams, $tabindex);
        return $this->fetch($this->findTemplate('DetailView')); //load inside DetailView tempalte
    }

    function getEditViewSmarty($parentFieldArray, $vardef, $displayParams, $tabindex) 
	{

        if (!is_array($displayParams)) 
        {
            $displayParams = array();
        }

        $query = "SELECT {$vardef['ext2']}, {$vardef['ext3']} FROM {$vardef['ext1']} order by {$vardef['ext2']}";
        $result = $GLOBALS['db']->query($query, false);

        $list = array();
        while (($row = $GLOBALS['db']->fetchByAssoc($result)) != null) 
        {
            $list[$row['id']] = $row['name'];
        }
        $displayParams['options']= $list;
        $displayParams['value'] = $vardef['value'];

        $this->setup($parentFieldArray, $vardef, $displayParams, $tabindex);
        return $this->fetch($this->findTemplate('EditView'));
    }
    
    function getListViewSmarty($parentFieldArray, $vardef, $displayParams, $col) 
    {

        if (!is_array($displayParams)) 
        {
            $displayParams = array();
        }

        $value = $parentFieldArray[strtoupper($vardef['name'])];
        $query = "SELECT {$vardef['ext3']} FROM {$vardef['ext1']} WHERE {$vardef['ext2']}='$value'";
        $result = $GLOBALS['db']->query($query, false);

        if (($row = $GLOBALS['db']->fetchByAssoc($result)) != null) 
        {
            $displayParams['street']= $row['name'];
        }

        $this->setup($parentFieldArray, $vardef, $displayParams, $tabindex);

        return $this->fetch($this->findTemplate('ListView'));
    }

    function getSearchViewSmarty($parentFieldArray, $vardef, $displayParams, $col) 
	{
    	if (!is_array($displayParams)) 
    	{
                $displayParams = array();
        }

        $value = $parentFieldArray[strtoupper($vardef['name'])];
        $query = "SELECT {$vardef['ext3']} FROM {$vardef['ext1']} WHERE {$vardef['ext2']}='$value'";
        $result = $GLOBALS['db']->query($query, false);

        if (($row = $GLOBALS['db']->fetchByAssoc($result)) != null) 
    	{
            $displayParams['street']= $row['name'];
        }

        $this->setup($parentFieldArray, $vardef, $displayParams, $tabindex);

        return $this->fetch($this->findTemplate('ListView'));
    }

    function getSearchViewSmarty($parentFieldArray, $vardef, $displayParams, $col) 
	{
        $this->setup($parentFieldArray, $vardef, $displayParams, $tabindex);

        $query = "SELECT {$vardef['ext2']}, {$vardef['ext3']} FROM {$vardef['ext1']} order by {$vardef['ext2']}";
        $result = $GLOBALS['db']->query($query, false);

        $list = array();
        while (($row = $GLOBALS['db']->fetchByAssoc($result)) != null) 
		{
            $list[$row['id']] = $row['name'];
        }
        $displayParams['options']= $list;
        $displayParams['value'] = $vardef['value'];

        $this->setup($parentFieldArray, $vardef, $displayParams, $tabindex);
        return $this->fetch($this->findTemplate('EditView'));

    }

}
?>
