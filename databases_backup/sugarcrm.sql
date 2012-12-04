-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 03, 2012 at 11:49 AM
-- Server version: 5.5.22
-- PHP Version: 5.3.10-1ubuntu3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sugarcrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `annual_revenue` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `phone_office` varchar(100) DEFAULT NULL,
  `phone_alternate` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `ownership` varchar(100) DEFAULT NULL,
  `employees` varchar(10) DEFAULT NULL,
  `ticker_symbol` varchar(10) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `sic_code` varchar(10) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accnt_id_del` (`id`,`deleted`),
  KEY `idx_accnt_name_del` (`name`,`deleted`),
  KEY `idx_accnt_assigned_del` (`deleted`,`assigned_user_id`),
  KEY `idx_accnt_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_audit`
--

CREATE TABLE IF NOT EXISTS `accounts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_accounts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_bugs`
--

CREATE TABLE IF NOT EXISTS `accounts_bugs` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_bug_acc` (`account_id`),
  KEY `idx_acc_bug_bug` (`bug_id`),
  KEY `idx_account_bug` (`account_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_cases`
--

CREATE TABLE IF NOT EXISTS `accounts_cases` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_case_acc` (`account_id`),
  KEY `idx_acc_acc_case` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_contacts`
--

CREATE TABLE IF NOT EXISTS `accounts_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_contact` (`account_id`,`contact_id`),
  KEY `idx_contid_del_accid` (`contact_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_opportunities`
--

CREATE TABLE IF NOT EXISTS `accounts_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_opportunity` (`account_id`,`opportunity_id`),
  KEY `idx_oppid_del_accid` (`opportunity_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl_actions`
--

CREATE TABLE IF NOT EXISTS `acl_actions` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `acltype` varchar(100) DEFAULT NULL,
  `aclaccess` int(3) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclaction_id_del` (`id`,`deleted`),
  KEY `idx_category_name` (`category`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acl_actions`
--

INSERT INTO `acl_actions` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `category`, `acltype`, `aclaccess`, `deleted`) VALUES
('116676d8-ea77-21e3-dddc-50b34e369ea4', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Aknet_TVTariff', 'module', 90, 0),
('1185fecf-a327-93ea-fb77-50b34e271e67', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Prospects', 'module', 90, 0),
('124c6d12-b4f1-c84e-9ccb-50b34e12a338', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Contacts', 'module', 90, 0),
('13003116-41ec-83be-7f7f-50b34e72eaad', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Calls', 'module', 90, 0),
('13d5d481-abcc-63a4-88e0-50b34e9f0931', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Aknet_ServiceTV', 'module', 90, 0),
('14b58c5f-62ba-a844-fad2-50b34eade365', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Aknet_ServiceVPNL2', 'module', 90, 0),
('16330b2f-cd6d-0a9e-6b61-50b34ed84206', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Aknet_ServiceTV', 'module', 90, 0),
('1786ee37-d09f-2873-e8ad-50b34e7f6a2e', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Prospects', 'module', 90, 0),
('1787306b-760a-ee85-7f63-50b34e58edc0', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Aknet_TVTariff', 'module', 90, 0),
('188af9f9-83e8-4888-f42b-50b34e23e523', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Contacts', 'module', 90, 0),
('1a13d438-fd68-d9ec-df02-50b34eafa697', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Aknet_ServiceTV', 'module', 90, 0),
('1adbcd1f-8cda-db08-bbcf-50b34e5e1fa6', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Aknet_ServiceVPNL2', 'module', 90, 0),
('1d9654a4-fca6-9162-d91c-50b34e6cf994', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Prospects', 'module', 90, 0),
('1dba7ab0-50b9-3660-c72f-50b34ef26bda', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Aknet_TVTariff', 'module', 90, 0),
('1e9be0d3-8f17-6ba3-4044-50b34efa7f43', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Contacts', 'module', 90, 0),
('207c85f8-a713-383f-192d-50b34e3f2a37', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Aknet_ServiceInternet', 'module', 89, 0),
('23001620-0fb6-f4de-6bfa-50b34e2427d6', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Aknet_ServiceVPNL2', 'module', 90, 0),
('233854c0-d357-8c5d-89f7-50b34ef67852', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Emails', 'module', 89, 0),
('23b796eb-b5e5-42c8-2ab3-50b34e278529', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Prospects', 'module', 90, 0),
('23d9e032-b1a0-6757-799e-50b34e940d10', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Aknet_TVTariff', 'module', 90, 0),
('24432c2f-59fd-7522-75c5-50b34e78289c', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Tasks', 'module', 89, 0),
('24a4550b-8fe4-d9cc-8ab7-50b34ea7fb8d', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'EmailTemplates', 'module', 89, 0),
('24babb5a-a478-cb12-38a0-50b34e0f0e13', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Contacts', 'module', 90, 0),
('25990959-343d-0dc1-69fb-50b34e6cd858', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Notes', 'module', 90, 0),
('26a01fdb-f4dd-2c72-61e8-50b34efde97b', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Aknet_ServiceInternet', 'module', 90, 0),
('2932cd64-a0dd-2cf8-f476-50b34ed18606', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Emails', 'module', 90, 0),
('29e221e3-7d72-ed69-80aa-50b34e9e379c', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Aknet_TVTariff', 'module', 90, 0),
('2a5ee4c9-a848-8084-e7d4-50b34eeebe03', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Tasks', 'module', 90, 0),
('2ac03cab-faed-0a30-24cd-50b34ea88289', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'EmailTemplates', 'module', 90, 0),
('2ae78d37-bb5b-eac2-a0ce-50b34e8263c8', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Contacts', 'module', 90, 0),
('2e360ab5-91bc-eaf6-b2f0-50b34ee387d9', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Calls', 'module', 90, 0),
('2f60b3b5-cb2f-7ff1-708d-50b34e3ef7da', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Emails', 'module', 90, 0),
('300a921c-63c1-46a3-764b-50b34ebd68e5', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'EmailMarketing', 'module', 90, 0),
('30d98d06-7f4f-f044-d8b4-50b34ec3e96a', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'EmailTemplates', 'module', 90, 0),
('313b256d-c8cf-bf71-ce7b-50b34ebbb382', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Campaigns', 'module', 89, 0),
('314738b2-f1eb-a4bb-bd20-50b34e9328c4', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Aknet_ServiceInternet', 'module', 90, 0),
('321eb5b4-6e89-9ff0-4a12-50b34ea568e3', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'jjwa_Reports', 'module', 90, 0),
('357cb83f-9132-942c-375f-50b34ee2967a', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Emails', 'module', 90, 0),
('362529ce-6ee9-79f0-7613-50b34ec2f823', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'EmailMarketing', 'module', 90, 0),
('371116d0-f4fc-6342-2c21-50b34ef1458d', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'EmailTemplates', 'module', 90, 0),
('375342dc-46d4-abd2-bd40-50b34e445b5a', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Campaigns', 'module', 90, 0),
('37d84fe6-28ae-88ef-5442-50b34e39d640', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'jjwa_Tools', 'module', 89, 0),
('38bb4db0-95b6-45bd-3103-50b34e5ac134', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Tasks', 'module', 90, 0),
('39309fe6-a9d0-5235-28c8-50b34e46dca8', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Calls', 'module', 89, 0),
('3ba02048-c590-f41f-2aaf-50b34ed031ec', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Emails', 'module', 90, 0),
('3d7638cb-658d-1908-ecec-50b34e3c8a65', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Campaigns', 'module', 90, 0),
('3f85f5d1-f676-3149-8afe-50b34e1e9960', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Calls', 'module', 90, 0),
('4062a712-3f56-fbaf-5455-50b34eef7c7f', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Aknet_ServiceInternet', 'module', 90, 0),
('40abe3dd-180a-c649-a3a0-50b34eb8c64a', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'jjwa_Reports', 'module', 90, 0),
('41c5cc42-19a1-7589-927d-50b34e7bba0e', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Emails', 'module', 90, 0),
('42dbd874-257b-0821-6f26-50b34eb0a434', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Tasks', 'module', 90, 0),
('42dd7cda-cd4d-fe06-f81e-50b34e52106c', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'jjwa_Tools', 'module', 90, 0),
('438ee0bc-d0bb-90cd-67c0-50b34e9e0ce8', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Campaigns', 'module', 90, 0),
('45a5695e-51f3-85db-8907-50b34e8b35b4', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Calls', 'module', 90, 0),
('4679843d-9f29-1d59-570a-50b34e17f279', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'jjwa_Reports', 'module', 89, 0),
('47dd1611-a18f-d286-d42b-50b34e4e60cf', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Emails', 'module', 90, 0),
('48f671cc-16fc-14c2-1f16-50b34e2748b3', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Tasks', 'module', 90, 0),
('49b21e64-1c59-3598-9351-50b34e826d64', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Campaigns', 'module', 90, 0),
('4a581f4e-87f4-0b17-e026-50b34ee449db', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Aknet_ServiceInternet', 'module', 90, 0),
('4b202ea7-39e8-e5d4-36fc-50b34e1db515', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'jjwa_Tools', 'module', 90, 0),
('4d5c9fc9-f467-1fea-df37-50b34e3f676d', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'ProjectTask', 'module', 89, 0),
('4df3574f-3e34-e409-7dac-50b34ef235c9', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'jjwa_Reports', 'module', 90, 0),
('4df6fc7c-7d36-e07e-e558-50b34ee070fd', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Emails', 'module', 90, 0),
('4f121133-7061-e2a4-801e-50b34e232b32', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Tasks', 'module', 90, 0),
('5095a208-d72d-6ede-4852-50b34ea3e6d9', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Aknet_ServiceInternet', 'module', 90, 0),
('51d819dd-8e6a-14dc-14a5-50b34e36c9bc', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Campaigns', 'module', 90, 0),
('51e50ab8-b7ca-0f26-0a2a-50b34e33e001', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Prospects', 'module', 90, 0),
('524c0980-c952-c067-7580-50b34ed6bebd', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Aknet_TVTariff', 'module', 90, 0),
('55369268-d663-f16d-9cf1-50b34e193715', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Tasks', 'module', 90, 0),
('56a8d906-1d3f-cae3-8d6a-50b34ecd87e9', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Aknet_ServiceInternet', 'module', 90, 0),
('57f75c5a-f1b3-3cc9-90ca-50b34ee846d7', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'jjwa_Tools', 'module', 90, 0),
('57f78ead-5622-112c-17b3-50b34ed7ff4d', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Campaigns', 'module', 90, 0),
('5a3db1cd-ad71-6c16-cd72-50b34e627cd1', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Calls', 'module', 90, 0),
('5ce3e970-3c65-e7b6-1c7a-50b34e5243c4', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'ProjectTask', 'module', 90, 0),
('5d602931-0f4a-5839-26e6-50b34e4b02de', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Tasks', 'module', 90, 0),
('5e16f0c9-bd98-d2e5-2d41-50b34ec74b67', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Campaigns', 'module', 90, 0),
('6052f4cc-e9eb-2d23-72b5-50b34e6df613', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Aknet_Street', 'module', 89, 0),
('606d069f-40ff-5c21-275c-50b34ed07868', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Contacts', 'module', 90, 0),
('6092ee5b-d893-2ae3-80ac-50b34efa740f', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Project', 'module', 89, 0),
('60b114ad-57dd-85c5-bab9-50b34e85d547', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Aknet_ServiceInternet', 'module', 90, 0),
('64102418-b17b-f5ee-55f7-50b34e19c522', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'jjwa_Reports', 'module', 90, 0),
('6551f02f-5cd6-773a-4591-50b34ed45b6c', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'EmailTemplates', 'module', 90, 0),
('65e94b4f-c634-907e-a733-50b34e427b75', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Bugs', 'module', 89, 0),
('666a3c1b-0e18-fedd-1ee4-50b34e11db81', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Aknet_Street', 'module', 90, 0),
('6678fbc6-9997-8339-87ee-50b34e7ad544', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Calls', 'module', 90, 0),
('675dba64-6b92-b186-4d7d-50b34e5e67fe', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Project', 'module', 90, 0),
('6a3a3a39-2270-d699-69f9-50b34e48f3ec', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Users', 'module', 89, 0),
('6bf665d3-1384-5374-b3b6-50b34ee09457', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Bugs', 'module', 90, 0),
('6c8abe63-bb54-df86-79cb-50b34ef03f01', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Aknet_Street', 'module', 90, 0),
('6dbcedce-1ed5-8e89-dc11-50b34e805036', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Cases', 'module', 89, 0),
('6ec0085d-5fb8-cb84-4601-50b34e0a0ca0', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Project', 'module', 90, 0),
('7111ec75-7563-374f-9cae-50b34e5a82a8', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Opportunities', 'module', 89, 0),
('725769b8-e0d0-23cf-8358-50b34e2642bd', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Users', 'module', 90, 0),
('72ac3b74-6750-539b-0e21-50b34eeb362c', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Aknet_Street', 'module', 90, 0),
('734988f1-78fb-1aad-ddc7-50b34e1c8a0a', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Bugs', 'module', 90, 0),
('75c208a4-a4e0-8b8a-2c9d-50b34ebb03ed', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Aknet_ServiceVPNL2', 'module', 90, 0),
('76e6a680-c24e-70f0-92e1-50b34e49b263', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Project', 'module', 90, 0),
('7718ac27-4b08-311e-d1da-50b34eac2324', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Opportunities', 'module', 90, 0),
('77c73a65-f350-dbd3-17ea-50b34e4c2ad8', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Cases', 'module', 90, 0),
('78390c15-7d53-ef5d-b3cb-50b34eb98f0e', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Aknet_ServiceTV', 'module', 90, 0),
('78bce9ac-d920-d5f5-acd8-50b34ec4892f', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Aknet_Street', 'module', 90, 0),
('78e1c28a-c698-74df-5602-50b34e405d95', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Leads', 'module', 89, 0),
('7a7b3359-5373-ceef-382a-50b34eed1ea6', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Users', 'module', 90, 0),
('7b1f012e-216d-965d-69d5-50b34e80d785', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'ProjectTask', 'module', 90, 0),
('7b4e182a-719e-f70a-8253-50b34efbc8cc', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'EAPM', 'module', 89, 0),
('7c3ec462-43ad-2513-8ee0-50b34e4d6f97', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Bugs', 'module', 90, 0),
('7d379910-c2cb-b06f-dd57-50b34e769b65', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Opportunities', 'module', 90, 0),
('7dcd3627-fff2-f083-521b-50b34e3774e7', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'EmailTemplates', 'module', 90, 0),
('7e2cbf86-f730-56f4-489f-50b34e5e56b1', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Leads', 'module', 90, 0),
('7ee9fadc-dcfb-05fa-e586-50b34e8558fd', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Aknet_Street', 'module', 90, 0),
('7f0e605e-a17b-12a0-1ee0-50b34e1f2804', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Project', 'module', 90, 0),
('8164fc63-2bbb-ca76-7b47-50b34ee5b3e2', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'EAPM', 'module', 90, 0),
('829f2223-41f8-7d4a-19d6-50b34e4ae627', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Users', 'module', 90, 0),
('83584e09-7a8b-e75f-a695-50b34e091b44', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Opportunities', 'module', 90, 0),
('838da2e1-e686-ebdd-8fa8-50b34eacc53e', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Bugs', 'module', 90, 0),
('844c00ad-1ede-6fa1-473a-50b34ef71595', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Leads', 'module', 90, 0),
('85198256-d19c-2fb9-b174-50b34eff3988', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Aknet_Street', 'module', 90, 0),
('85c8e6fa-0fa1-da2d-f1a3-50b34e497fdd', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Calls', 'module', 90, 0),
('86176f87-572f-1ce9-133d-50b34e000be2', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'ProjectTask', 'module', 90, 0),
('8662376a-caa4-ebd5-a7dd-50b34ecfd65d', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'EmailTemplates', 'module', 90, 0),
('86e806ad-1bb6-3a95-0aea-50b34e6844e4', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Notes', 'module', 90, 0),
('878fbfd7-a21a-1133-b913-50b34e7dea5d', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'EAPM', 'module', 90, 0),
('87fce466-bf10-04b0-f347-50b34e7b15ad', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Project', 'module', 90, 0),
('887dd003-c543-bab0-3fb1-50b34e9ee3b6', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'ProspectLists', 'module', 89, 0),
('897380c4-714a-52aa-918a-50b34ebc9f25', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Opportunities', 'module', 90, 0),
('8a342d33-198b-f492-8048-50b34e4ad5d3', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Aknet_InternetTariff', 'module', 89, 0),
('8a914c4e-1797-3288-4550-50b34eaf4766', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Bugs', 'module', 90, 0),
('8acd69e6-686d-a93d-9898-50b34e85b2d7', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Users', 'module', 90, 0),
('8b44aaaa-470b-7d5f-fec3-50b34e08c05f', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Aknet_Street', 'module', 90, 0),
('8ba75c60-f401-740f-ca10-50b34eb480f0', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Leads', 'module', 90, 0),
('8c6d389b-8322-74de-5595-50b34eb0b186', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'EmailTemplates', 'module', 90, 0),
('8f27a454-4204-f94c-584f-50b34ee1d1b3', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'ProspectLists', 'module', 90, 0),
('8f60176e-0299-703e-927b-50b34e4c0fba', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Project', 'module', 90, 0),
('8f949664-b8f7-d7b8-f97e-50b34ed4bc52', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Opportunities', 'module', 90, 0),
('8fb34704-f80b-35e3-4413-50b34e79480f', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'EAPM', 'module', 90, 0),
('904173d4-35dd-5d35-2378-50b34e061ae6', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Aknet_InternetTariff', 'module', 90, 0),
('91dd48c6-1241-fe98-edec-50b34e5abd92', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Bugs', 'module', 90, 0),
('92421f9c-9b8c-141a-65a1-50b34e50a64d', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Cases', 'module', 90, 0),
('92f49480-8c5f-8fc9-7c26-50b34e000143', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Users', 'module', 90, 0),
('93ce8fef-98e8-ab96-428b-50b34eb5e9ff', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'ProjectTask', 'module', 90, 0),
('93d8384c-1203-20e1-72b9-50b34e84faa0', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Leads', 'module', 90, 0),
('95476973-9fb4-dce4-1482-50b34ef464bc', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'ProspectLists', 'module', 90, 0),
('95a9c228-bbcc-7d0e-95c3-50b34e2deecf', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Opportunities', 'module', 90, 0),
('95c70ee0-d8f5-a829-0951-50b34e6341be', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'EAPM', 'module', 90, 0),
('97f78789-044d-707c-1e55-50b34edd0156', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Bugs', 'module', 90, 0),
('9bd47dbd-1b26-e2ea-e4e9-50b34e8d9dc2', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Users', 'module', 90, 0),
('9bf15ea4-930f-a9c2-ea16-50b34e7680cc', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'EAPM', 'module', 90, 0),
('9bf1816a-3c07-87cf-3824-50b34e0105c4', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Leads', 'module', 90, 0),
('9c434e7d-4fdb-ce4b-e70b-50b34ecdb4b3', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Opportunities', 'module', 90, 0),
('9c68e2e1-a7cd-dbe7-ef53-50b34ee2e26e', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Cases', 'module', 90, 0),
('9d70a2bd-d35c-ad0f-0e0a-50b34e06d973', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'ProspectLists', 'module', 90, 0),
('a216685c-87ce-b865-a87b-50b34e7379f8', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'EAPM', 'module', 90, 0),
('a4008744-9801-0ee1-ec26-50b34e4340e7', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Users', 'module', 90, 0),
('a41bf058-72f6-66c0-a786-50b34ef91b96', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Leads', 'module', 90, 0),
('a479ae0d-488f-fc3f-54dd-50b34ecda16e', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Project', 'module', 90, 0),
('a48f1436-f3f1-946a-f943-50b34e2e96ff', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Cases', 'module', 90, 0),
('a505cf89-d099-8a07-e900-50b34e371c3b', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'ProspectLists', 'module', 90, 0),
('a626be64-0499-7f44-6bc2-50b34e8a1cad', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'jjwa_Reports', 'module', 90, 0),
('a82df713-e653-2e01-47e1-50b34ea97561', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'EAPM', 'module', 90, 0),
('a83e20f3-7d47-4b89-0df8-50b34ea633d3', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Meetings', 'module', 89, 0),
('abb22bb6-80b4-d02e-ad7b-50b34ea81839', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'ProspectLists', 'module', 90, 0),
('ac23ddd1-5b36-7c29-6c5e-50b34ea1ccc7', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'jjwa_Reports', 'module', 90, 0),
('ac43d9ba-ad91-2bf9-8e1f-50b34e759bef', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Leads', 'module', 90, 0),
('ad6cc90b-69b7-d56b-60a2-50b34e236dda', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'jjwa_Tools', 'module', 90, 0),
('aec96dbb-66a9-d40f-b0c7-50b34e9943b4', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Aknet_InternetTariff', 'module', 90, 0),
('afca8f69-03fb-63f1-f2ce-50b34ef02ed8', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Meetings', 'module', 90, 0),
('b1e13492-26e8-b3fc-296a-50b34e3bd8cd', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'ProspectLists', 'module', 90, 0),
('b3e30e26-706c-631f-b846-50b34ec2b55c', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Prospects', 'module', 90, 0),
('b3f70529-0dac-0278-e555-50b34efc542e', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Aknet_TVTariff', 'module', 90, 0),
('b4e044c3-eaff-ab80-7341-50b34eb820ea', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Aknet_InternetTariff', 'module', 90, 0),
('b6769a30-14c9-4310-4b3b-50b34ed54c18', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Meetings', 'module', 90, 0),
('b78a7adc-c881-7c8d-545b-50b34e6e9e96', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Cases', 'module', 90, 0),
('b79c10b8-4ea8-0ffe-03f1-50b34ed7046f', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Accounts', 'module', 89, 0),
('b9792ca8-0ffd-7fb6-52ae-50b34eb4869e', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'ProspectLists', 'module', 90, 0),
('ba7a03c7-cc21-89e3-96ea-50b34efd916f', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'EmailMarketing', 'module', 89, 0),
('bc718966-4471-c9fd-0b2f-50b34e02daac', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Documents', 'module', 89, 0),
('bc7b0774-be1f-702c-ac37-50b34eccda50', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'ProjectTask', 'module', 90, 0),
('bc89f1f5-9975-e77e-7276-50b34e16668a', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Meetings', 'module', 90, 0),
('bd093ac8-6eb5-0941-3c1c-50b34e867918', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Aknet_InternetTariff', 'module', 90, 0),
('bdbcc0b8-290a-54a0-f6d7-50b34e6c25a4', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Accounts', 'module', 90, 0),
('be772a3d-d389-d1ce-39d2-50b34e785fe3', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Notes', 'module', 89, 0),
('c07e19cf-ab2e-45bc-29fd-50b34e10bde1', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'EmailMarketing', 'module', 90, 0),
('c2716d34-18c3-d12c-6e25-50b34e60b80e', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Documents', 'module', 90, 0),
('c2a7cffd-749f-0cb3-6d92-50b34e9f1e5c', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Meetings', 'module', 90, 0),
('c2c00d55-0bd5-a15d-79cb-50b34ee5715a', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Contacts', 'module', 90, 0),
('c316efb3-80c5-8710-e1e9-50b34e367f02', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Cases', 'module', 90, 0),
('c3238d91-2950-f9b5-8b28-50b34e3d79c6', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Aknet_InternetTariff', 'module', 90, 0),
('c3d0b24b-f1c3-eeed-bad2-50b34e3c5c97', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Accounts', 'module', 90, 0),
('c68e255c-1574-a69d-8bb6-50b34e8cbedf', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'EmailMarketing', 'module', 90, 0),
('c7977a96-84b0-779d-3f30-50b34eae5c2d', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Notes', 'module', 90, 0),
('c88392ac-3370-3326-260b-50b34e508b45', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Documents', 'module', 90, 0),
('c8c3e6a2-a1f1-3cb5-a015-50b34e68ebbb', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Meetings', 'module', 90, 0),
('c93cb243-c8f8-eca2-d7da-50b34e97086b', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'ProjectTask', 'module', 90, 0),
('c93db845-be8e-be79-34aa-50b34ec1357e', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Aknet_InternetTariff', 'module', 90, 0),
('c9eb4d1d-a6f2-3a59-18fe-50b34ec6d9b2', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Accounts', 'module', 90, 0),
('ca63410f-6b8c-8201-f54c-50b34e930fef', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Cases', 'module', 90, 0),
('ccd6d12d-2766-09dc-f38a-50b34ec9b79a', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'EmailMarketing', 'module', 90, 0),
('cdacb3fb-089e-31cd-14f1-50b34ef00ad9', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Notes', 'module', 90, 0),
('ceb7147a-6de7-4dbf-45ba-50b34e9f076b', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Documents', 'module', 90, 0),
('cf6a213f-9cc5-d13d-ac44-50b34e38611c', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Aknet_InternetTariff', 'module', 90, 0),
('d2177e5d-fdeb-3823-0ef6-50b34e82ebb7', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Accounts', 'module', 90, 0),
('d2f28109-0acc-14b4-d904-50b34efef71c', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'EmailMarketing', 'module', 90, 0),
('d3d67d43-6f43-3119-73e6-50b34ed26ab8', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'edit', 'Notes', 'module', 90, 0),
('d4da1f83-c2b3-97eb-5754-50b34e22459f', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Documents', 'module', 90, 0),
('d75f7072-e584-792c-f5a3-50b34e68216a', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'jjwa_Tools', 'module', 90, 0),
('d77d3293-b464-d424-d0ce-50b34ebdfc9a', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Meetings', 'module', 90, 0),
('d8305b65-3e1e-e51c-ba86-50b34e7e4ad4', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Aknet_ServiceVPNL2', 'module', 89, 0),
('d83e8bd2-b38d-672c-1bd8-50b34e1ab909', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Accounts', 'module', 90, 0),
('d84e0e88-5eb2-1609-34ab-50b34e9c8395', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'ProjectTask', 'module', 90, 0),
('da520d2b-44ef-184e-6d6a-50b34e06fb1f', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Aknet_ServiceTV', 'module', 90, 0),
('daa57d8f-881e-6354-be4a-50b34e261ee9', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'EmailMarketing', 'module', 90, 0),
('dacc4d58-96b0-5ff4-bd2f-50b34e34c53a', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Prospects', 'module', 89, 0),
('dd01a518-fbcd-2b5a-a9c4-50b34ed2b21c', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Documents', 'module', 90, 0),
('dd61d636-4520-d6f5-82e1-50b34e82513f', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Notes', 'module', 90, 0),
('e19130a5-8a03-e1a2-ce6f-50b34e83965c', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'jjwa_Tools', 'module', 90, 0),
('e25792f9-5681-94a9-b987-50b34e5171e2', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Aknet_ServiceVPNL2', 'module', 90, 0),
('e2ee974c-299d-e8d6-2a4a-50b34e9013ee', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Aknet_ServiceTV', 'module', 89, 0),
('e325d8d5-fa7f-f934-0bdb-50b34eb584a1', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Documents', 'module', 90, 0),
('e54c42c5-a9d9-629b-5628-50b34e921048', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Meetings', 'module', 90, 0),
('e88d09c7-c323-a465-a571-50b34eb00605', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Prospects', 'module', 90, 0),
('e8a25d0c-0eaf-6d17-62e2-50b34ec13e30', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'export', 'Accounts', 'module', 90, 0),
('e93b5da6-d6e3-685e-22b2-50b34ea8d217', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Documents', 'module', 90, 0),
('e94bf5cc-b02d-8362-e8b5-50b34e3b27fa', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'jjwa_Reports', 'module', 90, 0),
('e958d374-36e4-e79c-0964-50b34ea29922', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'view', 'Aknet_ServiceTV', 'module', 90, 0),
('e9b209d4-f145-cfdd-c2f5-50b34e2fbdf0', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'delete', 'Aknet_ServiceVPNL2', 'module', 90, 0),
('e9c51433-8dab-42ac-c9b4-50b34e81fb8f', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'jjwa_Tools', 'module', 90, 0),
('ebdbf48f-d31d-f1b5-8ba5-50b34e77c7b6', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'import', 'Notes', 'module', 90, 0),
('ec6a01e4-4214-5f80-b8da-50b34e1c6ff2', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Aknet_ServiceVPNL2', 'module', 90, 0),
('ef6ca7a6-6701-221e-130f-50b34e56bc22', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'list', 'Aknet_ServiceTV', 'module', 90, 0),
('f201aa13-4007-ace7-9a6f-50b34e923a79', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Contacts', 'module', 89, 0),
('f2e7dbd5-7812-1f3e-90f8-50b34eb2a7eb', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'massupdate', 'Accounts', 'module', 90, 0),
('f33f887e-0a62-e630-be97-50b34e3b304d', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '', 'access', 'Aknet_TVTariff', 'module', 89, 0);

-- --------------------------------------------------------

--
-- Table structure for table `acl_roles`
--

CREATE TABLE IF NOT EXISTS `acl_roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl_roles_actions`
--

CREATE TABLE IF NOT EXISTS `acl_roles_actions` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `action_id` varchar(36) DEFAULT NULL,
  `access_override` int(3) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acl_role_id` (`role_id`),
  KEY `idx_acl_action_id` (`action_id`),
  KEY `idx_aclrole_action` (`role_id`,`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl_roles_users`
--

CREATE TABLE IF NOT EXISTS `acl_roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id` (`role_id`),
  KEY `idx_acluser_id` (`user_id`),
  KEY `idx_aclrole_user` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `address_book`
--

CREATE TABLE IF NOT EXISTS `address_book` (
  `assigned_user_id` char(36) NOT NULL,
  `bean` varchar(50) DEFAULT NULL,
  `bean_id` char(36) NOT NULL,
  KEY `ab_user_bean_idx` (`assigned_user_id`,`bean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_internettariff`
--

CREATE TABLE IF NOT EXISTS `aknet_internettariff` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `billing_tariff_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_internettariff_audit`
--

CREATE TABLE IF NOT EXISTS `aknet_internettariff_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aknet_internettariff_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_serviceinternet`
--

CREATE TABLE IF NOT EXISTS `aknet_serviceinternet` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT 'KYRGYZSTAN',
  `address_city` varchar(100) DEFAULT 'bishkek',
  `address_state` varchar(100) DEFAULT 'chui',
  `address_building` varchar(255) DEFAULT NULL,
  `address_appartment` varchar(255) DEFAULT NULL,
  `switch_id` int(11) DEFAULT NULL,
  `port` int(255) DEFAULT NULL,
  `connection_price` decimal(18,8) DEFAULT NULL,
  `comment` text,
  `service_internet_status` varchar(100) DEFAULT 'survey',
  `tariff` varchar(255) DEFAULT NULL,
  `address_street` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_serviceinternet_accounts_c`
--

CREATE TABLE IF NOT EXISTS `aknet_serviceinternet_accounts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aknet_serviceinternet_accountsaknet_serviceinternet_ida` varchar(36) DEFAULT NULL,
  `aknet_serviceinternet_accountsaccounts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aknet_serviceinternet_accounts_alt` (`aknet_serviceinternet_accountsaknet_serviceinternet_ida`,`aknet_serviceinternet_accountsaccounts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_serviceinternet_audit`
--

CREATE TABLE IF NOT EXISTS `aknet_serviceinternet_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aknet_serviceinternet_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_serviceinternet_contacts_c`
--

CREATE TABLE IF NOT EXISTS `aknet_serviceinternet_contacts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aknet_serviceinternet_contactsaknet_serviceinternet_ida` varchar(36) DEFAULT NULL,
  `aknet_serviceinternet_contactscontacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aknet_serviceinternet_contacts_alt` (`aknet_serviceinternet_contactsaknet_serviceinternet_ida`,`aknet_serviceinternet_contactscontacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_serviceinternet_leads_c`
--

CREATE TABLE IF NOT EXISTS `aknet_serviceinternet_leads_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aknet_serviceinternet_leadsaknet_serviceinternet_ida` varchar(36) DEFAULT NULL,
  `aknet_serviceinternet_leadsleads_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aknet_serviceinternet_leads_alt` (`aknet_serviceinternet_leadsaknet_serviceinternet_ida`,`aknet_serviceinternet_leadsleads_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_serviceinternet_opportunities_c`
--

CREATE TABLE IF NOT EXISTS `aknet_serviceinternet_opportunities_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aknet_serviceinternet_opportunitiesaknet_serviceinternet_ida` varchar(36) DEFAULT NULL,
  `aknet_serviceinternet_opportunitiesopportunities_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aknet_serviceinternet_opportunities_alt` (`aknet_serviceinternet_opportunitiesaknet_serviceinternet_ida`,`aknet_serviceinternet_opportunitiesopportunities_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_servicetv`
--

CREATE TABLE IF NOT EXISTS `aknet_servicetv` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT 'KYRGYZSTAN',
  `address_state` varchar(100) DEFAULT 'bishkek',
  `address_city` varchar(100) DEFAULT 'bishkek',
  `address_building` varchar(255) DEFAULT NULL,
  `address_appartment` varchar(255) DEFAULT NULL,
  `switch_id` int(11) DEFAULT NULL,
  `port` int(255) DEFAULT NULL,
  `connection_price` float(18,2) DEFAULT NULL,
  `service_tv_status` varchar(100) DEFAULT 'survey',
  `comment` text,
  `address_street` varchar(255) DEFAULT NULL,
  `tariff` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_servicetv_accounts_c`
--

CREATE TABLE IF NOT EXISTS `aknet_servicetv_accounts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aknet_servicetv_accountsaknet_servicetv_ida` varchar(36) DEFAULT NULL,
  `aknet_servicetv_accountsaccounts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aknet_servicetv_accounts_alt` (`aknet_servicetv_accountsaknet_servicetv_ida`,`aknet_servicetv_accountsaccounts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_servicetv_audit`
--

CREATE TABLE IF NOT EXISTS `aknet_servicetv_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aknet_servicetv_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_servicetv_contacts_c`
--

CREATE TABLE IF NOT EXISTS `aknet_servicetv_contacts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aknet_servicetv_contactsaknet_servicetv_ida` varchar(36) DEFAULT NULL,
  `aknet_servicetv_contactscontacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aknet_servicetv_contacts_alt` (`aknet_servicetv_contactsaknet_servicetv_ida`,`aknet_servicetv_contactscontacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_servicetv_leads_c`
--

CREATE TABLE IF NOT EXISTS `aknet_servicetv_leads_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aknet_servicetv_leadsaknet_servicetv_ida` varchar(36) DEFAULT NULL,
  `aknet_servicetv_leadsleads_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aknet_servicetv_leads_alt` (`aknet_servicetv_leadsaknet_servicetv_ida`,`aknet_servicetv_leadsleads_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_servicetv_opportunities_c`
--

CREATE TABLE IF NOT EXISTS `aknet_servicetv_opportunities_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aknet_servicetv_opportunitiesaknet_servicetv_ida` varchar(36) DEFAULT NULL,
  `aknet_servicetv_opportunitiesopportunities_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aknet_servicetv_opportunities_alt` (`aknet_servicetv_opportunitiesaknet_servicetv_ida`,`aknet_servicetv_opportunitiesopportunities_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_servicevpnl2`
--

CREATE TABLE IF NOT EXISTS `aknet_servicevpnl2` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT 'KYRGYZSTAN',
  `address_state` varchar(100) DEFAULT 'chui',
  `address_city` varchar(100) DEFAULT 'bishkek',
  `address_building` varchar(255) DEFAULT NULL,
  `address_appartment` varchar(255) DEFAULT NULL,
  `switch_id` int(11) DEFAULT NULL,
  `port` int(255) DEFAULT NULL,
  `connection_price` float(18,2) DEFAULT NULL,
  `service_vpnl2_status` varchar(100) DEFAULT 'survey',
  `comment` text,
  `address_street` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_servicevpnl2_accounts_c`
--

CREATE TABLE IF NOT EXISTS `aknet_servicevpnl2_accounts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aknet_servicevpnl2_accountsaknet_servicevpnl2_ida` varchar(36) DEFAULT NULL,
  `aknet_servicevpnl2_accountsaccounts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aknet_servicevpnl2_accounts_alt` (`aknet_servicevpnl2_accountsaknet_servicevpnl2_ida`,`aknet_servicevpnl2_accountsaccounts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_servicevpnl2_audit`
--

CREATE TABLE IF NOT EXISTS `aknet_servicevpnl2_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aknet_servicevpnl2_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_servicevpnl2_contacts_c`
--

CREATE TABLE IF NOT EXISTS `aknet_servicevpnl2_contacts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aknet_servicevpnl2_contactsaknet_servicevpnl2_ida` varchar(36) DEFAULT NULL,
  `aknet_servicevpnl2_contactscontacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aknet_servicevpnl2_contacts_alt` (`aknet_servicevpnl2_contactsaknet_servicevpnl2_ida`,`aknet_servicevpnl2_contactscontacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_servicevpnl2_leads_c`
--

CREATE TABLE IF NOT EXISTS `aknet_servicevpnl2_leads_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aknet_servicevpnl2_leadsaknet_servicevpnl2_ida` varchar(36) DEFAULT NULL,
  `aknet_servicevpnl2_leadsleads_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aknet_servicevpnl2_leads_alt` (`aknet_servicevpnl2_leadsaknet_servicevpnl2_ida`,`aknet_servicevpnl2_leadsleads_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_servicevpnl2_opportunities_c`
--

CREATE TABLE IF NOT EXISTS `aknet_servicevpnl2_opportunities_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aknet_servicevpnl2_opportunitiesaknet_servicevpnl2_ida` varchar(36) DEFAULT NULL,
  `aknet_servicevpnl2_opportunitiesopportunities_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aknet_servicevpnl2_opportunities_alt` (`aknet_servicevpnl2_opportunitiesaknet_servicevpnl2_ida`,`aknet_servicevpnl2_opportunitiesopportunities_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_street`
--

CREATE TABLE IF NOT EXISTS `aknet_street` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `street_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_street_audit`
--

CREATE TABLE IF NOT EXISTS `aknet_street_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aknet_street_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_tvtariff`
--

CREATE TABLE IF NOT EXISTS `aknet_tvtariff` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `billing_tariff_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aknet_tvtariff_audit`
--

CREATE TABLE IF NOT EXISTS `aknet_tvtariff_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aknet_tvtariff_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bugs`
--

CREATE TABLE IF NOT EXISTS `bugs` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `bug_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `found_in_release` varchar(255) DEFAULT NULL,
  `fixed_in_release` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bugsnumk` (`bug_number`),
  KEY `bug_number` (`bug_number`),
  KEY `idx_bug_name` (`name`),
  KEY `idx_bugs_assigned_user` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bugs_audit`
--

CREATE TABLE IF NOT EXISTS `bugs_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_bugs_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls`
--

CREATE TABLE IF NOT EXISTS `calls` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(2) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `direction` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_call_name` (`name`),
  KEY `idx_status` (`status`),
  KEY `idx_calls_date_start` (`date_start`),
  KEY `idx_calls_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_calls_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_contacts`
--

CREATE TABLE IF NOT EXISTS `calls_contacts` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_call_call` (`call_id`),
  KEY `idx_con_call_con` (`contact_id`),
  KEY `idx_call_contact` (`call_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_leads`
--

CREATE TABLE IF NOT EXISTS `calls_leads` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_call_call` (`call_id`),
  KEY `idx_lead_call_lead` (`lead_id`),
  KEY `idx_call_lead` (`call_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_users`
--

CREATE TABLE IF NOT EXISTS `calls_users` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_call_call` (`call_id`),
  KEY `idx_usr_call_usr` (`user_id`),
  KEY `idx_call_users` (`call_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE IF NOT EXISTS `campaigns` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_count` int(11) DEFAULT '0',
  `refer_url` varchar(255) DEFAULT 'http://',
  `tracker_text` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `impressions` int(11) DEFAULT '0',
  `currency_id` char(36) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `expected_cost` double DEFAULT NULL,
  `actual_cost` double DEFAULT NULL,
  `expected_revenue` double DEFAULT NULL,
  `campaign_type` varchar(100) DEFAULT NULL,
  `objective` text,
  `content` text,
  `frequency` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `camp_auto_tracker_key` (`tracker_key`),
  KEY `idx_campaign_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns_audit`
--

CREATE TABLE IF NOT EXISTS `campaigns_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_campaigns_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_log`
--

CREATE TABLE IF NOT EXISTS `campaign_log` (
  `id` char(36) NOT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `target_tracker_key` varchar(36) DEFAULT NULL,
  `target_id` varchar(36) DEFAULT NULL,
  `target_type` varchar(100) DEFAULT NULL,
  `activity_type` varchar(100) DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `list_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `more_information` varchar(100) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_camp_tracker` (`target_tracker_key`),
  KEY `idx_camp_campaign_id` (`campaign_id`),
  KEY `idx_camp_more_info` (`more_information`),
  KEY `idx_target_id` (`target_id`),
  KEY `idx_target_id_deleted` (`target_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_trkrs`
--

CREATE TABLE IF NOT EXISTS `campaign_trkrs` (
  `id` char(36) NOT NULL,
  `tracker_name` varchar(30) DEFAULT NULL,
  `tracker_url` varchar(255) DEFAULT 'http://',
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `is_optout` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `campaign_tracker_key_idx` (`tracker_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE IF NOT EXISTS `cases` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` text,
  `work_log` text,
  `account_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `casesnumk` (`case_number`),
  KEY `case_number` (`case_number`),
  KEY `idx_case_name` (`name`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_cases_stat_del` (`assigned_user_id`,`status`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cases_audit`
--

CREATE TABLE IF NOT EXISTS `cases_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_cases_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cases_bugs`
--

CREATE TABLE IF NOT EXISTS `cases_bugs` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cas_bug_cas` (`case_id`),
  KEY `idx_cas_bug_bug` (`bug_id`),
  KEY `idx_case_bug` (`case_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `category` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` text,
  KEY `idx_config_cat` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`category`, `name`, `value`) VALUES
('notify', 'fromaddress', 'do_not_reply@example.com'),
('notify', 'fromname', 'SugarCRM'),
('notify', 'send_by_default', '1'),
('notify', 'on', '1'),
('notify', 'send_from_assigning_user', '0'),
('info', 'sugar_version', '6.5.4'),
('MySettings', 'tab', 'YToyMjp7czo0OiJIb21lIjtzOjQ6IkhvbWUiO3M6ODoiQWNjb3VudHMiO3M6ODoiQWNjb3VudHMiO3M6ODoiQ29udGFjdHMiO3M6ODoiQ29udGFjdHMiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6NToiTGVhZHMiO3M6NToiTGVhZHMiO3M6ODoiQ2FsZW5kYXIiO3M6ODoiQ2FsZW5kYXIiO3M6OToiRG9jdW1lbnRzIjtzOjk6IkRvY3VtZW50cyI7czo2OiJFbWFpbHMiO3M6NjoiRW1haWxzIjtzOjk6IkNhbXBhaWducyI7czo5OiJDYW1wYWlnbnMiO3M6NToiQ2FsbHMiO3M6NToiQ2FsbHMiO3M6ODoiTWVldGluZ3MiO3M6ODoiTWVldGluZ3MiO3M6NToiVGFza3MiO3M6NToiVGFza3MiO3M6NToiTm90ZXMiO3M6NToiTm90ZXMiO3M6NToiQ2FzZXMiO3M6NToiQ2FzZXMiO3M6OToiUHJvc3BlY3RzIjtzOjk6IlByb3NwZWN0cyI7czoxMzoiUHJvc3BlY3RMaXN0cyI7czoxMzoiUHJvc3BlY3RMaXN0cyI7czoyMDoiQWtuZXRfSW50ZXJuZXRUYXJpZmYiO3M6MjA6IkFrbmV0X0ludGVybmV0VGFyaWZmIjtzOjIxOiJBa25ldF9TZXJ2aWNlSW50ZXJuZXQiO3M6MjE6IkFrbmV0X1NlcnZpY2VJbnRlcm5ldCI7czoxNToiQWtuZXRfU2VydmljZVRWIjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO3M6MTg6IkFrbmV0X1NlcnZpY2VWUE5MMiI7czoxODoiQWtuZXRfU2VydmljZVZQTkwyIjtzOjEyOiJBa25ldF9TdHJlZXQiO3M6MTI6IkFrbmV0X1N0cmVldCI7czoxNDoiQWtuZXRfVFZUYXJpZmYiO3M6MTQ6IkFrbmV0X1RWVGFyaWZmIjt9'),
('portal', 'on', '0'),
('tracker', 'Tracker', '1'),
('system', 'skypeout_on', '1'),
('sugarfeed', 'enabled', '1'),
('sugarfeed', 'module_UserFeed', '1'),
('sugarfeed', 'module_Leads', '1'),
('sugarfeed', 'module_Contacts', '1'),
('sugarfeed', 'module_Opportunities', '1'),
('sugarfeed', 'module_Cases', '1'),
('Update', 'CheckUpdates', 'automatic'),
('system', 'name', 'SugarCRM'),
('license', 'msg_admin', ''),
('license', 'msg_all', ''),
('license', 'last_validation', 'success'),
('license', 'latest_versions', 'YToxOntpOjA7YToyOntzOjc6InZlcnNpb24iO3M6NToiNi41LjUiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjE2MjoiVGhlIGxhdGVzdCB2ZXJzaW9uIG9mIFN1Z2FyQ1JNIGlzIDYuNS41LiAgUGxlYXNlIHZpc2l0IDxhIGhyZWY9Imh0dHA6Ly9zdXBwb3J0LnN1Z2FyY3JtLmNvbSIgdGFyZ2V0PSJfbmV3Ij5zdXBwb3J0LnN1Z2FyY3JtLmNvbTwvYT4gdG8gYWNxdWlyZSB0aGUgbGF0ZXN0IHZlcnNpb24uIjt9fQ=='),
('Update', 'last_check_date', '1353928396'),
('Update', 'last_check_version', '6.5.5'),
('system', 'adminwizard', '1'),
('notify', 'allow_default_outbound', '0');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `lead_source` varchar(255) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cont_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_contacts_del_last` (`deleted`,`last_name`),
  KEY `idx_cont_del_reports` (`deleted`,`reports_to_id`,`last_name`),
  KEY `idx_reports_to_id` (`reports_to_id`),
  KEY `idx_del_id_user` (`deleted`,`id`,`assigned_user_id`),
  KEY `idx_cont_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_audit`
--

CREATE TABLE IF NOT EXISTS `contacts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_contacts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_bugs`
--

CREATE TABLE IF NOT EXISTS `contacts_bugs` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_bug_con` (`contact_id`),
  KEY `idx_con_bug_bug` (`bug_id`),
  KEY `idx_contact_bug` (`contact_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_cases`
--

CREATE TABLE IF NOT EXISTS `contacts_cases` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_case_con` (`contact_id`),
  KEY `idx_con_case_case` (`case_id`),
  KEY `idx_contacts_cases` (`contact_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_users`
--

CREATE TABLE IF NOT EXISTS `contacts_users` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_users_con` (`contact_id`),
  KEY `idx_con_users_user` (`user_id`),
  KEY `idx_contacts_users` (`contact_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `id` char(36) NOT NULL,
  `name` varchar(36) DEFAULT NULL,
  `symbol` varchar(36) DEFAULT NULL,
  `iso4217` varchar(3) DEFAULT NULL,
  `conversion_rate` double DEFAULT '0',
  `status` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_currency_name` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE IF NOT EXISTS `custom_fields` (
  `bean_id` varchar(36) DEFAULT NULL,
  `set_num` int(11) DEFAULT '0',
  `field0` varchar(255) DEFAULT NULL,
  `field1` varchar(255) DEFAULT NULL,
  `field2` varchar(255) DEFAULT NULL,
  `field3` varchar(255) DEFAULT NULL,
  `field4` varchar(255) DEFAULT NULL,
  `field5` varchar(255) DEFAULT NULL,
  `field6` varchar(255) DEFAULT NULL,
  `field7` varchar(255) DEFAULT NULL,
  `field8` varchar(255) DEFAULT NULL,
  `field9` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_beanid_set_num` (`bean_id`,`set_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT 'Sugar',
  `doc_url` varchar(255) DEFAULT NULL,
  `active_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `subcategory_id` varchar(100) DEFAULT NULL,
  `status_id` varchar(100) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `related_doc_id` char(36) DEFAULT NULL,
  `related_doc_rev_id` char(36) DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT '0',
  `template_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_doc_cat` (`category_id`,`subcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_accounts`
--

CREATE TABLE IF NOT EXISTS `documents_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_accounts_account_id` (`account_id`,`document_id`),
  KEY `documents_accounts_document_id` (`document_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_bugs`
--

CREATE TABLE IF NOT EXISTS `documents_bugs` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_bugs_bug_id` (`bug_id`,`document_id`),
  KEY `documents_bugs_document_id` (`document_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_cases`
--

CREATE TABLE IF NOT EXISTS `documents_cases` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_cases_case_id` (`case_id`,`document_id`),
  KEY `documents_cases_document_id` (`document_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_contacts`
--

CREATE TABLE IF NOT EXISTS `documents_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_contacts_contact_id` (`contact_id`,`document_id`),
  KEY `documents_contacts_document_id` (`document_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_opportunities`
--

CREATE TABLE IF NOT EXISTS `documents_opportunities` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_docu_opps_oppo_id` (`opportunity_id`,`document_id`),
  KEY `idx_docu_oppo_docu_id` (`document_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `document_revisions`
--

CREATE TABLE IF NOT EXISTS `document_revisions` (
  `id` varchar(36) NOT NULL,
  `change_log` varchar(255) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT NULL,
  `doc_url` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `file_ext` varchar(100) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `revision` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documentrevision_mimetype` (`file_mime_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `eapm`
--

CREATE TABLE IF NOT EXISTS `eapm` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `application` varchar(100) DEFAULT 'webex',
  `api_data` text,
  `consumer_key` varchar(255) DEFAULT NULL,
  `consumer_secret` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `oauth_secret` varchar(255) DEFAULT NULL,
  `validated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_app_active` (`assigned_user_id`,`application`,`validated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emailman`
--

CREATE TABLE IF NOT EXISTS `emailman` (
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  `list_id` char(36) DEFAULT NULL,
  `send_date_time` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `in_queue` tinyint(1) DEFAULT '0',
  `in_queue_date` datetime DEFAULT NULL,
  `send_attempts` int(11) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `related_id` char(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_eman_list` (`list_id`,`user_id`,`deleted`),
  KEY `idx_eman_campaign_id` (`campaign_id`),
  KEY `idx_eman_relid_reltype_id` (`related_id`,`related_type`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE IF NOT EXISTS `emails` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `flagged` tinyint(1) DEFAULT NULL,
  `reply_to_status` tinyint(1) DEFAULT NULL,
  `intent` varchar(100) DEFAULT 'pick',
  `mailbox_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_name` (`name`),
  KEY `idx_message_id` (`message_id`),
  KEY `idx_email_parent_id` (`parent_id`),
  KEY `idx_email_assigned` (`assigned_user_id`,`type`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails_beans`
--

CREATE TABLE IF NOT EXISTS `emails_beans` (
  `id` char(36) NOT NULL,
  `email_id` char(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `campaign_data` text,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emails_beans_bean_id` (`bean_id`),
  KEY `idx_emails_beans_email_bean` (`email_id`,`bean_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails_email_addr_rel`
--

CREATE TABLE IF NOT EXISTS `emails_email_addr_rel` (
  `id` char(36) NOT NULL,
  `email_id` char(36) NOT NULL,
  `address_type` varchar(4) DEFAULT NULL,
  `email_address_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eearl_email_id` (`email_id`,`address_type`),
  KEY `idx_eearl_address_id` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails_text`
--

CREATE TABLE IF NOT EXISTS `emails_text` (
  `email_id` char(36) NOT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `reply_to_addr` varchar(255) DEFAULT NULL,
  `to_addrs` text,
  `cc_addrs` text,
  `bcc_addrs` text,
  `description` longtext,
  `description_html` longtext,
  `raw_source` longtext,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`email_id`),
  KEY `emails_textfromaddr` (`from_addr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_addresses`
--

CREATE TABLE IF NOT EXISTS `email_addresses` (
  `id` char(36) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `email_address_caps` varchar(255) DEFAULT NULL,
  `invalid_email` tinyint(1) DEFAULT '0',
  `opt_out` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ea_caps_opt_out_invalid` (`email_address_caps`,`opt_out`,`invalid_email`),
  KEY `idx_ea_opt_out_invalid` (`email_address`,`opt_out`,`invalid_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_addresses`
--

INSERT INTO `email_addresses` (`id`, `email_address`, `email_address_caps`, `invalid_email`, `opt_out`, `date_created`, `date_modified`, `deleted`) VALUES
('94ed2790-030b-c560-835f-50b34e56745b', 'kbonov@gmail.com', 'KBONOV@GMAIL.COM', 0, 0, '2012-11-26 11:13:46', '2012-11-26 11:13:46', 0);

-- --------------------------------------------------------

--
-- Table structure for table `email_addr_bean_rel`
--

CREATE TABLE IF NOT EXISTS `email_addr_bean_rel` (
  `id` char(36) NOT NULL,
  `email_address_id` char(36) NOT NULL,
  `bean_id` char(36) NOT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `primary_address` tinyint(1) DEFAULT '0',
  `reply_to_address` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_email_address_id` (`email_address_id`),
  KEY `idx_bean_id` (`bean_id`,`bean_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_addr_bean_rel`
--

INSERT INTO `email_addr_bean_rel` (`id`, `email_address_id`, `bean_id`, `bean_module`, `primary_address`, `reply_to_address`, `date_created`, `date_modified`, `deleted`) VALUES
('94cd970a-08c4-851f-17d2-50b34e244b09', '94ed2790-030b-c560-835f-50b34e56745b', '1', 'Users', 1, 0, '2012-11-26 11:13:46', '2012-11-26 11:13:46', 0);

-- --------------------------------------------------------

--
-- Table structure for table `email_cache`
--

CREATE TABLE IF NOT EXISTS `email_cache` (
  `ie_id` char(36) DEFAULT NULL,
  `mbox` varchar(60) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fromaddr` varchar(100) DEFAULT NULL,
  `toaddr` varchar(255) DEFAULT NULL,
  `senddate` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `mailsize` int(10) unsigned DEFAULT NULL,
  `imap_uid` int(10) unsigned DEFAULT NULL,
  `msgno` int(10) unsigned DEFAULT NULL,
  `recent` tinyint(4) DEFAULT NULL,
  `flagged` tinyint(4) DEFAULT NULL,
  `answered` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `draft` tinyint(4) DEFAULT NULL,
  KEY `idx_ie_id` (`ie_id`),
  KEY `idx_mail_date` (`ie_id`,`mbox`,`senddate`),
  KEY `idx_mail_from` (`ie_id`,`mbox`,`fromaddr`),
  KEY `idx_mail_subj` (`subject`),
  KEY `idx_mail_to` (`toaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_marketing`
--

CREATE TABLE IF NOT EXISTS `email_marketing` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_addr` varchar(100) DEFAULT NULL,
  `reply_to_name` varchar(100) DEFAULT NULL,
  `reply_to_addr` varchar(100) DEFAULT NULL,
  `inbound_email_id` varchar(36) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `template_id` char(36) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `all_prospect_lists` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emmkt_name` (`name`),
  KEY `idx_emmkit_del` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_marketing_prospect_lists`
--

CREATE TABLE IF NOT EXISTS `email_marketing_prospect_lists` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `email_marketing_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email_mp_prospects` (`email_marketing_id`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `published` varchar(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `body_html` text,
  `deleted` tinyint(1) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `text_only` tinyint(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_template_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `published`, `name`, `description`, `subject`, `body`, `body_html`, `deleted`, `assigned_user_id`, `text_only`, `type`) VALUES
('4a560023-3d4f-a862-87c5-50b34edcc4e7', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '1', 'off', 'System-generated password email', 'This template is used when the System Administrator sends a new password to a user.', 'New account information', '\nHere is your account username and temporary password:\nUsername : $contact_user_user_name\nPassword : $contact_user_user_hash\n\n$config_site_url\n\nAfter you log in using the above password, you may be required to reset the password to one of your own choice.', '<div><table width="550"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : $contact_user_user_name </p><p>Password : $contact_user_user_hash </p><br /><p>$config_site_url</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr></tbody></table></div>', 0, NULL, 0, NULL),
('534c1f19-c084-fae9-800c-50b34e859f37', '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '1', 'off', 'Forgot Password email', 'This template is used to send a user a link to click to reset the user''s account password.', 'Reset your account password', '\nYou recently requested on $contact_user_pwd_last_changed to be able to reset your account password.\n\nClick on the link below to reset your password:\n\n$contact_user_link_guid', '<div><table width="550"><tbody><tr><td><p>You recently requested on $contact_user_pwd_last_changed to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> $contact_user_link_guid </p>  </td>         </tr><tr><td></td>         </tr></tbody></table></div>', 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fields_meta_data`
--

CREATE TABLE IF NOT EXISTS `fields_meta_data` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vname` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `help` varchar(255) DEFAULT NULL,
  `custom_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `len` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `default_value` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `audited` tinyint(1) DEFAULT '0',
  `massupdate` tinyint(1) DEFAULT '0',
  `duplicate_merge` smallint(6) DEFAULT '0',
  `reportable` tinyint(1) DEFAULT '1',
  `importable` varchar(255) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `ext3` varchar(255) DEFAULT NULL,
  `ext4` text,
  PRIMARY KEY (`id`),
  KEY `idx_meta_id_del` (`id`,`deleted`),
  KEY `idx_meta_cm_del` (`custom_module`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE IF NOT EXISTS `folders` (
  `id` char(36) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `folder_type` varchar(25) DEFAULT NULL,
  `parent_folder` char(36) DEFAULT NULL,
  `has_child` tinyint(1) DEFAULT '0',
  `is_group` tinyint(1) DEFAULT '0',
  `is_dynamic` tinyint(1) DEFAULT '0',
  `dynamic_query` text,
  `assign_to_id` char(36) DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_folder` (`parent_folder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `folders_rel`
--

CREATE TABLE IF NOT EXISTS `folders_rel` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `polymorphic_module` varchar(25) DEFAULT NULL,
  `polymorphic_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_poly_module_poly_id` (`polymorphic_module`,`polymorphic_id`),
  KEY `idx_fr_id_deleted_poly` (`folder_id`,`deleted`,`polymorphic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `folders_subscriptions`
--

CREATE TABLE IF NOT EXISTS `folders_subscriptions` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `assigned_user_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder_id_assigned_user_id` (`folder_id`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `import_maps`
--

CREATE TABLE IF NOT EXISTS `import_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(254) DEFAULT NULL,
  `source` varchar(36) DEFAULT NULL,
  `enclosure` varchar(1) DEFAULT ' ',
  `delimiter` varchar(1) DEFAULT ',',
  `module` varchar(36) DEFAULT NULL,
  `content` text,
  `default_values` text,
  `has_header` tinyint(1) DEFAULT '1',
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_published` varchar(3) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `idx_owner_module_name` (`assigned_user_id`,`module`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email`
--

CREATE TABLE IF NOT EXISTS `inbound_email` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Active',
  `server_url` varchar(100) DEFAULT NULL,
  `email_user` varchar(100) DEFAULT NULL,
  `email_password` varchar(100) DEFAULT NULL,
  `port` int(5) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `mailbox` text,
  `delete_seen` tinyint(1) DEFAULT '0',
  `mailbox_type` varchar(10) DEFAULT NULL,
  `template_id` char(36) DEFAULT NULL,
  `stored_options` text,
  `group_id` char(36) DEFAULT NULL,
  `is_personal` tinyint(1) DEFAULT '0',
  `groupfolder_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email_autoreply`
--

CREATE TABLE IF NOT EXISTS `inbound_email_autoreply` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `autoreplied_to` varchar(100) DEFAULT NULL,
  `ie_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ie_autoreplied_to` (`autoreplied_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email_cache_ts`
--

CREATE TABLE IF NOT EXISTS `inbound_email_cache_ts` (
  `id` varchar(255) NOT NULL,
  `ie_timestamp` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwa_reports`
--

CREATE TABLE IF NOT EXISTS `jjwa_reports` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwa_reports_audit`
--

CREATE TABLE IF NOT EXISTS `jjwa_reports_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwa_reports_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwa_tools`
--

CREATE TABLE IF NOT EXISTS `jjwa_tools` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwa_tools_audit`
--

CREATE TABLE IF NOT EXISTS `jjwa_tools_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwa_tools_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_queue`
--

CREATE TABLE IF NOT EXISTS `job_queue` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `scheduler_id` char(36) DEFAULT NULL,
  `execute_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `resolution` varchar(20) DEFAULT NULL,
  `message` text,
  `target` varchar(255) DEFAULT NULL,
  `data` text,
  `requeue` tinyint(1) DEFAULT '0',
  `retry_count` tinyint(4) DEFAULT NULL,
  `failure_count` tinyint(4) DEFAULT NULL,
  `job_delay` int(11) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status_scheduler` (`status`,`scheduler_id`),
  KEY `idx_status_time` (`status`,`execute_time`,`date_entered`),
  KEY `idx_status_entered` (`status`,`date_entered`),
  KEY `idx_status_modified` (`status`,`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE IF NOT EXISTS `leads` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `converted` tinyint(1) DEFAULT '0',
  `refered_by` varchar(100) DEFAULT NULL,
  `lead_source` varchar(100) DEFAULT NULL,
  `lead_source_description` text,
  `status` varchar(100) DEFAULT NULL,
  `status_description` text,
  `reports_to_id` char(36) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_description` text,
  `contact_id` char(36) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `opportunity_name` varchar(255) DEFAULT NULL,
  `opportunity_amount` varchar(50) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `portal_name` varchar(255) DEFAULT NULL,
  `portal_app` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lead_acct_name_first` (`account_name`,`deleted`),
  KEY `idx_lead_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_lead_del_stat` (`last_name`,`status`,`deleted`,`first_name`),
  KEY `idx_lead_opp_del` (`opportunity_id`,`deleted`),
  KEY `idx_leads_acct_del` (`account_id`,`deleted`),
  KEY `idx_del_user` (`deleted`,`assigned_user_id`),
  KEY `idx_lead_assigned` (`assigned_user_id`),
  KEY `idx_lead_contact` (`contact_id`),
  KEY `idx_reports_to` (`reports_to_id`),
  KEY `idx_lead_phone_work` (`phone_work`),
  KEY `idx_leads_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leads_audit`
--

CREATE TABLE IF NOT EXISTS `leads_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_leads_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `linked_documents`
--

CREATE TABLE IF NOT EXISTS `linked_documents` (
  `id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `parent_type` varchar(25) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_document` (`parent_type`,`parent_id`,`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE IF NOT EXISTS `meetings` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `join_url` varchar(200) DEFAULT NULL,
  `host_url` varchar(400) DEFAULT NULL,
  `displayed_url` varchar(400) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `external_id` varchar(50) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `type` varchar(255) DEFAULT 'Sugar',
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mtg_name` (`name`),
  KEY `idx_meet_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_meet_stat_del` (`assigned_user_id`,`status`,`deleted`),
  KEY `idx_meet_date_start` (`date_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_contacts`
--

CREATE TABLE IF NOT EXISTS `meetings_contacts` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_mtg_mtg` (`meeting_id`),
  KEY `idx_con_mtg_con` (`contact_id`),
  KEY `idx_meeting_contact` (`meeting_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_leads`
--

CREATE TABLE IF NOT EXISTS `meetings_leads` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_meeting_meeting` (`meeting_id`),
  KEY `idx_lead_meeting_lead` (`lead_id`),
  KEY `idx_meeting_lead` (`meeting_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_users`
--

CREATE TABLE IF NOT EXISTS `meetings_users` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_mtg_mtg` (`meeting_id`),
  KEY `idx_usr_mtg_usr` (`user_id`),
  KEY `idx_meeting_users` (`meeting_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `portal_flag` tinyint(1) DEFAULT NULL,
  `embed_flag` tinyint(1) DEFAULT '0',
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_note_name` (`name`),
  KEY `idx_notes_parent` (`parent_id`,`parent_type`),
  KEY `idx_note_contact` (`contact_id`),
  KEY `idx_notes_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_consumer`
--

CREATE TABLE IF NOT EXISTS `oauth_consumer` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `c_key` varchar(255) DEFAULT NULL,
  `c_secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ckey` (`c_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_nonce`
--

CREATE TABLE IF NOT EXISTS `oauth_nonce` (
  `conskey` varchar(32) NOT NULL,
  `nonce` varchar(32) NOT NULL,
  `nonce_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`conskey`,`nonce`),
  KEY `oauth_nonce_keyts` (`conskey`,`nonce_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_tokens` (
  `id` char(36) NOT NULL,
  `secret` varchar(32) DEFAULT NULL,
  `tstate` varchar(1) DEFAULT NULL,
  `consumer` char(36) NOT NULL,
  `token_ts` bigint(20) DEFAULT NULL,
  `verify` varchar(32) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `callback_url` varchar(255) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`,`deleted`),
  KEY `oauth_state_ts` (`tstate`,`token_ts`),
  KEY `constoken_key` (`consumer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities`
--

CREATE TABLE IF NOT EXISTS `opportunities` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `opportunity_type` varchar(255) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `lead_source` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amount_usdollar` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `next_step` varchar(100) DEFAULT NULL,
  `sales_stage` varchar(255) DEFAULT NULL,
  `probability` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_opp_name` (`name`),
  KEY `idx_opp_assigned` (`assigned_user_id`),
  KEY `idx_opp_id_deleted` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities_audit`
--

CREATE TABLE IF NOT EXISTS `opportunities_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_opportunities_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities_contacts`
--

CREATE TABLE IF NOT EXISTS `opportunities_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_opp_con` (`contact_id`),
  KEY `idx_con_opp_opp` (`opportunity_id`),
  KEY `idx_opportunities_contacts` (`opportunity_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `outbound_email`
--

CREATE TABLE IF NOT EXISTS `outbound_email` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(15) DEFAULT 'user',
  `user_id` char(36) NOT NULL,
  `mail_sendtype` varchar(8) DEFAULT 'smtp',
  `mail_smtptype` varchar(20) DEFAULT 'other',
  `mail_smtpserver` varchar(100) DEFAULT NULL,
  `mail_smtpport` int(5) DEFAULT '0',
  `mail_smtpuser` varchar(100) DEFAULT NULL,
  `mail_smtppass` varchar(100) DEFAULT NULL,
  `mail_smtpauth_req` tinyint(1) DEFAULT '0',
  `mail_smtpssl` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `oe_user_id_idx` (`id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `outbound_email`
--

INSERT INTO `outbound_email` (`id`, `name`, `type`, `user_id`, `mail_sendtype`, `mail_smtptype`, `mail_smtpserver`, `mail_smtpport`, `mail_smtpuser`, `mail_smtppass`, `mail_smtpauth_req`, `mail_smtpssl`) VALUES
('3c004720-8a55-9eb6-59ee-50b34eb251d9', 'system', 'system', '1', 'SMTP', 'other', '', 25, '', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `estimated_start_date` date DEFAULT NULL,
  `estimated_end_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_accounts`
--

CREATE TABLE IF NOT EXISTS `projects_accounts` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_acct_proj` (`project_id`),
  KEY `idx_proj_acct_acct` (`account_id`),
  KEY `projects_accounts_alt` (`project_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_bugs`
--

CREATE TABLE IF NOT EXISTS `projects_bugs` (
  `id` varchar(36) NOT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_bug_proj` (`project_id`),
  KEY `idx_proj_bug_bug` (`bug_id`),
  KEY `projects_bugs_alt` (`project_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_cases`
--

CREATE TABLE IF NOT EXISTS `projects_cases` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_case_proj` (`project_id`),
  KEY `idx_proj_case_case` (`case_id`),
  KEY `projects_cases_alt` (`project_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_contacts`
--

CREATE TABLE IF NOT EXISTS `projects_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_con_proj` (`project_id`),
  KEY `idx_proj_con_con` (`contact_id`),
  KEY `projects_contacts_alt` (`project_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_opportunities`
--

CREATE TABLE IF NOT EXISTS `projects_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_opp_proj` (`project_id`),
  KEY `idx_proj_opp_opp` (`opportunity_id`),
  KEY `projects_opportunities_alt` (`project_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_products`
--

CREATE TABLE IF NOT EXISTS `projects_products` (
  `id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_prod_project` (`project_id`),
  KEY `idx_proj_prod_product` (`product_id`),
  KEY `projects_products_alt` (`project_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_task`
--

CREATE TABLE IF NOT EXISTS `project_task` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `project_id` char(36) NOT NULL,
  `project_task_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `description` text,
  `predecessors` text,
  `date_start` date DEFAULT NULL,
  `time_start` int(11) DEFAULT NULL,
  `time_finish` int(11) DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `duration_unit` text,
  `actual_duration` int(11) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  `date_due` date DEFAULT NULL,
  `time_due` time DEFAULT NULL,
  `parent_task_id` int(11) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT NULL,
  `order_number` int(11) DEFAULT '1',
  `task_number` int(11) DEFAULT NULL,
  `estimated_effort` int(11) DEFAULT NULL,
  `actual_effort` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `utilization` int(11) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_task_audit`
--

CREATE TABLE IF NOT EXISTS `project_task_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_project_task_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospects`
--

CREATE TABLE IF NOT EXISTS `prospects` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `birthdate` date DEFAULT NULL,
  `lead_id` char(36) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prospect_auto_tracker_key` (`tracker_key`),
  KEY `idx_prospects_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_prospecs_del_last` (`last_name`,`deleted`),
  KEY `idx_prospects_id_del` (`id`,`deleted`),
  KEY `idx_prospects_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_lists`
--

CREATE TABLE IF NOT EXISTS `prospect_lists` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_type` varchar(100) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `description` text,
  `domain_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prospect_list_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_lists_prospects`
--

CREATE TABLE IF NOT EXISTS `prospect_lists_prospects` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_plp_pro_id` (`prospect_list_id`),
  KEY `idx_plp_rel_id` (`related_id`,`related_type`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_list_campaigns`
--

CREATE TABLE IF NOT EXISTS `prospect_list_campaigns` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `campaign_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pro_id` (`prospect_list_id`),
  KEY `idx_cam_id` (`campaign_id`),
  KEY `idx_prospect_list_campaigns` (`prospect_list_id`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `relationships`
--

CREATE TABLE IF NOT EXISTS `relationships` (
  `id` char(36) NOT NULL,
  `relationship_name` varchar(150) DEFAULT NULL,
  `lhs_module` varchar(100) DEFAULT NULL,
  `lhs_table` varchar(64) DEFAULT NULL,
  `lhs_key` varchar(64) DEFAULT NULL,
  `rhs_module` varchar(100) DEFAULT NULL,
  `rhs_table` varchar(64) DEFAULT NULL,
  `rhs_key` varchar(64) DEFAULT NULL,
  `join_table` varchar(64) DEFAULT NULL,
  `join_key_lhs` varchar(64) DEFAULT NULL,
  `join_key_rhs` varchar(64) DEFAULT NULL,
  `relationship_type` varchar(64) DEFAULT NULL,
  `relationship_role_column` varchar(64) DEFAULT NULL,
  `relationship_role_column_value` varchar(50) DEFAULT NULL,
  `reverse` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rel_name` (`relationship_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `relationships`
--

INSERT INTO `relationships` (`id`, `relationship_name`, `lhs_module`, `lhs_table`, `lhs_key`, `rhs_module`, `rhs_table`, `rhs_key`, `join_table`, `join_key_lhs`, `join_key_rhs`, `relationship_type`, `relationship_role_column`, `relationship_role_column_value`, `reverse`, `deleted`) VALUES
('100d2350-4c48-5ff6-14eb-50b34f64308e', 'aknet_servicevpnl2_leads', 'Aknet_ServiceVPNL2', 'aknet_servicevpnl2', 'id', 'Leads', 'leads', 'id', 'aknet_servicevpnl2_leads_c', 'aknet_servicevpnl2_leadsaknet_servicevpnl2_ida', 'aknet_servicevpnl2_leadsleads_idb', 'many-to-many', NULL, NULL, 0, 0),
('121190dc-df59-ae98-e47b-50b34fca7063', 'roles_users', 'Roles', 'roles', 'id', 'Users', 'users', 'id', 'roles_users', 'role_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('12a53693-99be-5924-bb6d-50b34f416ed0', 'tasks_modified_user', 'Users', 'users', 'id', 'Tasks', 'tasks', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('14353fba-79df-8547-1339-50b34f5ba0b0', 'project_tasks_calls', 'ProjectTask', 'project_task', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('14fa5fcd-b885-a533-3b9a-50b34fc77d50', 'contact_tasks', 'Contacts', 'contacts', 'id', 'Tasks', 'tasks', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1552d2fb-af22-9074-b88d-50b34fba168b', 'cases_created_by', 'Users', 'users', 'id', 'Cases', 'cases', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('16243abf-41c1-73a5-5d0a-50b34fa3038e', 'aknet_serviceinternet_accounts', 'Aknet_ServiceInternet', 'aknet_serviceinternet', 'id', 'Accounts', 'accounts', 'id', 'aknet_serviceinternet_accounts_c', 'aknet_serviceinternet_accountsaknet_serviceinternet_ida', 'aknet_serviceinternet_accountsaccounts_idb', 'many-to-many', NULL, NULL, 0, 0),
('162bffcb-bb21-6749-5034-50b34fee1d1a', 'jjwa_reports_created_by', 'Users', 'users', 'id', 'jjwa_Reports', 'jjwa_reports', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1864005f-4e16-9e5d-9bcd-50b34fa0bc60', 'project_tasks_notes', 'ProjectTask', 'project_task', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('1901ec84-5ee6-bcf6-646d-50b34fd436cb', 'tasks_created_by', 'Users', 'users', 'id', 'Tasks', 'tasks', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1a590a10-1e7c-6f33-fa72-50b34fc2c433', 'project_tasks_emails', 'ProjectTask', 'project_task', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('1b21a09a-fa82-9c3f-8584-50b34fcdb60e', 'contact_tasks_parent', 'Contacts', 'contacts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Contacts', 0, 0),
('1b3704fa-30da-3a61-bbea-50b34f2d370d', 'jjwa_tools_created_by', 'Users', 'users', 'id', 'jjwa_Tools', 'jjwa_tools', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1bf5030b-5558-2b12-dad3-50b34f68b5fa', 'aknet_servicevpnl2_contacts', 'Aknet_ServiceVPNL2', 'aknet_servicevpnl2', 'id', 'Contacts', 'contacts', 'id', 'aknet_servicevpnl2_contacts_c', 'aknet_servicevpnl2_contactsaknet_servicevpnl2_ida', 'aknet_servicevpnl2_contactscontacts_idb', 'many-to-many', NULL, NULL, 0, 0),
('1c27e6e9-1506-4eba-8015-50b34fa59fbf', 'projects_bugs', 'Project', 'project', 'id', 'Bugs', 'bugs', 'id', 'projects_bugs', 'project_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('1c4ad310-0414-7f19-b983-50b34f53c49b', 'jjwa_reports_assigned_user', 'Users', 'users', 'id', 'jjwa_Reports', 'jjwa_reports', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1d61ef8b-83e3-f0cc-d504-50b34f8060e6', 'aknet_serviceinternet_opportunities', 'Aknet_ServiceInternet', 'aknet_serviceinternet', 'id', 'Opportunities', 'opportunities', 'id', 'aknet_serviceinternet_opportunities_c', 'aknet_serviceinternet_opportunitiesaknet_serviceinternet_ida', 'aknet_serviceinternet_opportunitiesopportunities_idb', 'many-to-many', NULL, NULL, 0, 0),
('1d73e176-cca4-c329-fd3b-50b34f5346a3', 'cases_assigned_user', 'Users', 'users', 'id', 'Cases', 'cases', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1f3ca2ec-2046-0559-eccb-50b34f67aca2', 'tasks_assigned_user', 'Users', 'users', 'id', 'Tasks', 'tasks', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2068531d-d642-3d4e-9c21-50b34ff596b1', 'project_tasks_assigned_user', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2137640a-811e-77b4-a56d-50b34fe3a0fa', 'contact_campaign_log', 'Contacts', 'contacts', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('22b443b9-b9ef-b986-62c0-50b34f53b35d', 'schedulers_created_by_rel', 'Users', 'users', 'id', 'Schedulers', 'schedulers', 'created_by', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('236b5b8c-00e2-e5d1-3241-50b34fd86d39', 'projects_cases', 'Project', 'project', 'id', 'Cases', 'cases', 'id', 'projects_cases', 'project_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('23921f8b-3476-211e-a44d-50b34fae6512', 'aknet_internettariff_modified_user', 'Users', 'users', 'id', 'Aknet_InternetTariff', 'aknet_internettariff', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2394647d-634f-dc27-b2d1-50b34f8a2101', 'case_calls', 'Cases', 'cases', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('2462c5b6-5f47-2e3f-b7f9-50b34f18b439', 'opportunity_meetings', 'Opportunities', 'opportunities', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('2549a11d-7413-d283-01d1-50b34faedf3c', 'tasks_notes', 'Tasks', 'tasks', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('265f1c40-66c1-a5b1-c65c-50b34ff81b34', 'aknet_servicevpnl2_accounts', 'Aknet_ServiceVPNL2', 'aknet_servicevpnl2', 'id', 'Accounts', 'accounts', 'id', 'aknet_servicevpnl2_accounts_c', 'aknet_servicevpnl2_accountsaknet_servicevpnl2_ida', 'aknet_servicevpnl2_accountsaccounts_idb', 'many-to-many', NULL, NULL, 0, 0),
('26877b02-eae6-657c-3ebb-50b34f42e385', 'project_tasks_modified_user', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('28f10fe8-e181-0fe9-bfdd-50b34f731ec7', 'meetings_assigned_user', 'Users', 'users', 'id', 'Meetings', 'meetings', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('29af9f6e-24fa-acaa-c78f-50b34f0b4f45', 'case_tasks', 'Cases', 'cases', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('2a569714-973c-f21a-3597-50b34fb213a9', 'accounts_modified_user', 'Users', 'users', 'id', 'Accounts', 'accounts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2a635d73-27a4-4899-671b-50b34f723ed3', 'projects_accounts', 'Project', 'project', 'id', 'Accounts', 'accounts', 'id', 'projects_accounts', 'project_id', 'account_id', 'many-to-many', NULL, NULL, 0, 0),
('2a8c0449-9297-9c4d-df2a-50b34f1ea2ba', 'contact_direct_reports', 'Contacts', 'contacts', 'id', 'Contacts', 'contacts', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2a9bd21e-9468-a2a4-6256-50b34f689522', 'aknet_internettariff_created_by', 'Users', 'users', 'id', 'Aknet_InternetTariff', 'aknet_internettariff', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2c8ef867-74e2-9ccc-9f17-50b34fa9b3c0', 'aknet_servicevpnl2_opportunities', 'Aknet_ServiceVPNL2', 'aknet_servicevpnl2', 'id', 'Opportunities', 'opportunities', 'id', 'aknet_servicevpnl2_opportunities_c', 'aknet_servicevpnl2_opportunitiesaknet_servicevpnl2_ida', 'aknet_servicevpnl2_opportunitiesopportunities_idb', 'many-to-many', NULL, NULL, 0, 0),
('2cc9db89-0e46-d7fc-d32f-50b34f499e0c', 'project_tasks_created_by', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2fcf45fa-56fb-e472-ce91-50b34fdc5050', 'case_notes', 'Cases', 'cases', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('302327b0-9adf-857f-a70a-50b34fc593f8', 'emails_contacts_rel', 'Emails', 'emails', 'id', 'Contacts', 'contacts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Contacts', 0, 0),
('31a02874-d16d-c8c6-5a12-50b34fabe0ef', 'accounts_created_by', 'Users', 'users', 'id', 'Accounts', 'accounts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('31b95c5a-9401-4471-f2b8-50b34f304e35', 'projects_contacts', 'Project', 'project', 'id', 'Contacts', 'contacts', 'id', 'projects_contacts', 'project_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('32c51185-a9cb-6a9b-2aa7-50b34fbad2d3', 'aknet_internettariff_assigned_user', 'Users', 'users', 'id', 'Aknet_InternetTariff', 'aknet_internettariff', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3360ea77-cd94-c902-b424-50b34f40e009', 'documents_modified_user', 'Users', 'users', 'id', 'Documents', 'documents', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('34b5e909-4d22-16db-4f1d-50b34fefa375', 'aknet_servicetv_contacts', 'Aknet_ServiceTV', 'aknet_servicetv', 'id', 'Contacts', 'contacts', 'id', 'aknet_servicetv_contacts_c', 'aknet_servicetv_contactsaknet_servicetv_ida', 'aknet_servicetv_contactscontacts_idb', 'many-to-many', NULL, NULL, 0, 0),
('35458604-1f62-9434-3b82-50b34f2950a4', 'campaigns_modified_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('35e76f6d-2e73-5926-4ef4-50b34ff0fa12', 'case_meetings', 'Cases', 'cases', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('38a9c54f-0871-a701-5ee8-50b34ff429e8', 'projects_opportunities', 'Project', 'project', 'id', 'Opportunities', 'opportunities', 'id', 'projects_opportunities', 'project_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('39bb186b-a4c3-6db5-f7d9-50b34fbe7677', 'accounts_assigned_user', 'Users', 'users', 'id', 'Accounts', 'accounts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('39c69ff3-f2b0-37d0-3744-50b34f99671e', 'documents_created_by', 'Users', 'users', 'id', 'Documents', 'documents', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3a839075-c977-498f-9f9c-50b34f405d85', 'aknet_serviceinternet_modified_user', 'Users', 'users', 'id', 'Aknet_ServiceInternet', 'aknet_serviceinternet', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3ab30ed3-a272-2dbc-84f4-50b34f3537e8', 'prospect_list_users', 'ProspectLists', 'prospect_lists', 'id', 'Users', 'users', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Users', 0, 0),
('3ad1f653-aa21-ab2e-fe71-50b34f8d14a8', 'aknet_servicetv_opportunities', 'Aknet_ServiceTV', 'aknet_servicetv', 'id', 'Opportunities', 'opportunities', 'id', 'aknet_servicetv_opportunities_c', 'aknet_servicetv_opportunitiesaknet_servicetv_ida', 'aknet_servicetv_opportunitiesopportunities_idb', 'many-to-many', NULL, NULL, 0, 0),
('3b1d39c6-9521-0300-7382-50b34fe6f05e', 'campaigns_created_by', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3c0bef07-903e-8bb9-7eb0-50b34f7e7b08', 'case_emails', 'Cases', 'cases', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('3fd4673c-f4dd-caa9-8712-50b34f62aabc', 'accounts_email_addresses', 'Accounts', 'accounts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Accounts', 0, 0),
('3fe3b975-acfd-583f-c943-50b34fc24ed2', 'documents_assigned_user', 'Users', 'users', 'id', 'Documents', 'documents', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3ff8b696-6ae7-f44f-6c3a-50b34f84d449', 'acl_roles_actions', 'ACLRoles', 'acl_roles', 'id', 'ACLActions', 'acl_actions', 'id', 'acl_roles_actions', 'role_id', 'action_id', 'many-to-many', NULL, NULL, 0, 0),
('40f3e9d3-ec8a-63ac-cf90-50b34f7d720b', 'aknet_serviceinternet_leads', 'Aknet_ServiceInternet', 'aknet_serviceinternet', 'id', 'Leads', 'leads', 'id', 'aknet_serviceinternet_leads_c', 'aknet_serviceinternet_leadsaknet_serviceinternet_ida', 'aknet_serviceinternet_leadsleads_idb', 'many-to-many', NULL, NULL, 0, 0),
('4110fe0e-ed7b-5e8c-c8a0-50b34fbc7703', 'aknet_serviceinternet_created_by', 'Users', 'users', 'id', 'Aknet_ServiceInternet', 'aknet_serviceinternet', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('433dee3b-3af2-97f9-ff24-50b34f60586f', 'campaigns_assigned_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('442b7236-742c-31ca-6dce-50b34f94a384', 'bugs_modified_user', 'Users', 'users', 'id', 'Bugs', 'bugs', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('44651fcf-acd8-c2bf-852d-50b34fb60faf', 'emails_projects_rel', 'Emails', 'emails', 'id', 'Project', 'project', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Project', 0, 0),
('45f106e3-fc5e-fc91-e19b-50b34fb04d9f', 'accounts_email_addresses_primary', 'Accounts', 'accounts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('46057ce4-1ccf-42c4-e438-50b34f21b52d', 'document_revisions', 'Documents', 'documents', 'id', 'DocumentRevisions', 'document_revisions', 'document_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4720f2e4-3f39-c379-f9e7-50b34fc01efb', 'aknet_serviceinternet_assigned_user', 'Users', 'users', 'id', 'Aknet_ServiceInternet', 'aknet_serviceinternet', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4724b898-cc8d-be93-2796-50b34fdf3386', 'aknet_servicetv_accounts', 'Aknet_ServiceTV', 'aknet_servicetv', 'id', 'Accounts', 'accounts', 'id', 'aknet_servicetv_accounts_c', 'aknet_servicetv_accountsaknet_servicetv_ida', 'aknet_servicetv_accountsaccounts_idb', 'many-to-many', NULL, NULL, 0, 0),
('4959e999-0f34-5615-3882-50b34fde867d', 'campaign_accounts', 'Campaigns', 'campaigns', 'id', 'Accounts', 'accounts', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4a50dec3-d905-2d39-1623-50b34f92f676', 'bugs_created_by', 'Users', 'users', 'id', 'Bugs', 'bugs', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4bfce59f-c212-1223-848e-50b34fddf3a5', 'member_accounts', 'Accounts', 'accounts', 'id', 'Accounts', 'accounts', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4ccf4903-98e8-0676-49a1-50b34f77afd7', 'revisions_created_by', 'Users', 'users', 'id', 'DocumentRevisions', 'document_revisions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4e53c845-b285-bf98-6487-50b34f3665a8', 'acl_roles_users', 'ACLRoles', 'acl_roles', 'id', 'Users', 'users', 'id', 'acl_roles_users', 'role_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('4ede83a6-dca5-0375-e767-50b34feefff8', 'aknet_servicetv_modified_user', 'Users', 'users', 'id', 'Aknet_ServiceTV', 'aknet_servicetv', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4f3bd813-970e-5191-5e5e-50b34f9867cd', 'aknet_servicetv_leads', 'Aknet_ServiceTV', 'aknet_servicetv', 'id', 'Leads', 'leads', 'id', 'aknet_servicetv_leads_c', 'aknet_servicetv_leadsaknet_servicetv_ida', 'aknet_servicetv_leadsleads_idb', 'many-to-many', NULL, NULL, 0, 0),
('4f835be0-72dc-39da-f08c-50b34fafaa8d', 'campaign_contacts', 'Campaigns', 'campaigns', 'id', 'Contacts', 'contacts', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('506e8f87-4205-6af1-a2ce-50b34ff45cbd', 'bugs_assigned_user', 'Users', 'users', 'id', 'Bugs', 'bugs', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('50b732ec-bf70-fde3-f16a-50b34f90363f', 'emails_leads_rel', 'Emails', 'emails', 'id', 'Leads', 'leads', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Leads', 0, 0),
('51353a95-7b5e-c905-4c94-50b34f03dbcf', 'opportunity_tasks', 'Opportunities', 'opportunities', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('5239f502-8bcd-4009-d67b-50b34fc6f38b', 'account_cases', 'Accounts', 'accounts', 'id', 'Cases', 'cases', 'account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('55822f1c-0c6b-1772-82d6-50b34fc66717', 'aknet_servicetv_created_by', 'Users', 'users', 'id', 'Aknet_ServiceTV', 'aknet_servicetv', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('558d2f23-1dbe-e825-f479-50b34f0d8c9a', 'campaign_leads', 'Campaigns', 'campaigns', 'id', 'Leads', 'leads', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('568f3a51-3687-3fbe-b9d8-50b34f0748af', 'bug_tasks', 'Bugs', 'bugs', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('56ece20d-0da0-9e4c-383a-50b34f95393c', 'emails_prospects_rel', 'Emails', 'emails', 'id', 'Prospects', 'prospects', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Prospects', 0, 0),
('57a70573-21fc-b6cc-6f66-50b34f329bf7', 'opportunity_notes', 'Opportunities', 'opportunities', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('585578a3-a3ea-1fae-7459-50b34fd9417b', 'account_tasks', 'Accounts', 'accounts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('58a63713-2b32-0166-a836-50b34f6b3a57', 'inbound_email_created_by', 'Users', 'users', 'id', 'InboundEmail', 'inbound_email', 'created_by', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('5b8c8476-d11f-e5d8-f1d6-50b34fa41ebb', 'aknet_servicetv_assigned_user', 'Users', 'users', 'id', 'Aknet_ServiceTV', 'aknet_servicetv', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5bbde661-219e-d2eb-616a-50b34f8d794f', 'campaign_prospects', 'Campaigns', 'campaigns', 'id', 'Prospects', 'prospects', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5ca59959-e062-d10f-5504-50b34fddc465', 'bug_meetings', 'Bugs', 'bugs', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('5dc199f7-5834-cf77-e86e-50b34fb4ed22', 'opportunity_emails', 'Opportunities', 'opportunities', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('5e6d3c8c-aa00-b19a-4a01-50b34f4cbbd0', 'account_notes', 'Accounts', 'accounts', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('5e8e6129-9c03-d405-73a7-50b34fbda435', 'inbound_email_modified_user_id', 'Users', 'users', 'id', 'InboundEmail', 'inbound_email', 'modified_user_id', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('5edec132-2b63-ebe4-1647-50b34f3be6ae', 'schedulers_modified_user_id_rel', 'Users', 'users', 'id', 'Schedulers', 'schedulers', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('61d9006b-d1b9-7d32-1e0b-50b34f41e461', 'campaign_opportunities', 'Campaigns', 'campaigns', 'id', 'Opportunities', 'opportunities', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('62d798dc-412f-c873-0505-50b34f512f8b', 'aknet_servicevpnl2_modified_user', 'Users', 'users', 'id', 'Aknet_ServiceVPNL2', 'aknet_servicevpnl2', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('63e04ab0-2fc0-f2b6-2400-50b34f60e7a1', 'opportunity_leads', 'Opportunities', 'opportunities', 'id', 'Leads', 'leads', 'opportunity_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('648fcca9-d711-e4b3-8aa9-50b34f260508', 'account_meetings', 'Accounts', 'accounts', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('64dd17c1-35ce-3c4e-7d8d-50b34f172d5a', 'bug_calls', 'Bugs', 'bugs', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('66ecd5dd-1be2-c5de-bee8-50b34f207f78', 'emails_opportunities_rel', 'Emails', 'emails', 'id', 'Opportunities', 'opportunities', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Opportunities', 0, 0),
('67dd8b63-8dce-4206-a13e-50b34f183a1b', 'saved_search_assigned_user', 'Users', 'users', 'id', 'SavedSearch', 'saved_search', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('67f184a0-6844-03dc-3b0d-50b34f328f4a', 'campaign_email_marketing', 'Campaigns', 'campaigns', 'id', 'EmailMarketing', 'email_marketing', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('69db117b-fff7-2923-67ae-50b34ff5cf61', 'aknet_servicevpnl2_created_by', 'Users', 'users', 'id', 'Aknet_ServiceVPNL2', 'aknet_servicevpnl2', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('69fe3a5e-a078-3c38-2b7d-50b34f378383', 'opportunity_currencies', 'Opportunities', 'opportunities', 'currency_id', 'Currencies', 'currencies', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6aaafa33-dfac-b018-61d1-50b34fe91b8a', 'account_calls', 'Accounts', 'accounts', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('6ae9ca30-fded-e426-e582-50b34f30755e', 'bug_emails', 'Bugs', 'bugs', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('6e14eea4-c324-cc5f-d0f5-50b34f6a9857', 'campaign_emailman', 'Campaigns', 'campaigns', 'id', 'EmailMan', 'emailman', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6ff0da2a-78f3-9056-f1ee-50b34f4042f4', 'aknet_servicevpnl2_assigned_user', 'Users', 'users', 'id', 'Aknet_ServiceVPNL2', 'aknet_servicevpnl2', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('704d058e-3e1c-8506-153f-50b34fc355b7', 'lead_campaign_log', 'Leads', 'leads', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('709308c1-14b8-940f-61bd-50b34f5f629f', 'email_template_email_marketings', 'EmailTemplates', 'email_templates', 'id', 'EmailMarketing', 'email_marketing', 'template_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('70c7974b-7196-1458-5dd8-50b34fad028c', 'account_emails', 'Accounts', 'accounts', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('7109f231-efc5-918d-8113-50b34ff13979', 'bug_notes', 'Bugs', 'bugs', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('71672f47-abe9-2a7f-f980-50b34f7a727d', 'sugarfeed_modified_user', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('72279e64-e5b1-732f-e4ce-50b34fefdd26', 'opportunities_campaign', 'Campaigns', 'campaigns', 'id', 'Opportunities', 'opportunities', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('72bb9d27-ee8c-1a11-f840-50b34f2f7ec8', 'meetings_contacts', 'Meetings', 'meetings', 'id', 'Contacts', 'contacts', 'id', 'meetings_contacts', 'meeting_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('7432453b-1b3e-8424-07c9-50b34ff4226c', 'campaign_campaignlog', 'Campaigns', 'campaigns', 'id', 'CampaignLog', 'campaign_log', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7563cd59-5d2c-d651-f17d-50b34f9106d6', 'email_marketing_prospect_lists', 'EmailMarketing', 'email_marketing', 'id', 'ProspectLists', 'prospect_lists', 'id', 'email_marketing_prospect_lists', 'email_marketing_id', 'prospect_list_id', 'many-to-many', NULL, NULL, 0, 0),
('75e005e9-7082-64b6-1e87-50b34f46dfe4', 'prospect_campaign_log', 'Prospects', 'prospects', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('769ec7b0-f8a1-3590-0e05-50b34f15005e', 'emails_tasks_rel', 'Emails', 'emails', 'id', 'Tasks', 'tasks', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Tasks', 0, 0),
('76e62cc0-2d33-61b6-b3a0-50b34f1de2d8', 'account_leads', 'Accounts', 'accounts', 'id', 'Leads', 'leads', 'account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('77232f88-8de6-84b5-0583-50b34f79891f', 'bugs_release', 'Releases', 'releases', 'id', 'Bugs', 'bugs', 'found_in_release', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7862b5bf-b732-6f80-fe28-50b34faafc19', 'aknet_street_modified_user', 'Users', 'users', 'id', 'Aknet_Street', 'aknet_street', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('79a84f72-34d3-b25c-6a5e-50b34fcd8761', 'emailtemplates_assigned_user', 'Users', 'users', 'id', 'EmailTemplates', 'email_templates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7a50270d-977c-0f31-27fc-50b34ffb46a3', 'campaign_assigned_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7d41edae-e2b4-52f5-12ea-50b34f14059c', 'bugs_fixed_in_release', 'Releases', 'releases', 'id', 'Bugs', 'bugs', 'fixed_in_release', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7da169d8-3b1d-656a-45a2-50b34f31b88a', 'sugarfeed_created_by', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7e4b433d-ecfe-74f1-b09c-50b34ffd6576', 'aknet_street_created_by', 'Users', 'users', 'id', 'Aknet_Street', 'aknet_street', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7e7a07b2-59c9-f52c-bae8-50b34f8cb563', 'jjwa_tools_assigned_user', 'Users', 'users', 'id', 'jjwa_Tools', 'jjwa_tools', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7f0f9ac3-2d15-f575-e68c-50b34f1ee6e7', 'account_campaign_log', 'Accounts', 'accounts', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7fcd0217-ce6f-7ad6-d6c1-50b34f409020', 'project_tasks_tasks', 'ProjectTask', 'project_task', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('82199ef0-894e-3e2a-a874-50b34f1fea5d', 'notes_assigned_user', 'Users', 'users', 'id', 'Notes', 'notes', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('82783d56-15e5-2e75-7baa-50b34fc69f63', 'campaign_modified_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('83e59333-fce1-69fe-11ed-50b34f06b73f', 'user_direct_reports', 'Users', 'users', 'id', 'Users', 'users', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('848394c3-ac06-b92e-a29a-50b34fca3dc8', 'aknet_street_assigned_user', 'Users', 'users', 'id', 'Aknet_Street', 'aknet_street', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8858a5f3-63e3-5b13-9cfe-50b34f9db7e2', 'emails_users_rel', 'Emails', 'emails', 'id', 'Users', 'users', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Users', 0, 0),
('88ac563d-5d5e-3a6c-8359-50b34f85c047', 'notes_modified_user', 'Users', 'users', 'id', 'Notes', 'notes', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('88cfda26-f153-5dbc-ccea-50b34fbf47ca', 'opportunities_modified_user', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('897fccc9-f639-a216-d801-50b34fd596e2', 'users_email_addresses', 'Users', 'users', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Users', 0, 0),
('89deb45e-092b-ce8c-3cd8-50b34f2ad09a', 'prospectlists_assigned_user', 'Users', 'users', 'id', 'prospectlists', 'prospect_lists', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8a710121-cdd4-35f3-6e35-50b34f6d1526', 'meetings_notes', 'Meetings', 'meetings', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Meetings', 0, 0),
('8ba1cf0d-7a3d-ec7f-10db-50b34fb32a2a', 'aknet_tvtariff_modified_user', 'Users', 'users', 'id', 'Aknet_TVTariff', 'aknet_tvtariff', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8c2d0052-032f-0160-4e07-50b34f89956c', 'contact_leads', 'Contacts', 'contacts', 'id', 'Leads', 'leads', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8ea62919-af3e-a485-9f19-50b34fee4cc9', 'opportunities_created_by', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8eb90408-3c03-1a44-12e3-50b34f79bf5f', 'notes_created_by', 'Users', 'users', 'id', 'Notes', 'notes', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8fa2d27a-f2db-e95a-0f3f-50b34fc820bc', 'users_email_addresses_primary', 'Users', 'users', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('90880632-77ee-3076-947a-50b34fe4dd8f', 'aknet_serviceinternet_contacts', 'Aknet_ServiceInternet', 'aknet_serviceinternet', 'id', 'Contacts', 'contacts', 'id', 'aknet_serviceinternet_contacts_c', 'aknet_serviceinternet_contactsaknet_serviceinternet_ida', 'aknet_serviceinternet_contactscontacts_idb', 'many-to-many', NULL, NULL, 0, 0),
('90c9914e-9a2d-e8ef-79ce-50b34fae0f49', 'aknet_tvtariff_created_by', 'Users', 'users', 'id', 'Aknet_TVTariff', 'aknet_tvtariff', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('92398f18-c597-89d4-7125-50b34faf94b6', 'leads_documents', 'Leads', 'leads', 'id', 'Documents', 'documents', 'id', 'linked_documents', 'parent_id', 'document_id', 'many-to-many', 'parent_type', 'Leads', 0, 0),
('933cf811-5ef8-1c18-c609-50b34fa41204', 'prospects_modified_user', 'Users', 'users', 'id', 'Prospects', 'prospects', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('938803b9-8286-6400-5b0e-50b34fa49a05', 'sugarfeed_assigned_user', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('94ca27e9-6f69-6240-ebb3-50b34f099160', 'opportunities_assigned_user', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('96029d5d-c189-509f-0b72-50b34f4dbb94', 'meetings_users', 'Meetings', 'meetings', 'id', 'Users', 'users', 'id', 'meetings_users', 'meeting_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('96826904-b773-ce45-7c9f-50b34fcdbdf0', 'campaignlog_contact', 'CampaignLog', 'campaign_log', 'related_id', 'Contacts', 'contacts', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('96a2c4df-bcc9-be8b-6a12-50b34f054976', 'calls_modified_user', 'Users', 'users', 'id', 'Calls', 'calls', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('96da3700-a756-f507-2105-50b34f7c567c', 'aknet_tvtariff_assigned_user', 'Users', 'users', 'id', 'Aknet_TVTariff', 'aknet_tvtariff', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('98f7854a-8681-3ae7-6e7d-50b34f4edba0', 'prospects_created_by', 'Users', 'users', 'id', 'Prospects', 'prospects', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('993d0d80-1b9e-fbff-71d5-50b34f7d9f3e', 'emails_cases_rel', 'Emails', 'emails', 'id', 'Cases', 'cases', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Cases', 0, 0),
('9ae3757b-96fd-fa03-5f01-50b34fd4c60b', 'opportunity_calls', 'Opportunities', 'opportunities', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('9be64443-17ec-2cdf-e908-50b34fac48e5', 'campaignlog_lead', 'CampaignLog', 'campaign_log', 'related_id', 'Leads', 'leads', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9c71b470-4eb0-4ceb-8b70-50b34f741792', 'schedulers_jobs_rel', 'Schedulers', 'schedulers', 'id', 'SchedulersJobs', 'job_queue', 'scheduler_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9d09e5c6-435d-2083-229c-50b34fc97ca8', 'calls_created_by', 'Users', 'users', 'id', 'Calls', 'calls', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9d5f5563-acfd-6393-4617-50b34f0add7e', 'meetings_leads', 'Meetings', 'meetings', 'id', 'Leads', 'leads', 'id', 'meetings_leads', 'meeting_id', 'lead_id', 'many-to-many', NULL, NULL, 0, 0),
('9ed77313-f1c3-00ba-d2ca-50b34f26d403', 'eapm_modified_user', 'Users', 'users', 'id', 'EAPM', 'eapm', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9f15063a-777d-4132-49f7-50b34f0d52c3', 'prospects_assigned_user', 'Users', 'users', 'id', 'Prospects', 'prospects', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9f3e0b2d-6be9-a937-6ee8-50b34f335ae3', 'leads_modified_user', 'Users', 'users', 'id', 'Leads', 'leads', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a1f68235-e7e2-6c8a-cbad-50b34f0dc6e4', 'campaignlog_created_opportunities', 'CampaignLog', 'campaign_log', 'related_id', 'Opportunities', 'opportunities', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a2f5896b-e4ec-c25a-44d6-50b34f627a87', 'accounts_bugs', 'Accounts', 'accounts', 'id', 'Bugs', 'bugs', 'id', 'accounts_bugs', 'account_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('a32689a5-5d2b-f9bf-0524-50b34f5a3331', 'calls_assigned_user', 'Users', 'users', 'id', 'Calls', 'calls', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a5a43777-f11d-1cf7-3272-50b34f06c819', 'leads_created_by', 'Users', 'users', 'id', 'Leads', 'leads', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a914742f-b40d-85c1-e390-50b34f5c2511', 'eapm_created_by', 'Users', 'users', 'id', 'EAPM', 'eapm', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a92ae279-aee6-a10e-3758-50b34fdadf71', 'accounts_contacts', 'Accounts', 'accounts', 'id', 'Contacts', 'contacts', 'id', 'accounts_contacts', 'account_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('a94331c8-4411-88d5-5daa-50b34fff9e25', 'calls_notes', 'Calls', 'calls', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Calls', 0, 0),
('aa3b5640-9a25-dc38-3f43-50b34f1ce2c3', 'campaignlog_targeted_users', 'CampaignLog', 'campaign_log', 'target_id', 'Users', 'users', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('abb07a00-f85a-cbec-51d7-50b34fbfdee1', 'leads_assigned_user', 'Users', 'users', 'id', 'Leads', 'leads', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ad46ee44-5b45-8981-6924-50b34f037bac', 'emails_project_task_rel', 'Emails', 'emails', 'id', 'ProjectTask', 'project_task', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'ProjectTask', 0, 0),
('ad4ff987-fb4c-68e1-3cea-50b34fa0b13c', 'prospects_email_addresses', 'Prospects', 'prospects', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Prospects', 0, 0),
('ae5b055b-b4b2-4024-d4ba-50b34f500222', 'prospect_list_accounts', 'ProspectLists', 'prospect_lists', 'id', 'Accounts', 'accounts', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Accounts', 0, 0),
('af53c101-3a2f-3e41-637e-50b34f4a6823', 'accounts_opportunities', 'Accounts', 'accounts', 'id', 'Opportunities', 'opportunities', 'id', 'accounts_opportunities', 'account_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('afafd6ee-f858-0e14-ad7d-50b34fb7c4a8', 'emails_assigned_user', 'Users', 'users', 'id', 'Emails', 'emails', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b0473b13-be49-5c71-4110-50b34f552f33', 'campaignlog_sent_emails', 'CampaignLog', 'campaign_log', 'related_id', 'Emails', 'emails', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b0938c19-c0ab-7d4d-87af-50b34f1c3a57', 'opportunities_contacts', 'Opportunities', 'opportunities', 'id', 'Contacts', 'contacts', 'id', 'opportunities_contacts', 'opportunity_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('b1cfeed8-4468-2321-878a-50b34f1456ac', 'leads_email_addresses', 'Leads', 'leads', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Leads', 0, 0),
('b2189e9b-c834-ea75-cb5e-50b34fd59710', 'eapm_assigned_user', 'Users', 'users', 'id', 'EAPM', 'eapm', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b5622a15-ade8-0afd-236e-50b34f84f11b', 'calls_contacts', 'Calls', 'calls', 'id', 'Contacts', 'contacts', 'id', 'calls_contacts', 'call_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('b577735b-9b02-4434-1dbb-50b34f1bddfa', 'emails_modified_user', 'Users', 'users', 'id', 'Emails', 'emails', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b7ad0922-4e40-c2fe-5637-50b34f2becef', 'projects_notes', 'Project', 'project', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('b7f0c14e-9f91-0d11-3995-50b34f764a52', 'leads_email_addresses_primary', 'Leads', 'leads', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('b9999636-e7f6-b05f-9e77-50b34f69cf38', 'oauthkeys_modified_user', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('baa8cdd6-610a-dd2a-5cf2-50b34f945bdd', 'prospect_list_campaigns', 'ProspectLists', 'prospect_lists', 'id', 'Campaigns', 'campaigns', 'id', 'prospect_list_campaigns', 'prospect_list_id', 'campaign_id', 'many-to-many', NULL, NULL, 0, 0),
('bd914fe4-7e16-f44e-356d-50b34fe5f477', 'calls_users', 'Calls', 'calls', 'id', 'Users', 'users', 'id', 'calls_users', 'call_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('bed087cf-60d1-b6bb-0c4f-50b34fc61520', 'projects_tasks', 'Project', 'project', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('c00c2210-d1c0-7b96-4b13-50b34f156b26', 'lead_direct_reports', 'Leads', 'leads', 'id', 'Leads', 'leads', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c20e9c8b-78a1-bedd-d264-50b34f0a1f8e', 'oauthkeys_created_by', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c3bb1063-8579-e834-3466-50b34f9920cb', 'calls_leads', 'Calls', 'calls', 'id', 'Leads', 'leads', 'id', 'calls_leads', 'call_id', 'lead_id', 'many-to-many', NULL, NULL, 0, 0),
('c50f5bae-cc7d-a936-4d5d-50b34f552b0e', 'projects_meetings', 'Project', 'project', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('c62026a0-6b65-b02e-255e-50b34f5d5d55', 'lead_tasks', 'Leads', 'leads', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('c79196f8-13a4-b9bb-3e2c-50b34f65d8ef', 'schedulersjobs_assigned_user', 'Users', 'users', 'id', 'SchedulersJobs', 'schedulersjobs', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c89d27e7-73d8-cb37-c502-50b34fd908ba', 'oauthkeys_assigned_user', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c8aa5e41-9c59-fb8f-04c3-50b34f9e9d92', 'cases_bugs', 'Cases', 'cases', 'id', 'Bugs', 'bugs', 'id', 'cases_bugs', 'case_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('cc437a41-5c6e-da62-3a42-50b34fd58fad', 'lead_notes', 'Leads', 'leads', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('cd379c1f-b3b0-d88c-ff3b-50b34ff1ddcd', 'projects_calls', 'Project', 'project', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('cddf91aa-2ff8-583e-1c1e-50b34fedcffa', 'prospects_email_addresses_primary', 'Prospects', 'prospects', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('cec52ded-0903-5858-573b-50b34ff9565e', 'contacts_bugs', 'Contacts', 'contacts', 'id', 'Bugs', 'bugs', 'id', 'contacts_bugs', 'contact_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('d1f7cf14-da90-a73f-7a7c-50b34f440c79', 'emails_created_by', 'Users', 'users', 'id', 'Emails', 'emails', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d21b066e-512e-406b-7668-50b34f4c48d5', 'campaign_campaigntrakers', 'Campaigns', 'campaigns', 'id', 'CampaignTrackers', 'campaign_trkrs', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d354fbf5-7567-a269-598f-50b34f9bc891', 'projects_emails', 'Project', 'project', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('d38be2fe-c2f3-aaac-8c24-50b34fbc3265', 'documents_accounts', 'Documents', 'documents', 'id', 'Accounts', 'accounts', 'id', 'documents_accounts', 'document_id', 'account_id', 'many-to-many', NULL, NULL, 0, 0),
('d3fbea8e-d500-8b25-b267-50b34f731e4c', 'prospect_tasks', 'Prospects', 'prospects', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('d41576de-dd62-0a75-2cc9-50b34fdecdc2', 'consumer_tokens', 'OAuthKeys', 'oauth_consumer', 'id', 'OAuthTokens', 'oauth_tokens', 'consumer', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d4e453d3-7d91-4b0f-8b6b-50b34fc63ae3', 'contacts_cases', 'Contacts', 'contacts', 'id', 'Cases', 'cases', 'id', 'contacts_cases', 'contact_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('d56d184f-f678-0205-b54a-50b34f4bcdf7', 'contacts_modified_user', 'Users', 'users', 'id', 'Contacts', 'contacts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d815b342-ef61-7c4c-6dc7-50b34f3c3e66', 'emails_notes_rel', 'Emails', 'emails', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d8751ced-9e66-07d5-8f7d-50b34f756e2a', 'prospect_list_contacts', 'ProspectLists', 'prospect_lists', 'id', 'Contacts', 'contacts', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Contacts', 0, 0),
('d973983e-58d0-f4a1-d87a-50b34faa2ef4', 'projects_project_tasks', 'Project', 'project', 'id', 'ProjectTask', 'project_task', 'project_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('da210938-e006-d982-a41d-50b34fd73d58', 'prospect_notes', 'Prospects', 'prospects', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('daff481d-822b-3122-e760-50b34f8659c6', 'contacts_users', 'Contacts', 'contacts', 'id', 'Users', 'users', 'id', 'contacts_users', 'contact_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('dbd0068f-6ed5-7bd0-e49d-50b34fcd2646', 'lead_emails', 'Leads', 'leads', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('dc56da2e-d1cb-69ec-44b2-50b34f7ec4ca', 'contacts_created_by', 'Users', 'users', 'id', 'Contacts', 'contacts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('dd651304-0bf0-ef3e-7829-50b34fa8e368', 'documents_contacts', 'Documents', 'documents', 'id', 'Contacts', 'contacts', 'id', 'documents_contacts', 'document_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('de309bdb-75c0-8cc8-6988-50b34f632d2d', 'emails_meetings_rel', 'Emails', 'emails', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('df8e9963-73b6-b1b4-a8b3-50b34fffc5f1', 'projects_assigned_user', 'Users', 'users', 'id', 'Project', 'project', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e034f9d4-df81-c8ec-0c78-50b34fa454ee', 'prospect_meetings', 'Prospects', 'prospects', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('e116091f-e1d1-b0e2-e4cb-50b34f6372ff', 'oauthtokens_assigned_user', 'Users', 'users', 'id', 'OAuthTokens', 'oauth_tokens', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e12cb403-ff4b-5040-36b3-50b34f8dd816', 'emails_accounts_rel', 'Emails', 'emails', 'id', 'Accounts', 'accounts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Accounts', 0, 0),
('e19e03bd-2156-7148-31a8-50b34f8572e4', 'project_tasks_meetings', 'ProjectTask', 'project_task', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('e22b8df2-3021-be65-a146-50b34f48f39e', 'prospect_list_prospects', 'ProspectLists', 'prospect_lists', 'id', 'Prospects', 'prospects', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Prospects', 0, 0),
('e2696a14-660d-dafc-72bd-50b34f1ee81c', 'contacts_assigned_user', 'Users', 'users', 'id', 'Contacts', 'contacts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e385289e-6b9d-7e99-166e-50b34f4fb764', 'documents_opportunities', 'Documents', 'documents', 'id', 'Opportunities', 'opportunities', 'id', 'documents_opportunities', 'document_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('e5a6f74e-9cab-b5c6-8e95-50b34f63c67a', 'projects_modified_user', 'Users', 'users', 'id', 'Project', 'project', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e6515f85-0eaf-d983-7817-50b34f698f15', 'prospect_calls', 'Prospects', 'prospects', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('e6d25d7f-efc0-d3ee-6db9-50b34fc19e9e', 'meetings_modified_user', 'Users', 'users', 'id', 'Meetings', 'meetings', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e8b7a14b-61be-cfa8-dedc-50b34f177fa0', 'lead_meetings', 'Leads', 'leads', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('e9a9528e-a161-9e76-9c39-50b34fb3197c', 'documents_cases', 'Documents', 'documents', 'id', 'Cases', 'cases', 'id', 'documents_cases', 'document_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('ea8589a7-6707-9036-e5ab-50b34fc1b2ad', 'contacts_email_addresses', 'Contacts', 'contacts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Contacts', 0, 0),
('eb29844b-ac4e-4131-abe0-50b34fae67c2', 'jjwa_tools_modified_user', 'Users', 'users', 'id', 'jjwa_Tools', 'jjwa_tools', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ebce6b5b-bacd-4d4d-c175-50b34f11da4c', 'projects_created_by', 'Users', 'users', 'id', 'Project', 'project', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ed49ea6c-e35e-2b8e-6225-50b34f3a7988', 'emails_bugs_rel', 'Emails', 'emails', 'id', 'Bugs', 'bugs', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Bugs', 0, 0),
('edc809c2-f45a-496a-6fa9-50b34fccc74c', 'contact_notes', 'Contacts', 'contacts', 'id', 'Notes', 'notes', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ee6d7187-7f6d-ab00-b6d9-50b34f77cad9', 'prospect_emails', 'Prospects', 'prospects', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('eee85d94-3e79-ce8c-4668-50b34fe6884d', 'lead_calls', 'Leads', 'leads', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('efc2b6e9-69e3-3e48-5f9c-50b34f8e0b58', 'documents_bugs', 'Documents', 'documents', 'id', 'Bugs', 'bugs', 'id', 'documents_bugs', 'document_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('f0933690-ae19-5963-6b29-50b34f3ed743', 'meetings_created_by', 'Users', 'users', 'id', 'Meetings', 'meetings', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f0a233c7-5022-c115-9062-50b34f4b69b8', 'contacts_email_addresses_primary', 'Contacts', 'contacts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('f0c90698-d27d-a34c-0eb6-50b34f8cd180', 'cases_modified_user', 'Users', 'users', 'id', 'Cases', 'cases', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f1240389-e489-c7ce-0a82-50b34f5acb5a', 'prospect_list_leads', 'ProspectLists', 'prospect_lists', 'id', 'Leads', 'leads', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Leads', 0, 0),
('f13c0683-ad9e-cdaf-eda4-50b34fd46bdf', 'jjwa_reports_modified_user', 'Users', 'users', 'id', 'jjwa_Reports', 'jjwa_reports', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `releases`
--

CREATE TABLE IF NOT EXISTS `releases` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_order` int(4) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_releases` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `modules` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles_modules`
--

CREATE TABLE IF NOT EXISTS `roles_modules` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `module_id` varchar(36) DEFAULT NULL,
  `allow` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles_users`
--

CREATE TABLE IF NOT EXISTS `roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ru_role_id` (`role_id`),
  KEY `idx_ru_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `saved_search`
--

CREATE TABLE IF NOT EXISTS `saved_search` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `search_module` varchar(150) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `idx_desc` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schedulers`
--

CREATE TABLE IF NOT EXISTS `schedulers` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `date_time_start` datetime DEFAULT NULL,
  `date_time_end` datetime DEFAULT NULL,
  `job_interval` varchar(100) DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `catch_up` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_schedule` (`date_time_start`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedulers`
--

INSERT INTO `schedulers` (`id`, `deleted`, `date_entered`, `date_modified`, `created_by`, `modified_user_id`, `name`, `job`, `date_time_start`, `date_time_end`, `job_interval`, `time_from`, `time_to`, `last_run`, `status`, `catch_up`) VALUES
('b4ffb248-42eb-d5cc-9936-50b34e3ea877', 0, '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '1', 'Prune Tracker Tables', 'function::trimTracker', '2005-01-01 06:45:01', '2020-12-31 23:59:59', '0::2::1::*::*', NULL, NULL, NULL, 'Active', 1),
('bc923f3b-94b4-1c8e-dffe-50b34e32d248', 0, '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '1', 'Check Inbound Mailboxes', 'function::pollMonitoredInboxes', '2005-01-01 06:00:01', '2020-12-31 23:59:59', '*::*::*::*::*', NULL, NULL, NULL, 'Active', 0),
('c490a67d-c77c-7aae-36ce-50b34e4c7f6c', 0, '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '1', 'Run Nightly Process Bounced Campaign Emails', 'function::pollMonitoredInboxesForBouncedCampaignEmails', '2005-01-01 13:00:01', '2020-12-31 23:59:59', '0::2-6::*::*::*', NULL, NULL, NULL, 'Active', 1),
('ccb31b51-dd95-917e-e713-50b34eb8aa87', 0, '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '1', 'Run Nightly Mass Email Campaigns', 'function::runMassEmailCampaign', '2005-01-01 18:45:01', '2020-12-31 23:59:59', '0::2-6::*::*::*', NULL, NULL, NULL, 'Active', 1),
('d6e2f3b1-6365-1292-45fa-50b34e89d457', 0, '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '1', 'Prune Database on 1st of Month', 'function::pruneDatabase', '2005-01-01 13:15:01', '2020-12-31 23:59:59', '0::4::1::*::*', NULL, NULL, NULL, 'Inactive', 0),
('e1dd94e3-0c2f-d436-2a53-50b34e2ec7bb', 0, '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '1', 'Run Email Reminder Notifications', 'function::sendEmailReminders', '2008-01-01 12:30:01', '2020-12-31 23:59:59', '*::*::*::*::*', NULL, NULL, NULL, 'Active', 0),
('ef6809cb-c7e4-99ac-fd59-50b34e9c48f9', 0, '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '1', 'Clean Jobs Queue', 'function::cleanJobQueue', '2012-01-01 19:45:01', '2030-12-31 23:59:59', '0::5::*::*::*', NULL, NULL, NULL, 'Active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sugarfeed`
--

CREATE TABLE IF NOT EXISTS `sugarfeed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `related_module` varchar(100) DEFAULT NULL,
  `related_id` char(36) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sgrfeed_date` (`date_entered`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `date_due_flag` tinyint(1) DEFAULT '0',
  `date_due` datetime DEFAULT NULL,
  `date_start_flag` tinyint(1) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tsk_name` (`name`),
  KEY `idx_task_con_del` (`contact_id`,`deleted`),
  KEY `idx_task_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_task_assigned` (`assigned_user_id`),
  KEY `idx_task_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tracker`
--

CREATE TABLE IF NOT EXISTS `tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_id` char(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `item_summary` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `session_id` varchar(36) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tracker_iid` (`item_id`),
  KEY `idx_tracker_userid_vis_id` (`user_id`,`visible`,`id`),
  KEY `idx_tracker_userid_itemid_vis` (`user_id`,`item_id`,`visible`),
  KEY `idx_tracker_monitor_id` (`monitor_id`),
  KEY `idx_tracker_date_modified` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `upgrade_history`
--

CREATE TABLE IF NOT EXISTS `upgrade_history` (
  `id` char(36) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `id_name` varchar(255) DEFAULT NULL,
  `manifest` longtext,
  `date_entered` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `upgrade_history_md5_uk` (`md5sum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upgrade_history`
--

INSERT INTO `upgrade_history` (`id`, `filename`, `md5sum`, `type`, `status`, `version`, `name`, `description`, `id_name`, `manifest`, `date_entered`, `enabled`) VALUES
('77d20c59-d02c-3a69-e533-50b34f0162c7', 'upload/upgrades/module/Aknet2012_11_26_171419.zip', '3c9b98ce55a7ea55fa603983b75e7cb7', 'module', 'installed', '1353928459', 'Aknet', '', 'Aknet', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6NToiQWtuZXQiO3M6NjoiYXV0aG9yIjtzOjA6IiI7czoxMToiZGVzY3JpcHRpb24iO3M6MDoiIjtzOjQ6Imljb24iO3M6MDoiIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtiOjE7czo0OiJuYW1lIjtzOjU6IkFrbmV0IjtzOjE0OiJwdWJsaXNoZWRfZGF0ZSI7czoxOToiMjAxMi0xMS0yNiAxMToxNDoxOSI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo3OiJ2ZXJzaW9uIjtpOjEzNTM5Mjg0NTk7czoxMzoicmVtb3ZlX3RhYmxlcyI7czo2OiJwcm9tcHQiO31zOjExOiJpbnN0YWxsZGVmcyI7YTo4OntzOjI6ImlkIjtzOjU6IkFrbmV0IjtzOjU6ImJlYW5zIjthOjY6e2k6MDthOjQ6e3M6NjoibW9kdWxlIjtzOjIwOiJBa25ldF9JbnRlcm5ldFRhcmlmZiI7czo1OiJjbGFzcyI7czoyMDoiQWtuZXRfSW50ZXJuZXRUYXJpZmYiO3M6NDoicGF0aCI7czo1MzoibW9kdWxlcy9Ba25ldF9JbnRlcm5ldFRhcmlmZi9Ba25ldF9JbnRlcm5ldFRhcmlmZi5waHAiO3M6MzoidGFiIjtiOjE7fWk6MTthOjQ6e3M6NjoibW9kdWxlIjtzOjIxOiJBa25ldF9TZXJ2aWNlSW50ZXJuZXQiO3M6NToiY2xhc3MiO3M6MjE6IkFrbmV0X1NlcnZpY2VJbnRlcm5ldCI7czo0OiJwYXRoIjtzOjU1OiJtb2R1bGVzL0FrbmV0X1NlcnZpY2VJbnRlcm5ldC9Ba25ldF9TZXJ2aWNlSW50ZXJuZXQucGhwIjtzOjM6InRhYiI7YjoxO31pOjI7YTo0OntzOjY6Im1vZHVsZSI7czoxNToiQWtuZXRfU2VydmljZVRWIjtzOjU6ImNsYXNzIjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO3M6NDoicGF0aCI7czo0MzoibW9kdWxlcy9Ba25ldF9TZXJ2aWNlVFYvQWtuZXRfU2VydmljZVRWLnBocCI7czozOiJ0YWIiO2I6MTt9aTozO2E6NDp7czo2OiJtb2R1bGUiO3M6MTg6IkFrbmV0X1NlcnZpY2VWUE5MMiI7czo1OiJjbGFzcyI7czoxODoiQWtuZXRfU2VydmljZVZQTkwyIjtzOjQ6InBhdGgiO3M6NDk6Im1vZHVsZXMvQWtuZXRfU2VydmljZVZQTkwyL0FrbmV0X1NlcnZpY2VWUE5MMi5waHAiO3M6MzoidGFiIjtiOjE7fWk6NDthOjQ6e3M6NjoibW9kdWxlIjtzOjEyOiJBa25ldF9TdHJlZXQiO3M6NToiY2xhc3MiO3M6MTI6IkFrbmV0X1N0cmVldCI7czo0OiJwYXRoIjtzOjM3OiJtb2R1bGVzL0FrbmV0X1N0cmVldC9Ba25ldF9TdHJlZXQucGhwIjtzOjM6InRhYiI7YjoxO31pOjU7YTo0OntzOjY6Im1vZHVsZSI7czoxNDoiQWtuZXRfVFZUYXJpZmYiO3M6NToiY2xhc3MiO3M6MTQ6IkFrbmV0X1RWVGFyaWZmIjtzOjQ6InBhdGgiO3M6NDE6Im1vZHVsZXMvQWtuZXRfVFZUYXJpZmYvQWtuZXRfVFZUYXJpZmYucGhwIjtzOjM6InRhYiI7YjoxO319czoxMDoibGF5b3V0ZGVmcyI7YToyNDp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjg2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMvYWtuZXRfc2VydmljZWludGVybmV0X2xlYWRzX0xlYWRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO31pOjE7YToyOntzOjQ6ImZyb20iO3M6MTAyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMvYWtuZXRfc2VydmljZWludGVybmV0X2xlYWRzX0FrbmV0X1NlcnZpY2VJbnRlcm5ldC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjIxOiJBa25ldF9TZXJ2aWNlSW50ZXJuZXQiO31pOjI7YToyOntzOjQ6ImZyb20iO3M6OTI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNlaW50ZXJuZXRfY29udGFjdHNfQ29udGFjdHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDb250YWN0cyI7fWk6MzthOjI6e3M6NDoiZnJvbSI7czoxMDU6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNlaW50ZXJuZXRfY29udGFjdHNfQWtuZXRfU2VydmljZUludGVybmV0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MjE6IkFrbmV0X1NlcnZpY2VJbnRlcm5ldCI7fWk6NDthOjI6e3M6NDoiZnJvbSI7czoxMDI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNlaW50ZXJuZXRfb3Bwb3J0dW5pdGllc19PcHBvcnR1bml0aWVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO31pOjU7YToyOntzOjQ6ImZyb20iO3M6MTEwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMvYWtuZXRfc2VydmljZWludGVybmV0X29wcG9ydHVuaXRpZXNfQWtuZXRfU2VydmljZUludGVybmV0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MjE6IkFrbmV0X1NlcnZpY2VJbnRlcm5ldCI7fWk6NjthOjI6e3M6NDoiZnJvbSI7czo5MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYXlvdXRkZWZzL2FrbmV0X3NlcnZpY2VpbnRlcm5ldF9hY2NvdW50c19BY2NvdW50cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjt9aTo3O2E6Mjp7czo0OiJmcm9tIjtzOjEwNToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYXlvdXRkZWZzL2FrbmV0X3NlcnZpY2VpbnRlcm5ldF9hY2NvdW50c19Ba25ldF9TZXJ2aWNlSW50ZXJuZXQucGhwIjtzOjk6InRvX21vZHVsZSI7czoyMToiQWtuZXRfU2VydmljZUludGVybmV0Ijt9aTo4O2E6Mjp7czo0OiJmcm9tIjtzOjgwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMvYWtuZXRfc2VydmljZXR2X2xlYWRzX0xlYWRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO31pOjk7YToyOntzOjQ6ImZyb20iO3M6OTA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldHZfbGVhZHNfQWtuZXRfU2VydmljZVRWLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTU6IkFrbmV0X1NlcnZpY2VUViI7fWk6MTA7YToyOntzOjQ6ImZyb20iO3M6ODY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldHZfYWNjb3VudHNfQWNjb3VudHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJBY2NvdW50cyI7fWk6MTE7YToyOntzOjQ6ImZyb20iO3M6OTM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldHZfYWNjb3VudHNfQWtuZXRfU2VydmljZVRWLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTU6IkFrbmV0X1NlcnZpY2VUViI7fWk6MTI7YToyOntzOjQ6ImZyb20iO3M6ODY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldHZfY29udGFjdHNfQ29udGFjdHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDb250YWN0cyI7fWk6MTM7YToyOntzOjQ6ImZyb20iO3M6OTM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldHZfY29udGFjdHNfQWtuZXRfU2VydmljZVRWLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTU6IkFrbmV0X1NlcnZpY2VUViI7fWk6MTQ7YToyOntzOjQ6ImZyb20iO3M6OTY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldHZfb3Bwb3J0dW5pdGllc19PcHBvcnR1bml0aWVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO31pOjE1O2E6Mjp7czo0OiJmcm9tIjtzOjk4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMvYWtuZXRfc2VydmljZXR2X29wcG9ydHVuaXRpZXNfQWtuZXRfU2VydmljZVRWLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTU6IkFrbmV0X1NlcnZpY2VUViI7fWk6MTY7YToyOntzOjQ6ImZyb20iO3M6ODM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldnBubDJfbGVhZHNfTGVhZHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJMZWFkcyI7fWk6MTc7YToyOntzOjQ6ImZyb20iO3M6OTY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldnBubDJfbGVhZHNfQWtuZXRfU2VydmljZVZQTkwyLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTg6IkFrbmV0X1NlcnZpY2VWUE5MMiI7fWk6MTg7YToyOntzOjQ6ImZyb20iO3M6ODk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldnBubDJfYWNjb3VudHNfQWNjb3VudHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJBY2NvdW50cyI7fWk6MTk7YToyOntzOjQ6ImZyb20iO3M6OTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldnBubDJfYWNjb3VudHNfQWtuZXRfU2VydmljZVZQTkwyLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTg6IkFrbmV0X1NlcnZpY2VWUE5MMiI7fWk6MjA7YToyOntzOjQ6ImZyb20iO3M6ODk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldnBubDJfY29udGFjdHNfQ29udGFjdHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDb250YWN0cyI7fWk6MjE7YToyOntzOjQ6ImZyb20iO3M6OTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldnBubDJfY29udGFjdHNfQWtuZXRfU2VydmljZVZQTkwyLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTg6IkFrbmV0X1NlcnZpY2VWUE5MMiI7fWk6MjI7YToyOntzOjQ6ImZyb20iO3M6OTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldnBubDJfb3Bwb3J0dW5pdGllc19PcHBvcnR1bml0aWVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO31pOjIzO2E6Mjp7czo0OiJmcm9tIjtzOjEwNDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYXlvdXRkZWZzL2FrbmV0X3NlcnZpY2V2cG5sMl9vcHBvcnR1bml0aWVzX0FrbmV0X1NlcnZpY2VWUE5MMi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE4OiJBa25ldF9TZXJ2aWNlVlBOTDIiO319czoxMzoicmVsYXRpb25zaGlwcyI7YToxMjp7aTowO2E6MTp7czo5OiJtZXRhX2RhdGEiO3M6OTE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvcmVsYXRpb25zaGlwcy9ha25ldF9zZXJ2aWNlaW50ZXJuZXRfbGVhZHNNZXRhRGF0YS5waHAiO31pOjE7YToxOntzOjk6Im1ldGFfZGF0YSI7czo5NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL2FrbmV0X3NlcnZpY2VpbnRlcm5ldF9jb250YWN0c01ldGFEYXRhLnBocCI7fWk6MjthOjE6e3M6OToibWV0YV9kYXRhIjtzOjk5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMvYWtuZXRfc2VydmljZWludGVybmV0X29wcG9ydHVuaXRpZXNNZXRhRGF0YS5waHAiO31pOjM7YToxOntzOjk6Im1ldGFfZGF0YSI7czo5NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL2FrbmV0X3NlcnZpY2VpbnRlcm5ldF9hY2NvdW50c01ldGFEYXRhLnBocCI7fWk6NDthOjE6e3M6OToibWV0YV9kYXRhIjtzOjg1OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMvYWtuZXRfc2VydmljZXR2X2xlYWRzTWV0YURhdGEucGhwIjt9aTo1O2E6MTp7czo5OiJtZXRhX2RhdGEiO3M6ODg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvcmVsYXRpb25zaGlwcy9ha25ldF9zZXJ2aWNldHZfYWNjb3VudHNNZXRhRGF0YS5waHAiO31pOjY7YToxOntzOjk6Im1ldGFfZGF0YSI7czo4ODoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL2FrbmV0X3NlcnZpY2V0dl9jb250YWN0c01ldGFEYXRhLnBocCI7fWk6NzthOjE6e3M6OToibWV0YV9kYXRhIjtzOjkzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMvYWtuZXRfc2VydmljZXR2X29wcG9ydHVuaXRpZXNNZXRhRGF0YS5waHAiO31pOjg7YToxOntzOjk6Im1ldGFfZGF0YSI7czo4ODoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL2FrbmV0X3NlcnZpY2V2cG5sMl9sZWFkc01ldGFEYXRhLnBocCI7fWk6OTthOjE6e3M6OToibWV0YV9kYXRhIjtzOjkxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMvYWtuZXRfc2VydmljZXZwbmwyX2FjY291bnRzTWV0YURhdGEucGhwIjt9aToxMDthOjE6e3M6OToibWV0YV9kYXRhIjtzOjkxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMvYWtuZXRfc2VydmljZXZwbmwyX2NvbnRhY3RzTWV0YURhdGEucGhwIjt9aToxMTthOjE6e3M6OToibWV0YV9kYXRhIjtzOjk2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMvYWtuZXRfc2VydmljZXZwbmwyX29wcG9ydHVuaXRpZXNNZXRhRGF0YS5waHAiO319czo5OiJpbWFnZV9kaXIiO3M6MTY6IjxiYXNlcGF0aD4vaWNvbnMiO3M6NDoiY29weSI7YTo2OntpOjA7YToyOntzOjQ6ImZyb20iO3M6NTI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvQWtuZXRfSW50ZXJuZXRUYXJpZmYiO3M6MjoidG8iO3M6Mjg6Im1vZHVsZXMvQWtuZXRfSW50ZXJuZXRUYXJpZmYiO31pOjE7YToyOntzOjQ6ImZyb20iO3M6NTM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvQWtuZXRfU2VydmljZUludGVybmV0IjtzOjI6InRvIjtzOjI5OiJtb2R1bGVzL0FrbmV0X1NlcnZpY2VJbnRlcm5ldCI7fWk6MjthOjI6e3M6NDoiZnJvbSI7czo0NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9Ba25ldF9TZXJ2aWNlVFYiO3M6MjoidG8iO3M6MjM6Im1vZHVsZXMvQWtuZXRfU2VydmljZVRWIjt9aTozO2E6Mjp7czo0OiJmcm9tIjtzOjUwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL0FrbmV0X1NlcnZpY2VWUE5MMiI7czoyOiJ0byI7czoyNjoibW9kdWxlcy9Ba25ldF9TZXJ2aWNlVlBOTDIiO31pOjQ7YToyOntzOjQ6ImZyb20iO3M6NDQ6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvQWtuZXRfU3RyZWV0IjtzOjI6InRvIjtzOjIwOiJtb2R1bGVzL0FrbmV0X1N0cmVldCI7fWk6NTthOjI6e3M6NDoiZnJvbSI7czo0NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9Ba25ldF9UVlRhcmlmZiI7czoyOiJ0byI7czoyMjoibW9kdWxlcy9Ba25ldF9UVlRhcmlmZiI7fX1zOjg6Imxhbmd1YWdlIjthOjUwOntpOjA7YTozOntzOjQ6ImZyb20iO3M6NTY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvTGVhZHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJMZWFkcyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6MTthOjM6e3M6NDoiZnJvbSI7czo1NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9MZWFkcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkxlYWRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToyO2E6Mzp7czo0OiJmcm9tIjtzOjcyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FrbmV0X1NlcnZpY2VJbnRlcm5ldC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjIxOiJBa25ldF9TZXJ2aWNlSW50ZXJuZXQiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjM7YTozOntzOjQ6ImZyb20iO3M6NzI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvQWtuZXRfU2VydmljZUludGVybmV0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MjE6IkFrbmV0X1NlcnZpY2VJbnRlcm5ldCI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6NDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Db250YWN0cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkNvbnRhY3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTo1O2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0NvbnRhY3RzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjY7YTozOntzOjQ6ImZyb20iO3M6NzI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvQWtuZXRfU2VydmljZUludGVybmV0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MjE6IkFrbmV0X1NlcnZpY2VJbnRlcm5ldCI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6NzthOjM6e3M6NDoiZnJvbSI7czo3MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Ba25ldF9TZXJ2aWNlSW50ZXJuZXQucGhwIjtzOjk6InRvX21vZHVsZSI7czoyMToiQWtuZXRfU2VydmljZUludGVybmV0IjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTo4O2E6Mzp7czo0OiJmcm9tIjtzOjY0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL09wcG9ydHVuaXRpZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMzoiT3Bwb3J0dW5pdGllcyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6OTthOjM6e3M6NDoiZnJvbSI7czo2NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9PcHBvcnR1bml0aWVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjEwO2E6Mzp7czo0OiJmcm9tIjtzOjcyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FrbmV0X1NlcnZpY2VJbnRlcm5ldC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjIxOiJBa25ldF9TZXJ2aWNlSW50ZXJuZXQiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjExO2E6Mzp7czo0OiJmcm9tIjtzOjcyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FrbmV0X1NlcnZpY2VJbnRlcm5ldC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjIxOiJBa25ldF9TZXJ2aWNlSW50ZXJuZXQiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjEyO2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FjY291bnRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjEzO2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FjY291bnRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjE0O2E6Mzp7czo0OiJmcm9tIjtzOjcyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FrbmV0X1NlcnZpY2VJbnRlcm5ldC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjIxOiJBa25ldF9TZXJ2aWNlSW50ZXJuZXQiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjE1O2E6Mzp7czo0OiJmcm9tIjtzOjcyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FrbmV0X1NlcnZpY2VJbnRlcm5ldC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjIxOiJBa25ldF9TZXJ2aWNlSW50ZXJuZXQiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjE2O2E6Mzp7czo0OiJmcm9tIjtzOjU2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0xlYWRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjE3O2E6Mzp7czo0OiJmcm9tIjtzOjU2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0xlYWRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjE4O2E6Mzp7czo0OiJmcm9tIjtzOjY2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FrbmV0X1NlcnZpY2VUVi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjE5O2E6Mzp7czo0OiJmcm9tIjtzOjY2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FrbmV0X1NlcnZpY2VUVi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjIwO2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FjY291bnRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjIxO2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FjY291bnRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjIyO2E6Mzp7czo0OiJmcm9tIjtzOjY2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FrbmV0X1NlcnZpY2VUVi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjIzO2E6Mzp7czo0OiJmcm9tIjtzOjY2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FrbmV0X1NlcnZpY2VUVi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjI0O2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0NvbnRhY3RzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjI1O2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0NvbnRhY3RzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjI2O2E6Mzp7czo0OiJmcm9tIjtzOjY2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FrbmV0X1NlcnZpY2VUVi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjI3O2E6Mzp7czo0OiJmcm9tIjtzOjY2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FrbmV0X1NlcnZpY2VUVi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjI4O2E6Mzp7czo0OiJmcm9tIjtzOjY0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL09wcG9ydHVuaXRpZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMzoiT3Bwb3J0dW5pdGllcyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6Mjk7YTozOntzOjQ6ImZyb20iO3M6NjQ6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvT3Bwb3J0dW5pdGllcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTozMDthOjM6e3M6NDoiZnJvbSI7czo2NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Ba25ldF9TZXJ2aWNlVFYucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNToiQWtuZXRfU2VydmljZVRWIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTozMTthOjM6e3M6NDoiZnJvbSI7czo2NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Ba25ldF9TZXJ2aWNlVFYucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNToiQWtuZXRfU2VydmljZVRWIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTozMjthOjM6e3M6NDoiZnJvbSI7czo1NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9MZWFkcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkxlYWRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTozMzthOjM6e3M6NDoiZnJvbSI7czo1NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9MZWFkcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkxlYWRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTozNDthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Ba25ldF9TZXJ2aWNlVlBOTDIucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoiQWtuZXRfU2VydmljZVZQTkwyIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTozNTthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Ba25ldF9TZXJ2aWNlVlBOTDIucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoiQWtuZXRfU2VydmljZVZQTkwyIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTozNjthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9BY2NvdW50cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTozNzthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9BY2NvdW50cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTozODthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Ba25ldF9TZXJ2aWNlVlBOTDIucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoiQWtuZXRfU2VydmljZVZQTkwyIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTozOTthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Ba25ldF9TZXJ2aWNlVlBOTDIucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoiQWtuZXRfU2VydmljZVZQTkwyIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTo0MDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Db250YWN0cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkNvbnRhY3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTo0MTthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Db250YWN0cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkNvbnRhY3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTo0MjthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Ba25ldF9TZXJ2aWNlVlBOTDIucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoiQWtuZXRfU2VydmljZVZQTkwyIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTo0MzthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Ba25ldF9TZXJ2aWNlVlBOTDIucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoiQWtuZXRfU2VydmljZVZQTkwyIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTo0NDthOjM6e3M6NDoiZnJvbSI7czo2NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9PcHBvcnR1bml0aWVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjQ1O2E6Mzp7czo0OiJmcm9tIjtzOjY0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL09wcG9ydHVuaXRpZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMzoiT3Bwb3J0dW5pdGllcyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6NDY7YTozOntzOjQ6ImZyb20iO3M6Njk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvQWtuZXRfU2VydmljZVZQTkwyLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTg6IkFrbmV0X1NlcnZpY2VWUE5MMiI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6NDc7YTozOntzOjQ6ImZyb20iO3M6Njk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvQWtuZXRfU2VydmljZVZQTkwyLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTg6IkFrbmV0X1NlcnZpY2VWUE5MMiI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6NDg7YTozOntzOjQ6ImZyb20iO3M6NTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL2FwcGxpY2F0aW9uL3J1X3J1LmxhbmcucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMToiYXBwbGljYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjQ5O2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9hcHBsaWNhdGlvbi9lbl91cy5sYW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTE6ImFwcGxpY2F0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9fXM6NzoidmFyZGVmcyI7YToyNDp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjgzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZWludGVybmV0X2xlYWRzX0xlYWRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO31pOjE7YToyOntzOjQ6ImZyb20iO3M6OTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy9ha25ldF9zZXJ2aWNlaW50ZXJuZXRfbGVhZHNfQWtuZXRfU2VydmljZUludGVybmV0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MjE6IkFrbmV0X1NlcnZpY2VJbnRlcm5ldCI7fWk6MjthOjI6e3M6NDoiZnJvbSI7czo4OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL2FrbmV0X3NlcnZpY2VpbnRlcm5ldF9jb250YWN0c19Db250YWN0cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkNvbnRhY3RzIjt9aTozO2E6Mjp7czo0OiJmcm9tIjtzOjEwMjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL2FrbmV0X3NlcnZpY2VpbnRlcm5ldF9jb250YWN0c19Ba25ldF9TZXJ2aWNlSW50ZXJuZXQucGhwIjtzOjk6InRvX21vZHVsZSI7czoyMToiQWtuZXRfU2VydmljZUludGVybmV0Ijt9aTo0O2E6Mjp7czo0OiJmcm9tIjtzOjk5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZWludGVybmV0X29wcG9ydHVuaXRpZXNfT3Bwb3J0dW5pdGllcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjt9aTo1O2E6Mjp7czo0OiJmcm9tIjtzOjEwNzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL2FrbmV0X3NlcnZpY2VpbnRlcm5ldF9vcHBvcnR1bml0aWVzX0FrbmV0X1NlcnZpY2VJbnRlcm5ldC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjIxOiJBa25ldF9TZXJ2aWNlSW50ZXJuZXQiO31pOjY7YToyOntzOjQ6ImZyb20iO3M6ODk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy9ha25ldF9zZXJ2aWNlaW50ZXJuZXRfYWNjb3VudHNfQWNjb3VudHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJBY2NvdW50cyI7fWk6NzthOjI6e3M6NDoiZnJvbSI7czoxMDI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy9ha25ldF9zZXJ2aWNlaW50ZXJuZXRfYWNjb3VudHNfQWtuZXRfU2VydmljZUludGVybmV0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MjE6IkFrbmV0X1NlcnZpY2VJbnRlcm5ldCI7fWk6ODthOjI6e3M6NDoiZnJvbSI7czo3NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL2FrbmV0X3NlcnZpY2V0dl9sZWFkc19MZWFkcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkxlYWRzIjt9aTo5O2E6Mjp7czo0OiJmcm9tIjtzOjg3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXR2X2xlYWRzX0FrbmV0X1NlcnZpY2VUVi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO31pOjEwO2E6Mjp7czo0OiJmcm9tIjtzOjgzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXR2X2FjY291bnRzX0FjY291bnRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO31pOjExO2E6Mjp7czo0OiJmcm9tIjtzOjkwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXR2X2FjY291bnRzX0FrbmV0X1NlcnZpY2VUVi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO31pOjEyO2E6Mjp7czo0OiJmcm9tIjtzOjgzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXR2X2NvbnRhY3RzX0NvbnRhY3RzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO31pOjEzO2E6Mjp7czo0OiJmcm9tIjtzOjkwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXR2X2NvbnRhY3RzX0FrbmV0X1NlcnZpY2VUVi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO31pOjE0O2E6Mjp7czo0OiJmcm9tIjtzOjkzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXR2X29wcG9ydHVuaXRpZXNfT3Bwb3J0dW5pdGllcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjt9aToxNTthOjI6e3M6NDoiZnJvbSI7czo5NToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL2FrbmV0X3NlcnZpY2V0dl9vcHBvcnR1bml0aWVzX0FrbmV0X1NlcnZpY2VUVi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO31pOjE2O2E6Mjp7czo0OiJmcm9tIjtzOjgwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXZwbmwyX2xlYWRzX0xlYWRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO31pOjE3O2E6Mjp7czo0OiJmcm9tIjtzOjkzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXZwbmwyX2xlYWRzX0FrbmV0X1NlcnZpY2VWUE5MMi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE4OiJBa25ldF9TZXJ2aWNlVlBOTDIiO31pOjE4O2E6Mjp7czo0OiJmcm9tIjtzOjg2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXZwbmwyX2FjY291bnRzX0FjY291bnRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO31pOjE5O2E6Mjp7czo0OiJmcm9tIjtzOjk2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXZwbmwyX2FjY291bnRzX0FrbmV0X1NlcnZpY2VWUE5MMi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE4OiJBa25ldF9TZXJ2aWNlVlBOTDIiO31pOjIwO2E6Mjp7czo0OiJmcm9tIjtzOjg2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXZwbmwyX2NvbnRhY3RzX0NvbnRhY3RzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO31pOjIxO2E6Mjp7czo0OiJmcm9tIjtzOjk2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXZwbmwyX2NvbnRhY3RzX0FrbmV0X1NlcnZpY2VWUE5MMi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE4OiJBa25ldF9TZXJ2aWNlVlBOTDIiO31pOjIyO2E6Mjp7czo0OiJmcm9tIjtzOjk2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXZwbmwyX29wcG9ydHVuaXRpZXNfT3Bwb3J0dW5pdGllcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjt9aToyMzthOjI6e3M6NDoiZnJvbSI7czoxMDE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy9ha25ldF9zZXJ2aWNldnBubDJfb3Bwb3J0dW5pdGllc19Ba25ldF9TZXJ2aWNlVlBOTDIucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoiQWtuZXRfU2VydmljZVZQTkwyIjt9fX1zOjE2OiJ1cGdyYWRlX21hbmlmZXN0IjtzOjA6IiI7fQ==', '2012-11-26 11:14:19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` char(36) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `user_hash` varchar(255) DEFAULT NULL,
  `system_generated_password` tinyint(1) DEFAULT NULL,
  `pwd_last_changed` datetime DEFAULT NULL,
  `authenticate_id` varchar(100) DEFAULT NULL,
  `sugar_login` tinyint(1) DEFAULT '1',
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `external_auth_only` tinyint(1) DEFAULT '0',
  `receive_notifications` tinyint(1) DEFAULT '1',
  `description` text,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone_home` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `phone_other` varchar(50) DEFAULT NULL,
  `phone_fax` varchar(50) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `address_street` varchar(150) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `portal_only` tinyint(1) DEFAULT '0',
  `show_on_employees` tinyint(1) DEFAULT '1',
  `employee_status` varchar(100) DEFAULT NULL,
  `messenger_id` varchar(100) DEFAULT NULL,
  `messenger_type` varchar(100) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_name` (`user_name`,`is_group`,`status`,`last_name`,`first_name`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_hash`, `system_generated_password`, `pwd_last_changed`, `authenticate_id`, `sugar_login`, `first_name`, `last_name`, `is_admin`, `external_auth_only`, `receive_notifications`, `description`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `title`, `department`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `status`, `address_street`, `address_city`, `address_state`, `address_country`, `address_postalcode`, `deleted`, `portal_only`, `show_on_employees`, `employee_status`, `messenger_id`, `messenger_type`, `reports_to_id`, `is_group`) VALUES
('1', 'admin', '$6$nqkKXElu$3Ho.mU387gZNTgegj5HceJYnUxRIhNX8MhGFq6AGMTJ63EQoPX6I.46wP7xTYq1VvvXLW3VFjGFb6StDWtZcS1', 0, NULL, NULL, 1, NULL, 'Administrator', 1, 0, 1, NULL, '2012-11-26 11:12:16', '2012-11-26 11:13:46', '1', '', 'Administrator', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'Active', NULL, NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_feeds`
--

CREATE TABLE IF NOT EXISTS `users_feeds` (
  `user_id` varchar(36) DEFAULT NULL,
  `feed_id` varchar(36) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_ud_user_id` (`user_id`,`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_last_import`
--

CREATE TABLE IF NOT EXISTS `users_last_import` (
  `id` char(36) NOT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `import_module` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_password_link`
--

CREATE TABLE IF NOT EXISTS `users_password_link` (
  `id` char(36) NOT NULL,
  `username` varchar(36) DEFAULT NULL,
  `date_generated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_signatures`
--

CREATE TABLE IF NOT EXISTS `users_signatures` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `signature` text,
  `signature_html` text,
  PRIMARY KEY (`id`),
  KEY `idx_usersig_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE IF NOT EXISTS `user_preferences` (
  `id` char(36) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_userprefnamecat` (`assigned_user_id`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `category`, `deleted`, `date_entered`, `date_modified`, `assigned_user_id`, `contents`) VALUES
('1a1a90f6-5e19-af0c-4f0a-50b42c11b1b9', 'Notes2_NOTE', 0, '2012-11-27 02:59:02', '2012-11-27 02:59:02', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('3d64f83b-7b10-00d0-ed5c-50b42cab019f', 'Documents2_DOCUMENT', 0, '2012-11-27 02:59:28', '2012-11-27 02:59:28', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('42199e08-7138-623c-09d4-50b34ec99266', 'Home', 0, '2012-11-26 11:13:47', '2012-11-26 11:13:47', '1', 'YToyOntzOjg6ImRhc2hsZXRzIjthOjg6e3M6MzY6IjMyYmM4MTNhLTFjNDEtNWI3NC0wZWNmLTUwYjM0ZWMyZTc0OCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxMzoiaUZyYW1lRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NDoiSG9tZSI7czoxMToiZm9yY2VDb2x1bW4iO2k6MDtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NTM6Im1vZHVsZXMvSG9tZS9EYXNobGV0cy9pRnJhbWVEYXNobGV0L2lGcmFtZURhc2hsZXQucGhwIjtzOjc6Im9wdGlvbnMiO2E6Mzp7czoxMDoidGl0bGVMYWJlbCI7czozMDoiTEJMX0RBU0hMRVRfRElTQ09WRVJfU1VHQVJfUFJPIjtzOjM6InVybCI7czo0MToiaHR0cDovL3d3dy5zdWdhcmNybS5jb20vY3JtL3Byb2R1Y3QvZ29wcm8iO3M6NjoiaGVpZ2h0IjtpOjMxNTt9fXM6MzY6IjMyYmU0ODkxLTdkOTgtMTAyOC04MmI3LTUwYjM0ZTkyNTZhZCI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6IjMyYmYzOWVmLWFjMmItODZjNS03YTBiLTUwYjM0ZWNiZDEzNCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxMzoiaUZyYW1lRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NDoiSG9tZSI7czoxMToiZm9yY2VDb2x1bW4iO2k6MTtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NTM6Im1vZHVsZXMvSG9tZS9EYXNobGV0cy9pRnJhbWVEYXNobGV0L2lGcmFtZURhc2hsZXQucGhwIjtzOjc6Im9wdGlvbnMiO2E6Mzp7czoxMDoidGl0bGVMYWJlbCI7czoyMjoiTEJMX0RBU0hMRVRfU1VHQVJfTkVXUyI7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly93d3cuc3VnYXJjcm0uY29tL2NybS9wcm9kdWN0L25ld3MiO3M6NjoiaGVpZ2h0IjtpOjMxNTt9fXM6MzY6IjMzODJiYTc0LWM3MjAtZTQwNy1kODQ5LTUwYjM0ZTEwYWU1MSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjM0NWFlOTZmLTg2MDItYzg1Ny04N2E0LTUwYjM0ZTVhZDg1MCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjM1MTI2MWQyLWYyZGEtNTNiYi1jYmM0LTUwYjM0ZTFiYzNiYyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiMzYxMDk4ZmQtZTA1Yy0yZWZiLWZhNmUtNTBiMzRlZjBiODM3IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiMzczY2JjN2ItYmM4ZC0xOGIyLWNjNTAtNTBiMzRlNTIxZGY4IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjY6e2k6MDtzOjM2OiIzMmJjODEzYS0xYzQxLTViNzQtMGVjZi01MGIzNGVjMmU3NDgiO2k6MTtzOjM2OiIzMzgyYmE3NC1jNzIwLWU0MDctZDg0OS01MGIzNGUxMGFlNTEiO2k6MjtzOjM2OiIzNDVhZTk2Zi04NjAyLWM4NTctODdhNC01MGIzNGU1YWQ4NTAiO2k6MztzOjM2OiIzNTEyNjFkMi1mMmRhLTUzYmItY2JjNC01MGIzNGUxYmMzYmMiO2k6NDtzOjM2OiIzNjEwOThmZC1lMDVjLTJlZmItZmE2ZS01MGIzNGVmMGI4MzciO2k6NTtzOjM2OiIzNzNjYmM3Yi1iYzhkLTE4YjItY2M1MC01MGIzNGU1MjFkZjgiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6Mjp7aTowO3M6MzY6IjMyYmU0ODkxLTdkOTgtMTAyOC04MmI3LTUwYjM0ZTkyNTZhZCI7aToxO3M6MzY6IjMyYmYzOWVmLWFjMmItODZjNS03YTBiLTUwYjM0ZWNiZDEzNCI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIyIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),
('5870b43e-69ca-b9a5-4fae-50b42cf2bb78', 'Meetings2_MEETING', 0, '2012-11-27 02:58:43', '2012-11-27 02:58:43', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('6c8c805a-ef5e-16c2-5db7-50b42e7dd160', 'search', 0, '2012-11-27 03:08:51', '2012-11-27 03:08:51', '1', 'YToxOntzOjEyOiJnbG9iYWxTZWFyY2giO2E6OTp7czo4OiJBY2NvdW50cyI7czo3OiJBY2NvdW50IjtzOjU6IkNhbGxzIjtzOjQ6IkNhbGwiO3M6NToiQ2FzZXMiO3M6NToiYUNhc2UiO3M6ODoiQ29udGFjdHMiO3M6NzoiQ29udGFjdCI7czo5OiJEb2N1bWVudHMiO3M6ODoiRG9jdW1lbnQiO3M6NToiTGVhZHMiO3M6NDoiTGVhZCI7czo4OiJNZWV0aW5ncyI7czo3OiJNZWV0aW5nIjtzOjU6Ik5vdGVzIjtzOjQ6Ik5vdGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6Ik9wcG9ydHVuaXR5Ijt9fQ=='),
('734eae45-66e7-95e0-8bb4-50b42ec8dc3e', 'Home2_CASE', 0, '2012-11-27 03:08:51', '2012-11-27 03:08:51', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('796a1c61-4453-22d6-5970-50b42e155906', 'Home2_CONTACT', 0, '2012-11-27 03:08:51', '2012-11-27 03:08:51', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('7f8342ac-8e98-070f-54fb-50b42eeeff0e', 'Home2_DOCUMENT', 0, '2012-11-27 03:08:51', '2012-11-27 03:08:51', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('85b81119-bf9e-9232-cd97-50b42e08505b', 'Home2_NOTE', 0, '2012-11-27 03:08:51', '2012-11-27 03:08:51', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('8d8ce7ae-696e-c7ed-2322-50b42c1e3bb8', 'Opportunities2_OPPORTUNITY', 0, '2012-11-27 03:00:08', '2012-11-27 03:00:08', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('901fec63-fc15-cbdf-ceed-50b34ebb346f', 'Home2_CALL', 0, '2012-11-26 11:13:47', '2012-11-26 11:13:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('916e63fa-dbb8-7c04-7769-50b42ca6f095', 'Calls2_CALL', 0, '2012-11-27 02:58:48', '2012-11-27 02:58:48', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('974f1040-7654-df20-26a9-50b34e096904', 'Home2_MEETING', 0, '2012-11-26 11:13:47', '2012-11-26 11:13:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('9f752299-b9d4-5d40-d5f9-50b34efdf790', 'Home2_OPPORTUNITY', 0, '2012-11-26 11:13:47', '2012-11-26 11:13:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('a4d935ff-4f87-5ba1-d6a1-50b34e65282d', 'ETag', 0, '2012-11-26 11:13:46', '2012-11-26 11:14:19', '1', 'YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6Mjt9'),
('a798f756-aea5-3127-bf0d-50b34e8b0d8f', 'Home2_ACCOUNT', 0, '2012-11-26 11:13:47', '2012-11-26 11:13:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('aba4e4e5-a02c-cdc4-b402-50b34efb6ac8', 'Leads2_LEAD', 0, '2012-11-26 11:13:51', '2012-11-26 11:13:51', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('afc55f1d-92d2-3a82-ed20-50b34eb8b142', 'Home2_LEAD', 0, '2012-11-26 11:13:47', '2012-11-26 11:13:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('b49ea41d-6fe5-be65-49d4-50b34ee6542b', 'global', 0, '2012-11-26 11:13:19', '2012-11-27 03:08:51', '1', 'YToyNzp7czoxMDoidXNlcl90aGVtZSI7czo1OiJBa25ldCI7czoxMzoicmVtaW5kZXJfdGltZSI7aToxODAwO3M6MTI6Im1haWxtZXJnZV9vbiI7czoyOiJvbiI7czo4OiJ0aW1lem9uZSI7czoxMjoiQXNpYS9CaXNoa2VrIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjEzOiJzdWJwYW5lbF90YWJzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTk6ImVtYWlsX3JlbWluZGVyX3RpbWUiO2k6LTE7czoyOiJ1dCI7czoxOiIxIjtzOjg6ImN1cnJlbmN5IjtzOjM6Ii05OSI7czozNToiZGVmYXVsdF9jdXJyZW5jeV9zaWduaWZpY2FudF9kaWdpdHMiO3M6MToiMiI7czoxMToibnVtX2dycF9zZXAiO3M6MToiLCI7czo3OiJkZWNfc2VwIjtzOjE6Ii4iO3M6NToiZGF0ZWYiO3M6NToibS9kL1kiO3M6NToidGltZWYiO3M6NDoiaDppYSI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6MzoiZiBsIjtzOjE0OiJ1c2VfcmVhbF9uYW1lcyI7czoyOiJvbiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MDoiIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MDtzOjE3OiJlbWFpbF9zaG93X2NvdW50cyI7aTowO3M6MTk6InRoZW1lX2N1cnJlbnRfZ3JvdXAiO3M6MzoiQWxsIjtzOjEyOiJnbG9iYWxTZWFyY2giO2E6OTp7czo4OiJBY2NvdW50cyI7czo3OiJBY2NvdW50IjtzOjU6IkNhbGxzIjtzOjQ6IkNhbGwiO3M6NToiQ2FzZXMiO3M6NToiYUNhc2UiO3M6ODoiQ29udGFjdHMiO3M6NzoiQ29udGFjdCI7czo5OiJEb2N1bWVudHMiO3M6ODoiRG9jdW1lbnQiO3M6NToiTGVhZHMiO3M6NDoiTGVhZCI7czo4OiJNZWV0aW5ncyI7czo3OiJNZWV0aW5nIjtzOjU6Ik5vdGVzIjtzOjQ6Ik5vdGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6Ik9wcG9ydHVuaXR5Ijt9fQ=='),
('b80615b5-2d63-8d9a-e79a-50b34e3971d3', 'Home2_SUGARFEED', 0, '2012-11-26 11:13:47', '2012-11-26 11:13:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('c2f05c38-3839-e8c2-544b-50b42c7008ef', 'Tasks2_TASK', 0, '2012-11-27 02:58:52', '2012-11-27 02:58:52', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');

-- --------------------------------------------------------

--
-- Table structure for table `vcals`
--

CREATE TABLE IF NOT EXISTS `vcals` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `idx_vcal` (`type`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE IF NOT EXISTS `versions` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_version` varchar(255) DEFAULT NULL,
  `db_version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_version` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `versions`
--

INSERT INTO `versions` (`id`, `deleted`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `file_version`, `db_version`) VALUES
('29007995-30db-d63a-b1e8-50b34ec9b5fc', 0, '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '1', 'Chart Data Cache', '3.5.1', '3.5.1'),
('31a82f3d-72fc-e861-ef1e-50b34ea46587', 0, '2012-11-26 11:12:16', '2012-11-26 11:12:16', '1', '1', 'htaccess', '3.5.1', '3.5.1'),
('5b635dd6-bc78-b668-1fa9-50b34fa1af43', 0, '2012-11-26 11:15:45', '2012-11-26 11:15:45', '1', '1', 'Rebuild Relationships', '4.0.0', '4.0.0'),
('6fbd9984-c5ef-dd43-8c74-50b34f6edc45', 0, '2012-11-26 11:15:45', '2012-11-26 11:15:45', '1', '1', 'Rebuild Extensions', '4.0.0', '4.0.0');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
