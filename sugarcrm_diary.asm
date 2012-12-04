

"27 NOV 2012"
9.17

Working on zayavki module

Issue: Few fields are missing inside the form

;Missing fields:

LBL_MIDDLE_NAME: not in list		
LBL_ADDRESS_STATE: not in list		 	
LBL_ADDRESS_CITY: not in list			
LBL_ADDRESS_STREET: 		
LBL_ADDRESS_BUILDING: 		 	
LBL_ADDRESS_APPARTMENT: 			
LBL_ADDRESS_POSTCODE: 
LBL_EMAIL:	

9.25
;Issue solved

9.51

;Srarting to work on the customer address table

10.23
;Working with SugarFieldDictionary.php

1. function fetchByAssoc
-The function fetchByAssoc only returns one row, not the entire table you want. 
 After reading a row, a pointer is set to the beginning of next row

 ; Srudying SugarCRM module building

 ;useful links:
 http://www.epicom.com/blog/crm/customizing-dashlets-and-tabs-in-sugarcrm

;billing
http://www.youtube.com/watch?v=Zs6xx7qeH04

;autocomplete address field

http://www.youtube.com/watch?v=2ZhRAkR_A5o
http://www.profilingsolutions.com/software-products/sugarcrm-modules/address-postalcode-auto-appendandlookup/
http://forums.sugarcrm.com/f6/autocomplete-address-fields-72357/#post252117


;notes from studying:
;sugarcrm moduleoverview: 

- A sugar module consists of the following files:
-- A Vardefs file that specifies the Sugar metadata for the database table: 
   fields, data types, and relationships
-- A SugarBean file that implements that functionality to create , retrieve, update, and delete objects in Sugar. 
   SugarBean is the base class for all business objects in Sugar. Each module implements this base class
   with aditional properties and methods specific to that module. 
-- Metadata files that define the contents and layout of the Sugar screens.
---ListView: lists the existing records in the module
---Detail View: displays record details
---EditView: allows user to edit the record.
---SubPanels: displays the module's relationship with other Sugar modules
---Popups: displays list of records to link with another record. 


16.22

;more useful links
http://sugarcrm-dev.blogspot.com/2012/05/how-to-develop-and-deploy-custom.html
http://support.sugarcrm.com/02_Documentation/04_Sugar_Developer/Sugar_Developer_Guide_6.5/03_Module_Framework#Performance_Considerations

"28 NOV 2012"

9.30
; Studying more about module building in sugarcrm

9.40
;Reading "Building on sugacrm" (O'Reilly)
~ Reding about adding new fields to a module
~ Reading about Sugar Logic
~ Sugar Logic seems to e missing in the CE
~ BPM (Business Process Maker) seems to be a quite useful replacement
# read more about BPM and SugarCRM workflow
http://www.processmaker.com/sugarcrm-workflow
# read more about hooks:
http://developers.sugarcrm.com/docs/OS/5.2/-docs-Developer_Guides-Developer_Guide_5.2-DevGuide%205.2.1.47.html

11.08
;Working onsetting up an account with multiple addresses as shown on sheet 1

;Useful links:
http://forums.sugarcrm.com/f22/setting-up-account-multiple-addresses-47374/

;multiple addresses by using relationships
http://developers.sugarcrm.com/docs/OS/5.2/-docs-Developer_Guides-Developer_Guide_5.2-DevGuide%205.2.1.40.html

http://cheleguanaco.blogspot.com/2012/04/sugarcrm-customization-dynamic.html

http://www.profilingsolutions.com/archive/converting-relationships-in-sugarcrm-one-many-to-many-many/

http://cheleguanaco.blogspot.com/2012/03/sugarcrm-cookbook-adding-related.html

15.27
;Notes
;Workflows are missing in the CE


15.53
;Notes
;In the future for inventory we can look into this:
http://www.sugarforge.org/frs/?group_id=333
;We should note that it is for an earlier version (5.5)

16.44
;Subpanels
http://support.sugarcrm.com/04_Find_Answers/03_Developers/100Customization/Dynamically_Hiding_Subpanels_Based_on_Record_Values

17.16
;Reading O'Reilly's book
;The code on page 46 seems quite hard to understand. I will need to review it. 

17.36
;Working on SHEET 1

;Address part

;If the service address is the same as the user's address : continue (get data from the Users(пользватели) module)
;If not : enter new address


;Inventory part

;For this situation it might be good to add an "inventory" module
;The module will have few categories for inventories and all tools in a drop down list
;The list should be connected with a database where the names of all inventory items are stored 


18.06
;Useful information
http://sugartalk.ru/customize-sugarcrm-part1.html


"29 NOV 2012"

9.41
;Reading "SugarCRM developers manual"

;Reading about creating a new tab
;in order to create a new tab you need to create a module first


;Reading about dashlets


10.04
;Reading going on

;I have decided to install sugarcrm at home
; and create custom modules and dashlets as shown in the book

11.04
;Follow the steps metioned in the book

: Adding drop down
: - admin >> Dropdown Editor >> Add Dropdown


16.17
;Reading going on

:Logic hooks
;I will need to learn this perfectly, it is very useful

#Get all useful information aboout sugarcrm available on springerlink


16.48
;Reading going on
:Upgrading, migrating
;Chapter 7 contains useful information 
;about upgrading sugarcm, migrating and comparing databases


17.09
;Reading going on
:Processing data in module
;Chapter 8, page 199 provides a solution to the streets issue on SHEET 2
;it uses a mysql query and concatenates the data

"30 NOV 2012"

10.20
;Creating a custom module by hand

14.02
;Module called "Test Module" created and working
0556636969
14.12
;Now I will work on adding some functionality to the module


14.23
;Since I cannot find useful literature for creating modules through the admin,  
;I will move to creating a project by reading the directions in  "sugarcrm for dummies"

14.35
;Change of direction
;I will look for a module dealing with inventory and try to install it and customize it.

:Inventory Module
http://www.sugarforge.org/frs/?group_id=491

:Invoices Module
http://www.sugarforge.org/projects/letriuminvoice/


15.47 
;Installing the inventory module
;Deleted the barcode directory

;Fixed sql archar(255)  DEFAULT 'not inspected' NOT NULL ,condition_description ' error
; by changing the variable condition to condition_name
; it turned out that condition is a mysql reserved keyword
http://forums.sugarcrm.com/f115/error-installing-inventory_item-module-32064/

16.01
;Need to get aquainted with him
http://forums.sugarcrm.com/members/andopes/
andre@lampadaglobal.com

;Write to sugarcrm.com 
webmaster@sugarcrm.com
;and ask them to include a chat
;The website is built on Drupal so, it would not be a problem
;offer to do it for them for free

17.11
;Interesting material to read
http://deanhaddock.com/sugarcrm-open-source-crm-solution/



17.27
;Another useful module for Invoices
:Invoices Module
http://www.sugarforge.org/frs/?group_id=905


17.29
;Posibilities for Inventory modules
http://www.sugarforge.org/frs/?group_id=755
http://www.sugarforge.org/frs/?group_id=598
http://www.sugarforge.org/projects/productquote


"3 DEC 2012"

12.16

;fixed the mistake done on Friday

:Solution

; 1.changed the following lines in 

/etc/php5/apache2/php.ini

line 538
	Original: display_errors = Off
	Modified: display_errors = On

line 521 
	Original: error_reporting = E_ALL & ~E_DEPRECATED
	Modified: error_reporting = E_ALL & ~E_NOTICE


;In this way I found that there were some leftovers from the Inventory module

;2. Compied database sugarcrm.sql to sugarcrm_1.sql (with overwriting)


12.24
;Continuing to work on the Inventory module


14.00
;SugarCRM started showing the same mistake
;Copying the databasesdid not fix it


16.28
;Copying all the files from home to root

;at the same time readming more about inventory modules

;useful links:
http://www.sugarforge.org/projects/c3crmquotes/

http://www.sugarforge.org/projects/ce-sales


16.57
;the file coppying is finished
;SugarCRM seems to work fine 


;some usefuj videos
http://www.youtube.com/watch?v=LuOzZOHxf5U

17.29
;strange enoughthe same mistake appeardafter i ran repair and rebuild
;checking what could be the reason for that

17.36
; I found out that SugarCRM performs the following steps when one runs repair/rebuild
;1 clears the cache so that the files will be rebuilt
;2 goes through custom/Extensions/ and rebuilds all the layoutdef, vardef and language files
;3 ensures its list of audited fields is correct
;4 compares the database schema against its vardefs to be sure everything matches

;therfore I cleaned all inventory_items references from custom/Extensions


17.45
;What if...
;Useful links:
http://www.slideshare.net/DrupalCampDN/drupal-crm-core-10503606#btnNext
http://drupal.org/project/crm_core
http://www.trellon.com/content/blog/introducing-crm-core

http://www.leveltendesign.com/blog/david-hahn/basic-drupal-and-sugarcrm-integration-pt-1

https://www.acquia.com/resources/acquia-tv/conference/unleash-power-integrated-drupal-and-sugarcrm-solution-may-23-2012






