-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 03, 2012 at 12:03 PM
-- Server version: 5.5.22
-- PHP Version: 5.3.10-1ubuntu3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sugarcrm_1`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `account_type`, `industry`, `annual_revenue`, `phone_fax`, `billing_address_street`, `billing_address_city`, `billing_address_state`, `billing_address_postalcode`, `billing_address_country`, `rating`, `phone_office`, `phone_alternate`, `website`, `ownership`, `employees`, `ticker_symbol`, `shipping_address_street`, `shipping_address_city`, `shipping_address_state`, `shipping_address_postalcode`, `shipping_address_country`, `parent_id`, `sic_code`, `campaign_id`) VALUES
('ea808b06-86cd-46e4-276b-507bd910620c', 'ОсОО "Акнет"', '2012-10-15 09:37:33', '2012-10-18 04:54:47', '1', '1', '', 1, '1', NULL, NULL, NULL, '', '', '', '', '', '', NULL, '', NULL, '', NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, ''),
('4336375c-e1a2-1fd2-b3d3-50a479df66a3', 'Aknet ISP', '2012-11-15 05:13:06', '2012-11-15 05:13:06', '1', '1', '', 0, '1', NULL, NULL, NULL, '', '', '', '', '', '', NULL, '', NULL, 'http://', NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, '');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts_contacts`
--

INSERT INTO `accounts_contacts` (`id`, `contact_id`, `account_id`, `date_modified`, `deleted`) VALUES
('ecd5c177-3932-78db-106a-507bd9bb87c3', 'b83b2268-2611-fc55-39b2-507bd92bca49', 'ea808b06-86cd-46e4-276b-507bd910620c', '2012-10-18 04:54:47', 1),
('964e2ec3-1c50-ee16-ef2a-507bdd43148d', '14778e91-0f44-8a10-f913-507bddd97f57', 'ea808b06-86cd-46e4-276b-507bd910620c', '2012-10-18 04:54:47', 1),
('434b3f8b-6be1-7723-f099-50a4794d0779', '36de02a6-3097-7240-9037-50a479768785', '4336375c-e1a2-1fd2-b3d3-50a479df66a3', '2012-11-15 05:13:06', 0);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_cstm`
--

CREATE TABLE IF NOT EXISTS `accounts_cstm` (
  `id_c` char(36) NOT NULL,
  `address_country_c` varchar(100) DEFAULT 'KYRGYZSTAN',
  `address_state_c` varchar(100) DEFAULT 'chui',
  `address_city_c` varchar(100) DEFAULT 'bishkek',
  `address_building_c` varchar(255) DEFAULT NULL,
  `address_appartment_c` varchar(255) DEFAULT NULL,
  `address_postcode_c` varchar(255) DEFAULT NULL,
  `email_c` varchar(255) DEFAULT NULL,
  `phone_alternate1_c` varchar(255) DEFAULT NULL,
  `phone_alternate2_c` varchar(255) DEFAULT NULL,
  `okpo_c` varchar(255) DEFAULT NULL,
  `rgni_c` varchar(100) DEFAULT '999',
  `bank_c` varchar(100) DEFAULT '112001',
  `bank_account_c` varchar(255) DEFAULT NULL,
  `inn_c` varchar(255) DEFAULT NULL,
  `business_name_c` text,
  `business_address_c` text,
  `contact_id_c` char(36) DEFAULT NULL,
  `accounting_description_c` text,
  `address_street_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts_cstm`
--

INSERT INTO `accounts_cstm` (`id_c`, `address_country_c`, `address_state_c`, `address_city_c`, `address_building_c`, `address_appartment_c`, `address_postcode_c`, `email_c`, `phone_alternate1_c`, `phone_alternate2_c`, `okpo_c`, `rgni_c`, `bank_c`, `bank_account_c`, `inn_c`, `business_name_c`, `business_address_c`, `contact_id_c`, `accounting_description_c`, `address_street_c`) VALUES
('ea808b06-86cd-46e4-276b-507bd910620c', 'KYRGYZSTAN', 'chui', 'bishkek', '86', '40', '720083', 'temonix@gmail.com', NULL, '', '', '999', '112001', '', '', '', '', NULL, '', NULL),
('4336375c-e1a2-1fd2-b3d3-50a479df66a3', 'KYRGYZSTAN', 'chui', 'bishkek', '10', '5', '', '', NULL, '', '', '999', '112001', '', '', '', '', NULL, '', '8975bdc6-552d-1030-9562-001022fda270');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts_opportunities`
--

INSERT INTO `accounts_opportunities` (`id`, `opportunity_id`, `account_id`, `date_modified`, `deleted`) VALUES
('68180875-f589-70ac-c3ec-507bd99daef6', '10d829c5-e8dd-5f0e-aa11-507bd929ef20', 'ea808b06-86cd-46e4-276b-507bd910620c', '2012-10-18 04:54:47', 1),
('a5e3da43-2048-c8d6-c35e-507bdd456243', '577cfbf4-2952-6982-18fc-507bddc97d52', 'ea808b06-86cd-46e4-276b-507bd910620c', '2012-10-18 04:54:47', 1),
('55b8a35d-fcbf-d572-5de7-50a4794d3c4b', '479fd117-795a-3835-a566-50a479d995a5', '4336375c-e1a2-1fd2-b3d3-50a479df66a3', '2012-11-15 05:13:06', 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acl_actions`
--

INSERT INTO `acl_actions` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `category`, `acltype`, `aclaccess`, `deleted`) VALUES
('85eb14c1-c6e3-5e09-a775-50724d60890d', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'Leads', 'module', 89, 0),
('88f8b82f-2531-f32b-0783-50724d010401', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'Leads', 'module', 90, 0),
('8bfa1822-4c14-c1a3-0888-50724ddfe63b', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'Leads', 'module', 90, 0),
('8ef9cee3-2208-9349-877f-50724ddb80c3', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'Leads', 'module', 90, 0),
('91f5349c-2177-0a5c-78e8-50724d8496bb', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'Leads', 'module', 90, 0),
('94f1b06c-6a01-07be-755c-50724d9944df', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'Leads', 'module', 90, 0),
('97e93570-2772-c240-7208-50724debcf6b', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'Leads', 'module', 90, 0),
('9af3ebb0-fa07-f0b7-bc89-50724de96d36', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'Leads', 'module', 90, 0),
('d4f533f9-956c-cbfb-4c09-50724d20c519', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'Cases', 'module', 89, 0),
('d7fbaf45-97db-3af1-34de-50724d96fb60', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'Cases', 'module', 90, 0),
('dafbd8b8-3206-2661-e360-50724dde9131', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'Cases', 'module', 90, 0),
('ddfc1655-fb52-bdd2-f55c-50724d8cd8fc', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'Cases', 'module', 90, 0),
('e0f9d9ac-2f27-7f1b-dbc8-50724d93b7b6', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'Cases', 'module', 90, 0),
('e405aadb-7ff4-94c8-e329-50724d6252d9', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'Cases', 'module', 90, 0),
('e7071989-63c5-9a21-e936-50724d8c5cb0', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'Cases', 'module', 90, 0),
('ea0a1522-7602-9b21-47f4-50724daf3bdb', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'Cases', 'module', 90, 0),
('202c5f0d-faa5-db13-7844-50724d61438a', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'Bugs', 'module', 89, 0),
('23378a6b-6fce-9a57-e7c8-50724d8a67fd', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'Bugs', 'module', 90, 0),
('263c13b7-f49f-0203-7a9d-50724d36e1ba', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'Bugs', 'module', 90, 0),
('2941a5aa-9b54-8d23-1446-50724df75bce', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'Bugs', 'module', 90, 0),
('2c4c3bcc-5b43-7c5f-4efd-50724db468dc', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'Bugs', 'module', 90, 0),
('2f5c4b8c-37b7-c5fb-1af5-50724d6212a1', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'Bugs', 'module', 90, 0),
('325e4f86-2e38-b2eb-ab12-50724de5adba', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'Bugs', 'module', 90, 0),
('356356d3-c134-7d17-40d3-50724d14ed28', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'Bugs', 'module', 90, 0),
('62bc5ede-4045-b522-46b9-50724dd416b2', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'Users', 'module', 89, 0),
('65d66630-326a-eba4-0cdb-50724d41be5f', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'Users', 'module', 90, 0),
('68db6cbb-d5a2-75b8-5451-50724d1d5102', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'Users', 'module', 90, 0),
('6be6fca8-22c4-3323-3aeb-50724db24bb2', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'Users', 'module', 90, 0),
('6eea92ed-ffb1-cf66-d184-50724d474935', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'Users', 'module', 90, 0),
('71f53ed2-a6d0-0eb3-5192-50724d1b170b', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'Users', 'module', 90, 0),
('7501245f-a9ca-ab93-259f-50724d13ee0b', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'Users', 'module', 90, 0),
('78107dea-e0c2-0ab4-1cec-50724d3a9b76', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'Users', 'module', 90, 0),
('a5501357-9745-87da-3f0b-50724d83ba78', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'Project', 'module', 89, 0),
('a8667a39-099c-93a3-0e7d-50724d2ce30d', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'Project', 'module', 90, 0),
('ab6ec5f8-1763-7e3f-2db9-50724d43ba8f', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'Project', 'module', 90, 0),
('ae787466-a1f3-4817-9a36-50724ddff1a6', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'Project', 'module', 90, 0),
('b17edc4d-f54e-b8b4-d614-50724d0b8b7b', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'Project', 'module', 90, 0),
('b48dea51-c4a3-7b46-2e44-50724dbde480', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'Project', 'module', 90, 0),
('b794fb87-caf3-ea14-b14d-50724d147b6f', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'Project', 'module', 90, 0),
('ba9fd771-b822-70cd-dce7-50724da2b1f9', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'Project', 'module', 90, 0),
('e1bdc9f3-3fd2-2c2c-2f48-50724d3d1160', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'ProjectTask', 'module', 89, 0),
('e4db0b3c-ab1e-4f49-51e4-50724d84eea1', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'ProjectTask', 'module', 90, 0),
('e7ee3aff-0668-e795-b572-50724db4f39e', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'ProjectTask', 'module', 90, 0),
('eafad5db-1815-a2af-294b-50724d8d0068', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'ProjectTask', 'module', 90, 0),
('ee13f1f9-3f87-62cc-fc04-50724dd311c5', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'ProjectTask', 'module', 90, 0),
('f11e48b9-bbaa-05cd-e3e1-50724df4a8a3', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'ProjectTask', 'module', 90, 0),
('a1000a82-381e-de6c-0936-50724d902d57', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'ProjectTask', 'module', 90, 0),
('31b30ebe-cc7d-0e72-ec17-50724dea8350', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'ProjectTask', 'module', 90, 0),
('3666a575-011a-08d7-1674-50724d7ab813', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'Campaigns', 'module', 89, 0),
('397ffaa8-826a-5adf-7296-50724d49e8b0', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'Campaigns', 'module', 90, 0),
('3c915523-206e-0ce9-59f8-50724da13040', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'Campaigns', 'module', 90, 0),
('400a08c0-5087-8d2c-91ee-50724d30f92e', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'Campaigns', 'module', 90, 0),
('431f098a-4412-efa9-a5bb-50724d0f1db0', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'Campaigns', 'module', 90, 0),
('462ce0d9-e7e6-afac-e205-50724dd1bb0a', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'Campaigns', 'module', 90, 0),
('494099d6-cbe3-ae2c-f072-50724d29380d', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'Campaigns', 'module', 90, 0),
('4c47a791-a9a4-c7fe-0542-50724d1705f2', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'Campaigns', 'module', 90, 0),
('75444568-efa7-9136-ba7c-50724d1bff4b', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'ProspectLists', 'module', 89, 0),
('78d32e78-03b2-80fd-dffd-50724da6e5b4', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'ProspectLists', 'module', 90, 0),
('7be810b9-3f8b-e813-d07d-50724d78bcd1', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'ProspectLists', 'module', 90, 0),
('7ef65f54-6c53-b68e-d2f4-50724da55e74', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'ProspectLists', 'module', 90, 0),
('8223435f-88c9-f546-9aea-50724d5184c4', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'ProspectLists', 'module', 90, 0),
('853093fd-cddf-ada3-e99f-50724dacd2ea', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'ProspectLists', 'module', 90, 0),
('884b0911-8868-0524-8389-50724dd2f53b', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'ProspectLists', 'module', 90, 0),
('8b625efc-9f6b-2357-6bbf-50724d2af5cc', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'ProspectLists', 'module', 90, 0),
('acc7500c-7d9f-17b3-7142-50724d609e1c', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'Prospects', 'module', 89, 0),
('aff295e1-eae7-5bce-828a-50724dbc627c', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'Prospects', 'module', 90, 0),
('b307d13b-9b71-40d4-6047-50724da33989', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'Prospects', 'module', 90, 0),
('b61aaddc-e5d8-467c-e9a5-50724df1c08c', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'Prospects', 'module', 90, 0),
('b938b370-8b2f-5e94-706f-50724d9dbd30', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'Prospects', 'module', 90, 0),
('bc54b9a4-fba7-3849-cccc-50724d8bb79a', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'Prospects', 'module', 90, 0),
('bf7203f5-8fec-366f-ef84-50724da5efd1', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'Prospects', 'module', 90, 0),
('c28b5291-797d-6c34-74d4-50724dd529ff', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'Prospects', 'module', 90, 0),
('e47a9f64-c03c-e119-bd85-50724dadee24', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'EmailMarketing', 'module', 89, 0),
('e7947e5b-2e6c-1aa7-1c34-50724d8df027', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'EmailMarketing', 'module', 90, 0),
('eaae1b5b-daf6-fef3-1f77-50724d50d9e7', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'EmailMarketing', 'module', 90, 0),
('edbdd2da-096a-87c8-8679-50724d99d4f0', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'EmailMarketing', 'module', 90, 0),
('f0d71870-8a89-d0bb-fff2-50724d3fde4d', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'EmailMarketing', 'module', 90, 0),
('f3e93ffc-8be8-3a53-b1c0-50724d2333c3', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'EmailMarketing', 'module', 90, 0),
('2ee20350-e213-15ce-33f8-50724df6fb94', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'EmailMarketing', 'module', 90, 0),
('67900f3f-beaf-eb40-3d50-50724d06a6a9', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'EmailMarketing', 'module', 90, 0),
('7eb879a4-d774-0245-0116-50724dbc63f0', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'Contacts', 'module', 89, 0),
('81d8c828-176d-fc17-ae06-50724d45c048', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'Contacts', 'module', 90, 0),
('84e5924b-f9e8-eca2-74e8-50724da2aea2', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'Contacts', 'module', 90, 0),
('886ab233-6a4d-8d7b-4c67-50724dabacca', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'Contacts', 'module', 90, 0),
('8b87a4f9-d298-a46b-4848-50724d0d805f', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'Contacts', 'module', 90, 0),
('8ea152aa-e0f0-fdc4-37c5-50724db3b11b', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'Contacts', 'module', 90, 0),
('91b516f5-21ec-a91e-0eeb-50724d75e27c', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'Contacts', 'module', 90, 0),
('94cdb097-8e0e-e3c3-7eba-50724d3cf71c', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'Contacts', 'module', 90, 0),
('cfc2ab03-b144-7142-254e-50724d2e97c3', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'Accounts', 'module', 89, 0),
('d2df1c14-8190-a348-007f-50724da57324', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'Accounts', 'module', 90, 0),
('d5f6e72b-4542-ba27-ed6b-50724d3371f1', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'Accounts', 'module', 90, 0),
('d90895e2-91e4-53a9-5a1a-50724d8c7fd2', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'Accounts', 'module', 90, 0),
('dc1ddc2b-594e-3d09-b64c-50724dfe81e0', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'Accounts', 'module', 90, 0),
('df30b0fe-9066-31f8-9a1d-50724dcf92d9', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'Accounts', 'module', 90, 0),
('e24afbd9-0a54-70a0-8c13-50724d4ea572', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'Accounts', 'module', 90, 0),
('e55cceb0-2a88-b531-7006-50724d7eb3d6', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'Accounts', 'module', 90, 0),
('21d3f803-afaa-ae58-686c-50724dd76404', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'Opportunities', 'module', 89, 0),
('24f38e91-d128-d4a3-9f6f-50724d7b5b85', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'Opportunities', 'module', 90, 0),
('280c78d6-7cac-d724-5dda-50724d8754d9', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'Opportunities', 'module', 90, 0),
('2b2def28-e5bb-e72f-3899-50724d650162', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'Opportunities', 'module', 90, 0),
('2e4b096e-be98-9c89-3885-50724d71e0d5', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'Opportunities', 'module', 90, 0),
('31683f47-de4b-d2a8-2378-50724d5b3069', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'Opportunities', 'module', 90, 0),
('34828b21-f1d1-e8cc-66f8-50724d1d3fd8', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'Opportunities', 'module', 90, 0),
('37a4b2b3-0461-46c2-701d-50724d505b34', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'Opportunities', 'module', 90, 0),
('62d5d37c-ab9c-ec8b-7e1b-50724d8255bf', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'EmailTemplates', 'module', 89, 0),
('65f9b55f-f3f9-1b63-19a9-50724defbcda', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'EmailTemplates', 'module', 90, 0),
('6912be32-3240-bcfc-62a1-50724debe85c', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'EmailTemplates', 'module', 90, 0),
('6c2add1b-b82f-46e4-bc90-50724da669e3', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'EmailTemplates', 'module', 90, 0),
('6f44555d-b75b-78e7-d8ef-50724d80d80b', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'EmailTemplates', 'module', 90, 0),
('725a9689-cf9e-ef66-9210-50724d0251f2', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'EmailTemplates', 'module', 90, 0),
('7580898d-37b8-230c-055c-50724d2ea996', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'EmailTemplates', 'module', 90, 0),
('7896adda-de1f-ebc8-13f9-50724d3d6eb4', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'EmailTemplates', 'module', 90, 0),
('917dbd58-461f-8fcc-755e-50724d6f21bf', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'Notes', 'module', 89, 0),
('94a53bab-f8cd-b2ec-680f-50724ddaa6d9', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'Notes', 'module', 90, 0),
('97bb71fb-6e49-7ebf-813b-50724d075e61', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'Notes', 'module', 90, 0),
('9add0dcd-2350-0d81-cf7d-50724dd619ca', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'Notes', 'module', 90, 0),
('9df2a433-7341-ed38-7c8c-50724db8b894', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'Notes', 'module', 90, 0),
('a1063479-6f3c-2001-fdd9-50724d3b9e12', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'Notes', 'module', 90, 0),
('a41dfb36-74cf-47ea-d7ba-50724d02bb34', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'Notes', 'module', 90, 0),
('a73ae462-54fa-cab5-d2ed-50724dc16617', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'Notes', 'module', 90, 0),
('c9cf644c-7035-d375-661b-50724d6fb98e', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'Calls', 'module', 89, 0),
('ccf1b889-358a-6647-d3b5-50724d7705f6', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'Calls', 'module', 90, 0),
('d005fe28-44d9-aba6-8b63-50724daf4b6c', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'Calls', 'module', 90, 0),
('d3148522-c659-113e-56d3-50724d6eb1c7', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'Calls', 'module', 90, 0),
('d630fcb2-02da-fca4-7ede-50724da6967b', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'Calls', 'module', 90, 0),
('d9458d08-fb61-4479-3349-50724dcbdc3e', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'Calls', 'module', 90, 0),
('dc5df22d-94e6-808d-c0b5-50724dfc09c5', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'Calls', 'module', 90, 0),
('df7090fc-4590-1056-ebb1-50724df29db9', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'Calls', 'module', 90, 0),
('1154c222-18bb-c664-cc09-50724d6ab25a', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'Emails', 'module', 89, 0),
('147f9644-b036-0405-65f0-50724d45b46f', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'Emails', 'module', 90, 0),
('17974f09-4e0b-c6a3-37d4-50724d54c039', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'Emails', 'module', 90, 0),
('1ab08084-b4d7-6ba1-c91a-50724d76f727', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'Emails', 'module', 90, 0),
('1dd38e3a-0944-a7b0-32a0-50724dcb92a3', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'Emails', 'module', 90, 0),
('20faf2c1-a822-d57d-72dd-50724d0d6379', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'Emails', 'module', 90, 0),
('24194662-4fd3-e81b-e099-50724d877ded', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'Emails', 'module', 90, 0),
('273a2ea1-23db-50f6-ee88-50724df7ac8c', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'Emails', 'module', 90, 0),
('4905c9b9-b465-a77d-41c7-50724d84b044', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'Meetings', 'module', 89, 0),
('4c24928d-e453-b954-ae81-50724da3b6d0', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'Meetings', 'module', 90, 0),
('4f66649f-016e-d240-6d77-50724dd30c83', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'Meetings', 'module', 90, 0),
('532f83b6-f783-944b-5a4b-50724d894373', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'Meetings', 'module', 90, 0),
('564872d4-78b8-fd77-daa2-50724de8b7dc', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'Meetings', 'module', 90, 0),
('5964bacf-5253-c15a-f50a-50724da759f7', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'Meetings', 'module', 90, 0),
('5c885706-5f1d-fb46-d07e-50724d46618f', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'Meetings', 'module', 90, 0),
('5fef5ce6-630d-07e4-671b-50724d34ce2e', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'Meetings', 'module', 90, 0),
('7fabb333-ab3c-efe5-44f0-50724d154b6e', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'Tasks', 'module', 89, 0),
('82e15a85-7ac1-30b4-fb8c-50724d7a3c0a', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'Tasks', 'module', 90, 0),
('8606749e-c822-276e-28e2-50724dcf483f', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'Tasks', 'module', 90, 0),
('8926c829-507f-6cfd-49fa-50724d416725', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'Tasks', 'module', 90, 0),
('8c4c3298-e94e-d5f0-2afa-50724dd1e57d', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'Tasks', 'module', 90, 0),
('8f83e32b-2146-4425-c8ba-50724d0eb36b', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'Tasks', 'module', 90, 0),
('931f3039-5c0b-d943-b76d-50724d87916c', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'Tasks', 'module', 90, 0),
('964b8a99-e2ef-05ea-c3d3-50724dacf097', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'Tasks', 'module', 90, 0),
('3c2059e2-11fc-fb5b-7221-50724d15de5e', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'Documents', 'module', 89, 0),
('3f431694-fc6b-8949-7c20-50724db5bd6d', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'Documents', 'module', 90, 0),
('425c4d09-309c-0b79-a3e9-50724df3ec36', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'Documents', 'module', 90, 0),
('45715aa7-b72f-b9c6-8ea6-50724d4dfb52', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'Documents', 'module', 90, 0),
('488bd9a6-d055-805c-84ec-50724df0b899', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'Documents', 'module', 90, 0),
('4ba70aac-f396-635c-9be2-50724da9dc3d', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'Documents', 'module', 90, 0),
('4ebdc08d-c42d-e818-6802-50724d2308ff', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'Documents', 'module', 90, 0),
('5250e357-db67-bc44-0ab6-50724db2520e', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'Documents', 'module', 90, 0),
('194c8bca-4e24-1b36-34ad-50724d109633', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'access', 'EAPM', 'module', 89, 0),
('1c68cd8c-e45d-1e28-9e8f-50724d692397', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'view', 'EAPM', 'module', 90, 0),
('1f7ce602-4078-04bb-517e-50724d0255c8', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'list', 'EAPM', 'module', 90, 0),
('22936176-2352-bf20-f9bb-50724d98dadf', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'edit', 'EAPM', 'module', 90, 0),
('25b7bf56-39a9-fa81-b41d-50724d718049', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'delete', 'EAPM', 'module', 90, 0),
('28cfc464-883d-85f8-92d0-50724d236df5', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'import', 'EAPM', 'module', 90, 0),
('2be9798d-cfd8-8fe9-0ffd-50724d7d3687', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'export', 'EAPM', 'module', 90, 0),
('2f0414cf-b368-0cd0-ec74-50724d2bc9c8', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '', 'massupdate', 'EAPM', 'module', 90, 0),
('247aa689-9ffc-6703-4b3e-5073b4ff05e8', '2012-10-09 05:23:28', '2012-10-09 05:23:28', '1', '1', 'access', 'Aknet_ServiceInternet', 'module', 89, 0),
('4fcc0813-ea19-2df0-7360-5073b466c8df', '2012-10-09 05:23:28', '2012-10-09 05:23:28', '1', '1', 'view', 'Aknet_ServiceInternet', 'module', 90, 0),
('533d4c61-f24d-85fb-6310-5073b4c2ce35', '2012-10-09 05:23:28', '2012-10-09 05:23:28', '1', '1', 'list', 'Aknet_ServiceInternet', 'module', 90, 0),
('56bd10fd-9cb5-785c-a71f-5073b49bb718', '2012-10-09 05:23:28', '2012-10-09 05:23:28', '1', '1', 'edit', 'Aknet_ServiceInternet', 'module', 90, 0),
('5a2f6808-50bd-79cf-edcd-5073b47c94d4', '2012-10-09 05:23:28', '2012-10-09 05:23:28', '1', '1', 'delete', 'Aknet_ServiceInternet', 'module', 90, 0),
('5da67ae4-b724-133b-4594-5073b44b325c', '2012-10-09 05:23:28', '2012-10-09 05:23:28', '1', '1', 'import', 'Aknet_ServiceInternet', 'module', 90, 0),
('65cd99bd-04f6-88fd-cb20-5073b4e0a9b7', '2012-10-09 05:23:28', '2012-10-09 05:23:28', '1', '1', 'export', 'Aknet_ServiceInternet', 'module', 90, 0),
('694295a5-1ccf-5e9f-0b05-5073b46e9826', '2012-10-09 05:23:28', '2012-10-09 05:23:28', '1', '1', 'massupdate', 'Aknet_ServiceInternet', 'module', 90, 0),
('851f6f87-d6de-babe-dc5f-5074f8145997', '2012-10-10 04:25:10', '2012-10-10 04:25:10', '1', '1', 'access', 'Aknet_Street', 'module', 89, 0),
('addee199-cffd-d815-5631-5074f8b6ba6c', '2012-10-10 04:25:10', '2012-10-10 04:25:10', '1', '1', 'view', 'Aknet_Street', 'module', 90, 0),
('b1556e22-fdaf-57f4-3228-5074f8481880', '2012-10-10 04:25:10', '2012-10-10 04:25:10', '1', '1', 'list', 'Aknet_Street', 'module', 90, 0),
('b4dc5498-e912-5063-b6cf-5074f88e7f8a', '2012-10-10 04:25:10', '2012-10-10 04:25:10', '1', '1', 'edit', 'Aknet_Street', 'module', 90, 0),
('b851fc6a-d7b0-ab64-1453-5074f835cedc', '2012-10-10 04:25:10', '2012-10-10 04:25:10', '1', '1', 'delete', 'Aknet_Street', 'module', 90, 0),
('bbcd9794-cbcb-3665-9d09-5074f85733e9', '2012-10-10 04:25:10', '2012-10-10 04:25:10', '1', '1', 'import', 'Aknet_Street', 'module', 90, 0),
('bf448f83-ed8a-11f0-6742-5074f895a2b0', '2012-10-10 04:25:10', '2012-10-10 04:25:10', '1', '1', 'export', 'Aknet_Street', 'module', 90, 0),
('c2c18ca2-b877-eb3e-9f43-5074f8c230f5', '2012-10-10 04:25:10', '2012-10-10 04:25:10', '1', '1', 'massupdate', 'Aknet_Street', 'module', 90, 0),
('aff2add0-76ac-513b-f5fc-507be6ca7f18', '2012-10-15 10:31:21', '2012-10-15 10:31:21', '1', '1', 'access', 'Aknet_ServiceTV', 'module', 89, 0),
('d4ce7afc-ccb6-15a5-dc6c-507be6d77f76', '2012-10-15 10:31:21', '2012-10-15 10:31:21', '1', '1', 'view', 'Aknet_ServiceTV', 'module', 90, 0),
('d85d0a47-0ee3-6229-f74b-507be6b2c419', '2012-10-15 10:31:21', '2012-10-15 10:31:21', '1', '1', 'list', 'Aknet_ServiceTV', 'module', 90, 0),
('dbdb8eff-1eb4-fc49-3887-507be6fe69c9', '2012-10-15 10:31:21', '2012-10-15 10:31:21', '1', '1', 'edit', 'Aknet_ServiceTV', 'module', 90, 0),
('df4bfd25-d92b-4f79-f00c-507be6a9866d', '2012-10-15 10:31:21', '2012-10-15 10:31:21', '1', '1', 'delete', 'Aknet_ServiceTV', 'module', 90, 0),
('e2c3e9a6-3650-663b-3e76-507be68d6713', '2012-10-15 10:31:21', '2012-10-15 10:31:21', '1', '1', 'import', 'Aknet_ServiceTV', 'module', 90, 0),
('e632b8ea-8c9b-7800-6229-507be66ce20e', '2012-10-15 10:31:21', '2012-10-15 10:31:21', '1', '1', 'export', 'Aknet_ServiceTV', 'module', 90, 0),
('e9a73421-540e-9279-bd06-507be6ffb967', '2012-10-15 10:31:21', '2012-10-15 10:31:21', '1', '1', 'massupdate', 'Aknet_ServiceTV', 'module', 90, 0),
('c61709d0-173b-338f-239a-507be64247db', '2012-10-15 10:31:21', '2012-10-15 10:31:21', '1', '1', 'access', 'Aknet_ServiceVPNL2', 'module', 89, 0),
('fd7b0fab-3cd0-1573-0f6c-507be6943857', '2012-10-15 10:31:21', '2012-10-15 10:31:21', '1', '1', 'view', 'Aknet_ServiceVPNL2', 'module', 90, 0),
('13567f95-2ea8-eeaf-6378-507be6a86823', '2012-10-15 10:31:21', '2012-10-15 10:31:21', '1', '1', 'list', 'Aknet_ServiceVPNL2', 'module', 90, 0),
('16cbc2f4-6542-5e2b-c5dd-507be6e3ce62', '2012-10-15 10:31:21', '2012-10-15 10:31:21', '1', '1', 'edit', 'Aknet_ServiceVPNL2', 'module', 90, 0),
('1a455d25-0db2-4547-def7-507be6d4c043', '2012-10-15 10:31:21', '2012-10-15 10:31:21', '1', '1', 'delete', 'Aknet_ServiceVPNL2', 'module', 90, 0),
('1dc1407c-40a1-f8ab-1742-507be62ff7ce', '2012-10-15 10:31:21', '2012-10-15 10:31:21', '1', '1', 'import', 'Aknet_ServiceVPNL2', 'module', 90, 0),
('21426719-7c74-35d7-60ba-507be6bdf4b9', '2012-10-15 10:31:21', '2012-10-15 10:31:21', '1', '1', 'export', 'Aknet_ServiceVPNL2', 'module', 90, 0),
('24bad6fa-41d7-a723-6c58-507be6c8a460', '2012-10-15 10:31:21', '2012-10-15 10:31:21', '1', '1', 'massupdate', 'Aknet_ServiceVPNL2', 'module', 90, 0),
('42ac2ee8-b684-4f94-ecef-508137396951', '2012-10-19 11:20:17', '2012-10-19 11:20:17', '1', '1', 'access', 'Aknet_InternetTariff', 'module', 89, 0),
('48305f06-e8a5-d1b9-1014-50813732ce1e', '2012-10-19 11:20:17', '2012-10-19 11:20:17', '1', '1', 'view', 'Aknet_InternetTariff', 'module', 90, 0),
('4855a768-c292-459e-108a-50813797e0f9', '2012-10-19 11:20:17', '2012-10-19 11:20:17', '1', '1', 'list', 'Aknet_InternetTariff', 'module', 90, 0),
('48781cd2-f23a-2cfe-db8a-5081372e6c77', '2012-10-19 11:20:17', '2012-10-19 11:20:17', '1', '1', 'edit', 'Aknet_InternetTariff', 'module', 90, 0),
('489b040f-742a-b4e7-80b0-5081371cd1f6', '2012-10-19 11:20:17', '2012-10-19 11:20:17', '1', '1', 'delete', 'Aknet_InternetTariff', 'module', 90, 0),
('48bc38c9-8ef1-a44b-ed90-5081371eb6f1', '2012-10-19 11:20:17', '2012-10-19 11:20:17', '1', '1', 'import', 'Aknet_InternetTariff', 'module', 90, 0),
('48ddd569-06da-1723-c334-5081379b4539', '2012-10-19 11:20:17', '2012-10-19 11:20:17', '1', '1', 'export', 'Aknet_InternetTariff', 'module', 90, 0),
('49007bcb-b2bc-e797-db5c-50813781e194', '2012-10-19 11:20:17', '2012-10-19 11:20:17', '1', '1', 'massupdate', 'Aknet_InternetTariff', 'module', 90, 0),
('71398bd8-67b1-1186-5c7a-50813aa7c458', '2012-10-19 11:32:30', '2012-10-19 11:32:30', '1', '1', 'access', 'Aknet_TVTariff', 'module', 89, 0),
('75a4b4ea-cc67-d301-60e8-50813accefac', '2012-10-19 11:32:30', '2012-10-19 11:32:30', '1', '1', 'view', 'Aknet_TVTariff', 'module', 90, 0),
('75ccba64-fdb4-e054-be58-50813ab7409f', '2012-10-19 11:32:30', '2012-10-19 11:32:30', '1', '1', 'list', 'Aknet_TVTariff', 'module', 90, 0),
('75f2da20-8857-e370-31c8-50813a80764a', '2012-10-19 11:32:30', '2012-10-19 11:32:30', '1', '1', 'edit', 'Aknet_TVTariff', 'module', 90, 0),
('761687e3-3590-056d-b758-50813a55e059', '2012-10-19 11:32:30', '2012-10-19 11:32:30', '1', '1', 'delete', 'Aknet_TVTariff', 'module', 90, 0),
('7639f85d-7751-e6c6-70b2-50813a054ad7', '2012-10-19 11:32:30', '2012-10-19 11:32:30', '1', '1', 'import', 'Aknet_TVTariff', 'module', 90, 0),
('765d0fb0-808d-9bb7-3ce3-50813a0a48fa', '2012-10-19 11:32:30', '2012-10-19 11:32:30', '1', '1', 'export', 'Aknet_TVTariff', 'module', 90, 0),
('767fb836-2eb7-c50c-6089-50813adc2401', '2012-10-19 11:32:30', '2012-10-19 11:32:30', '1', '1', 'massupdate', 'Aknet_TVTariff', 'module', 90, 0),
('2cb7f14f-9810-df56-b55e-50b84e8303a9', '2012-11-30 06:13:27', '2012-11-30 06:13:48', '1', '1', 'access', 'hw_helloworld', 'module', 89, 1),
('2d465df2-b64f-d8d6-0133-50b84e4cb395', '2012-11-30 06:13:27', '2012-11-30 06:13:48', '1', '1', 'view', 'hw_helloworld', 'module', 90, 1),
('2da379f3-d5a9-b7c8-2ea0-50b84eeb8df8', '2012-11-30 06:13:27', '2012-11-30 06:13:48', '1', '1', 'list', 'hw_helloworld', 'module', 90, 1),
('2e00570d-bd3e-b24b-f21f-50b84e67e999', '2012-11-30 06:13:27', '2012-11-30 06:13:48', '1', '1', 'edit', 'hw_helloworld', 'module', 90, 1),
('2e612e3e-6ef2-0a1f-1713-50b84e9b651f', '2012-11-30 06:13:27', '2012-11-30 06:13:48', '1', '1', 'delete', 'hw_helloworld', 'module', 90, 1),
('2ec769b0-4b3e-6ba4-a4ef-50b84e395466', '2012-11-30 06:13:27', '2012-11-30 06:13:48', '1', '1', 'import', 'hw_helloworld', 'module', 90, 1),
('2eef76a7-09c4-5c9e-8098-50b84e9dc391', '2012-11-30 06:13:27', '2012-11-30 06:13:48', '1', '1', 'export', 'hw_helloworld', 'module', 90, 1),
('2f167821-e0f7-182c-52c0-50b84e770a4c', '2012-11-30 06:13:27', '2012-11-30 06:13:48', '1', '1', 'massupdate', 'hw_helloworld', 'module', 90, 1),
('bb9fa192-ff4d-f160-64cd-50b85da4a2d1', '2012-11-30 07:15:57', '2012-11-30 07:19:06', '1', '1', 'access', 'hw_helloworld', 'module', 89, 1),
('bc34028a-f025-3c1f-97d0-50b85d758e14', '2012-11-30 07:15:57', '2012-11-30 07:19:06', '1', '1', 'view', 'hw_helloworld', 'module', 90, 1),
('bc938459-9007-c2a2-35ce-50b85d210afd', '2012-11-30 07:15:57', '2012-11-30 07:19:06', '1', '1', 'list', 'hw_helloworld', 'module', 90, 1),
('bcf48d4e-2d95-062e-4b8a-50b85d666985', '2012-11-30 07:15:57', '2012-11-30 07:19:06', '1', '1', 'edit', 'hw_helloworld', 'module', 90, 1),
('bd54b6f2-cea8-b7ae-b27a-50b85dc867b8', '2012-11-30 07:15:57', '2012-11-30 07:19:06', '1', '1', 'delete', 'hw_helloworld', 'module', 90, 1),
('bdb580c5-33b7-b246-0e7a-50b85d590682', '2012-11-30 07:15:57', '2012-11-30 07:19:06', '1', '1', 'import', 'hw_helloworld', 'module', 90, 1),
('be179613-6610-b434-6c46-50b85d0ca5c0', '2012-11-30 07:15:57', '2012-11-30 07:19:06', '1', '1', 'export', 'hw_helloworld', 'module', 90, 1),
('be63c0f0-82ae-4c42-0b5b-50b85d12be2f', '2012-11-30 07:15:57', '2012-11-30 07:19:06', '1', '1', 'massupdate', 'hw_helloworld', 'module', 90, 1),
('4e64634d-7e7f-929a-b2a8-50b86777c008', '2012-11-30 07:59:17', '2012-11-30 08:46:47', '1', '1', 'access', 'tm_testmodule', 'module', 89, 1),
('4ef94b3e-e824-34ff-8bd8-50b867efe6e1', '2012-11-30 07:59:17', '2012-11-30 08:46:47', '1', '1', 'view', 'tm_testmodule', 'module', 90, 1),
('4f58ca44-ffbb-f0a4-c082-50b8679a3091', '2012-11-30 07:59:17', '2012-11-30 08:46:47', '1', '1', 'list', 'tm_testmodule', 'module', 90, 1),
('4fbb5dfb-e84b-98c7-3c63-50b867523efb', '2012-11-30 07:59:17', '2012-11-30 08:46:47', '1', '1', 'edit', 'tm_testmodule', 'module', 90, 1),
('500a3584-c5f6-d964-ff72-50b867f65c42', '2012-11-30 07:59:17', '2012-11-30 08:46:47', '1', '1', 'delete', 'tm_testmodule', 'module', 90, 1),
('5033fbb8-a356-3437-c101-50b8671d84d9', '2012-11-30 07:59:17', '2012-11-30 08:46:47', '1', '1', 'import', 'tm_testmodule', 'module', 90, 1),
('505bead4-4923-0952-aeef-50b8675aa01d', '2012-11-30 07:59:17', '2012-11-30 08:46:47', '1', '1', 'export', 'tm_testmodule', 'module', 90, 1),
('5086d559-979d-2cb6-c24c-50b8674e1dc1', '2012-11-30 07:59:17', '2012-11-30 08:46:47', '1', '1', 'massupdate', 'tm_testmodule', 'module', 90, 1),
('e36fbe5e-9107-2a37-dfa9-50b87e298848', '2012-11-30 09:40:08', '2012-11-30 09:40:08', '1', '1', 'access', 'Inventory_items', 'module', 89, 0),
('e4040bad-9764-40e2-7da9-50b87effea5d', '2012-11-30 09:40:08', '2012-11-30 09:40:08', '1', '1', 'view', 'Inventory_items', 'module', 90, 0),
('e46a946c-63f6-5be9-9058-50b87e84c489', '2012-11-30 09:40:08', '2012-11-30 09:40:08', '1', '1', 'list', 'Inventory_items', 'module', 90, 0),
('e4cb57bc-6964-01b1-4747-50b87ec59fe9', '2012-11-30 09:40:08', '2012-11-30 09:40:08', '1', '1', 'edit', 'Inventory_items', 'module', 90, 0),
('e52d5065-9197-29c9-0493-50b87e2b55aa', '2012-11-30 09:40:08', '2012-11-30 09:40:08', '1', '1', 'delete', 'Inventory_items', 'module', 90, 0),
('e58f16b0-36c1-5030-842a-50b87e740dc9', '2012-11-30 09:40:08', '2012-11-30 09:40:08', '1', '1', 'import', 'Inventory_items', 'module', 90, 0),
('e5f2cf6a-ee40-12da-fec4-50b87e031dda', '2012-11-30 09:40:08', '2012-11-30 09:40:08', '1', '1', 'export', 'Inventory_items', 'module', 90, 0),
('e65323d7-003d-13eb-9b85-50b87e59b4b6', '2012-11-30 09:40:08', '2012-11-30 09:40:08', '1', '1', 'massupdate', 'Inventory_items', 'module', 90, 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `address_book`
--

CREATE TABLE IF NOT EXISTS `address_book` (
  `assigned_user_id` char(36) NOT NULL,
  `bean` varchar(50) DEFAULT NULL,
  `bean_id` char(36) NOT NULL,
  KEY `ab_user_bean_idx` (`assigned_user_id`,`bean`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

--
-- Dumping data for table `aknet_internettariff`
--

INSERT INTO `aknet_internettariff` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `billing_tariff_id`) VALUES
('e699de1c-bc25-58ac-6dbf-508137076a3b', 'Удачный', '2012-10-19 11:21:49', '2012-10-19 11:21:49', '1', '1', '', 0, NULL, 1);

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
  `address_street` varchar(255) DEFAULT NULL,
  `address_building` varchar(255) DEFAULT NULL,
  `address_appartment` varchar(255) DEFAULT NULL,
  `switch_id` int(11) DEFAULT NULL,
  `port` int(255) DEFAULT NULL,
  `connection_price` decimal(18,8) DEFAULT NULL,
  `comment` text,
  `lead_status` varchar(100) DEFAULT 'survey',
  `service_internet_status` varchar(100) DEFAULT 'survey',
  `tariff` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aknet_serviceinternet`
--

INSERT INTO `aknet_serviceinternet` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `address_country`, `address_city`, `address_state`, `address_street`, `address_building`, `address_appartment`, `switch_id`, `port`, `connection_price`, `comment`, `lead_status`, `service_internet_status`, `tariff`) VALUES
('26b539c5-373f-77e9-50e6-5075360b56d3', NULL, '2012-10-10 08:48:48', '2012-10-18 04:55:08', '1', '1', NULL, 1, '', 'KYRGYZSTAN', 'bishkek', 'chui', '89772fec-552d-1030-9562-001022fda270', '59', '40', 207, NULL, NULL, NULL, 'survey', 'survey', NULL),
('2546bd0a-ed14-d903-8abe-507bd84da293', '', '2012-10-15 09:35:07', '2012-10-18 04:55:08', '1', '1', NULL, 1, NULL, 'KYRGYZSTAN', 'bishkek', 'chui', '89762d90-552d-1030-9562-001022fda270', '86', '40', NULL, NULL, NULL, NULL, 'survey', 'survey', NULL),
('a111085a-cd21-5ead-044c-507bdcd26209', '', '2012-10-15 09:51:26', '2012-10-18 04:55:08', '1', '1', NULL, 1, NULL, 'KYRGYZSTAN', 'bishkek', 'chui', '8982aaff-552d-1030-9562-001022fda270', '265', 'а', NULL, NULL, NULL, NULL, 'survey', 'survey', NULL),
('9c2f1f9b-93ed-c697-cdb1-507bf36c6c7d', '', '2012-10-15 11:27:56', '2012-10-18 04:55:08', '1', '1', NULL, 1, NULL, 'KYRGYZSTAN', 'bishkek', 'chui', '8977b87e-552d-1030-9562-001022fda270', '20', '', NULL, NULL, NULL, NULL, 'survey', 'survey', NULL),
('43b8f5d2-0be3-a0f9-2767-507bf4a62455', '', '2012-10-15 11:32:22', '2012-10-18 04:55:08', '1', '1', NULL, 1, NULL, 'KYRGYZSTAN', 'bishkek', 'chui', '89837a94-552d-1030-9562-001022fda270', '20', '', NULL, NULL, NULL, NULL, 'survey', 'survey', NULL),
('5898044f-2022-5207-5426-507bf6cf2a4b', '', '2012-10-15 11:40:05', '2012-10-18 04:55:08', '1', '1', NULL, 1, NULL, 'KYRGYZSTAN', 'bishkek', 'chui', '897cc23e-552d-1030-9562-001022fda270', '119', '', NULL, NULL, NULL, NULL, 'survey', 'survey', NULL),
('d07b36fe-01f4-cbf0-2d98-507bf6e1bacc', '', '2012-10-15 11:42:46', '2012-10-18 04:55:08', '1', '1', NULL, 1, NULL, 'KYRGYZSTAN', 'bishkek', 'chui', '89783dfa-552d-1030-9562-001022fda270', '1', '', NULL, NULL, NULL, NULL, 'survey', 'survey', NULL),
('8714f02f-bf07-4802-8bcf-507febaa33b4', NULL, '2012-10-18 11:45:58', '2012-10-19 11:22:17', '1', '1', NULL, 0, '', 'KYRGYZSTAN', 'bishkek', 'chui', '89762d90-552d-1030-9562-001022fda270', '20', NULL, NULL, NULL, NULL, NULL, 'survey', 'new', 'e699de1c-bc25-58ac-6dbf-508137076a3b'),
('ee0c999d-5320-ea0a-a7fe-50a4795877d9', NULL, '2012-11-15 05:11:18', '2012-11-15 05:12:14', '1', '1', NULL, 0, '', 'KYRGYZSTAN', 'bishkek', 'chui', '8975bdc6-552d-1030-9562-001022fda270', '10', '5', NULL, NULL, NULL, NULL, 'survey', 'survey', 'e699de1c-bc25-58ac-6dbf-508137076a3b');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aknet_serviceinternet_accounts_c`
--

INSERT INTO `aknet_serviceinternet_accounts_c` (`id`, `date_modified`, `deleted`, `aknet_serviceinternet_accountsaknet_serviceinternet_ida`, `aknet_serviceinternet_accountsaccounts_idb`) VALUES
('e7546a63-781c-1eb6-45eb-507bdb078637', '2012-10-15 09:44:43', 0, '2546bd0a-ed14-d903-8abe-507bd84da293', 'ea808b06-86cd-46e4-276b-507bd910620c'),
('d5d7ab79-c0b0-ff40-357e-507bdd495639', '2012-10-15 09:53:57', 0, 'a111085a-cd21-5ead-044c-507bdcd26209', 'ea808b06-86cd-46e4-276b-507bd910620c'),
('63b58a24-302c-8943-e567-50a479093feb', '2012-11-15 05:13:06', 0, 'ee0c999d-5320-ea0a-a7fe-50a4795877d9', '4336375c-e1a2-1fd2-b3d3-50a479df66a3');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aknet_serviceinternet_audit`
--

INSERT INTO `aknet_serviceinternet_audit` (`id`, `parent_id`, `date_created`, `created_by`, `field_name`, `data_type`, `before_value_string`, `after_value_string`, `before_value_text`, `after_value_text`) VALUES
('e0d40c6b-b859-91d3-a10c-50812c7b22cb', '8714f02f-bf07-4802-8bcf-507febaa33b4', '2012-10-19 10:35:27', '1', 'tariff', 'dictionary', NULL, '89762d90-552d-1030-9562-001022fda270', NULL, NULL),
('168dcbea-7cfe-5dd2-0bab-50813669de15', '8714f02f-bf07-4802-8bcf-507febaa33b4', '2012-10-19 11:17:36', '1', 'address_street', 'dictionary', '89837920-552d-1030-9562-001022fda270', '89762d90-552d-1030-9562-001022fda270', NULL, NULL),
('ad2891c1-0e44-0a5f-b452-508136cd0e7c', '8714f02f-bf07-4802-8bcf-507febaa33b4', '2012-10-19 11:17:57', '1', 'tariff', 'dictionary', '89762d90-552d-1030-9562-001022fda270', '', NULL, NULL),
('bac410ea-514d-4e58-ed91-5081375d545c', '8714f02f-bf07-4802-8bcf-507febaa33b4', '2012-10-19 11:22:17', '1', 'tariff', 'dictionary', NULL, 'e699de1c-bc25-58ac-6dbf-508137076a3b', NULL, NULL);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aknet_serviceinternet_contacts_c`
--

INSERT INTO `aknet_serviceinternet_contacts_c` (`id`, `date_modified`, `deleted`, `aknet_serviceinternet_contactsaknet_serviceinternet_ida`, `aknet_serviceinternet_contactscontacts_idb`) VALUES
('9fe50ab3-3d78-6790-67af-5077fdc666e8', '2012-10-18 04:54:57', 1, '26b539c5-373f-77e9-50e6-5075360b56d3', '95f25806-a654-b8df-5e99-5077f6e2e412'),
('d8717639-2a6d-5144-f5ff-507bf6f90083', '2012-10-18 04:54:57', 1, 'd07b36fe-01f4-cbf0-2d98-507bf6e1bacc', '604aa8fc-1901-7f9e-bc96-507bf678ccb3'),
('949a085f-2b90-f826-241c-50810bfed1fa', '2012-10-19 11:17:57', 0, '8714f02f-bf07-4802-8bcf-507febaa33b4', '7b7cc131-186f-465f-2f9f-50810b169a16');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aknet_serviceinternet_leads_c`
--

INSERT INTO `aknet_serviceinternet_leads_c` (`id`, `date_modified`, `deleted`, `aknet_serviceinternet_leadsaknet_serviceinternet_ida`, `aknet_serviceinternet_leadsleads_idb`) VALUES
('5e13b1ea-4acd-4be4-4469-507536b280fd', '2012-10-18 04:54:34', 1, '26b539c5-373f-77e9-50e6-5075360b56d3', '611d14d9-ad0f-79b7-14d5-5073b64eb6df'),
('5c3296c9-b10f-d16f-8b33-507bd8e7b633', '2012-10-18 04:54:34', 1, '2546bd0a-ed14-d903-8abe-507bd84da293', 'cf0a2110-4830-b067-4133-507ba45d2d4f'),
('da4d7f0a-a5e4-fab1-eed3-507bdc9e2c3f', '2012-10-18 04:54:34', 1, 'a111085a-cd21-5ead-044c-507bdcd26209', 'd6f0629b-4d5f-700c-3d89-507bdc8668bc'),
('d4cce283-e239-86e2-b717-507bf3b8743d', '2012-10-18 04:54:34', 1, '9c2f1f9b-93ed-c697-cdb1-507bf36c6c7d', '88746f24-6719-3186-2106-507bf38bc6ae'),
('7cdd5045-4ca3-42f6-c3ec-507bf47f8553', '2012-10-18 04:54:34', 1, '43b8f5d2-0be3-a0f9-2767-507bf4a62455', 'e083912a-d153-3ed0-3cf3-507bf4375c54'),
('3cccb176-148f-2fa1-4be9-507bf6a31e92', '2012-10-18 04:54:34', 1, '5898044f-2022-5207-5426-507bf6cf2a4b', '44e2813c-90f2-d1de-bff2-507bf59afa06'),
('139e3239-a7c6-4ff4-a70c-507bf6eb4eef', '2012-10-18 04:54:34', 1, 'd07b36fe-01f4-cbf0-2d98-507bf6e1bacc', '1c068d0a-238b-5f0a-4497-507bf6fc7824'),
('8ae12518-7f37-6829-6986-507feb1ee220', '2012-10-19 11:22:17', 0, '8714f02f-bf07-4802-8bcf-507febaa33b4', '726fd7d8-6d34-1436-55b2-507f8be26eb9'),
('f179144b-3714-25a4-2d0d-50a4799c98cb', '2012-11-15 05:12:14', 0, 'ee0c999d-5320-ea0a-a7fe-50a4795877d9', '67d60327-f647-13b1-0921-50a479f01c0f');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aknet_serviceinternet_opportunities_c`
--

INSERT INTO `aknet_serviceinternet_opportunities_c` (`id`, `date_modified`, `deleted`, `aknet_serviceinternet_opportunitiesaknet_serviceinternet_ida`, `aknet_serviceinternet_opportunitiesopportunities_idb`) VALUES
('1bfc80a7-4850-57d1-8426-507bdba6c09a', '2012-10-15 09:44:43', 0, '2546bd0a-ed14-d903-8abe-507bd84da293', '10d829c5-e8dd-5f0e-aa11-507bd929ef20'),
('e56127bf-61b8-04eb-5d0e-507bddb7296e', '2012-10-15 09:53:57', 0, 'a111085a-cd21-5ead-044c-507bdcd26209', '577cfbf4-2952-6982-18fc-507bddc97d52'),
('6df4f45e-f5b1-1238-48ef-50a47982dcbe', '2012-11-15 05:13:06', 0, 'ee0c999d-5320-ea0a-a7fe-50a4795877d9', '479fd117-795a-3835-a566-50a479d995a5');

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
  `address_streeet` varchar(255) DEFAULT NULL,
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aknet_servicetv`
--

INSERT INTO `aknet_servicetv` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `address_country`, `address_state`, `address_city`, `address_streeet`, `address_building`, `address_appartment`, `switch_id`, `port`, `connection_price`, `service_tv_status`, `comment`, `address_street`, `tariff`) VALUES
('f03a0a50-ab98-4c16-51ae-507bf871e8e0', '', '2012-10-15 11:48:56', '2012-10-15 11:48:56', '1', '1', NULL, 0, NULL, 'KYRGYZSTAN', 'chui', 'bishkek', '89783dfa-552d-1030-9562-001022fda270', '1', '', NULL, NULL, NULL, 'survey', NULL, NULL, NULL);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aknet_servicetv_contacts_c`
--

INSERT INTO `aknet_servicetv_contacts_c` (`id`, `date_modified`, `deleted`, `aknet_servicetv_contactsaknet_servicetv_ida`, `aknet_servicetv_contactscontacts_idb`) VALUES
('ac19a2f3-7e85-eb06-11c6-507bf804e79a', '2012-10-15 11:49:36', 0, 'f03a0a50-ab98-4c16-51ae-507bf871e8e0', '604aa8fc-1901-7f9e-bc96-507bf678ccb3');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aknet_servicetv_leads_c`
--

INSERT INTO `aknet_servicetv_leads_c` (`id`, `date_modified`, `deleted`, `aknet_servicetv_leadsaknet_servicetv_ida`, `aknet_servicetv_leadsleads_idb`) VALUES
('33cd03c1-1241-812c-39a5-507bf8e596fa', '2012-10-15 11:48:56', 0, 'f03a0a50-ab98-4c16-51ae-507bf871e8e0', '1c068d0a-238b-5f0a-4497-507bf6fc7824');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
  `address_street` varchar(255) DEFAULT NULL,
  `address_building` varchar(255) DEFAULT NULL,
  `address_appartment` varchar(255) DEFAULT NULL,
  `switch_id` int(11) DEFAULT NULL,
  `port` int(255) DEFAULT NULL,
  `connection_price` float(18,2) DEFAULT NULL,
  `service_vpnl2_status` varchar(100) DEFAULT 'survey',
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aknet_street`
--

INSERT INTO `aknet_street` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `street_id`) VALUES
('8975b4ec-552d-1030-9562-001022fda270', 'А-атинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1),
('8975ba50-552d-1030-9562-001022fda270', 'Абадана ул., ж/м арча-бешик', NULL, NULL, NULL, NULL, NULL, 0, NULL, 2),
('8975bbf1-552d-1030-9562-001022fda270', 'Абаданова ул., ала-арча ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 3),
('8975bcef-552d-1030-9562-001022fda270', 'Абаканская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 4),
('8975bdc6-552d-1030-9562-001022fda270', 'Абая ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 5),
('8975beae-552d-1030-9562-001022fda270', 'Абдраева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 6),
('8975c147-552d-1030-9562-001022fda270', 'Абдрахманова ы. ул., арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 7),
('8975c296-552d-1030-9562-001022fda270', 'Абдрахманова ю. ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 8),
('8975c381-552d-1030-9562-001022fda270', 'Абдумомунова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 9),
('8975c460-552d-1030-9562-001022fda270', 'Абдыкадырова ж. ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 10),
('8975c545-552d-1030-9562-001022fda270', 'Абдыкадырова р. ул. (туюкская ул.)', NULL, NULL, NULL, NULL, NULL, 0, NULL, 11),
('8975c625-552d-1030-9562-001022fda270', 'Авангардный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 12),
('8975c70f-552d-1030-9562-001022fda270', 'Авиагородок манас', NULL, NULL, NULL, NULL, NULL, 0, NULL, 13),
('8975c802-552d-1030-9562-001022fda270', 'Автобазовский тупик', NULL, NULL, NULL, NULL, NULL, 0, NULL, 14),
('8975c8f8-552d-1030-9562-001022fda270', 'Автосборочная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 15),
('8975ca04-552d-1030-9562-001022fda270', 'Адверский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 16),
('8975cb1f-552d-1030-9562-001022fda270', 'Адыгине ул., ынтымак ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 17),
('8975cc30-552d-1030-9562-001022fda270', 'Адырская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 18),
('8975cd34-552d-1030-9562-001022fda270', 'Адырский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 19),
('8975ce40-552d-1030-9562-001022fda270', 'Адышева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 20),
('8975d005-552d-1030-9562-001022fda270', 'Ажыбек баатыр ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 21),
('8975d149-552d-1030-9562-001022fda270', 'Азамат ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 22),
('8975d271-552d-1030-9562-001022fda270', 'Азат ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 23),
('8975d4bf-552d-1030-9562-001022fda270', 'Азаттык ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 24),
('8975d619-552d-1030-9562-001022fda270', 'Азаттык ул.,алтын-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 25),
('8975d747-552d-1030-9562-001022fda270', 'Азаттык ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 26),
('8975d872-552d-1030-9562-001022fda270', 'Азия ул.,ынтымак ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 27),
('8975da6e-552d-1030-9562-001022fda270', 'Азовская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 28),
('8975db7a-552d-1030-9562-001022fda270', 'Ай ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 29),
('8975dc62-552d-1030-9562-001022fda270', 'Айбеке ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 30),
('8975dd5b-552d-1030-9562-001022fda270', 'Айвазовский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 31),
('8975de48-552d-1030-9562-001022fda270', 'Айдаралиева а. ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 32),
('8975df39-552d-1030-9562-001022fda270', 'Айдын-кол ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 33),
('8975e03f-552d-1030-9562-001022fda270', 'Айкол пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 34),
('8975e140-552d-1030-9562-001022fda270', 'Ай-кол ул.,алтын-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 35),
('8975e24f-552d-1030-9562-001022fda270', 'Ай-кочо,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 36),
('8975e361-552d-1030-9562-001022fda270', 'Айлампа ул.,алтын-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 37),
('8975e476-552d-1030-9562-001022fda270', 'Айланыш ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 38),
('8975e592-552d-1030-9562-001022fda270', 'Ай-мончок ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 39),
('8975e7ff-552d-1030-9562-001022fda270', 'Айни ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 40),
('8975e997-552d-1030-9562-001022fda270', 'Айтиева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 41),
('8975eacf-552d-1030-9562-001022fda270', 'Айтматова торокула ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 42),
('8975ec00-552d-1030-9562-001022fda270', 'Ак бата ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 43),
('8975ed36-552d-1030-9562-001022fda270', 'Ак-балта ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 44),
('8975ee67-552d-1030-9562-001022fda270', 'Акбасарский ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 45),
('8975ef97-552d-1030-9562-001022fda270', 'Ак-бата ул.,ак-бата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 46),
('8975f0d8-552d-1030-9562-001022fda270', 'Ак-босого ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 47),
('8975f211-552d-1030-9562-001022fda270', 'Ак-булак ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 48),
('8975f34a-552d-1030-9562-001022fda270', 'Акбуринский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 49),
('8975f494-552d-1030-9562-001022fda270', 'Ак-жар ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 50),
('8975f5db-552d-1030-9562-001022fda270', 'Акжолтой ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 51),
('8975f719-552d-1030-9562-001022fda270', 'Ак-жолтой ул.,кольмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 52),
('8975f860-552d-1030-9562-001022fda270', 'Ак-кайын ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 53),
('8975fbe9-552d-1030-9562-001022fda270', 'Аккульский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 54),
('8975fd3b-552d-1030-9562-001022fda270', 'Ак-куу ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 55),
('8975fe52-552d-1030-9562-001022fda270', 'Ак-кыя ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 56),
('8975ff4e-552d-1030-9562-001022fda270', 'Ак-марал ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 57),
('89760049-552d-1030-9562-001022fda270', 'Акмончок ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 58),
('89760150-552d-1030-9562-001022fda270', 'Ак-моор ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 59),
('8976026a-552d-1030-9562-001022fda270', 'Ак-муз пер., саламалик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 60),
('89760371-552d-1030-9562-001022fda270', 'Акмуз ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 61),
('89760472-552d-1030-9562-001022fda270', 'Ак-муз ул.,саламалик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 62),
('8976058c-552d-1030-9562-001022fda270', 'Ак-оргее ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 63),
('897606ac-552d-1030-9562-001022fda270', 'Ак-орго ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 64),
('897607c3-552d-1030-9562-001022fda270', 'Ак-ордо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 65),
('897608e3-552d-1030-9562-001022fda270', 'Ак-ордо ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 66),
('89760a02-552d-1030-9562-001022fda270', 'Аксай ул, бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 67),
('89760b33-552d-1030-9562-001022fda270', 'Ак-сайский пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 68),
('89760c61-552d-1030-9562-001022fda270', 'Аксы ул.,учкун ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 69),
('89760ed0-552d-1030-9562-001022fda270', 'Ак-талаа ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 70),
('8976108f-552d-1030-9562-001022fda270', 'Акталинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 71),
('897611ef-552d-1030-9562-001022fda270', 'Ак-тан ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 72),
('89761349-552d-1030-9562-001022fda270', 'Ак-терекская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 73),
('897614a9-552d-1030-9562-001022fda270', 'Ак-терекский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 74),
('897615f8-552d-1030-9562-001022fda270', 'Ак-тилек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 75),
('8976173a-552d-1030-9562-001022fda270', 'Ак-тилек ул.,ак-тилек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 76),
('8976188c-552d-1030-9562-001022fda270', 'Ак-тилек ул.,касым ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 77),
('897619ee-552d-1030-9562-001022fda270', 'Ак-тилек 2 ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 78),
('89761b5a-552d-1030-9562-001022fda270', 'Ак-туз ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 79),
('89761d7a-552d-1030-9562-001022fda270', 'Актюбинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 80),
('89761e92-552d-1030-9562-001022fda270', 'Ак-уул ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 81),
('89761f90-552d-1030-9562-001022fda270', 'Ак-чолмок ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 82),
('89762094-552d-1030-9562-001022fda270', 'Ак-шоокум ул,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 83),
('89762327-552d-1030-9562-001022fda270', 'Ак-шоокум,ак-тилек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 84),
('8976247c-552d-1030-9562-001022fda270', 'Ак-шыйрак ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 85),
('8976258b-552d-1030-9562-001022fda270', 'Акылбекова ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 86),
('8976269a-552d-1030-9562-001022fda270', 'Ала-арча м-н, арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 87),
('897627ba-552d-1030-9562-001022fda270', 'Алабукинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 88),
('897628e2-552d-1030-9562-001022fda270', 'Алайский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 89),
('89762a01-552d-1030-9562-001022fda270', 'Ала-куу ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 90),
('89762b2f-552d-1030-9562-001022fda270', 'Аламединский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 91),
('89762c5d-552d-1030-9562-001022fda270', 'Аламединский рынок', NULL, NULL, NULL, NULL, NULL, 0, NULL, 92),
('89762d90-552d-1030-9562-001022fda270', 'Аламедин-1 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 93),
('89762ec9-552d-1030-9562-001022fda270', 'Аларчинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 94),
('89763002-552d-1030-9562-001022fda270', 'Ала-тоо мкр', NULL, NULL, NULL, NULL, NULL, 0, NULL, 95),
('8976313e-552d-1030-9562-001022fda270', 'Ала-тоо пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 96),
('89763274-552d-1030-9562-001022fda270', 'Ала-тоо ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 97),
('897633af-552d-1030-9562-001022fda270', 'Алданский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 98),
('8976365f-552d-1030-9562-001022fda270', 'Александровская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 99),
('897637f1-552d-1030-9562-001022fda270', 'Александровский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 100),
('89763949-552d-1030-9562-001022fda270', 'Алканов и к рынок', NULL, NULL, NULL, NULL, NULL, 0, NULL, 101),
('89763a9b-552d-1030-9562-001022fda270', 'Алма-атинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 102),
('89763bf2-552d-1030-9562-001022fda270', 'Алма-атинская ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 103),
('89763d55-552d-1030-9562-001022fda270', 'Алмалуу ул.,орок ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 104),
('89763ec6-552d-1030-9562-001022fda270', 'Алманбет ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 105),
('897640fd-552d-1030-9562-001022fda270', 'Алтайский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 106),
('89764214-552d-1030-9562-001022fda270', 'Алты-бакан ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 107),
('89764320-552d-1030-9562-001022fda270', 'Алтымышева а. ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 108),
('89764424-552d-1030-9562-001022fda270', 'Алтын бешик ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 109),
('89764533-552d-1030-9562-001022fda270', 'Алтын-бешик ул.,алтын-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 110),
('89764642-552d-1030-9562-001022fda270', 'Алтын-бешик ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 111),
('8976474c-552d-1030-9562-001022fda270', 'Алтын-казык ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 112),
('8976498b-552d-1030-9562-001022fda270', 'Алтын-ордо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 113),
('89764b26-552d-1030-9562-001022fda270', 'Алты-тутун ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 114),
('89764c6a-552d-1030-9562-001022fda270', 'Алыбаева м. ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 115),
('89764da0-552d-1030-9562-001022fda270', 'Алыкулов ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 116),
('89764ee1-552d-1030-9562-001022fda270', 'Алыкулова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 117),
('8976501a-552d-1030-9562-001022fda270', 'Альмаматр рынок', NULL, NULL, NULL, NULL, NULL, 0, NULL, 118),
('8976515b-552d-1030-9562-001022fda270', 'Альпийская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 119),
('8976529a-552d-1030-9562-001022fda270', 'Аманат ул.,касым ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 120),
('897653d6-552d-1030-9562-001022fda270', 'А.мидина ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 121),
('89765517-552d-1030-9562-001022fda270', 'Аммосова м.к. ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 122),
('8976565b-552d-1030-9562-001022fda270', 'Амурский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 123),
('89765797-552d-1030-9562-001022fda270', 'Ананьева пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 124),
('897658d8-552d-1030-9562-001022fda270', 'Ананьева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 125),
('89765a2a-552d-1030-9562-001022fda270', 'Анар ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 126),
('89765b7f-552d-1030-9562-001022fda270', 'Анарбека ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 127),
('89765e7f-552d-1030-9562-001022fda270', 'Анарчинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 128),
('89766009-552d-1030-9562-001022fda270', 'Ангарский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 129),
('8976618d-552d-1030-9562-001022fda270', 'Андижанская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 130),
('897662f0-552d-1030-9562-001022fda270', 'Андижанский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 131),
('8976651c-552d-1030-9562-001022fda270', 'Аптекарский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 132),
('8976662e-552d-1030-9562-001022fda270', 'Арабаев ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 133),
('8976672f-552d-1030-9562-001022fda270', 'Араванская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 134),
('89766819-552d-1030-9562-001022fda270', 'Ара-кол ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 135),
('89766915-552d-1030-9562-001022fda270', 'Аральский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 136),
('89766a13-552d-1030-9562-001022fda270', 'Арасанский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 137),
('89766b11-552d-1030-9562-001022fda270', 'Арашан ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 138),
('89766c0d-552d-1030-9562-001022fda270', 'Арзамасская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 139),
('89766d0b-552d-1030-9562-001022fda270', 'Армейская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 140),
('89766e11-552d-1030-9562-001022fda270', 'Арстамбай ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 141),
('89766f1b-552d-1030-9562-001022fda270', 'Арстанбап пер., ж/м кок-жар', NULL, NULL, NULL, NULL, NULL, 0, NULL, 142),
('897671e6-552d-1030-9562-001022fda270', 'Арстанбап ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 143),
('89767332-552d-1030-9562-001022fda270', 'Артемовская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 144),
('89767477-552d-1030-9562-001022fda270', 'Арууке ул.,орок ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 145),
('897675af-552d-1030-9562-001022fda270', 'Архангельская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 146),
('897676e3-552d-1030-9562-001022fda270', 'Архитекторская ул., ак-босого ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 147),
('89767816-552d-1030-9562-001022fda270', 'Арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 148),
('8976794c-552d-1030-9562-001022fda270', 'Арча-бешик ж/м,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 149),
('89767a85-552d-1030-9562-001022fda270', 'Арча-бешик ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 150),
('89767bc3-552d-1030-9562-001022fda270', 'Арча-бешик ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 151),
('89767d0a-552d-1030-9562-001022fda270', 'Арча-гул ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 152),
('89767e5a-552d-1030-9562-001022fda270', 'Арчалуу ул.,орок ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 153),
('89767fb1-552d-1030-9562-001022fda270', 'Арчалы ул.,учкун ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 154),
('89768114-552d-1030-9562-001022fda270', 'Арча-1 ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 155),
('8976827c-552d-1030-9562-001022fda270', 'Арычная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 156),
('89768582-552d-1030-9562-001022fda270', 'Асаналиева усенгазы ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 157),
('897687ec-552d-1030-9562-001022fda270', 'Асанбай м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 158),
('89768903-552d-1030-9562-001022fda270', 'Асановой ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 159),
('89768a0f-552d-1030-9562-001022fda270', 'Аска-таш ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 160),
('89768b1b-552d-1030-9562-001022fda270', 'Асламбоб ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 161),
('89768c28-552d-1030-9562-001022fda270', 'Астраханская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 162),
('89768d44-552d-1030-9562-001022fda270', 'Астраханский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 163),
('89768e61-552d-1030-9562-001022fda270', 'Атбасарский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 164),
('89768f84-552d-1030-9562-001022fda270', 'Ат-баши ул.,тынч-тык ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 165),
('897690ac-552d-1030-9562-001022fda270', 'Атбашинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 166),
('897691dd-552d-1030-9562-001022fda270', 'Атбашинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 167),
('89769316-552d-1030-9562-001022fda270', 'Атойнок ул.,ак-тилек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 168),
('89769454-552d-1030-9562-001022fda270', 'Аул ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 169),
('89769584-552d-1030-9562-001022fda270', 'Аульный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 170),
('897697ee-552d-1030-9562-001022fda270', 'Ауэзова ул. аламедин м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 171),
('89769980-552d-1030-9562-001022fda270', 'Ауэзова ул, восточная промзона', NULL, NULL, NULL, NULL, NULL, 0, NULL, 172),
('89769ae0-552d-1030-9562-001022fda270', 'Ауэзова ул.,тунгуч м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 173),
('89769c24-552d-1030-9562-001022fda270', 'Ауэзова ул.,учкун ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 174),
('89769d63-552d-1030-9562-001022fda270', 'Ауэзова ул.учкун м-р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 175),
('89769ea1-552d-1030-9562-001022fda270', 'Ахунбаева ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 176),
('89769ff9-552d-1030-9562-001022fda270', 'Ахунбаева ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 177),
('8976a15e-552d-1030-9562-001022fda270', 'Ашар ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 178),
('8976a2bc-552d-1030-9562-001022fda270', 'Ашар ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 179),
('8976a41c-552d-1030-9562-001022fda270', 'Ашпара ул., орок ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 180),
('8976a579-552d-1030-9562-001022fda270', 'Ашхабадская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 181),
('8976a6d0-552d-1030-9562-001022fda270', 'Ашхабадский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 182),
('8976a836-552d-1030-9562-001022fda270', 'Аэродромный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 183),
('8976aba3-552d-1030-9562-001022fda270', 'Аэропорт манас', NULL, NULL, NULL, NULL, NULL, 0, NULL, 184),
('8976ad06-552d-1030-9562-001022fda270', 'А/я', NULL, NULL, NULL, NULL, NULL, 0, NULL, 185),
('8976ae1d-552d-1030-9562-001022fda270', 'Аягузовский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 186),
('8976af1c-552d-1030-9562-001022fda270', 'Баба-ата пер., ж/м арча-бешик', NULL, NULL, NULL, NULL, NULL, 0, NULL, 187),
('8976b02b-552d-1030-9562-001022fda270', 'Баба-ата ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 188),
('8976b13f-552d-1030-9562-001022fda270', 'Бабур ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 189),
('8976b267-552d-1030-9562-001022fda270', 'Бабушкин пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 190),
('8976b398-552d-1030-9562-001022fda270', 'Багижский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 191),
('8976b4ce-552d-1030-9562-001022fda270', 'Багратиона ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 192),
('8976b607-552d-1030-9562-001022fda270', 'Багыш ул., кара-жыгач ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 193),
('8976b745-552d-1030-9562-001022fda270', 'Бадахшан ул., ж/м арча-бешик', NULL, NULL, NULL, NULL, NULL, 0, NULL, 194),
('8976b88f-552d-1030-9562-001022fda270', 'Баетова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 195),
('8976b9de-552d-1030-9562-001022fda270', 'Базар-курганская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 196),
('8976bb2d-552d-1030-9562-001022fda270', 'Базарный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 197),
('8976bc77-552d-1030-9562-001022fda270', 'Байдамтал ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 198),
('8976bf02-552d-1030-9562-001022fda270', 'Байдобинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 199),
('8976c0a2-552d-1030-9562-001022fda270', 'Байдукова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 200),
('8976c202-552d-1030-9562-001022fda270', 'Байкальский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 201),
('8976c36b-552d-1030-9562-001022fda270', 'Байсак ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 202),
('8976c4d0-552d-1030-9562-001022fda270', 'Байтик Баатыр ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 203),
('8976c636-552d-1030-9562-001022fda270', 'Байчечекей ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 204),
('8976c7a7-552d-1030-9562-001022fda270', 'Бакаева  а. - генерала ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 205),
('8976c914-552d-1030-9562-001022fda270', 'Бакаева ул., арча - бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 206),
('8976ca88-552d-1030-9562-001022fda270', 'Бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 207),
('8976cbf3-552d-1030-9562-001022fda270', 'Бакай-ата ж/м,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 208),
('8976cd67-552d-1030-9562-001022fda270', 'Бакай-ата ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 209),
('8976cf9e-552d-1030-9562-001022fda270', 'Бакинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 210),
('8976d0cc-552d-1030-9562-001022fda270', 'Бакыян ул., ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 211),
('8976d38c-552d-1030-9562-001022fda270', 'Балгарский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 212),
('8976d4bf-552d-1030-9562-001022fda270', 'Балканский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 213),
('8976d5e1-552d-1030-9562-001022fda270', 'Балтагулова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 214),
('8976d701-552d-1030-9562-001022fda270', 'Балтийская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 215),
('8976d81e-552d-1030-9562-001022fda270', 'Балхашский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 216),
('8976d94c-552d-1030-9562-001022fda270', 'Балык кумара ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 217),
('8976da7c-552d-1030-9562-001022fda270', 'Балыкчинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 218),
('8976dbbb-552d-1030-9562-001022fda270', 'Барабинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 219),
('8976dcff-552d-1030-9562-001022fda270', 'Барнаульский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 220),
('8976de35-552d-1030-9562-001022fda270', 'Баррикадный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 221),
('8976df7c-552d-1030-9562-001022fda270', 'Барскаунский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 222),
('8976e0c6-552d-1030-9562-001022fda270', 'Баткенский пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 223),
('8976e207-552d-1030-9562-001022fda270', 'Батырский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 224),
('8976e35e-552d-1030-9562-001022fda270', 'Баха ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 225),
('8976e5a9-552d-1030-9562-001022fda270', 'Баха ул, ынтымак ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 226),
('8976e773-552d-1030-9562-001022fda270', 'Баха ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 227),
('8976e8ef-552d-1030-9562-001022fda270', 'Баха-ахунбаева участки', NULL, NULL, NULL, NULL, NULL, 0, NULL, 228),
('8976ea6e-552d-1030-9562-001022fda270', 'Бахахшан ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 229),
('8976ebed-552d-1030-9562-001022fda270', 'Бахкян ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 230),
('8976ed74-552d-1030-9562-001022fda270', 'Баялинова касымалы ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 231),
('8976ef00-552d-1030-9562-001022fda270', 'Баят рынок, 1 вход', NULL, NULL, NULL, NULL, NULL, 0, NULL, 232),
('8976f088-552d-1030-9562-001022fda270', 'Баят рынок, 2 вход', NULL, NULL, NULL, NULL, NULL, 0, NULL, 233),
('8976f21d-552d-1030-9562-001022fda270', 'Баят рынок, 3 вход', NULL, NULL, NULL, NULL, NULL, 0, NULL, 234),
('8976f3a9-552d-1030-9562-001022fda270', 'Баят рынок, 4 вход', NULL, NULL, NULL, NULL, NULL, 0, NULL, 235),
('8976f5e9-552d-1030-9562-001022fda270', 'Бегматова с., кара-жыгач ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 236),
('8976f72d-552d-1030-9562-001022fda270', 'Беговой пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 237),
('8976f991-552d-1030-9562-001022fda270', 'Безымянная ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 238),
('8976fb26-552d-1030-9562-001022fda270', 'Бейли-кел ул.,аска-таш  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 239),
('8976fc61-552d-1030-9562-001022fda270', 'Бейшеналиевой ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 240),
('8976fd95-552d-1030-9562-001022fda270', 'Бекбекей  ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 241),
('8976fec5-552d-1030-9562-001022fda270', 'Бекбекей ул.,ак-тилек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 242),
('8977007f-552d-1030-9562-001022fda270', 'Бекет ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 243),
('897701d1-552d-1030-9562-001022fda270', 'Бектенова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 244),
('89770318-552d-1030-9562-001022fda270', 'Белгородская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 245),
('8977044e-552d-1030-9562-001022fda270', 'Белинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 246),
('89770589-552d-1030-9562-001022fda270', 'Белмазар ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 247),
('897706c8-552d-1030-9562-001022fda270', 'Белозерский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 248),
('89770811-552d-1030-9562-001022fda270', 'Беломорский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 249),
('8977095b-552d-1030-9562-001022fda270', 'Белорусская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 250),
('89770aa8-552d-1030-9562-001022fda270', 'Бельская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 251),
('89770d2d-552d-1030-9562-001022fda270', 'Бердибаева ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 252),
('89770ed8-552d-1030-9562-001022fda270', 'Береговая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 253),
('8977103b-552d-1030-9562-001022fda270', 'Береговой пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 254),
('897711a1-552d-1030-9562-001022fda270', 'Березовая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 255),
('8977130f-552d-1030-9562-001022fda270', 'Береке ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 256),
('89771493-552d-1030-9562-001022fda270', 'Берекет рынок, 1 вход', NULL, NULL, NULL, NULL, NULL, 0, NULL, 257),
('8977161a-552d-1030-9562-001022fda270', 'Берекет рынок, 2 вход', NULL, NULL, NULL, NULL, NULL, 0, NULL, 258),
('8977179e-552d-1030-9562-001022fda270', 'Берекет рынок, 3 вход', NULL, NULL, NULL, NULL, NULL, 0, NULL, 259),
('8977191d-552d-1030-9562-001022fda270', 'Берекет рынок, 4 вход', NULL, NULL, NULL, NULL, NULL, 0, NULL, 260),
('89771a99-552d-1030-9562-001022fda270', 'Берекет ул., кара-жыгач ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 261),
('89771cdb-552d-1030-9562-001022fda270', 'Берлибаев а.ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 262),
('89771e22-552d-1030-9562-001022fda270', 'Берликская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 263),
('89772065-552d-1030-9562-001022fda270', 'Берликский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 264),
('897721ff-552d-1030-9562-001022fda270', 'Беш-кунгейский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 265),
('89772343-552d-1030-9562-001022fda270', 'Бештектир ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 266),
('8977247c-552d-1030-9562-001022fda270', 'Библиотечный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 267),
('897725b2-552d-1030-9562-001022fda270', 'Бийский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 268),
('897726e8-552d-1030-9562-001022fda270', 'Билим ул., ж/м касым', NULL, NULL, NULL, NULL, NULL, 0, NULL, 269),
('89772824-552d-1030-9562-001022fda270', 'Биримдик ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 270),
('89772965-552d-1030-9562-001022fda270', 'Бишкек г.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 271),
('89772aa4-552d-1030-9562-001022fda270', 'Бобруйский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 272),
('89772bed-552d-1030-9562-001022fda270', 'Бодайбинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 273),
('89772d37-552d-1030-9562-001022fda270', 'Бозболток ул., ынтымак ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 274),
('89772e8f-552d-1030-9562-001022fda270', 'Бозсалкын ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 275),
('89772fec-552d-1030-9562-001022fda270', 'Боконбаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 276),
('89773154-552d-1030-9562-001022fda270', 'Болотная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 277),
('897733c6-552d-1030-9562-001022fda270', 'Больничный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 278),
('897735ac-552d-1030-9562-001022fda270', 'Боогачы ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 279),
('8977372e-552d-1030-9562-001022fda270', 'Боогачы ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 280),
('897738aa-552d-1030-9562-001022fda270', 'Боомский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 281),
('89773a1d-552d-1030-9562-001022fda270', 'Боровской пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 282),
('89773b91-552d-1030-9562-001022fda270', 'Бородина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 283),
('89773d1d-552d-1030-9562-001022fda270', 'Бос-болток ул.,ынтымак ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 284),
('89773ea7-552d-1030-9562-001022fda270', 'Босого ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 285),
('89774037-552d-1030-9562-001022fda270', 'Босого ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 286),
('897741c1-552d-1030-9562-001022fda270', 'Бот сад', NULL, NULL, NULL, NULL, NULL, 0, NULL, 287),
('89774406-552d-1030-9562-001022fda270', 'Боталиева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 288),
('89774531-552d-1030-9562-001022fda270', 'Боталиева ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 289),
('89774770-552d-1030-9562-001022fda270', 'Ботанический пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 290),
('89774913-552d-1030-9562-001022fda270', 'Братская ул.- абая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 291),
('89774a4c-552d-1030-9562-001022fda270', 'Бреславский переулок', NULL, NULL, NULL, NULL, NULL, 0, NULL, 292),
('89774b6c-552d-1030-9562-001022fda270', 'Брестская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 293),
('89774c8e-552d-1030-9562-001022fda270', 'Бронированная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 294),
('89774db9-552d-1030-9562-001022fda270', 'Брянская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 295),
('89774efb-552d-1030-9562-001022fda270', 'Бугулук ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 296),
('8977503c-552d-1030-9562-001022fda270', 'Буденного ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 297),
('8977517d-552d-1030-9562-001022fda270', 'Булакский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 298),
('897752bc-552d-1030-9562-001022fda270', 'Бурана ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 299),
('897753f5-552d-1030-9562-001022fda270', 'Бурулдайская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 300),
('89775539-552d-1030-9562-001022fda270', 'Буурдинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 301),
('8977567a-552d-1030-9562-001022fda270', 'Буурдинская ул, ж/м буурдинский-тос13', NULL, NULL, NULL, NULL, NULL, 0, NULL, 302),
('897757c9-552d-1030-9562-001022fda270', 'Буурдинская ул.,маданият ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 303),
('89775916-552d-1030-9562-001022fda270', 'Бухарская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 304),
('89775b98-552d-1030-9562-001022fda270', 'Бухарская ул.,ак-босого ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 305),
('89775d4f-552d-1030-9562-001022fda270', 'Бухарский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 306),
('89775eba-552d-1030-9562-001022fda270', 'Валдайская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 307),
('8977602d-552d-1030-9562-001022fda270', 'Варшавская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 308),
('897761a9-552d-1030-9562-001022fda270', 'Васильева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 309),
('89776320-552d-1030-9562-001022fda270', 'Васильевское шоссе', NULL, NULL, NULL, NULL, NULL, 0, NULL, 310),
('8977649c-552d-1030-9562-001022fda270', 'Вднх', NULL, NULL, NULL, NULL, NULL, 0, NULL, 311),
('89776626-552d-1030-9562-001022fda270', 'Великолукская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 312),
('897767bd-552d-1030-9562-001022fda270', 'Верненский тупик', NULL, NULL, NULL, NULL, NULL, 0, NULL, 313),
('89776a00-552d-1030-9562-001022fda270', 'Верхний кок-жар ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 314),
('89776b4f-552d-1030-9562-001022fda270', 'Верхний пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 315),
('89776c85-552d-1030-9562-001022fda270', 'Веселая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 316),
('89776f21-552d-1030-9562-001022fda270', 'Веселый пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 317),
('897770a5-552d-1030-9562-001022fda270', 'Ветеринарная ул.,ынтымак ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 318),
('897771f4-552d-1030-9562-001022fda270', 'Вильямса ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 319),
('89777333-552d-1030-9562-001022fda270', 'Вилюйский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 320),
('89777477-552d-1030-9562-001022fda270', 'Виноградная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 321),
('897775c9-552d-1030-9562-001022fda270', 'Виноградный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 322),
('89777710-552d-1030-9562-001022fda270', 'Винсовхоз ала-тоо', NULL, NULL, NULL, NULL, NULL, 0, NULL, 323),
('8977785c-552d-1030-9562-001022fda270', 'Витебская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 324),
('897779bc-552d-1030-9562-001022fda270', 'Витебская ул.,ак-тилек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 325),
('89777b25-552d-1030-9562-001022fda270', 'Витебский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 326),
('89777c8a-552d-1030-9562-001022fda270', 'Вишневый пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 327),
('89777ded-552d-1030-9562-001022fda270', 'Владимирская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 328),
('89777f5e-552d-1030-9562-001022fda270', 'Власова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 329),
('897781d2-552d-1030-9562-001022fda270', 'Водопроводная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 330),
('897783d4-552d-1030-9562-001022fda270', 'Военный гор.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 331),
('89778569-552d-1030-9562-001022fda270', 'Волгоградская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 332),
('897786ee-552d-1030-9562-001022fda270', 'Волжский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 333),
('8977887d-552d-1030-9562-001022fda270', 'Волковой ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 334),
('89778a1d-552d-1030-9562-001022fda270', 'Вологодский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 335),
('89778bb8-552d-1030-9562-001022fda270', 'Волокаламская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 336),
('89778d69-552d-1030-9562-001022fda270', 'Волоколамская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 337),
('89778f12-552d-1030-9562-001022fda270', 'Волочаевский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 338),
('897790c3-552d-1030-9562-001022fda270', 'Волховская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 339),
('89779324-552d-1030-9562-001022fda270', 'Волынский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 340),
('89779596-552d-1030-9562-001022fda270', 'Воркутинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 341),
('89779757-552d-1030-9562-001022fda270', 'Воровского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 342),
('8977989b-552d-1030-9562-001022fda270', 'Воронежская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 343),
('897799cf-552d-1030-9562-001022fda270', 'Восток-1 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 344),
('89779af4-552d-1030-9562-001022fda270', 'Восток-4 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 345),
('89779c25-552d-1030-9562-001022fda270', 'Восток-5 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 346),
('89779d4d-552d-1030-9562-001022fda270', 'Восток-6 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 347),
('89779e78-552d-1030-9562-001022fda270', 'Восточная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 348),
('89779fa8-552d-1030-9562-001022fda270', 'Вост.промзона', NULL, NULL, NULL, NULL, NULL, 0, NULL, 349),
('8977a0de-552d-1030-9562-001022fda270', 'В/с ала-тоо ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 350),
('8977a233-552d-1030-9562-001022fda270', 'Вятская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 351),
('8977a385-552d-1030-9562-001022fda270', 'Гагарина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 352),
('8977a4da-552d-1030-9562-001022fda270', 'Гагарина ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 353),
('8977a63d-552d-1030-9562-001022fda270', 'Ганди м. ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 354),
('8977a79a-552d-1030-9562-001022fda270', 'Гаражная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 355),
('8977aaf3-552d-1030-9562-001022fda270', 'Гастелло ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 356),
('8977acad-552d-1030-9562-001022fda270', 'Гатчинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 357),
('8977ae20-552d-1030-9562-001022fda270', 'Г.бишкек лермонтова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 358),
('8977af9a-552d-1030-9562-001022fda270', 'Гвардейский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 359),
('8977b113-552d-1030-9562-001022fda270', 'Геологический пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 360),
('8977b28c-552d-1030-9562-001022fda270', 'Герцена ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 361),
('8977b402-552d-1030-9562-001022fda270', 'Главпочтамт а/я.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 362),
('8977b57e-552d-1030-9562-001022fda270', 'Глинки ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 363),
('8977b6fd-552d-1030-9562-001022fda270', 'Глухой пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 364),
('8977b87e-552d-1030-9562-001022fda270', 'Гоголя ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 365),
('8977bac3-552d-1030-9562-001022fda270', 'Гомельский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 366),
('8977bd8f-552d-1030-9562-001022fda270', 'Гончарная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 367),
('8977beff-552d-1030-9562-001022fda270', 'Гончарная 2-я', NULL, NULL, NULL, NULL, NULL, 0, NULL, 368),
('8977c03e-552d-1030-9562-001022fda270', 'Гончарный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 369),
('8977c185-552d-1030-9562-001022fda270', 'Гончарова пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 370),
('8977c2be-552d-1030-9562-001022fda270', 'Гончарова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 371),
('8977c3ee-552d-1030-9562-001022fda270', 'Горный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 372),
('8977c521-552d-1030-9562-001022fda270', 'Городок строителей', NULL, NULL, NULL, NULL, NULL, 0, NULL, 373),
('8977c65d-552d-1030-9562-001022fda270', 'Горького пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 374),
('8977c7af-552d-1030-9562-001022fda270', 'Госипподром ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 375),
('8977c8fe-552d-1030-9562-001022fda270', 'Гражданская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 376),
('8977ca5c-552d-1030-9562-001022fda270', 'Гранитный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 377),
('8977cbb6-552d-1030-9562-001022fda270', 'Грибоедова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 378),
('8977cd13-552d-1030-9562-001022fda270', 'Грозненский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 379),
('8977ce70-552d-1030-9562-001022fda270', 'Гулчоро ул., орок ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 380),
('8977d125-552d-1030-9562-001022fda270', 'Гульчинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 381),
('8977d2ea-552d-1030-9562-001022fda270', 'Гурьевский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 382),
('8977d479-552d-1030-9562-001022fda270', 'Дабан ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 383),
('8977d603-552d-1030-9562-001022fda270', 'Дагестанская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 384),
('8977d78d-552d-1030-9562-001022fda270', 'Дальняя ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 385),
('8977d922-552d-1030-9562-001022fda270', 'Дархан ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 386),
('8977dab5-552d-1030-9562-001022fda270', 'Дарханский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 387),
('8977dc44-552d-1030-9562-001022fda270', 'Дастан пер.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 388),
('8977dde1-552d-1030-9562-001022fda270', 'Дастан ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 389),
('8977df8d-552d-1030-9562-001022fda270', 'Дача правительственная', NULL, NULL, NULL, NULL, NULL, 0, NULL, 390),
('8977e146-552d-1030-9562-001022fda270', 'Дачная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 391),
('8977e50d-552d-1030-9562-001022fda270', 'Дачная ул.,учкун ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 392),
('8977e68c-552d-1030-9562-001022fda270', 'Дачный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 393),
('8977e7c7-552d-1030-9562-001022fda270', 'Двинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 394),
('8977e8fd-552d-1030-9562-001022fda270', 'Демократический пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 395),
('8977ea33-552d-1030-9562-001022fda270', 'Деповская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 396),
('8977eb7a-552d-1030-9562-001022fda270', 'Дербентский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 397),
('8977eccc-552d-1030-9562-001022fda270', 'Джакыпова', NULL, NULL, NULL, NULL, NULL, 0, NULL, 398),
('8977ee1e-552d-1030-9562-001022fda270', 'Джал м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 399),
('8977ef70-552d-1030-9562-001022fda270', 'Джал 15 м/н', NULL, NULL, NULL, NULL, NULL, 0, NULL, 400),
('8977f0bd-552d-1030-9562-001022fda270', 'Джал 23 мкр.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 401),
('8977f212-552d-1030-9562-001022fda270', 'Джал 29 м/н', NULL, NULL, NULL, NULL, NULL, 0, NULL, 402),
('8977f369-552d-1030-9562-001022fda270', 'Джал 30 м/н', NULL, NULL, NULL, NULL, NULL, 0, NULL, 403),
('8977f4c4-552d-1030-9562-001022fda270', 'Джалал абадская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 404),
('8977f738-552d-1030-9562-001022fda270', 'Джаманбаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 405),
('8977f927-552d-1030-9562-001022fda270', 'Джамбула пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 406),
('8977fab1-552d-1030-9562-001022fda270', 'Джамбула ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 407),
('8977fc27-552d-1030-9562-001022fda270', 'Джамгерчинова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 408),
('8977fda0-552d-1030-9562-001022fda270', 'Джамзинбаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 409),
('8977ff11-552d-1030-9562-001022fda270', 'Джантошева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 410),
('89780090-552d-1030-9562-001022fda270', 'Джергаланский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 411),
('89780200-552d-1030-9562-001022fda270', 'Джергетал ул.,  ак-телек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 412),
('8978037a-552d-1030-9562-001022fda270', 'Джетыогузская ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 413),
('89780509-552d-1030-9562-001022fda270', 'Джетыогузский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 414),
('897806a7-552d-1030-9562-001022fda270', 'Джольский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 415),
('89780847-552d-1030-9562-001022fda270', 'Джумгальский пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 416);
INSERT INTO `aknet_street` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `street_id`) VALUES
('89780b28-552d-1030-9562-001022fda270', 'Джунусалиева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 417),
('89780de3-552d-1030-9562-001022fda270', 'Дзержинского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 418),
('89780f3a-552d-1030-9562-001022fda270', 'Дзержинского ул.,ак-тилек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 419),
('89781070-552d-1030-9562-001022fda270', 'Димитрова пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 420),
('897811ac-552d-1030-9562-001022fda270', 'Димитрова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 421),
('897812f6-552d-1030-9562-001022fda270', 'Добролюбова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 422),
('8978143d-552d-1030-9562-001022fda270', 'Долон пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 423),
('89781583-552d-1030-9562-001022fda270', 'Долон ул.,алтын-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 424),
('897816d8-552d-1030-9562-001022fda270', 'Долонский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 425),
('8978182d-552d-1030-9562-001022fda270', 'Дом отдыха', NULL, NULL, NULL, NULL, NULL, 0, NULL, 426),
('8978197f-552d-1030-9562-001022fda270', 'Дом правительства', NULL, NULL, NULL, NULL, NULL, 0, NULL, 427),
('89781ace-552d-1030-9562-001022fda270', 'Дома мпс', NULL, NULL, NULL, NULL, NULL, 0, NULL, 428),
('89781c23-552d-1030-9562-001022fda270', 'Донской пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 429),
('89781eb9-552d-1030-9562-001022fda270', 'Дордой ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 430),
('8978206d-552d-1030-9562-001022fda270', 'Дордой рынок', NULL, NULL, NULL, NULL, NULL, 0, NULL, 431),
('897821f1-552d-1030-9562-001022fda270', 'Дордой-автозапчасти рынок', NULL, NULL, NULL, NULL, NULL, 0, NULL, 432),
('8978235a-552d-1030-9562-001022fda270', 'Дородой ул., кара-жыгач ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 433),
('897824c8-552d-1030-9562-001022fda270', 'Дорожная ул.пдэу', NULL, NULL, NULL, NULL, NULL, 0, NULL, 434),
('89782641-552d-1030-9562-001022fda270', 'Дорожный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 435),
('897827c5-552d-1030-9562-001022fda270', 'Достан ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 436),
('8978294f-552d-1030-9562-001022fda270', 'Достоевского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 437),
('89782ad9-552d-1030-9562-001022fda270', 'Достоевского ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 438),
('89782c74-552d-1030-9562-001022fda270', 'Достук м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 439),
('89782e0e-552d-1030-9562-001022fda270', 'Достук ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 440),
('89782fbd-552d-1030-9562-001022fda270', 'Древесная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 441),
('89783335-552d-1030-9562-001022fda270', 'Дрогобычский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 442),
('8978352f-552d-1030-9562-001022fda270', 'Дубосековская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 443),
('897837a0-552d-1030-9562-001022fda270', 'Дубосековский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 444),
('897838e5-552d-1030-9562-001022fda270', 'Дунайский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 445),
('89783a2e-552d-1030-9562-001022fda270', 'Дунганский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 446),
('89783b6a-552d-1030-9562-001022fda270', 'Дыйкан ул., ж/м керемет', NULL, NULL, NULL, NULL, NULL, 0, NULL, 447),
('89783cab-552d-1030-9562-001022fda270', 'Дэн сяопина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 448),
('89783dfa-552d-1030-9562-001022fda270', 'Елебесова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 449),
('89783f3e-552d-1030-9562-001022fda270', 'Елецкий пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 450),
('8978408b-552d-1030-9562-001022fda270', 'Енисейский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 451),
('897841d2-552d-1030-9562-001022fda270', 'Ереванская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 452),
('8978430d-552d-1030-9562-001022fda270', 'Жабрын баатыр ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 453),
('89784571-552d-1030-9562-001022fda270', 'Жаз ул.,алтын-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 454),
('89784755-552d-1030-9562-001022fda270', 'Жайзыйра ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 455),
('897848e4-552d-1030-9562-001022fda270', 'Жайыл баатыра ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 456),
('89784a55-552d-1030-9562-001022fda270', 'Жайыл баатыра ул., арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 457),
('89784bd9-552d-1030-9562-001022fda270', 'Жайылма ул.,аска-таш  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 458),
('89784d4d-552d-1030-9562-001022fda270', 'Жаны конуш ул.,жаны-конуш ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 459),
('89784ece-552d-1030-9562-001022fda270', 'Жаны мырза ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 460),
('89785058-552d-1030-9562-001022fda270', 'Жаны-конуштун ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 461),
('897851e2-552d-1030-9562-001022fda270', 'Жаныл мырза ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 462),
('89785371-552d-1030-9562-001022fda270', 'Жанылык ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 463),
('89785507-552d-1030-9562-001022fda270', 'Жанылык ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 464),
('897856ce-552d-1030-9562-001022fda270', 'Жаштык ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 465),
('897859d7-552d-1030-9562-001022fda270', 'Жданова пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 466),
('89785bb1-552d-1030-9562-001022fda270', 'Ж-дор.вокзал', NULL, NULL, NULL, NULL, NULL, 0, NULL, 467),
('89785d6e-552d-1030-9562-001022fda270', 'Железнодорожный вокзал', NULL, NULL, NULL, NULL, NULL, 0, NULL, 468),
('89785f2f-552d-1030-9562-001022fda270', 'Женижок пер.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 469),
('897861aa-552d-1030-9562-001022fda270', 'Женижок ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 470),
('89786307-552d-1030-9562-001022fda270', 'Жерге-тал пер, саламалик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 471),
('89786453-552d-1030-9562-001022fda270', 'Жерге-тал ул.,саламалик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 472),
('8978659a-552d-1030-9562-001022fda270', 'Жетиген ул., кара-жыгач ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 473),
('897866e1-552d-1030-9562-001022fda270', 'Жетиген ул,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 474),
('8978683b-552d-1030-9562-001022fda270', 'Жетиген ул.,ынтымак ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 475),
('897869a7-552d-1030-9562-001022fda270', 'Жеткинчек пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 476),
('89786b1a-552d-1030-9562-001022fda270', 'Жеткинчек ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 477),
('89786df0-552d-1030-9562-001022fda270', 'Жибек-жолу пр', NULL, NULL, NULL, NULL, NULL, 0, NULL, 478),
('89786f91-552d-1030-9562-001022fda270', 'Жийделуу ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 479),
('89787104-552d-1030-9562-001022fda270', 'Жилгор. совмина', NULL, NULL, NULL, NULL, NULL, 0, NULL, 480),
('89787272-552d-1030-9562-001022fda270', 'Жил_город', NULL, NULL, NULL, NULL, NULL, 0, NULL, 481),
('897873dd-552d-1030-9562-001022fda270', 'Жолон ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 482),
('89787554-552d-1030-9562-001022fda270', 'Жоогазын ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 483),
('897876d5-552d-1030-9562-001022fda270', 'Жоон-добо ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 484),
('8978785c-552d-1030-9562-001022fda270', 'Ж.пудовкина', NULL, NULL, NULL, NULL, NULL, 0, NULL, 485),
('897879db-552d-1030-9562-001022fda270', 'Жуковского пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 486),
('89787b65-552d-1030-9562-001022fda270', 'Жулдубай ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 487),
('89787cf5-552d-1030-9562-001022fda270', 'Жумабек ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 488),
('89787e7e-552d-1030-9562-001022fda270', 'Журнальная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 489),
('8978816e-552d-1030-9562-001022fda270', 'Жыдейлуу ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 490),
('89788357-552d-1030-9562-001022fda270', 'Жылга-сай ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 491),
('89788516-552d-1030-9562-001022fda270', 'Жылдыз ул.,саламалик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 492),
('897886ca-552d-1030-9562-001022fda270', 'Жээк ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 493),
('89788880-552d-1030-9562-001022fda270', 'Заводской пос.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 494),
('89788a48-552d-1030-9562-001022fda270', 'Загородная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 495),
('89788cbc-552d-1030-9562-001022fda270', 'Загорская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 496),
('89788e14-552d-1030-9562-001022fda270', 'Зайсанский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 497),
('89788f5b-552d-1030-9562-001022fda270', 'Заман ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 498),
('897890af-552d-1030-9562-001022fda270', 'Западная промзона', NULL, NULL, NULL, NULL, NULL, 0, NULL, 499),
('89789218-552d-1030-9562-001022fda270', 'Западная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 500),
('897894dd-552d-1030-9562-001022fda270', 'Западный автовакзал', NULL, NULL, NULL, NULL, NULL, 0, NULL, 501),
('89789683-552d-1030-9562-001022fda270', 'Западный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 502),
('897897e6-552d-1030-9562-001022fda270', 'Запад-1 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 503),
('89789938-552d-1030-9562-001022fda270', 'Запад-2 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 504),
('89789a7f-552d-1030-9562-001022fda270', 'Заречная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 505),
('89789bd9-552d-1030-9562-001022fda270', 'Захарьева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 506),
('89789d39-552d-1030-9562-001022fda270', 'Зеленая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 507),
('89789e99-552d-1030-9562-001022fda270', 'Землеотвалы тэц', NULL, NULL, NULL, NULL, NULL, 0, NULL, 508),
('8978a002-552d-1030-9562-001022fda270', 'Зеравшанский пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 509),
('8978a165-552d-1030-9562-001022fda270', 'Зима ул.,ак-босого ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 510),
('8978a2d5-552d-1030-9562-001022fda270', 'Зулайка ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 511),
('8978a451-552d-1030-9562-001022fda270', 'Зыряновский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 512),
('8978a5cd-552d-1030-9562-001022fda270', 'И.ахунбаева ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 513),
('8978a8de-552d-1030-9562-001022fda270', 'Ибраимова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 514),
('8978aaa0-552d-1030-9562-001022fda270', 'Игарская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 515),
('8978ac43-552d-1030-9562-001022fda270', 'Игембердиева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 516),
('8978ade9-552d-1030-9562-001022fda270', 'Ижевский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 517),
('8978af86-552d-1030-9562-001022fda270', 'Измайловский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 518),
('8978b132-552d-1030-9562-001022fda270', 'Изюмский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 519),
('8978b2e3-552d-1030-9562-001022fda270', 'Илийский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 520),
('8978b486-552d-1030-9562-001022fda270', 'Илим ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 521),
('8978b703-552d-1030-9562-001022fda270', 'Ильменская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 522),
('8978b855-552d-1030-9562-001022fda270', 'Ильменский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 523),
('8978ba89-552d-1030-9562-001022fda270', 'Ильменский пер.,касым ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 524),
('8978bc61-552d-1030-9562-001022fda270', 'Иманкулова ч. ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 525),
('8978bdc7-552d-1030-9562-001022fda270', 'Инструментальный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 526),
('8978bf2c-552d-1030-9562-001022fda270', 'Интергельпо', NULL, NULL, NULL, NULL, NULL, 0, NULL, 527),
('8978c079-552d-1030-9562-001022fda270', 'Интернациональная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 528),
('8978c1ea-552d-1030-9562-001022fda270', 'Интернациональный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 529),
('8978c363-552d-1030-9562-001022fda270', 'Ипподромный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 530),
('8978c4d9-552d-1030-9562-001022fda270', 'Иркутский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 531),
('8978c64a-552d-1030-9562-001022fda270', 'Иртышский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 532),
('8978c7bd-552d-1030-9562-001022fda270', 'Исакеева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 533),
('8978c931-552d-1030-9562-001022fda270', 'Исакеева ул., кара-жыгач ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 534),
('8978cab5-552d-1030-9562-001022fda270', 'Исанова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 535),
('8978cc34-552d-1030-9562-001022fda270', 'Иссык-куль ул., кара-жыгач ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 536),
('8978cf1e-552d-1030-9562-001022fda270', 'Иссык-кульская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 537),
('8978d0fc-552d-1030-9562-001022fda270', 'Исфанский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 538),
('8978d296-552d-1030-9562-001022fda270', 'Исы ахунбаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 539),
('8978d43c-552d-1030-9562-001022fda270', 'Ичке-суу', NULL, NULL, NULL, NULL, NULL, 0, NULL, 540),
('8978d5d7-552d-1030-9562-001022fda270', 'Ишимский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 541),
('8978d774-552d-1030-9562-001022fda270', 'Каарманский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 542),
('8978d925-552d-1030-9562-001022fda270', 'Кавказский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 543),
('8978dacb-552d-1030-9562-001022fda270', 'Каганский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 544),
('8978dc7f-552d-1030-9562-001022fda270', 'Каджисайская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 545),
('8978de2d-552d-1030-9562-001022fda270', 'Каджисайский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 546),
('8978dfde-552d-1030-9562-001022fda270', 'Казакова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 547),
('8978e39f-552d-1030-9562-001022fda270', 'Казан-булак ул.,учкун ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 548),
('8978e53f-552d-1030-9562-001022fda270', 'Казанский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 549),
('8978e6b0-552d-1030-9562-001022fda270', 'Казарма 150-50', NULL, NULL, NULL, NULL, NULL, 0, NULL, 550),
('8978e810-552d-1030-9562-001022fda270', 'Казыбек ул.,касым ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 551),
('8978e970-552d-1030-9562-001022fda270', 'Кайберген ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 552),
('8978eabd-552d-1030-9562-001022fda270', 'Кайназаровой ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 553),
('8978ec1f-552d-1030-9562-001022fda270', 'Кайнар-булак ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 554),
('8978ed8d-552d-1030-9562-001022fda270', 'Кайынды ул.,учкун ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 555),
('8978eef3-552d-1030-9562-001022fda270', 'Калкагар ул., ж/м ынтымак', NULL, NULL, NULL, NULL, NULL, 0, NULL, 556),
('8978f059-552d-1030-9562-001022fda270', 'Калмурзаева ул., кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 557),
('8978f1c4-552d-1030-9562-001022fda270', 'Калужская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 558),
('8978f329-552d-1030-9562-001022fda270', 'Калыка акиева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 559),
('8978f600-552d-1030-9562-001022fda270', 'Калык-ато рынок', NULL, NULL, NULL, NULL, NULL, 0, NULL, 560),
('8978f7d5-552d-1030-9562-001022fda270', 'Калымский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 561),
('8978f96d-552d-1030-9562-001022fda270', 'Калыс-ордо участок, ж/м калыс-ордо', NULL, NULL, NULL, NULL, NULL, 0, NULL, 562),
('8978fb02-552d-1030-9562-001022fda270', 'Камбар-ата ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 563),
('8978fca2-552d-1030-9562-001022fda270', 'Камбаркан ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 564),
('8978fe40-552d-1030-9562-001022fda270', 'Каменный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 565),
('8978ffe3-552d-1030-9562-001022fda270', 'Камчатская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 566),
('8979018e-552d-1030-9562-001022fda270', 'Камырата ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 567),
('8979033a-552d-1030-9562-001022fda270', 'Кантемировская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 568),
('897904f0-552d-1030-9562-001022fda270', 'Кантский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 569),
('897906a4-552d-1030-9562-001022fda270', 'Канур олен ул.,учкун ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 570),
('89790988-552d-1030-9562-001022fda270', 'Канчоро ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 571),
('89790b8a-552d-1030-9562-001022fda270', 'Каныкей ул,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 572),
('89790d65-552d-1030-9562-001022fda270', 'Кара-алма ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 573),
('89791055-552d-1030-9562-001022fda270', 'Карабайский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 574),
('897911ce-552d-1030-9562-001022fda270', 'Карабалтинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 575),
('89791315-552d-1030-9562-001022fda270', 'Кара-булак ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 576),
('89791450-552d-1030-9562-001022fda270', 'Караванский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 577),
('89791587-552d-1030-9562-001022fda270', 'Карагайский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 578),
('897916bf-552d-1030-9562-001022fda270', 'Карагачевая роща', NULL, NULL, NULL, NULL, NULL, 0, NULL, 579),
('897917f0-552d-1030-9562-001022fda270', 'Карагачевая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 580),
('8979192e-552d-1030-9562-001022fda270', 'Карагачевый пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 581),
('89791a65-552d-1030-9562-001022fda270', 'Карагоо ул., ынтымак ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 582),
('89791d46-552d-1030-9562-001022fda270', 'Карадарьинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 583),
('89791ef4-552d-1030-9562-001022fda270', 'Кара-жыгач ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 584),
('89792068-552d-1030-9562-001022fda270', 'Кара-жыгач пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 585),
('897921d9-552d-1030-9562-001022fda270', 'Кара-кее ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 586),
('8979234f-552d-1030-9562-001022fda270', 'Каракол ул., кара-жыгач ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 587),
('897924c2-552d-1030-9562-001022fda270', 'Каракольский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 588),
('8979262b-552d-1030-9562-001022fda270', 'Кара-коо ул,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 589),
('897927ac-552d-1030-9562-001022fda270', 'Кара-кужур ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 590),
('8979292b-552d-1030-9562-001022fda270', 'Кара-кукур ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 591),
('89792aaa-552d-1030-9562-001022fda270', 'Каракульская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 592),
('89792c2b-552d-1030-9562-001022fda270', 'Каракумская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 593),
('89792db5-552d-1030-9562-001022fda270', 'Каралаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 594),
('897930c9-552d-1030-9562-001022fda270', 'Кара-оток ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 595),
('897932ce-552d-1030-9562-001022fda270', 'Карасаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 596),
('89793492-552d-1030-9562-001022fda270', 'Карасазский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 597),
('89793630-552d-1030-9562-001022fda270', 'Кара-сай ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 598),
('897937e7-552d-1030-9562-001022fda270', 'Карасуйский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 599),
('89793a5b-552d-1030-9562-001022fda270', 'Каратайский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 600),
('89793baa-552d-1030-9562-001022fda270', 'Кара-шоро ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 601),
('89793ce6-552d-1030-9562-001022fda270', 'Каркыра ул., кара-жыгач ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 602),
('89793e49-552d-1030-9562-001022fda270', 'Карпатская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 603),
('89793fb4-552d-1030-9562-001022fda270', 'Карпинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 604),
('8979410e-552d-1030-9562-001022fda270', 'Карский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 605),
('8979439f-552d-1030-9562-001022fda270', 'Карульский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 606),
('897945a1-552d-1030-9562-001022fda270', 'Каспийская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 607),
('8979471a-552d-1030-9562-001022fda270', 'Касым ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 608),
('89794882-552d-1030-9562-001022fda270', 'Каунасский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 609),
('897949dd-552d-1030-9562-001022fda270', 'Каховская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 610),
('89794b3a-552d-1030-9562-001022fda270', 'Каширская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 611),
('89794c95-552d-1030-9562-001022fda270', 'К.датка ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 612),
('89794dec-552d-1030-9562-001022fda270', 'Кедейкан ул.,аска-таш  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 613),
('89794f55-552d-1030-9562-001022fda270', 'Кедровая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 614),
('897950c2-552d-1030-9562-001022fda270', 'Кейгап ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 615),
('89795247-552d-1030-9562-001022fda270', 'Кек-асаба ул.,ак-тилек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 616),
('897953fb-552d-1030-9562-001022fda270', 'Кекемерен ул.,ак-орго ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 617),
('897955a0-552d-1030-9562-001022fda270', 'Кекол пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 618),
('897958c8-552d-1030-9562-001022fda270', 'Кек-сай ул.,саламалик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 619),
('89795a9d-552d-1030-9562-001022fda270', 'Келечек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 620),
('89795c40-552d-1030-9562-001022fda270', 'Келечек ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 621),
('89795de0-552d-1030-9562-001022fda270', 'Келечек-1 ул.,келечек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 622),
('89795f8f-552d-1030-9562-001022fda270', 'Келечек-10 ул.,келечек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 623),
('8979613a-552d-1030-9562-001022fda270', 'Келечек-11 ул.,келечек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 624),
('89796360-552d-1030-9562-001022fda270', 'Келечек-12 ул.,келечек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 625),
('897965f4-552d-1030-9562-001022fda270', 'Келечек-13,келечек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 626),
('8979674e-552d-1030-9562-001022fda270', 'Келечек-2 ул.,келечек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 627),
('8979688a-552d-1030-9562-001022fda270', 'Келечек-3 ул.,келечек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 628),
('89796b34-552d-1030-9562-001022fda270', 'Келечек-4 ул,келечек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 629),
('89796cf5-552d-1030-9562-001022fda270', 'Келечек-5 ул.,келечек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 630),
('89796e52-552d-1030-9562-001022fda270', 'Келечек-6 ул.,келечек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 631),
('89796fb0-552d-1030-9562-001022fda270', 'Келечек-7 ул.,келечек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 632),
('8979710a-552d-1030-9562-001022fda270', 'Келечек-8 ул.,келечек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 633),
('8979725f-552d-1030-9562-001022fda270', 'Келечек-9 ул.,келечек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 634),
('897973bc-552d-1030-9562-001022fda270', 'Кемеровский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 635),
('89797527-552d-1030-9562-001022fda270', 'Кеминская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 636),
('8979768a-552d-1030-9562-001022fda270', 'Кеминский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 637),
('897977ea-552d-1030-9562-001022fda270', 'Кеминский пер, аска-таш ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 638),
('89797966-552d-1030-9562-001022fda270', 'Кенеш пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 639),
('89797ad4-552d-1030-9562-001022fda270', 'Кенеш ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 640),
('89797c50-552d-1030-9562-001022fda270', 'Кен-кол ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 641),
('89797f21-552d-1030-9562-001022fda270', 'Кенсуйская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 642),
('89798112-552d-1030-9562-001022fda270', 'Кен-суу ул,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 643),
('897982cb-552d-1030-9562-001022fda270', 'Кенче ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 644),
('8979846c-552d-1030-9562-001022fda270', 'Кеперо-базар ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 645),
('897985fe-552d-1030-9562-001022fda270', 'Керамическая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 646),
('89798799-552d-1030-9562-001022fda270', 'Кербез ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 647),
('8979893c-552d-1030-9562-001022fda270', 'Кербен рынок', NULL, NULL, NULL, NULL, NULL, 0, NULL, 648),
('89798ad4-552d-1030-9562-001022fda270', 'Кереге-таш ул., кара-жыгач ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 649),
('89798c7f-552d-1030-9562-001022fda270', 'Кереге-тоо ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 650),
('89798e25-552d-1030-9562-001022fda270', 'Керемет ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 651),
('897991c7-552d-1030-9562-001022fda270', 'Керемет ж/м,керемет ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 652),
('897993d1-552d-1030-9562-001022fda270', 'Керемет пер.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 653),
('89799548-552d-1030-9562-001022fda270', 'Керемет ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 654),
('897996b0-552d-1030-9562-001022fda270', 'Керемет ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 655),
('89799821-552d-1030-9562-001022fda270', 'Керимбекова кульчоро ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 656),
('89799970-552d-1030-9562-001022fda270', 'Керме-тоо ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 657),
('89799acb-552d-1030-9562-001022fda270', 'Керченский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 658),
('89799c1d-552d-1030-9562-001022fda270', 'Киевская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 659),
('89799d74-552d-1030-9562-001022fda270', 'Киизбаевой сайры ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 660),
('89799ed4-552d-1030-9562-001022fda270', 'Киргизская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 661),
('8979a02c-552d-1030-9562-001022fda270', 'Киркомстром', NULL, NULL, NULL, NULL, NULL, 0, NULL, 662),
('8979a184-552d-1030-9562-001022fda270', 'Кирова пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 663),
('8979a2e1-552d-1030-9562-001022fda270', 'Кировский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 664),
('8979a552-552d-1030-9562-001022fda270', 'Кирпичная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 665),
('8979a776-552d-1030-9562-001022fda270', 'Кирпичный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 666),
('8979a91f-552d-1030-9562-001022fda270', 'Кисловодский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 667),
('8979aaae-552d-1030-9562-001022fda270', 'Кишиневская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 668),
('8979ac35-552d-1030-9562-001022fda270', 'Кленовый пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 669),
('8979adca-552d-1030-9562-001022fda270', 'К.либкнехта ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 670),
('8979af5d-552d-1030-9562-001022fda270', 'Клинский пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 671),
('8979b0e9-552d-1030-9562-001022fda270', 'Клубный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 672),
('8979b27c-552d-1030-9562-001022fda270', 'Коенкозова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 673),
('8979b411-552d-1030-9562-001022fda270', 'Кожевенная', NULL, NULL, NULL, NULL, NULL, 0, NULL, 674),
('8979b5b4-552d-1030-9562-001022fda270', 'Кожобергенова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 675),
('8979b754-552d-1030-9562-001022fda270', 'Кожожаш ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 676),
('8979bab6-552d-1030-9562-001022fda270', 'Кожомкула ул.,аска-таш  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 677),
('8979bd6e-552d-1030-9562-001022fda270', 'Кожомкула ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 678),
('8979bee4-552d-1030-9562-001022fda270', 'Кожсырьевая база', NULL, NULL, NULL, NULL, NULL, 0, NULL, 679),
('8979c03e-552d-1030-9562-001022fda270', 'Козу-баглан ул.,алтын-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 680),
('8979c18b-552d-1030-9562-001022fda270', 'Козу-баглан ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 681),
('8979c2e5-552d-1030-9562-001022fda270', 'Козу-балган ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 682),
('8979c435-552d-1030-9562-001022fda270', 'Койбагарова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 683),
('8979c592-552d-1030-9562-001022fda270', 'Кой-сары ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 684),
('8979c6ef-552d-1030-9562-001022fda270', 'Койташский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 685),
('8979c841-552d-1030-9562-001022fda270', 'Кок жайык ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 686),
('8979c996-552d-1030-9562-001022fda270', 'Кок жайык ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 687),
('8979caf9-552d-1030-9562-001022fda270', 'Кок жангак ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 688),
('8979ce04-552d-1030-9562-001022fda270', 'Кок жангак ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 689),
('8979cfaa-552d-1030-9562-001022fda270', 'Кокандский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 690),
('8979d139-552d-1030-9562-001022fda270', 'Кок-джар м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 691),
('8979d2c0-552d-1030-9562-001022fda270', 'Кок-джар ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 692),
('8979d442-552d-1030-9562-001022fda270', 'Кок-джарская', NULL, NULL, NULL, NULL, NULL, 0, NULL, 693),
('8979d5b8-552d-1030-9562-001022fda270', 'Кок-добо ул,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 694),
('8979d73d-552d-1030-9562-001022fda270', 'Кок-жар новостр.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 695),
('8979d8cc-552d-1030-9562-001022fda270', 'Кок-жар ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 696),
('8979da5e-552d-1030-9562-001022fda270', 'Кок-кыя ул., ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 697),
('8979dbee-552d-1030-9562-001022fda270', 'Кок-кыял ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 698),
('8979dd8e-552d-1030-9562-001022fda270', 'Кок-ой ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 699),
('8979e0b3-552d-1030-9562-001022fda270', 'Кокомерен ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 700),
('8979e2ed-552d-1030-9562-001022fda270', 'Кок-сай ул.,саламалик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 701),
('8979e4b7-552d-1030-9562-001022fda270', 'Кок-талаа ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 702),
('8979e67b-552d-1030-9562-001022fda270', 'Кокчетавская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 703),
('8979e906-552d-1030-9562-001022fda270', 'Кокчетавская ул.,саламалик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 704),
('8979ea77-552d-1030-9562-001022fda270', 'Кокчетавский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 705),
('8979ebc1-552d-1030-9562-001022fda270', 'Кокчо,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 706),
('8979ed0a-552d-1030-9562-001022fda270', 'Коллективная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 707),
('8979ee62-552d-1030-9562-001022fda270', 'Коллективная ул., ак-тилек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 708),
('8979efbc-552d-1030-9562-001022fda270', 'Коллекторная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 709),
('8979f11f-552d-1030-9562-001022fda270', 'Коллекторный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 710),
('8979f3a2-552d-1030-9562-001022fda270', 'Колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 711),
('8979f5a7-552d-1030-9562-001022fda270', 'Колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 712),
('8979f72b-552d-1030-9562-001022fda270', 'Колхозная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 713),
('8979f893-552d-1030-9562-001022fda270', 'Кольбаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 714),
('8979f9fe-552d-1030-9562-001022fda270', 'Кольмо ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 715),
('8979fb86-552d-1030-9562-001022fda270', 'Кольский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 716),
('8979fd04-552d-1030-9562-001022fda270', 'Кольцевая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 717),
('8979fe7b-552d-1030-9562-001022fda270', 'Коммунаров ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 718),
('8979fff9-552d-1030-9562-001022fda270', 'Коммунарская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 719),
('897a0189-552d-1030-9562-001022fda270', 'Коммунистическая остановка', NULL, NULL, NULL, NULL, NULL, 0, NULL, 720),
('897a032c-552d-1030-9562-001022fda270', 'Комсомольская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 721),
('897a04c9-552d-1030-9562-001022fda270', 'Комсомольская ул.,монолит ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 722),
('897a07e3-552d-1030-9562-001022fda270', 'Комсомольский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 723),
('897a09e8-552d-1030-9562-001022fda270', 'Комсомольский пос.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 724),
('897a0b99-552d-1030-9562-001022fda270', 'Комсомольский тупик', NULL, NULL, NULL, NULL, NULL, 0, NULL, 725),
('897a0d4f-552d-1030-9562-001022fda270', 'Комсомольское озеро', NULL, NULL, NULL, NULL, NULL, 0, NULL, 726),
('897a0f03-552d-1030-9562-001022fda270', 'Конорчок пер.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 727),
('897a10ba-552d-1030-9562-001022fda270', 'Конорчок ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 728),
('897a1289-552d-1030-9562-001022fda270', 'Конур олон,учкун ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 729),
('897a1533-552d-1030-9562-001022fda270', 'Коперника ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 730),
('897a16ba-552d-1030-9562-001022fda270', 'Копуро базар ул., арча-бейшик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 731),
('897a1825-552d-1030-9562-001022fda270', 'Корейская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 732),
('897a1aa5-552d-1030-9562-001022fda270', 'Короткая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 733),
('897a1c94-552d-1030-9562-001022fda270', 'Корпуса ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 734),
('897a1e07-552d-1030-9562-001022fda270', 'Космическая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 735),
('897a1f75-552d-1030-9562-001022fda270', 'Космодемьянская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 736),
('897a20e3-552d-1030-9562-001022fda270', 'Костромской пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 737),
('897a2254-552d-1030-9562-001022fda270', 'Кот-арт ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 738),
('897a23c2-552d-1030-9562-001022fda270', 'Котовского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 739),
('897a2527-552d-1030-9562-001022fda270', 'Кочина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 740),
('897a26a9-552d-1030-9562-001022fda270', 'Кочкор-ата ул.,орок ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 741),
('897a2828-552d-1030-9562-001022fda270', 'Кочкорская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 742),
('897a29ac-552d-1030-9562-001022fda270', 'Кошевого о.ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 743),
('897a2b41-552d-1030-9562-001022fda270', 'Кошой ул., ж/м бакай-ата', NULL, NULL, NULL, NULL, NULL, 0, NULL, 744),
('897a2deb-552d-1030-9562-001022fda270', 'Крайняя ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 745),
('897a3032-552d-1030-9562-001022fda270', 'Красная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 746),
('897a31ef-552d-1030-9562-001022fda270', 'Красноводский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 747),
('897a3397-552d-1030-9562-001022fda270', 'Краснодарская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 748),
('897a353d-552d-1030-9562-001022fda270', 'Краснодонцев ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 749),
('897a36e3-552d-1030-9562-001022fda270', 'Краснознаменный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 750),
('897a3880-552d-1030-9562-001022fda270', 'Красностроительная ул., ж/м городок', NULL, NULL, NULL, NULL, NULL, 0, NULL, 751),
('897a3a34-552d-1030-9562-001022fda270', 'Краснофлотский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 752),
('897a3bf0-552d-1030-9562-001022fda270', 'Красноярский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 753),
('897a3db2-552d-1030-9562-001022fda270', 'Красный строитель пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 754),
('897a3f85-552d-1030-9562-001022fda270', 'Красный строитель 2', NULL, NULL, NULL, NULL, NULL, 0, NULL, 755),
('897a4367-552d-1030-9562-001022fda270', 'Кривоносова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 756),
('897a4513-552d-1030-9562-001022fda270', 'Кривоносова ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 757),
('897a4673-552d-1030-9562-001022fda270', 'Криворожская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 758),
('897a47c5-552d-1030-9562-001022fda270', 'Криворожский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 759),
('897a490e-552d-1030-9562-001022fda270', 'Кронштадская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 760),
('897a4a74-552d-1030-9562-001022fda270', 'Крылова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 761),
('897a4bda-552d-1030-9562-001022fda270', 'Крымская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 762),
('897a4d3c-552d-1030-9562-001022fda270', 'К-сайский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 763),
('897a4ea8-552d-1030-9562-001022fda270', 'Кубанский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 764),
('897a5021-552d-1030-9562-001022fda270', 'Кубаныч ул.,касым ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 765),
('897a51a5-552d-1030-9562-001022fda270', 'Кубинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 766),
('897a535e-552d-1030-9562-001022fda270', 'Кудрука ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 767),
('897a5678-552d-1030-9562-001022fda270', 'Кузбасская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 768),
('897a5858-552d-1030-9562-001022fda270', 'Кузбасский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 769),
('897a59ed-552d-1030-9562-001022fda270', 'Кузнечная крепость', NULL, NULL, NULL, NULL, NULL, 0, NULL, 770),
('897a5b77-552d-1030-9562-001022fda270', 'Кузнечный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 771),
('897a5d07-552d-1030-9562-001022fda270', 'Кузнечный проезд', NULL, NULL, NULL, NULL, NULL, 0, NULL, 772),
('897a5e91-552d-1030-9562-001022fda270', 'Куйбышева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 773),
('897a601d-552d-1030-9562-001022fda270', 'Куйручук ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 774),
('897a61b2-552d-1030-9562-001022fda270', 'Куйручук ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 775),
('897a634a-552d-1030-9562-001022fda270', 'Куйукова ул, арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 776),
('897a64e8-552d-1030-9562-001022fda270', 'Кукурузный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 777),
('897a6685-552d-1030-9562-001022fda270', 'Куланак ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 778),
('897a6980-552d-1030-9562-001022fda270', 'Куланак ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 779),
('897a6b9b-552d-1030-9562-001022fda270', 'Кулатова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 780),
('897a6d79-552d-1030-9562-001022fda270', 'Кулиева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 781),
('897a6ffb-552d-1030-9562-001022fda270', 'Кулиева ул., ж/м кольмо', NULL, NULL, NULL, NULL, NULL, 0, NULL, 782),
('897a7175-552d-1030-9562-001022fda270', 'Куликовская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 783),
('897a72d5-552d-1030-9562-001022fda270', 'Кулмурзаева о. ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 784),
('897a743d-552d-1030-9562-001022fda270', 'Култегин ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 785),
('897a75a2-552d-1030-9562-001022fda270', 'Кулчоро ул.,орок ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 786),
('897a7710-552d-1030-9562-001022fda270', 'Кумарыкская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 787),
('897a788c-552d-1030-9562-001022fda270', 'Кумбельский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 788),
('897a7a08-552d-1030-9562-001022fda270', 'Кун ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 789),
('897a7d0e-552d-1030-9562-001022fda270', 'Кунгей ул.,саламалик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 790),
('897a7ee6-552d-1030-9562-001022fda270', 'Купянская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 791),
('897a807b-552d-1030-9562-001022fda270', 'Курганская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 792),
('897a820b-552d-1030-9562-001022fda270', 'Куренкеева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 793),
('897a8392-552d-1030-9562-001022fda270', 'Курманалиева к. ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 794),
('897a8511-552d-1030-9562-001022fda270', 'Курманжан датка ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 795),
('897a86a0-552d-1030-9562-001022fda270', 'Курманжан датка ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 796),
('897a8849-552d-1030-9562-001022fda270', 'Курский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 797),
('897a89ec-552d-1030-9562-001022fda270', 'Курултай ул.,ынтымак ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 798),
('897a8b9a-552d-1030-9562-001022fda270', 'Курулуш ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 799),
('897a8d61-552d-1030-9562-001022fda270', 'Курчатова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 800),
('897a9065-552d-1030-9562-001022fda270', 'Кустанайская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 801),
('897a925b-552d-1030-9562-001022fda270', 'Кустанайский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 802),
('897a94a6-552d-1030-9562-001022fda270', 'Куттубаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 803),
('897a9684-552d-1030-9562-001022fda270', 'Кутузова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 804),
('897a985c-552d-1030-9562-001022fda270', 'Куюкова ул., арча - бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 805),
('897a9a23-552d-1030-9562-001022fda270', 'Кыбыла ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 806),
('897a9bf0-552d-1030-9562-001022fda270', 'Кыз сайкал ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 807),
('897a9e8c-552d-1030-9562-001022fda270', 'Кызгалдак ул,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 808),
('897aa00b-552d-1030-9562-001022fda270', 'Кызыл суу пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 809),
('897aa168-552d-1030-9562-001022fda270', 'Кызыл-адыр ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 810),
('897aa465-552d-1030-9562-001022fda270', 'Кызыл-алма ул.,саламалик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 811),
('897aa62f-552d-1030-9562-001022fda270', 'Кызыл-аскерская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 812),
('897aa7a3-552d-1030-9562-001022fda270', 'Кызыл-кийская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 813),
('897aa906-552d-1030-9562-001022fda270', 'Кызыл-омпол ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 814),
('897aaa79-552d-1030-9562-001022fda270', 'Кызыл-ординский пер .', NULL, NULL, NULL, NULL, NULL, 0, NULL, 815),
('897aabea-552d-1030-9562-001022fda270', 'Кызыл-суу ул.,алтын-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 816),
('897aad5e-552d-1030-9562-001022fda270', 'Кызыл-тоо ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 817),
('897aaf0f-552d-1030-9562-001022fda270', 'Кыргызстан ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 818),
('897ab0bd-552d-1030-9562-001022fda270', 'Кыргыл-чал ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 819),
('897ab24c-552d-1030-9562-001022fda270', 'Кырк гуз ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 820),
('897ab3d4-552d-1030-9562-001022fda270', 'Кырк кербен ул.,орок ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 821),
('897ab54f-552d-1030-9562-001022fda270', 'Кырк-кыз ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 822),
('897ab88d-552d-1030-9562-001022fda270', 'Кырк-чоро ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 823),
('897aba8f-552d-1030-9562-001022fda270', 'Кырк-чоро ул.,ак-тилек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 824),
('897abc46-552d-1030-9562-001022fda270', 'Кырман ул.,ынтымак ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 825),
('897abdec-552d-1030-9562-001022fda270', 'Кырчын ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 826);
INSERT INTO `aknet_street` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `street_id`) VALUES
('897abf94-552d-1030-9562-001022fda270', 'Кыял ул., ж/м верхний кок-жар', NULL, NULL, NULL, NULL, NULL, 0, NULL, 827),
('897ac153-552d-1030-9562-001022fda270', 'Лагерная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 828),
('897ac318-552d-1030-9562-001022fda270', 'Лагерный пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 829),
('897ac4d7-552d-1030-9562-001022fda270', 'Ладожская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 830),
('897ac69b-552d-1030-9562-001022fda270', 'Лазурный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 831),
('897ac866-552d-1030-9562-001022fda270', 'Лебедева-кумача ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 832),
('897acbba-552d-1030-9562-001022fda270', 'Леваневского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 833),
('897aceb7-552d-1030-9562-001022fda270', 'Ленинобадская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 834),
('897ad030-552d-1030-9562-001022fda270', 'Ленинпольский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 835),
('897ad193-552d-1030-9562-001022fda270', 'Ленинский пр.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 836),
('897ad2f9-552d-1030-9562-001022fda270', 'Ленская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 837),
('897ad461-552d-1030-9562-001022fda270', 'Ленский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 838),
('897ad5da-552d-1030-9562-001022fda270', 'Лермонтова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 839),
('897ad767-552d-1030-9562-001022fda270', 'Лесная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 840),
('897ad8e6-552d-1030-9562-001022fda270', 'Лесхозная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 841),
('897ada61-552d-1030-9562-001022fda270', 'Литвинова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 842),
('897adbe6-552d-1030-9562-001022fda270', 'Литейная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 843),
('897aded3-552d-1030-9562-001022fda270', 'Лихачева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 844),
('897ae0c1-552d-1030-9562-001022fda270', 'Логвиненко пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 845),
('897ae26c-552d-1030-9562-001022fda270', 'Логвиненко ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 846),
('897ae40a-552d-1030-9562-001022fda270', 'Ломоносова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 847),
('897ae5b0-552d-1030-9562-001022fda270', 'Л.толстого ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 848),
('897ae753-552d-1030-9562-001022fda270', 'Луганская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 849),
('897ae8fb-552d-1030-9562-001022fda270', 'Луговая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 850),
('897aeaaf-552d-1030-9562-001022fda270', 'Луговой пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 851),
('897aec66-552d-1030-9562-001022fda270', 'Луначарского пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 852),
('897aee1f-552d-1030-9562-001022fda270', 'Луначарского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 853),
('897aefde-552d-1030-9562-001022fda270', 'Луцкий пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 854),
('897af335-552d-1030-9562-001022fda270', 'Лущихина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 855),
('897af55b-552d-1030-9562-001022fda270', 'Львовский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 856),
('897af739-552d-1030-9562-001022fda270', 'Льдопункт', NULL, NULL, NULL, NULL, NULL, 0, NULL, 857),
('897af917-552d-1030-9562-001022fda270', 'Ляйлякский пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 858),
('897afb05-552d-1030-9562-001022fda270', 'М. алыбаева, ж/м кольмо', NULL, NULL, NULL, NULL, NULL, 0, NULL, 859),
('897afe08-552d-1030-9562-001022fda270', 'Магаданская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 860),
('897aff63-552d-1030-9562-001022fda270', 'Магистральная ул., ж/м ынтымак', NULL, NULL, NULL, NULL, NULL, 0, NULL, 861),
('897b00c3-552d-1030-9562-001022fda270', 'Магнитогорский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 862),
('897b0212-552d-1030-9562-001022fda270', 'Маданият ул.,касым ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 863),
('897b0364-552d-1030-9562-001022fda270', 'Мадиева ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 864),
('897b061e-552d-1030-9562-001022fda270', 'Мажурум-тал ул.,ак-тилек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 865),
('897b07c7-552d-1030-9562-001022fda270', 'Майкопский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 866),
('897b092f-552d-1030-9562-001022fda270', 'Майли-сайский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 867),
('897b0a8a-552d-1030-9562-001022fda270', 'Маймак ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 868),
('897b0bdf-552d-1030-9562-001022fda270', 'Маймакский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 869),
('897b0d2e-552d-1030-9562-001022fda270', 'Майрам ул., верхний кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 870),
('897b0e91-552d-1030-9562-001022fda270', 'Макеевский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 871),
('897b0ff4-552d-1030-9562-001022fda270', 'Макмал ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 872),
('897b1175-552d-1030-9562-001022fda270', 'Максат ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 873),
('897b12f9-552d-1030-9562-001022fda270', 'Малдыбаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 874),
('897b146a-552d-1030-9562-001022fda270', 'Маликова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 875),
('897b15e9-552d-1030-9562-001022fda270', 'Малиновая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 876),
('897b1860-552d-1030-9562-001022fda270', 'Малышева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 877),
('897b1ab6-552d-1030-9562-001022fda270', 'Мамбетова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 878),
('897b1c64-552d-1030-9562-001022fda270', 'Мамыры ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 879),
('897b1df9-552d-1030-9562-001022fda270', 'Манас айылы ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 880),
('897b1f94-552d-1030-9562-001022fda270', 'Манас а/порт', NULL, NULL, NULL, NULL, NULL, 0, NULL, 881),
('897b212c-552d-1030-9562-001022fda270', 'Манаса ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 882),
('897b22d5-552d-1030-9562-001022fda270', 'Манаса ул., кара-жыгач ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 883),
('897b2486-552d-1030-9562-001022fda270', 'Манаса ул.,ак-босого ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 884),
('897b262b-552d-1030-9562-001022fda270', 'Манасчи сагынбая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 885),
('897b28b1-552d-1030-9562-001022fda270', 'Манасчи ул,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 886),
('897b2a2a-552d-1030-9562-001022fda270', 'Марата ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 887),
('897b2cce-552d-1030-9562-001022fda270', 'Мариупольский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 888),
('897b2e5b-552d-1030-9562-001022fda270', 'Марыйский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 889),
('897b2faa-552d-1030-9562-001022fda270', 'Масыралиева ул.,  ала-арча ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 890),
('897b3107-552d-1030-9562-001022fda270', 'Матисакова ул., ж/м арча-бешик (ала-арча)', NULL, NULL, NULL, NULL, NULL, 0, NULL, 891),
('897b326f-552d-1030-9562-001022fda270', 'Матросова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 892),
('897b33cf-552d-1030-9562-001022fda270', 'Матыева э. профессора ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 893),
('897b3540-552d-1030-9562-001022fda270', 'Махатма ганди ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 894),
('897b36b1-552d-1030-9562-001022fda270', 'Маяковского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 895),
('897b381c-552d-1030-9562-001022fda270', 'Горького ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 896),
('897b398a-552d-1030-9562-001022fda270', 'М.джалиля ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 897),
('897b3aea-552d-1030-9562-001022fda270', 'Медерова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 898),
('897b3c55-552d-1030-9562-001022fda270', 'Менделеева пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 899),
('897b3dc0-552d-1030-9562-001022fda270', 'Менделеева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 900),
('897b40c4-552d-1030-9562-001022fda270', 'Месароша ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 901),
('897b4293-552d-1030-9562-001022fda270', 'Месароша ул, аска-таш ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 902),
('897b443f-552d-1030-9562-001022fda270', 'Месароша ул., керемет ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 903),
('897b45d7-552d-1030-9562-001022fda270', 'Механический пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 904),
('897b475e-552d-1030-9562-001022fda270', 'Мечникова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 905),
('897b48ed-552d-1030-9562-001022fda270', 'Мидина ул.,алтын-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 906),
('897b4a8b-552d-1030-9562-001022fda270', 'Мидина ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 907),
('897b4c30-552d-1030-9562-001022fda270', 'Мин-булак ул.,учкун ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 908),
('897b4dd6-552d-1030-9562-001022fda270', 'Минбулакский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 909),
('897b4f7f-552d-1030-9562-001022fda270', 'Минжилкиева б. ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 910),
('897b5130-552d-1030-9562-001022fda270', 'Минина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 911),
('897b54f9-552d-1030-9562-001022fda270', 'Мин-куш ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 912),
('897b56ad-552d-1030-9562-001022fda270', 'Минская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 913),
('897b5802-552d-1030-9562-001022fda270', 'Мира ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 914),
('897b5951-552d-1030-9562-001022fda270', 'Мира пр.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 915),
('897b5aa6-552d-1030-9562-001022fda270', 'Мира ул.,ала-арча ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 916),
('897b5bfe-552d-1030-9562-001022fda270', 'Мирный м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 917),
('897b5d4d-552d-1030-9562-001022fda270', 'Мирный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 918),
('897b5ea2-552d-1030-9562-001022fda270', 'Мичурина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 919),
('897b6007-552d-1030-9562-001022fda270', 'Мичурина ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 920),
('897b6170-552d-1030-9562-001022fda270', 'Можайского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 921),
('897b62de-552d-1030-9562-001022fda270', 'Можайского ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 922),
('897b6454-552d-1030-9562-001022fda270', 'Мозолева л.н. ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 923),
('897b670e-552d-1030-9562-001022fda270', 'Мозырский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 924),
('897b6938-552d-1030-9562-001022fda270', 'Молдавский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 925),
('897b6aeb-552d-1030-9562-001022fda270', 'Молдокулова а. ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 926),
('897b6c91-552d-1030-9562-001022fda270', 'Молдо-нияз ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 927),
('897b6e26-552d-1030-9562-001022fda270', 'Молодая гвардия', NULL, NULL, NULL, NULL, NULL, 0, NULL, 928),
('897b6fa2-552d-1030-9562-001022fda270', 'Монгольский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 929),
('897b711e-552d-1030-9562-001022fda270', 'Монолит ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 930),
('897b72a3-552d-1030-9562-001022fda270', 'Московская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 931),
('897b741e-552d-1030-9562-001022fda270', 'Мпс', NULL, NULL, NULL, NULL, NULL, 0, NULL, 932),
('897b75a0-552d-1030-9562-001022fda270', 'Мраморный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 933),
('897b773d-552d-1030-9562-001022fda270', 'Муз-бел ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 934),
('897b78ee-552d-1030-9562-001022fda270', 'Мурас м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 935),
('897b7c27-552d-1030-9562-001022fda270', 'Мурас спорт рынок', NULL, NULL, NULL, NULL, NULL, 0, NULL, 936),
('897b7e04-552d-1030-9562-001022fda270', 'Мурас ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 937),
('897b8084-552d-1030-9562-001022fda270', 'Мургабский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 938),
('897b81fd-552d-1030-9562-001022fda270', 'Мурманская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 939),
('897b835d-552d-1030-9562-001022fda270', 'Муромская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 940),
('897b84bd-552d-1030-9562-001022fda270', 'Муромская ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 941),
('897b8636-552d-1030-9562-001022fda270', 'Мусоргского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 942),
('897b87bb-552d-1030-9562-001022fda270', 'Мырзаке ул.,учкун ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 943),
('897b893c-552d-1030-9562-001022fda270', 'Мыскал пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 944),
('897b8acc-552d-1030-9562-001022fda270', 'Мыскал ул.,алтын-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 945),
('897b8c5b-552d-1030-9562-001022fda270', 'Мыскал ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 946),
('897b8f8e-552d-1030-9562-001022fda270', 'Набережная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 947),
('897b914d-552d-1030-9562-001022fda270', 'Набережная ул, аска-таш ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 948),
('897b92dc-552d-1030-9562-001022fda270', 'Набережная ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 949),
('897b946c-552d-1030-9562-001022fda270', 'Набережный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 950),
('897b95ea-552d-1030-9562-001022fda270', 'Найман ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 951),
('897b977d-552d-1030-9562-001022fda270', 'Найманбаева с. пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 952),
('897b9904-552d-1030-9562-001022fda270', 'Наманганская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 953),
('897b9a93-552d-1030-9562-001022fda270', 'Наманганский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 954),
('897b9c2b-552d-1030-9562-001022fda270', 'Нарвская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 955),
('897b9dd7-552d-1030-9562-001022fda270', 'Нариманский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 956),
('897b9f77-552d-1030-9562-001022fda270', 'Наристе ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 957),
('897ba277-552d-1030-9562-001022fda270', 'Нарын ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 958),
('897ba476-552d-1030-9562-001022fda270', 'Нарынский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 959),
('897ba651-552d-1030-9562-001022fda270', 'Насыйкат пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 960),
('897ba808-552d-1030-9562-001022fda270', 'Насыйкат ул.,алтын-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 961),
('897ba9c7-552d-1030-9562-001022fda270', 'Наукатский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 962),
('897bab8b-552d-1030-9562-001022fda270', 'Нахимова пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 963),
('897bae11-552d-1030-9562-001022fda270', 'Нежинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 964),
('897baf76-552d-1030-9562-001022fda270', 'Неизвестно.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 965),
('897bb0d6-552d-1030-9562-001022fda270', 'Некрасова пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 966),
('897bb241-552d-1030-9562-001022fda270', 'Нерчинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 967),
('897bb396-552d-1030-9562-001022fda270', 'Нижний пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 968),
('897bb6c9-552d-1030-9562-001022fda270', 'Низовая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 969),
('897bb85e-552d-1030-9562-001022fda270', 'Никитина пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 970),
('897bb9eb-552d-1030-9562-001022fda270', 'Никитина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 971),
('897bbb8e-552d-1030-9562-001022fda270', 'Новая ул., красный строитель ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 972),
('897bbd07-552d-1030-9562-001022fda270', 'Новгородская', NULL, NULL, NULL, NULL, NULL, 0, NULL, 973),
('897bbe6a-552d-1030-9562-001022fda270', 'Новоключевая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 974),
('897bbfd5-552d-1030-9562-001022fda270', 'Новокронштадская', NULL, NULL, NULL, NULL, NULL, 0, NULL, 975),
('897bc148-552d-1030-9562-001022fda270', 'Новооктябрьский пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 976),
('897bc2cd-552d-1030-9562-001022fda270', 'Новосельская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 977),
('897bc451-552d-1030-9562-001022fda270', 'Новосибирский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 978),
('897bc677-552d-1030-9562-001022fda270', 'Новостроевский пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 979),
('897bc97d-552d-1030-9562-001022fda270', 'Новостройка', NULL, NULL, NULL, NULL, NULL, 0, NULL, 980),
('897bcb6c-552d-1030-9562-001022fda270', 'Новостройка маевка', NULL, NULL, NULL, NULL, NULL, 0, NULL, 981),
('897bcd1f-552d-1030-9562-001022fda270', 'Нооруз ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 982),
('897bcec8-552d-1030-9562-001022fda270', 'Нооруз ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 983),
('897bd071-552d-1030-9562-001022fda270', 'Нурекская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 984),
('897bd21c-552d-1030-9562-001022fda270', 'Нуркамал ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 985),
('897bd3db-552d-1030-9562-001022fda270', 'Оберон рынок', NULL, NULL, NULL, NULL, NULL, 0, NULL, 986),
('897bd5a0-552d-1030-9562-001022fda270', 'Оберон ул., кара-жигач ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 987),
('897bd786-552d-1030-9562-001022fda270', 'Обозный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 988),
('897bd966-552d-1030-9562-001022fda270', 'Обская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 989),
('897bdd65-552d-1030-9562-001022fda270', 'Овощной пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 990),
('897bdf21-552d-1030-9562-001022fda270', 'Огомбаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 991),
('897be089-552d-1030-9562-001022fda270', 'Огородный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 992),
('897be1ec-552d-1030-9562-001022fda270', 'Огуз ата ул.,ак-тилек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 993),
('897be341-552d-1030-9562-001022fda270', 'Огуз-ата ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 994),
('897be4af-552d-1030-9562-001022fda270', 'Одесский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 995),
('897be607-552d-1030-9562-001022fda270', 'Озгоруш ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 996),
('897be772-552d-1030-9562-001022fda270', 'Озерный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 997),
('897be8d5-552d-1030-9562-001022fda270', 'Ойсул-ата ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 998),
('897bea45-552d-1030-9562-001022fda270', 'Ой-тал ул.,учкун ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 999),
('897bebc1-552d-1030-9562-001022fda270', 'Ой-терскен пер.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1000),
('897bed3a-552d-1030-9562-001022fda270', 'Ой-терскен ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1001),
('897befde-552d-1030-9562-001022fda270', 'Ой-терскен ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1002),
('897bf1ff-552d-1030-9562-001022fda270', 'Окрайная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1003),
('897bf3d5-552d-1030-9562-001022fda270', 'Октябрьская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1004),
('897bf594-552d-1030-9562-001022fda270', 'Омский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1005),
('897bf747-552d-1030-9562-001022fda270', 'Омур кеч ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1006),
('897bf8f0-552d-1030-9562-001022fda270', 'Он-арча ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1007),
('897bfa9e-552d-1030-9562-001022fda270', 'Онарчинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1008),
('897bfc4a-552d-1030-9562-001022fda270', 'Онежская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1009),
('897bfdf8-552d-1030-9562-001022fda270', 'Опол-тоо ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1010),
('897bffb4-552d-1030-9562-001022fda270', 'Оренбургская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1011),
('897c016d-552d-1030-9562-001022fda270', 'Оренбургский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1012),
('897c04b6-552d-1030-9562-001022fda270', 'Орловская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1013),
('897c06df-552d-1030-9562-001022fda270', 'Орловский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1014),
('897c08a7-552d-1030-9562-001022fda270', 'Ормокоева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1015),
('897c0b16-552d-1030-9562-001022fda270', 'Орнок ул.,касым ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1016),
('897c0c8f-552d-1030-9562-001022fda270', 'Орозбекова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1017),
('897c0dec-552d-1030-9562-001022fda270', 'Орозова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1018),
('897c0f4c-552d-1030-9562-001022fda270', 'Орок ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1019),
('897c10ac-552d-1030-9562-001022fda270', 'Орок ул.,орок ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1020),
('897c1204-552d-1030-9562-001022fda270', 'Орская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1021),
('897c1367-552d-1030-9562-001022fda270', 'Орто-алышская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1022),
('897c14d2-552d-1030-9562-001022fda270', 'Орто-арык ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1023),
('897c1815-552d-1030-9562-001022fda270', 'Орто-сай  пос.совет', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1024),
('897c19fe-552d-1030-9562-001022fda270', 'Ортосайская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1025),
('897c1b93-552d-1030-9562-001022fda270', 'Ортосайский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1026),
('897c1d0f-552d-1030-9562-001022fda270', 'Орто-сайский рынок', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1027),
('897c1e99-552d-1030-9562-001022fda270', 'Орто-токойский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1028),
('897c202b-552d-1030-9562-001022fda270', 'Орукту ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1029),
('897c21b8-552d-1030-9562-001022fda270', 'Орхон ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1030),
('897c2334-552d-1030-9562-001022fda270', 'Осил ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1031),
('897c24b8-552d-1030-9562-001022fda270', 'Осипенко пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1032),
('897c2642-552d-1030-9562-001022fda270', 'Осипенко ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1033),
('897c27cf-552d-1030-9562-001022fda270', 'Осмонкула ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1034),
('897c2ada-552d-1030-9562-001022fda270', 'Осмонова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1035),
('897c2cfb-552d-1030-9562-001022fda270', 'Остановка коммунистическая', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1036),
('897c2ec5-552d-1030-9562-001022fda270', 'Осташковская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1037),
('897c3081-552d-1030-9562-001022fda270', 'Островского пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1038),
('897c324b-552d-1030-9562-001022fda270', 'Островского тупик', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1039),
('897c3410-552d-1030-9562-001022fda270', 'Островского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1040),
('897c35e3-552d-1030-9562-001022fda270', 'От-араба ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1041),
('897c3868-552d-1030-9562-001022fda270', 'Отдел леса ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1042),
('897c39e1-552d-1030-9562-001022fda270', 'Оттукский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1043),
('897c3b33-552d-1030-9562-001022fda270', 'Отуз-адыр ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1044),
('897c3c82-552d-1030-9562-001022fda270', 'Офицерский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1045),
('897c3ff5-552d-1030-9562-001022fda270', 'Охотный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1046),
('897c4193-552d-1030-9562-001022fda270', 'Охотский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1047),
('897c4317-552d-1030-9562-001022fda270', 'Очаковская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1048),
('897c448d-552d-1030-9562-001022fda270', 'Ошская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1049),
('897c460c-552d-1030-9562-001022fda270', 'Ошский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1050),
('897c478d-552d-1030-9562-001022fda270', 'Ошский рынок', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1051),
('897c491a-552d-1030-9562-001022fda270', 'Ошский рынок, 1 -ый вход', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1052),
('897c4aaa-552d-1030-9562-001022fda270', 'Ошский рынок, 2 - ой вход', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1053),
('897c4c3f-552d-1030-9562-001022fda270', 'Ошский рынок, 3 - ий вход', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1054),
('897c4dd7-552d-1030-9562-001022fda270', 'Ошский рынок, 4 - ый вход', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1055),
('897c4f71-552d-1030-9562-001022fda270', 'Павлова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1056),
('897c5285-552d-1030-9562-001022fda270', 'Павлодарская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1057),
('897c5484-552d-1030-9562-001022fda270', 'Памирский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1058),
('897c565a-552d-1030-9562-001022fda270', 'Панфилова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1059),
('897c5813-552d-1030-9562-001022fda270', 'Парк дубовый', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1060),
('897c59d5-552d-1030-9562-001022fda270', 'Парк панфилова', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1061),
('897c5b94-552d-1030-9562-001022fda270', 'Парк фучика', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1062),
('897c5d6f-552d-1030-9562-001022fda270', 'Паровозная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1063),
('897c5f3c-552d-1030-9562-001022fda270', 'Партизанский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1064),
('897c6100-552d-1030-9562-001022fda270', 'Пархоменко ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1065),
('897c62ca-552d-1030-9562-001022fda270', 'Пензенский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1066),
('897c65ec-552d-1030-9562-001022fda270', 'Первомайский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1067),
('897c68c8-552d-1030-9562-001022fda270', 'Передовая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1068),
('897c6a44-552d-1030-9562-001022fda270', 'Перекопская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1069),
('897c6b9e-552d-1030-9562-001022fda270', 'Пермская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1070),
('897c6d01-552d-1030-9562-001022fda270', 'Печорский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1071),
('897c6e75-552d-1030-9562-001022fda270', 'Пинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1072),
('897c6fee-552d-1030-9562-001022fda270', 'Пионерская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1073),
('897c7180-552d-1030-9562-001022fda270', 'Пионерская ул. г.бишкек', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1074),
('897c72ff-552d-1030-9562-001022fda270', 'Питомник ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1075),
('897c7478-552d-1030-9562-001022fda270', 'Пишпек станция', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1076),
('897c75f4-552d-1030-9562-001022fda270', 'Пишпекская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1077),
('897c78a0-552d-1030-9562-001022fda270', 'Пишпекский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1078),
('897c7ad2-552d-1030-9562-001022fda270', 'П.лумумбы', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1079),
('897c7c94-552d-1030-9562-001022fda270', 'П.лумумбы ул., касым ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1080),
('897c7e4a-552d-1030-9562-001022fda270', 'П.морозова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1081),
('897c7ff6-552d-1030-9562-001022fda270', 'Победы ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1082),
('897c8196-552d-1030-9562-001022fda270', 'Поваринская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1083),
('897c8336-552d-1030-9562-001022fda270', 'Подольская  ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1084),
('897c84e7-552d-1030-9562-001022fda270', 'Пожарского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1085),
('897c86a4-552d-1030-9562-001022fda270', 'Покровский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1086),
('897c8868-552d-1030-9562-001022fda270', 'Покрышкина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1087),
('897c8a32-552d-1030-9562-001022fda270', 'Полевая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1088),
('897c8d4e-552d-1030-9562-001022fda270', 'Полевая ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1089),
('897c8f96-552d-1030-9562-001022fda270', 'Политехническая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1090),
('897c917c-552d-1030-9562-001022fda270', 'Полоцкий пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1091),
('897c9360-552d-1030-9562-001022fda270', 'Полтавский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1092),
('897c953d-552d-1030-9562-001022fda270', 'Пономарева п.с. ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1093),
('897c97c8-552d-1030-9562-001022fda270', 'Попова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1094),
('897c9944-552d-1030-9562-001022fda270', 'Почтовый тупик пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1095),
('897c9ab8-552d-1030-9562-001022fda270', 'Предгорный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1096),
('897c9c26-552d-1030-9562-001022fda270', 'Пржевальского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1097),
('897c9d99-552d-1030-9562-001022fda270', 'Пр.жибек жолу г.бишкек', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1098),
('897ca08e-552d-1030-9562-001022fda270', 'Привокзальный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1099),
('897ca261-552d-1030-9562-001022fda270', 'Привокзальный тупик', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1100),
('897ca3e5-552d-1030-9562-001022fda270', 'Приг', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1101),
('897ca564-552d-1030-9562-001022fda270', 'Прикумская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1102),
('897ca6e8-552d-1030-9562-001022fda270', 'Прирельсовая база', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1103),
('897ca86d-552d-1030-9562-001022fda270', 'Проезжий пер., темирова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1104),
('897ca9ff-552d-1030-9562-001022fda270', 'Проектируемая ул, ж/м ак-ордо', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1105),
('897cab8c-552d-1030-9562-001022fda270', 'Пролетарская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1106),
('897cad29-552d-1030-9562-001022fda270', 'Промышленная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1107),
('897caec7-552d-1030-9562-001022fda270', 'Прорабские бараки', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1108),
('897cb06f-552d-1030-9562-001022fda270', 'Профессора зимы', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1109),
('897cb321-552d-1030-9562-001022fda270', 'Профсоюзная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1110),
('897cb571-552d-1030-9562-001022fda270', 'Профсоюзная ул., керемет ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1111),
('897cb744-552d-1030-9562-001022fda270', 'Профсоюзная ул.,касым ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1112),
('897cb919-552d-1030-9562-001022fda270', 'Псковская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1113),
('897cbae9-552d-1030-9562-001022fda270', 'Пугачева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1114),
('897cbcb0-552d-1030-9562-001022fda270', 'Путейская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1115),
('897cbe83-552d-1030-9562-001022fda270', 'Путейская ул, м/н учкун', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1116),
('897cc058-552d-1030-9562-001022fda270', 'Путепроводная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1117),
('897cc23e-552d-1030-9562-001022fda270', 'Пушкина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1118),
('897cc427-552d-1030-9562-001022fda270', 'Рабочая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1119),
('897cc837-552d-1030-9562-001022fda270', 'Рабочий гор.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1120),
('897cca01-552d-1030-9562-001022fda270', 'Рабочий пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1121),
('897ccb99-552d-1030-9562-001022fda270', 'Радищева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1122),
('897ccd1d-552d-1030-9562-001022fda270', 'Раззакова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1123),
('897ccea4-552d-1030-9562-001022fda270', 'Разина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1124),
('897cd02b-552d-1030-9562-001022fda270', 'Ракетная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1125),
('897cd1b8-552d-1030-9562-001022fda270', 'Репина пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1126),
('897cd360-552d-1030-9562-001022fda270', 'Репина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1127),
('897cd506-552d-1030-9562-001022fda270', 'Репина ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1128),
('897cd6b7-552d-1030-9562-001022fda270', 'Репина-ахунбаева ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1129),
('897cd858-552d-1030-9562-001022fda270', 'Республика ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1130),
('897cdb4f-552d-1030-9562-001022fda270', 'Республиканская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1131),
('897cdd54-552d-1030-9562-001022fda270', 'Республиканская ул.,алтын-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1132),
('897cdf2c-552d-1030-9562-001022fda270', 'Республиканская ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1133),
('897ce0ee-552d-1030-9562-001022fda270', 'Речной пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1134),
('897ce294-552d-1030-9562-001022fda270', 'Рижская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1135),
('897ce448-552d-1030-9562-001022fda270', 'Р.люксембург ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1136),
('897ce615-552d-1030-9562-001022fda270', 'Ровенский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1137),
('897ce7e2-552d-1030-9562-001022fda270', 'Родниковая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1138),
('897ce9ac-552d-1030-9562-001022fda270', 'Родниковый пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1139),
('897ceb84-552d-1030-9562-001022fda270', 'Российский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1140),
('897ceed3-552d-1030-9562-001022fda270', 'Ростовская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1141),
('897cf10c-552d-1030-9562-001022fda270', 'Рухий мурас ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1142),
('897cf2f8-552d-1030-9562-001022fda270', 'Рыбинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1143),
('897cf4db-552d-1030-9562-001022fda270', 'Рылеева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1144),
('897cf750-552d-1030-9562-001022fda270', 'Рынок аламединский', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1145),
('897cfa67-552d-1030-9562-001022fda270', 'Рынок евро-азия', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1146),
('897cfbcf-552d-1030-9562-001022fda270', 'Рынок кулун-ата', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1147),
('897cfd16-552d-1030-9562-001022fda270', 'Рынок орто-сайский', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1148),
('897cfe65-552d-1030-9562-001022fda270', 'Рынок ошский', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1149),
('897cffac-552d-1030-9562-001022fda270', 'Рынок пищевой', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1150),
('897d0290-552d-1030-9562-001022fda270', 'Рынок южный', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1151),
('897d0439-552d-1030-9562-001022fda270', 'Рыночный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1152),
('897d05ac-552d-1030-9562-001022fda270', 'Рыскулова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1153),
('897d06fe-552d-1030-9562-001022fda270', 'Рязанская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1154),
('897d084e-552d-1030-9562-001022fda270', 'Саадаева пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1155),
('897d09a3-552d-1030-9562-001022fda270', 'Саадаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1156),
('897d0b03-552d-1030-9562-001022fda270', 'Саадаева ул.,ак-босого ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1157),
('897d0c7c-552d-1030-9562-001022fda270', 'Саадаева ул.,ак-тилек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1158),
('897d0e0b-552d-1030-9562-001022fda270', 'Саадаева ул.,алтын-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1159),
('897d0f84-552d-1030-9562-001022fda270', 'Саадаева ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1160),
('897d1103-552d-1030-9562-001022fda270', 'Саадак ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1161),
('897d127c-552d-1030-9562-001022fda270', 'Сад ул., ж/м аска-таш', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1162),
('897d157c-552d-1030-9562-001022fda270', 'Садовая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1163),
('897d175a-552d-1030-9562-001022fda270', 'Садовая ул., алтын-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1164),
('897d18fa-552d-1030-9562-001022fda270', 'Садовая ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1165),
('897d1a8f-552d-1030-9562-001022fda270', 'Садовая 2', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1166),
('897d1c27-552d-1030-9562-001022fda270', 'Садовый пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1167),
('897d1dbf-552d-1030-9562-001022fda270', 'Садыбакасова шаткан ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1168),
('897d1f5d-552d-1030-9562-001022fda270', 'Садыгалиева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1169),
('897d20f7-552d-1030-9562-001022fda270', 'Садыгалиева ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1170),
('897d228c-552d-1030-9562-001022fda270', 'Сайма таш ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1171),
('897d24ed-552d-1030-9562-001022fda270', 'Сайма-таш ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1172),
('897d2634-552d-1030-9562-001022fda270', 'Сакалдуу ул.,ынтымак ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1173),
('897d289e-552d-1030-9562-001022fda270', 'Саламалик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1174),
('897d2a5d-552d-1030-9562-001022fda270', 'Салиевой ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1175),
('897d2bc5-552d-1030-9562-001022fda270', 'Салкын ул., верхний кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1176),
('897d2d25-552d-1030-9562-001022fda270', 'Салтанат ул.,касым ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1177),
('897d2e72-552d-1030-9562-001022fda270', 'Саманчина ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1178),
('897d2fc9-552d-1030-9562-001022fda270', 'Саманчы жолу ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1179),
('897d311e-552d-1030-9562-001022fda270', 'Самаркандский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1180),
('897d3270-552d-1030-9562-001022fda270', 'Самарский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1181),
('897d33bc-552d-1030-9562-001022fda270', 'Самойленко ул,ынтымак ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1182),
('897d3514-552d-1030-9562-001022fda270', 'Сандык-тер ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1183),
('897d3674-552d-1030-9562-001022fda270', 'Санжара ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1184),
('897d37d7-552d-1030-9562-001022fda270', 'Санжыра ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1185),
('897d3948-552d-1030-9562-001022fda270', 'Саранский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1186),
('897d3bdb-552d-1030-9562-001022fda270', 'Саратовская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1187),
('897d3df9-552d-1030-9562-001022fda270', 'Саратовский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1188),
('897d3fb5-552d-1030-9562-001022fda270', 'Саратовский проезд', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1189),
('897d4153-552d-1030-9562-001022fda270', 'Сартбаева к. ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1190),
('897d42fe-552d-1030-9562-001022fda270', 'Саруйский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1191),
('897d4493-552d-1030-9562-001022fda270', 'Сары-арка ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1192),
('897d462b-552d-1030-9562-001022fda270', 'Сары-булун ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1193),
('897d47c8-552d-1030-9562-001022fda270', 'Сары-жаз ул., кара-жыгач ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1194),
('897d4969-552d-1030-9562-001022fda270', 'Сары-камыш ул., ала-арча ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1195),
('897d4b14-552d-1030-9562-001022fda270', 'Сарыкулакова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1196),
('897d4cc5-552d-1030-9562-001022fda270', 'Сарынжы ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1197),
('897d50aa-552d-1030-9562-001022fda270', 'Сары-учкун ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1198),
('897d524d-552d-1030-9562-001022fda270', 'Сары-челекская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1199),
('897d539d-552d-1030-9562-001022fda270', 'Сахалинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1200),
('897d54de-552d-1030-9562-001022fda270', 'Сахалинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1201),
('897d5636-552d-1030-9562-001022fda270', 'Свердловский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1202),
('897d5793-552d-1030-9562-001022fda270', 'Свободная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1203),
('897d58e2-552d-1030-9562-001022fda270', 'Свободный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1204),
('897d5a37-552d-1030-9562-001022fda270', 'Севанская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1205),
('897d5b86-552d-1030-9562-001022fda270', 'Севастопольская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1206),
('897d5cd5-552d-1030-9562-001022fda270', 'Сев-иподромный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1207),
('897d5e30-552d-1030-9562-001022fda270', 'Сев-ипподромная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1208),
('897d5f93-552d-1030-9562-001022fda270', 'Сейил ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1209),
('897d6100-552d-1030-9562-001022fda270', 'Сейтек ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1210),
('897d6401-552d-1030-9562-001022fda270', 'Сельповская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1211),
('897d65d6-552d-1030-9562-001022fda270', 'Сельская ул.аламедин м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1212),
('897d6766-552d-1030-9562-001022fda270', 'Сельская ул.г.строителей', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1213),
('897d68e7-552d-1030-9562-001022fda270', 'Сельсоветская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1214),
('897d6a6e-552d-1030-9562-001022fda270', 'Семашко пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1215),
('897d6c06-552d-1030-9562-001022fda270', 'Семашко ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1216),
('897d6d90-552d-1030-9562-001022fda270', 'Семетей ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1217),
('897d6f1a-552d-1030-9562-001022fda270', 'Семипалатинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1218),
('897d70a9-552d-1030-9562-001022fda270', 'Серафимовича ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1219),
('8980a63c-552d-1030-9562-001022fda270', 'Серегина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1220),
('8980ac9e-552d-1030-9562-001022fda270', 'Серова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1221),
('8980af13-552d-1030-9562-001022fda270', 'Серпуховская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1222),
('8980b1a6-552d-1030-9562-001022fda270', 'Сеченова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1223),
('8980b322-552d-1030-9562-001022fda270', 'Сеченова ул.,ак-тилек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1224),
('8980b4c3-552d-1030-9562-001022fda270', 'Сибирский проезд пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1225),
('8980b644-552d-1030-9562-001022fda270', 'Сибирский тупик', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1226),
('8980b79c-552d-1030-9562-001022fda270', 'Симферопольский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1227),
('8980b8e5-552d-1030-9562-001022fda270', 'Скандинавский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1228),
('8980ba45-552d-1030-9562-001022fda270', 'Сквозной пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1229),
('8980bb9d-552d-1030-9562-001022fda270', 'Складской городок ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1230),
('8980bd00-552d-1030-9562-001022fda270', 'Скрябина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1231),
('8980c016-552d-1030-9562-001022fda270', 'Славгородская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1232),
('8980c1f1-552d-1030-9562-001022fda270', 'Славенская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1233),
('8980c392-552d-1030-9562-001022fda270', 'Славянская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1234),
('8980c51e-552d-1030-9562-001022fda270', 'С.лазо пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1235),
('8980c6ae-552d-1030-9562-001022fda270', 'С.лазо ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1236),
('8980c843-552d-1030-9562-001022fda270', 'Смоленский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1237),
('8980c9d5-552d-1030-9562-001022fda270', 'Снегиревский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1238),
('8980cb5f-552d-1030-9562-001022fda270', 'Советская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1239),
('8980ccfa-552d-1030-9562-001022fda270', 'Сокулукская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1240),
('8980ce97-552d-1030-9562-001022fda270', 'Сокулукский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1241),
('8980d02f-552d-1030-9562-001022fda270', 'Солтон-сары ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1242),
('8980d4b4-552d-1030-9562-001022fda270', 'Сонкульский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1243),
('8980d70f-552d-1030-9562-001022fda270', 'Соруйский пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1244),
('8980d8f5-552d-1030-9562-001022fda270', 'Сосновый пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1245);
INSERT INTO `aknet_street` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `street_id`) VALUES
('8980dac2-552d-1030-9562-001022fda270', 'Средний пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1246),
('8980dc76-552d-1030-9562-001022fda270', 'Средняя ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1247),
('8980de38-552d-1030-9562-001022fda270', 'Стадионная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1248),
('8980e0b5-552d-1030-9562-001022fda270', 'Станиславский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1249),
('8980e236-552d-1030-9562-001022fda270', 'Стаханова пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1250),
('8980e3af-552d-1030-9562-001022fda270', 'Стаханова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1251),
('8980e68e-552d-1030-9562-001022fda270', 'Строительная ул.,ынтымак ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1252),
('8980e89b-552d-1030-9562-001022fda270', 'Суванбердиева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1253),
('8980ea25-552d-1030-9562-001022fda270', 'Суворова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1254),
('8980eb96-552d-1030-9562-001022fda270', 'Суеркулова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1255),
('8980ed09-552d-1030-9562-001022fda270', 'Сузакский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1256),
('8980ee7d-552d-1030-9562-001022fda270', 'Сулайка ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1257),
('8980eff3-552d-1030-9562-001022fda270', 'Сулуутор ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1258),
('8980f161-552d-1030-9562-001022fda270', 'Сулюктинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1259),
('8980f2dd-552d-1030-9562-001022fda270', 'Сумской пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1260),
('8980f45f-552d-1030-9562-001022fda270', 'Сусамырский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1261),
('8980f5eb-552d-1030-9562-001022fda270', 'Суусамыр ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1262),
('8980f775-552d-1030-9562-001022fda270', 'Сухомлинова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1263),
('8980fa5a-552d-1030-9562-001022fda270', 'Сухэ-батора ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1264),
('8980fc6f-552d-1030-9562-001022fda270', 'Суюнбаева а ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1265),
('8980fe55-552d-1030-9562-001022fda270', 'С.щедрина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1266),
('8981001d-552d-1030-9562-001022fda270', 'Сыдыкова а. ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1267),
('898101e4-552d-1030-9562-001022fda270', 'Сын-таш ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1268),
('8981039d-552d-1030-9562-001022fda270', 'Сыргак ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1269),
('8981055a-552d-1030-9562-001022fda270', 'Таалай ул., арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1270),
('8981071e-552d-1030-9562-001022fda270', 'Табалдиева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1271),
('898108d5-552d-1030-9562-001022fda270', 'Табачная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1272),
('89810a8b-552d-1030-9562-001022fda270', 'Табышалиева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1273),
('89810db6-552d-1030-9562-001022fda270', 'Таганрогский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1274),
('8981108f-552d-1030-9562-001022fda270', 'Тагылдыр тоо ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1275),
('89811235-552d-1030-9562-001022fda270', 'Таджикский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1276),
('898113b9-552d-1030-9562-001022fda270', 'Таймырский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1277),
('89811527-552d-1030-9562-001022fda270', 'Тайшетская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1278),
('8981168a-552d-1030-9562-001022fda270', 'Тала ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1279),
('898117fa-552d-1030-9562-001022fda270', 'Таласский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1280),
('8981196e-552d-1030-9562-001022fda270', 'Талды-булак ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1281),
('89811b1c-552d-1030-9562-001022fda270', 'Талдысуйская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1282),
('89811cb1-552d-1030-9562-001022fda270', 'Талды-суйская ул.,маданият ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1283),
('89811e33-552d-1030-9562-001022fda270', 'Талдысуйский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1284),
('89812101-552d-1030-9562-001022fda270', 'Талды-суйский пер.,маданият ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1285),
('8981232a-552d-1030-9562-001022fda270', 'Таллинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1286),
('898124ee-552d-1030-9562-001022fda270', 'Тамбовская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1287),
('89812697-552d-1030-9562-001022fda270', 'Тамбовский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1288),
('89812829-552d-1030-9562-001022fda270', 'Тарагай ул.,ак-тилек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1289),
('898129b9-552d-1030-9562-001022fda270', 'Таттынбубу ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1290),
('89812b51-552d-1030-9562-001022fda270', 'Ташарык ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1291),
('89812cf9-552d-1030-9562-001022fda270', 'Ташаузская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1292),
('89812ea2-552d-1030-9562-001022fda270', 'Ташкентская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1293),
('89813059-552d-1030-9562-001022fda270', 'Таш-кумырская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1294),
('89813215-552d-1030-9562-001022fda270', 'Ташкумырский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1295),
('89813542-552d-1030-9562-001022fda270', 'Таш-рабат ул,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1296),
('8981377c-552d-1030-9562-001022fda270', 'Таш-тулга ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1297),
('8981395c-552d-1030-9562-001022fda270', 'Тверская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1298),
('89813b2c-552d-1030-9562-001022fda270', 'Тельмана ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1299),
('89813cf3-552d-1030-9562-001022fda270', 'Темирова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1300),
('89813f76-552d-1030-9562-001022fda270', 'Темировская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1301),
('898140ef-552d-1030-9562-001022fda270', 'Темировская ул, ж/м буурдинский', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1302),
('89814257-552d-1030-9562-001022fda270', 'Темировский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1303),
('898143bd-552d-1030-9562-001022fda270', 'Темировский пер, ж/м буурдинский-тос13', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1304),
('8981452e-552d-1030-9562-001022fda270', 'Тендик ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1305),
('898147b9-552d-1030-9562-001022fda270', 'Тенир тоо ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1306),
('898149d7-552d-1030-9562-001022fda270', 'Тепличная', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1307),
('89814b8d-552d-1030-9562-001022fda270', 'Терек-сай ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1308),
('89814d1d-552d-1030-9562-001022fda270', 'Термечикова', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1309),
('89814ea4-552d-1030-9562-001022fda270', 'Термечикова ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1310),
('8981501d-552d-1030-9562-001022fda270', 'Тернопольский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1311),
('8981518b-552d-1030-9562-001022fda270', 'Терский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1312),
('8981530a-552d-1030-9562-001022fda270', 'Тимирязева пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1313),
('8981548b-552d-1030-9562-001022fda270', 'Тимирязева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1314),
('89815612-552d-1030-9562-001022fda270', 'Тимура фрунзе ул., арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1315),
('898157cc-552d-1030-9562-001022fda270', 'Тимура фрунзе,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1316),
('89815974-552d-1030-9562-001022fda270', 'Тираспольская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1317),
('89815c8e-552d-1030-9562-001022fda270', 'Тифлисская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1318),
('89815ea6-552d-1030-9562-001022fda270', 'Тихая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1319),
('89816065-552d-1030-9562-001022fda270', 'Тихвинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1320),
('89816213-552d-1030-9562-001022fda270', 'Тобольский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1321),
('898163c2-552d-1030-9562-001022fda270', 'Товарная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1322),
('89816570-552d-1030-9562-001022fda270', 'Тоголок молдо ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1323),
('89816737-552d-1030-9562-001022fda270', 'Тогуз ак ул.,ынтымак ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1324),
('89816950-552d-1030-9562-001022fda270', 'Тогуз-кайрык ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1325),
('89816b2a-552d-1030-9562-001022fda270', 'Тогуз-канат ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1326),
('89816ec4-552d-1030-9562-001022fda270', 'Тогуз-тутун ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1327),
('89817101-552d-1030-9562-001022fda270', 'Тогучинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1328),
('8981729c-552d-1030-9562-001022fda270', 'Тойгомбаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1329),
('8981741a-552d-1030-9562-001022fda270', 'Токмакская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1330),
('89817599-552d-1030-9562-001022fda270', 'Токмакская ул., аламедин м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1331),
('89817718-552d-1030-9562-001022fda270', 'Токмакский тупик', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1332),
('898178a5-552d-1030-9562-001022fda270', 'Токомбаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1333),
('89817a23-552d-1030-9562-001022fda270', 'Токтогула ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1334),
('89817b9a-552d-1030-9562-001022fda270', 'Токтоналиева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1335),
('89817d24-552d-1030-9562-001022fda270', 'Токульдош пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1336),
('89817ead-552d-1030-9562-001022fda270', 'Токульдош ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1337),
('89818043-552d-1030-9562-001022fda270', 'Томский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1338),
('89818338-552d-1030-9562-001022fda270', 'Тон ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1339),
('89818556-552d-1030-9562-001022fda270', 'Тон ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1340),
('8981872b-552d-1030-9562-001022fda270', 'Тонский переулок.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1341),
('898188dc-552d-1030-9562-001022fda270', 'Тооашуу ул., кара-жигач ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1342),
('89818a7c-552d-1030-9562-001022fda270', 'Топографический пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1343),
('89818c1f-552d-1030-9562-001022fda270', 'Топографический проезд', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1344),
('89818ddb-552d-1030-9562-001022fda270', 'Торгой ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1345),
('89818f8f-552d-1030-9562-001022fda270', 'Торткуль ул., ынтымак ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1346),
('8981913b-552d-1030-9562-001022fda270', 'Торфяная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1347),
('898192d8-552d-1030-9562-001022fda270', 'Третьяковская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1348),
('89819486-552d-1030-9562-001022fda270', 'Троицкая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1349),
('898197c4-552d-1030-9562-001022fda270', 'Трудовая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1350),
('898199e5-552d-1030-9562-001022fda270', 'Тугелова н.с. ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1351),
('89819bd1-552d-1030-9562-001022fda270', 'Туголбай ата ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1352),
('89819e59-552d-1030-9562-001022fda270', 'Тугучинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1353),
('89819fd7-552d-1030-9562-001022fda270', 'Туз ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1354),
('8981a13a-552d-1030-9562-001022fda270', 'Тулебердиева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1355),
('8981a2ae-552d-1030-9562-001022fda270', 'Тулпар-таш ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1356),
('8981a427-552d-1030-9562-001022fda270', 'Тульская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1357),
('8981a598-552d-1030-9562-001022fda270', 'Тунгусский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1358),
('8981a700-552d-1030-9562-001022fda270', 'Тунгуч ж/м (лебединовка)', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1359),
('8981a9c8-552d-1030-9562-001022fda270', 'Тунгуч м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1360),
('8981abe6-552d-1030-9562-001022fda270', 'Тундук ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1361),
('8981ad92-552d-1030-9562-001022fda270', 'Тупик-1 ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1362),
('8981af27-552d-1030-9562-001022fda270', 'Тургенева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1363),
('8981b0bf-552d-1030-9562-001022fda270', 'Турсунбаева ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1364),
('8981b267-552d-1030-9562-001022fda270', 'Турусбекова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1365),
('8981b416-552d-1030-9562-001022fda270', 'Туура ул, ынтымак ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1366),
('8981b5bb-552d-1030-9562-001022fda270', 'Тушинский пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1367),
('8981b775-552d-1030-9562-001022fda270', 'Туюк ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1368),
('8981b934-552d-1030-9562-001022fda270', 'Туюк-жар ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1369),
('8981bb81-552d-1030-9562-001022fda270', 'Туюкская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1370),
('8981beb7-552d-1030-9562-001022fda270', 'Т.фрунзе ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1371),
('8981c0ee-552d-1030-9562-001022fda270', 'Тыналиева к. ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1372),
('8981c2e2-552d-1030-9562-001022fda270', 'Тынчтык ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1373),
('8981c4c8-552d-1030-9562-001022fda270', 'Тыныбекова т. ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1374),
('8981c69d-552d-1030-9562-001022fda270', 'Тыныстанова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1375),
('8981c881-552d-1030-9562-001022fda270', 'Тюменская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1376),
('8981ca5e-552d-1030-9562-001022fda270', 'Тюпский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1377),
('8981cc39-552d-1030-9562-001022fda270', 'Тяньшанская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1378),
('8981cec7-552d-1030-9562-001022fda270', 'Удмуртская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1379),
('8981d1d5-552d-1030-9562-001022fda270', 'Ужгородский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1380),
('8981d383-552d-1030-9562-001022fda270', 'Узгенский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1381),
('8981d4ff-552d-1030-9562-001022fda270', 'Узун-булак ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1382),
('8981d665-552d-1030-9562-001022fda270', 'Укек пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1383),
('8981d7d6-552d-1030-9562-001022fda270', 'Укок ул,алтын-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1384),
('8981d941-552d-1030-9562-001022fda270', 'Укол ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1385),
('8981daa9-552d-1030-9562-001022fda270', 'Украинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1386),
('8981dc1a-552d-1030-9562-001022fda270', 'Ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1387),
('8981dd88-552d-1030-9562-001022fda270', 'Ул. к. карбоз улуу', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1388),
('8981df07-552d-1030-9562-001022fda270', 'Улан мкн', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1389),
('8981e088-552d-1030-9562-001022fda270', 'Улан ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1390),
('8981e20f-552d-1030-9562-001022fda270', 'Улан ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1391),
('8981e4f9-552d-1030-9562-001022fda270', 'Улан ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1392),
('8981e725-552d-1030-9562-001022fda270', 'Улан ул.,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1393),
('8981e914-552d-1030-9562-001022fda270', 'Улан-1 мкн', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1394),
('8981eade-552d-1030-9562-001022fda270', 'Улар ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1395),
('8981ecad-552d-1030-9562-001022fda270', 'Улахольский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1396),
('8981ee75-552d-1030-9562-001022fda270', 'Улук-тоо ул.,ала-тоо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1397),
('8981f04d-552d-1030-9562-001022fda270', 'Уметалиева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1398),
('8981f212-552d-1030-9562-001022fda270', 'Умут ул,колмо ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1399),
('8981f3e4-552d-1030-9562-001022fda270', 'Уральская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1400),
('8981f5c5-552d-1030-9562-001022fda270', 'Урицкого ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1401),
('8981f913-552d-1030-9562-001022fda270', 'Уркор ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1402),
('8981fb7a-552d-1030-9562-001022fda270', 'Урожайный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1403),
('8981fd81-552d-1030-9562-001022fda270', 'Урючный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1404),
('89820023-552d-1030-9562-001022fda270', 'Усенбаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1405),
('898201a1-552d-1030-9562-001022fda270', 'Уссурийский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1406),
('8982032b-552d-1030-9562-001022fda270', 'Уфимский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1407),
('898204ad-552d-1030-9562-001022fda270', 'Участок, ж/м учкун-2', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1408),
('89820631-552d-1030-9562-001022fda270', 'Участок, кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1409),
('898207bb-552d-1030-9562-001022fda270', 'Участок ул., западная часть ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1410),
('8982093f-552d-1030-9562-001022fda270', 'Участок ул, каинды ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1411),
('89820c3a-552d-1030-9562-001022fda270', 'Участок ул., тынчтык ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1412),
('89820e52-552d-1030-9562-001022fda270', 'Учкун ж/м,учкун ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1413),
('8982101f-552d-1030-9562-001022fda270', 'Учкун мр', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1414),
('898211d0-552d-1030-9562-001022fda270', 'Учкун ул.,учкун ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1415),
('89821376-552d-1030-9562-001022fda270', 'Уч-курганская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1416),
('8982151c-552d-1030-9562-001022fda270', 'Уч-таш ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1417),
('898216ca-552d-1030-9562-001022fda270', 'Уч-терекский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1418),
('89821873-552d-1030-9562-001022fda270', 'Уч-тулга ул.,учкун ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1419),
('89821a1b-552d-1030-9562-001022fda270', 'Ушакова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1420),
('89821bca-552d-1030-9562-001022fda270', 'Фабричный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1421),
('89821d75-552d-1030-9562-001022fda270', 'Фатьянова ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1422),
('89822115-552d-1030-9562-001022fda270', 'Февральский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1423),
('898222f8-552d-1030-9562-001022fda270', 'Федорова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1424),
('898224bf-552d-1030-9562-001022fda270', 'Феодосийский пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1425),
('8982268f-552d-1030-9562-001022fda270', 'Ферганский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1426),
('8982286a-552d-1030-9562-001022fda270', 'Фере', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1427),
('89822a3a-552d-1030-9562-001022fda270', 'Фестивальный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1428),
('89822c09-552d-1030-9562-001022fda270', 'Фиолетова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1429),
('89822dd4-552d-1030-9562-001022fda270', 'Фирсова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1430),
('898230c3-552d-1030-9562-001022fda270', 'Флотский пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1431),
('898233b5-552d-1030-9562-001022fda270', 'Фонтанный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1432),
('89823545-552d-1030-9562-001022fda270', 'Фруктовая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1433),
('8982369a-552d-1030-9562-001022fda270', 'Фрунзе тимура ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1434),
('898237ee-552d-1030-9562-001022fda270', 'Фрунзе ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1435),
('8982393b-552d-1030-9562-001022fda270', 'Фрунзе ул.,алтын-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1436),
('89823a98-552d-1030-9562-001022fda270', 'Фурманова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1437),
('89823c09-552d-1030-9562-001022fda270', 'Фучика ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1438),
('89823d88-552d-1030-9562-001022fda270', 'Хабаровский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1439),
('89823efe-552d-1030-9562-001022fda270', 'Хабитат ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1440),
('898240ac-552d-1030-9562-001022fda270', 'Хайдарканский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1441),
('8982424c-552d-1030-9562-001022fda270', 'Хан тенир ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1442),
('898243e7-552d-1030-9562-001022fda270', 'Харьковская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1443),
('898246c0-552d-1030-9562-001022fda270', 'Хвойная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1444),
('8982489e-552d-1030-9562-001022fda270', 'Хивинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1445),
('89824a57-552d-1030-9562-001022fda270', 'Хмельницкого ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1446),
('89824bea-552d-1030-9562-001022fda270', 'Хоперская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1447),
('89824d84-552d-1030-9562-001022fda270', 'Худайбергенова т. ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1448),
('89824f2d-552d-1030-9562-001022fda270', 'Цветочный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1449),
('898250d8-552d-1030-9562-001022fda270', 'Целинная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1450),
('8982528c-552d-1030-9562-001022fda270', 'Целиноградская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1451),
('8982543d-552d-1030-9562-001022fda270', 'Центральный проход рынок', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1452),
('89825629-552d-1030-9562-001022fda270', 'Циолковского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1453),
('8982592c-552d-1030-9562-001022fda270', 'Чайковского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1454),
('89825bb7-552d-1030-9562-001022fda270', 'Чайковского ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1455),
('89825dcf-552d-1030-9562-001022fda270', 'Чайырды ул.,бакай-ата ж/и', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1456),
('89826081-552d-1030-9562-001022fda270', 'Чалдоварская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1457),
('898261fa-552d-1030-9562-001022fda270', 'Чалдыбар ул.,ак-тилек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1458),
('89826355-552d-1030-9562-001022fda270', 'Чамгарак ул.,ак-тилек ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1459),
('898264a4-552d-1030-9562-001022fda270', 'Чамгарак,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1460),
('898265f1-552d-1030-9562-001022fda270', 'Чар ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1461),
('89826751-552d-1030-9562-001022fda270', 'Чар ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1462),
('898268b3-552d-1030-9562-001022fda270', 'Чаткальский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1463),
('89826a0e-552d-1030-9562-001022fda270', 'Чатыр-кол ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1464),
('89826b76-552d-1030-9562-001022fda270', 'Чатыркульский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1465),
('89826eae-552d-1030-9562-001022fda270', 'Чебоксарская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1466),
('89827076-552d-1030-9562-001022fda270', 'Чебоксарская ул. г.бишкек', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1467),
('8982723a-552d-1030-9562-001022fda270', 'Чейырды ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1468),
('898273f1-552d-1030-9562-001022fda270', 'Челюскина пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1469),
('89827591-552d-1030-9562-001022fda270', 'Челюскина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1470),
('89827723-552d-1030-9562-001022fda270', 'Челябинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1471),
('898278b6-552d-1030-9562-001022fda270', 'Челябинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1472),
('89827a3a-552d-1030-9562-001022fda270', 'Черкасский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1473),
('89827bda-552d-1030-9562-001022fda270', 'Черкесский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1474),
('89827d80-552d-1030-9562-001022fda270', 'Черниговский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1475),
('89827f31-552d-1030-9562-001022fda270', 'Черновицкий пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1476),
('89828282-552d-1030-9562-001022fda270', 'Черноморская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1477),
('89828471-552d-1030-9562-001022fda270', 'Чернышевского пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1478),
('89828633-552d-1030-9562-001022fda270', 'Чехова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1479),
('898287e4-552d-1030-9562-001022fda270', 'Чимкентская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1480),
('89828989-552d-1030-9562-001022fda270', 'Чинара ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1481),
('89828b38-552d-1030-9562-001022fda270', 'Чирчикский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1482),
('89828da4-552d-1030-9562-001022fda270', 'Читинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1483),
('89828f0f-552d-1030-9562-001022fda270', 'Чкалова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1484),
('89829059-552d-1030-9562-001022fda270', 'Чокморова с. ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1485),
('898291ab-552d-1030-9562-001022fda270', 'Чоктал ул., кара-жыгач ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1486),
('89829444-552d-1030-9562-001022fda270', 'Чолпон ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1487),
('8982963d-552d-1030-9562-001022fda270', 'Чолпон-атинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1488),
('898297c2-552d-1030-9562-001022fda270', 'Чон-арык ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1489),
('89829927-552d-1030-9562-001022fda270', 'Чон-арык ул., ынтымак ж.м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1490),
('89829a8d-552d-1030-9562-001022fda270', 'Чон-горский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1491),
('89829bea-552d-1030-9562-001022fda270', 'Чон-коргонская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1492),
('89829d4d-552d-1030-9562-001022fda270', 'Чон-курчак ул, учкун ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1493),
('89829eb5-552d-1030-9562-001022fda270', 'Чон-ташская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1494),
('8982a01b-552d-1030-9562-001022fda270', 'Чортекова ул., арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1495),
('8982a186-552d-1030-9562-001022fda270', 'Чубак ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1496),
('8982a2fc-552d-1030-9562-001022fda270', 'Чувашская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1497),
('8982a47e-552d-1030-9562-001022fda270', 'Чувашский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1498),
('8982a610-552d-1030-9562-001022fda270', 'Чугуевский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1499),
('8982a921-552d-1030-9562-001022fda270', 'Чуй жилмассив.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1500),
('8982aaff-552d-1030-9562-001022fda270', 'Чуй пр.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1501),
('8982acb3-552d-1030-9562-001022fda270', 'Чуй пр.,учкун ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1502),
('8982aeaf-552d-1030-9562-001022fda270', 'Чуйкова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1565),
('8982b082-552d-1030-9562-001022fda270', 'Чукотская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1566),
('8982b235-552d-1030-9562-001022fda270', 'Чумышский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1567),
('8982b3ec-552d-1030-9562-001022fda270', 'Чункурчак ул.,учкун ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1568),
('8982b5a0-552d-1030-9562-001022fda270', 'Чыйырды ул., бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1569),
('8982b759-552d-1030-9562-001022fda270', 'Чыйырчик ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1570),
('8982b9ce-552d-1030-9562-001022fda270', 'Чымындык ул.,учкун ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1571),
('8982bced-552d-1030-9562-001022fda270', 'Шабдан баатыра ул., верхний кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1572),
('8982be6b-552d-1030-9562-001022fda270', 'Шабдан баатыра ул., ж/м кок-жар', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1573),
('8982bfd7-552d-1030-9562-001022fda270', 'Шабдан батыра ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1574),
('8982c12b-552d-1030-9562-001022fda270', 'Шабдан ул., ж/м арча-бешик', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1575),
('8982c286-552d-1030-9562-001022fda270', 'Шакирова ул. (молодежная)', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1576),
('8982c3e9-552d-1030-9562-001022fda270', 'Шапак манасчы ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1577),
('8982c53d-552d-1030-9562-001022fda270', 'Шапак ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1578),
('8982c6a6-552d-1030-9562-001022fda270', 'Шаттык ул.,касым ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1579),
('8982c822-552d-1030-9562-001022fda270', 'Шаты ул., кара-жыгач ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1580),
('8982c998-552d-1030-9562-001022fda270', 'Шаумяна ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1581),
('8982cb06-552d-1030-9562-001022fda270', 'Шевченко пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1582),
('8982cc77-552d-1030-9562-001022fda270', 'Шевченко ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1583),
('8982cf53-552d-1030-9562-001022fda270', 'Шералиева ул., арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1584),
('8982d163-552d-1030-9562-001022fda270', 'Шербет ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1585),
('8982d333-552d-1030-9562-001022fda270', 'Шетиген ул.,ак-орго  ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1586),
('8982d4ef-552d-1030-9562-001022fda270', 'Широкая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1587),
('8982d697-552d-1030-9562-001022fda270', 'Школьный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1588),
('8982d846-552d-1030-9562-001022fda270', 'Шмидта пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1589),
('8982d9f7-552d-1030-9562-001022fda270', 'Шоокум ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1590),
('8982dba8-552d-1030-9562-001022fda270', 'Шоокум ул.,кок-жар ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1591),
('8982dd40-552d-1030-9562-001022fda270', 'Шоорукова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1592),
('8982dee3-552d-1030-9562-001022fda270', 'Шопокова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1593),
('8982e096-552d-1030-9562-001022fda270', 'Шорина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1594),
('8982e3f3-552d-1030-9562-001022fda270', 'Шоштубе пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1595),
('8982e624-552d-1030-9562-001022fda270', 'Шоштубе ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1596),
('8982e8b5-552d-1030-9562-001022fda270', 'Ш.руставели пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1597),
('8982ea34-552d-1030-9562-001022fda270', 'Ш.руставели ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1598),
('8982ec17-552d-1030-9562-001022fda270', 'Шуберта ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1599),
('8982edc5-552d-1030-9562-001022fda270', 'Шукурова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1600),
('8982ef4c-552d-1030-9562-001022fda270', 'Шушенский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1601),
('8982f0d3-552d-1030-9562-001022fda270', 'Шырдакбек ул.,орок ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1602),
('8982f298-552d-1030-9562-001022fda270', 'Щербакова тупик.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1603),
('8982f433-552d-1030-9562-001022fda270', 'Щербакова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1604),
('8982f736-552d-1030-9562-001022fda270', 'Щербет ул., арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1605),
('8982f935-552d-1030-9562-001022fda270', 'Щорса ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1606),
('8982fb02-552d-1030-9562-001022fda270', 'Щусева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1607),
('8982fca5-552d-1030-9562-001022fda270', 'Ызар ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1608),
('8982fe34-552d-1030-9562-001022fda270', 'Ынтымак ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1609),
('8982ffc4-552d-1030-9562-001022fda270', 'Ынтымак ул., аска-таш ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1610),
('89830172-552d-1030-9562-001022fda270', 'Ынтымак ул.,касым ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1611),
('8983030a-552d-1030-9562-001022fda270', 'Ырчы-уул ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1612),
('898304a7-552d-1030-9562-001022fda270', 'Эгемендик ул., арча-бешик', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1613),
('8983064a-552d-1030-9562-001022fda270', 'Эгинчиева ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1614),
('898307ed-552d-1030-9562-001022fda270', 'Эгинчиева ул.,маданият ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1615),
('89830b69-552d-1030-9562-001022fda270', 'Элебаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1616),
('89830d5d-552d-1030-9562-001022fda270', 'Элет ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1617),
('89830f13-552d-1030-9562-001022fda270', 'Энергетиков ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1618),
('898310cd-552d-1030-9562-001022fda270', 'Эне-сай', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1619),
('89831281-552d-1030-9562-001022fda270', 'Энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1620),
('89831445-552d-1030-9562-001022fda270', 'Энесай ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1621),
('8983160f-552d-1030-9562-001022fda270', 'Эне-сай 1 ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1622),
('8983189d-552d-1030-9562-001022fda270', 'Энесай 1 ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1623),
('89831a19-552d-1030-9562-001022fda270', 'Энесай 10 ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1624),
('89831b84-552d-1030-9562-001022fda270', 'Энесай 11 ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1625),
('89831ec7-552d-1030-9562-001022fda270', 'Энесай 12 ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1626),
('8983205f-552d-1030-9562-001022fda270', 'Эне-сай 13 ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1627),
('898321de-552d-1030-9562-001022fda270', 'Энесай 13 ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1628),
('89832360-552d-1030-9562-001022fda270', 'Энесай 14 ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1629),
('898324ef-552d-1030-9562-001022fda270', 'Энесай 15 ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1630),
('89832679-552d-1030-9562-001022fda270', 'Энесай 16 ул, энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1631),
('89832800-552d-1030-9562-001022fda270', 'Энесай 17 ул, энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1632),
('8983298d-552d-1030-9562-001022fda270', 'Энесай 18 ул, энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1633),
('89832b11-552d-1030-9562-001022fda270', 'Энесай 19 ул., энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1634),
('89832ca6-552d-1030-9562-001022fda270', 'Эне-сай 2 ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1635),
('89832e33-552d-1030-9562-001022fda270', 'Энесай 2 ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1636),
('89833152-552d-1030-9562-001022fda270', 'Эне-сай 3 ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1637),
('89833378-552d-1030-9562-001022fda270', 'Энесай 3 ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1638),
('89833548-552d-1030-9562-001022fda270', 'Эне-сай 4 ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1639),
('898336fc-552d-1030-9562-001022fda270', 'Энесай 4 ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1640),
('898338ad-552d-1030-9562-001022fda270', 'Эне-сай 5 ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1641),
('89833a58-552d-1030-9562-001022fda270', 'Энесай 5 ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1642),
('89833c0c-552d-1030-9562-001022fda270', 'Эне-сай 6 ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1643),
('89833db7-552d-1030-9562-001022fda270', 'Энесай 6 ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1644),
('89833f71-552d-1030-9562-001022fda270', 'Эне-сай 7 ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1645),
('8983412a-552d-1030-9562-001022fda270', 'Энесай 7 ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1646),
('89834417-552d-1030-9562-001022fda270', 'Энесай 8 ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1647),
('89834697-552d-1030-9562-001022fda270', 'Энесай 9 ул.,энесай ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1648),
('89834970-552d-1030-9562-001022fda270', 'Энесай-9 ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1649),
('89834afc-552d-1030-9562-001022fda270', 'Энтузиастов ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1650),
('89834c76-552d-1030-9562-001022fda270', 'Эркиндик пр.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1651),
('89834de1-552d-1030-9562-001022fda270', 'Эркин-тоо ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1652),
('89834f5a-552d-1030-9562-001022fda270', 'Эркин-тоо ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1653),
('898350de-552d-1030-9562-001022fda270', 'Эркин-тоо ул.,ынтымак ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1654),
('89835257-552d-1030-9562-001022fda270', 'Эркисай ул.,саламалик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1655),
('898353ce-552d-1030-9562-001022fda270', 'Эрмек ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1656),
('8983554f-552d-1030-9562-001022fda270', 'Эр.табылды ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1657),
('89835871-552d-1030-9562-001022fda270', 'Эр-тайлак ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1658),
('89835a8f-552d-1030-9562-001022fda270', 'Эр-тоштук ул.,бакай-ата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1659),
('89835c54-552d-1030-9562-001022fda270', 'Эстонский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1660),
('89835deb-552d-1030-9562-001022fda270', 'Эшпай ул., ала-арча ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1661),
('89835f7e-552d-1030-9562-001022fda270', 'Юго-западный район', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1662),
('8983610a-552d-1030-9562-001022fda270', 'Юг-2 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1663),
('8983629d-552d-1030-9562-001022fda270', 'Юдахина академика ул. - 6-я линия ', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1664),
('8983644b-552d-1030-9562-001022fda270', 'Южная магистраль ул., арча - бешик ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1665),
('89836602-552d-1030-9562-001022fda270', 'Ю.магистраль ул.,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1666),
('898367a2-552d-1030-9562-001022fda270', 'Юнусалиева.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1667),
('8983694d-552d-1030-9562-001022fda270', 'Яблочный пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1668),
('89836c69-552d-1030-9562-001022fda270', 'Якутская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1669),
('89836ea1-552d-1030-9562-001022fda270', 'Ялтинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1670),
('89837097-552d-1030-9562-001022fda270', 'Январская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1671),
('89837267-552d-1030-9562-001022fda270', 'Январский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1672),
('89837431-552d-1030-9562-001022fda270', 'Ярмарочный пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1673),
('89837655-552d-1030-9562-001022fda270', 'Ясинский пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1674),
('89837920-552d-1030-9562-001022fda270', '1 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1675),
('89837a94-552d-1030-9562-001022fda270', '1 ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1676),
('89837bf9-552d-1030-9562-001022fda270', '1-е отд. ст. аламедин 1 с-з ала-тоо', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1677),
('89837ea8-552d-1030-9562-001022fda270', '1-я виноградная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1678),
('898380da-552d-1030-9562-001022fda270', '1-я линия ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1679),
('89838275-552d-1030-9562-001022fda270', '1-я товарная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1680),
('898383f3-552d-1030-9562-001022fda270', '10 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1681),
('89838575-552d-1030-9562-001022fda270', '10 ул., ж/м арча-бешик', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1682),
('898386fc-552d-1030-9562-001022fda270', '11 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1683),
('89838897-552d-1030-9562-001022fda270', '11 ул., ак-бата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1684),
('89838a29-552d-1030-9562-001022fda270', '11 ул., ж/м арча-бешик', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1685),
('89838bb6-552d-1030-9562-001022fda270', '110 квартал', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1686),
('89838d56-552d-1030-9562-001022fda270', '12 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1687),
('89838f0a-552d-1030-9562-001022fda270', '125 лет г.бишкек ул., арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1688),
('898390bb-552d-1030-9562-001022fda270', '17-я линия ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1689),
('89839406-552d-1030-9562-001022fda270', '2 ул,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1690),
('8983960b-552d-1030-9562-001022fda270', '2 черепки ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1691),
('898397f7-552d-1030-9562-001022fda270', '2-я горная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1692),
('898399c7-552d-1030-9562-001022fda270', '2-я линия ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1693),
('89839b83-552d-1030-9562-001022fda270', '2-я селекционная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1694),
('89839d34-552d-1030-9562-001022fda270', '2-я товарная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1695),
('89839ef0-552d-1030-9562-001022fda270', '22 ул., арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1696),
('8983a0af-552d-1030-9562-001022fda270', '24 ул, ак-орго ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1697),
('8983a284-552d-1030-9562-001022fda270', '25 ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1698),
('8983a451-552d-1030-9562-001022fda270', '26 ул., ж/м репина-ахунбаева', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1699),
('8983a810-552d-1030-9562-001022fda270', '27 ул., ж/м репина-ахунбаева', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1700),
('8983aae9-552d-1030-9562-001022fda270', '28 ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1701),
('8983ac67-552d-1030-9562-001022fda270', '28 участок,арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1702),
('8983adde-552d-1030-9562-001022fda270', '3 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1703),
('8983af5a-552d-1030-9562-001022fda270', '3 м-р торговый центр', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1704),
('8983b0db-552d-1030-9562-001022fda270', '3 черепки', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1705),
('8983b254-552d-1030-9562-001022fda270', '3-я линия ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1706),
('8983b3cb-552d-1030-9562-001022fda270', '4 кгб, арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1707),
('8983b541-552d-1030-9562-001022fda270', '4 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1708),
('8983b6d1-552d-1030-9562-001022fda270', '4 ул., арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1709),
('8983b9bd-552d-1030-9562-001022fda270', '4-я линия ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1710),
('8983bbb7-552d-1030-9562-001022fda270', '40 лет киргизии п.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1711),
('8983bd57-552d-1030-9562-001022fda270', '5 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1712),
('8983bee1-552d-1030-9562-001022fda270', '5-я линия ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1713),
('8983c07f-552d-1030-9562-001022fda270', '6 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1714),
('8983c219-552d-1030-9562-001022fda270', '6 ул., ак-бата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1715),
('8983c3c5-552d-1030-9562-001022fda270', '6 ул., арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1716),
('8983c56d-552d-1030-9562-001022fda270', '65 участок, ж/м юго-западный', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1717),
('8983c716-552d-1030-9562-001022fda270', '7 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1718),
('8983c8ca-552d-1030-9562-001022fda270', '7 м-р орто-сайский рынок', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1719),
('8983ca86-552d-1030-9562-001022fda270', '7-я линия', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1720),
('8983cdc6-552d-1030-9562-001022fda270', '7-я ул., арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1721),
('8983d01c-552d-1030-9562-001022fda270', '8 марта ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1722),
('8983d235-552d-1030-9562-001022fda270', '8 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1723);
INSERT INTO `aknet_street` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `street_id`) VALUES
('8983d42b-552d-1030-9562-001022fda270', '8 ул., ак-бата ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1724),
('8983d612-552d-1030-9562-001022fda270', '8 ул., арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1725),
('8983d803-552d-1030-9562-001022fda270', '8-я линия', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1726),
('8983daaa-552d-1030-9562-001022fda270', '9 м/р', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1727),
('8983dc2e-552d-1030-9562-001022fda270', '9 января ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1728),
('8983dda7-552d-1030-9562-001022fda270', '9-я линия', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1729),
('8983e094-552d-1030-9562-001022fda270', '9-я ул., арча-бешик ж/м', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1730),
('8983e2fd-552d-1030-9562-001022fda270', 'Кант Абрикосовая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1732),
('8983e4ab-552d-1030-9562-001022fda270', 'Кант Абыш чекиров ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1733),
('8983e641-552d-1030-9562-001022fda270', 'Кант Акдашева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1734),
('8983e7bc-552d-1030-9562-001022fda270', 'Кант Алма-атинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1735),
('8983e93b-552d-1030-9562-001022fda270', 'Кант Базарный переулок', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1736),
('8983eabd-552d-1030-9562-001022fda270', 'Кант Бакинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1737),
('8983ec47-552d-1030-9562-001022fda270', 'Кант Без наименования', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1738),
('8983edd6-552d-1030-9562-001022fda270', 'Кант Безымянная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1739),
('8983ef6e-552d-1030-9562-001022fda270', 'Кант Белинский переулок', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1740),
('8983f114-552d-1030-9562-001022fda270', 'Кант Белинского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1741),
('8983f3fb-552d-1030-9562-001022fda270', 'Кант Бокомбаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1742),
('8983f651-552d-1030-9562-001022fda270', 'Кант Больничная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1743),
('8983f831-552d-1030-9562-001022fda270', 'Кант Буслаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1744),
('8983f9fe-552d-1030-9562-001022fda270', 'Кант Валиханова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1745),
('8983fbd1-552d-1030-9562-001022fda270', 'Кант Ванахуна ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1746),
('8983fd9b-552d-1030-9562-001022fda270', 'Кант Вишневая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1747),
('8983ff79-552d-1030-9562-001022fda270', 'Кант Вокзальная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1748),
('89840170-552d-1030-9562-001022fda270', 'Кант Ворошилова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1749),
('8984036f-552d-1030-9562-001022fda270', 'Кант Восточная промзона', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1750),
('8984058a-552d-1030-9562-001022fda270', 'Кант Восточная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1751),
('898408bf-552d-1030-9562-001022fda270', 'Кант Гагарина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1752),
('89840ae6-552d-1030-9562-001022fda270', 'Кант Гайдара ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1753),
('89840db6-552d-1030-9562-001022fda270', 'Кант Гастелло ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1754),
('89840f4e-552d-1030-9562-001022fda270', 'Кант Герцена ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1755),
('898410cd-552d-1030-9562-001022fda270', 'Кант Гоголя ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1756),
('89841254-552d-1030-9562-001022fda270', 'Кант Гризодубова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1757),
('898413de-552d-1030-9562-001022fda270', 'Кант Дачная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1758),
('89841562-552d-1030-9562-001022fda270', 'Кант Джакыпова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1759),
('898416e4-552d-1030-9562-001022fda270', 'Кант Дзержинского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1760),
('89841863-552d-1030-9562-001022fda270', 'Кант Дорожная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1761),
('89841b39-552d-1030-9562-001022fda270', 'Кант Душанбинский пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1762),
('89841dff-552d-1030-9562-001022fda270', 'Кант Жданова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1763),
('89841fd4-552d-1030-9562-001022fda270', 'Кант Железнодорожная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1764),
('89842185-552d-1030-9562-001022fda270', 'Кант Забайкальская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1765),
('89842328-552d-1030-9562-001022fda270', 'Кант Западная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1766),
('898424df-552d-1030-9562-001022fda270', 'Кант Зеленая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1767),
('8984269d-552d-1030-9562-001022fda270', 'Кант Зубкова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1768),
('89842854-552d-1030-9562-001022fda270', 'Кант Иваницина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1769),
('89842a08-552d-1030-9562-001022fda270', 'Кант Интернациональный пе', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1770),
('89842bbf-552d-1030-9562-001022fda270', 'Кант Иссык-атинская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1771),
('89842e9a-552d-1030-9562-001022fda270', 'Кант Иссык-кульский пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1772),
('89843123-552d-1030-9562-001022fda270', 'Кант Казахстанский пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1773),
('89843343-552d-1030-9562-001022fda270', 'Кант Калинина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1774),
('8984353d-552d-1030-9562-001022fda270', 'Кант Кант г.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1775),
('89843726-552d-1030-9562-001022fda270', 'Кант Карасуйская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1776),
('8984390f-552d-1030-9562-001022fda270', 'Кант Киевская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1777),
('89843afd-552d-1030-9562-001022fda270', 'Кант Кирова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1778),
('89843ce3-552d-1030-9562-001022fda270', 'Кант Кирпичная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1779),
('89843fe4-552d-1030-9562-001022fda270', 'Кант Кирпичный пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1780),
('898442d6-552d-1030-9562-001022fda270', 'Кант Клубничная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1781),
('89844476-552d-1030-9562-001022fda270', 'Кант Ключевая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1782),
('898445ce-552d-1030-9562-001022fda270', 'Кант К.маркса ул', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1783),
('89844755-552d-1030-9562-001022fda270', 'Кант Колхозный пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1784),
('898448e2-552d-1030-9562-001022fda270', 'Кант Комарова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1785),
('89844a55-552d-1030-9562-001022fda270', 'Кант Коммунальный пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1786),
('89844bad-552d-1030-9562-001022fda270', 'Кант Коммунистический пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1787),
('89844d10-552d-1030-9562-001022fda270', 'Кант Космодемьянской ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1788),
('89844e6d-552d-1030-9562-001022fda270', 'Кант Котовского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1789),
('8984502c-552d-1030-9562-001022fda270', 'Кант Красноармейская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1790),
('898451c6-552d-1030-9562-001022fda270', 'Кант Крупской ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1791),
('8984534b-552d-1030-9562-001022fda270', 'Кант Куйбышева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1792),
('89845621-552d-1030-9562-001022fda270', 'Кант Куренкеева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1793),
('898457f1-552d-1030-9562-001022fda270', 'Кант Кутузова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1794),
('89845980-552d-1030-9562-001022fda270', 'Кант Ленина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1795),
('89845b15-552d-1030-9562-001022fda270', 'Кант Ленинградская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1796),
('89845cad-552d-1030-9562-001022fda270', 'Кант Лермонтова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1797),
('89845e48-552d-1030-9562-001022fda270', 'Кант Линейная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1798),
('89845feb-552d-1030-9562-001022fda270', 'Кант Логвиненко ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1799),
('8984618e-552d-1030-9562-001022fda270', 'Кант Ломоносова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1800),
('89846339-552d-1030-9562-001022fda270', 'Кант Льва толстого ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1801),
('898464e8-552d-1030-9562-001022fda270', 'Кант М п с', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1802),
('89846696-552d-1030-9562-001022fda270', 'Кант Маликова пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1803),
('898469b8-552d-1030-9562-001022fda270', 'Кант Марковского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1804),
('89846bba-552d-1030-9562-001022fda270', 'Кант Матросова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1805),
('89846e4a-552d-1030-9562-001022fda270', 'Кант Маяковского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1806),
('89846fb5-552d-1030-9562-001022fda270', 'Кант М.горького ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1807),
('89847115-552d-1030-9562-001022fda270', 'Кант Меркулова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1808),
('89847275-552d-1030-9562-001022fda270', 'Кант Микояна ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1809),
('898473e3-552d-1030-9562-001022fda270', 'Кант Микрорайон 1', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1810),
('8984756a-552d-1030-9562-001022fda270', 'Кант Микрорайон 2', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1811),
('898476d0-552d-1030-9562-001022fda270', 'Кант Микрорайон 3', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1812),
('89847854-552d-1030-9562-001022fda270', 'Кант Мира ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1813),
('898479de-552d-1030-9562-001022fda270', 'Кант Мирный пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1814),
('89847c99-552d-1030-9562-001022fda270', 'Кант Мичурина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1815),
('89847eb1-552d-1030-9562-001022fda270', 'Кант Молодая гвардия ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1816),
('89848054-552d-1030-9562-001022fda270', 'Кант Молодежная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1817),
('898481db-552d-1030-9562-001022fda270', 'Кант Морозова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1818),
('89848373-552d-1030-9562-001022fda270', 'Кант Московская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1819),
('8984850b-552d-1030-9562-001022fda270', 'Кант Набережная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1820),
('8984869d-552d-1030-9562-001022fda270', 'Кант Нахимова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1821),
('89848830-552d-1030-9562-001022fda270', 'Кант Неизвестно.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1822),
('898489b9-552d-1030-9562-001022fda270', 'Кант Некрасова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1823),
('89848b49-552d-1030-9562-001022fda270', 'Кант Озерный пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1824),
('89848cef-552d-1030-9562-001022fda270', 'Кант Октябрьская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1825),
('89848e8f-552d-1030-9562-001022fda270', 'Кант Ордженикидзе ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1826),
('898491c2-552d-1030-9562-001022fda270', 'Кант Орозова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1827),
('898493cc-552d-1030-9562-001022fda270', 'Кант Островского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1828),
('898495a1-552d-1030-9562-001022fda270', 'Кант Панфилова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1829),
('8984975e-552d-1030-9562-001022fda270', 'Кант Парковая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1830),
('89849917-552d-1030-9562-001022fda270', 'Кант Пионерская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1831),
('89849b91-552d-1030-9562-001022fda270', 'Кант Пишпекская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1832),
('89849cf4-552d-1030-9562-001022fda270', 'Кант Победы ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1833),
('89849e40-552d-1030-9562-001022fda270', 'Кант Полевая почта', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1834),
('89849f90-552d-1030-9562-001022fda270', 'Кант Полевая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1835),
('8984a0e7-552d-1030-9562-001022fda270', 'Кант Попова пер.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1836),
('8984a23f-552d-1030-9562-001022fda270', 'Кант Почтовое отделение', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1837),
('8984a542-552d-1030-9562-001022fda270', 'Кант Почтовый пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1838),
('8984a72e-552d-1030-9562-001022fda270', 'Кант Пржевальского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1839),
('8984a8d6-552d-1030-9562-001022fda270', 'Кант Пролетарский пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1840),
('8984aa4f-552d-1030-9562-001022fda270', 'Кант Прудовый пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1841),
('8984abcb-552d-1030-9562-001022fda270', 'Кант Пушкина ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1842),
('8984ad3c-552d-1030-9562-001022fda270', 'Кант Розы люксембург ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1843),
('8984aeb8-552d-1030-9562-001022fda270', 'Кант Садовая ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1844),
('8984b03f-552d-1030-9562-001022fda270', 'Кант Сакебаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1845),
('8984b1be-552d-1030-9562-001022fda270', 'Кант Салиева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1846),
('8984b35e-552d-1030-9562-001022fda270', 'Кант Свеклопункт', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1847),
('8984b54a-552d-1030-9562-001022fda270', 'Кант Свердлова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1848),
('8984b893-552d-1030-9562-001022fda270', 'Кант Склады минздрава', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1849),
('8984bac1-552d-1030-9562-001022fda270', 'Кант Советская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1850),
('8984bc97-552d-1030-9562-001022fda270', 'Кант Спортивный пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1851),
('8984be58-552d-1030-9562-001022fda270', 'Кант Строительная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1852),
('8984c004-552d-1030-9562-001022fda270', 'Кант Строительный пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1853),
('8984c1d1-552d-1030-9562-001022fda270', 'Кант Суворова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1854),
('8984c395-552d-1030-9562-001022fda270', 'Кант Таласский пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1855),
('8984c565-552d-1030-9562-001022fda270', 'Кант Ташкентский пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1856),
('8984c72f-552d-1030-9562-001022fda270', 'Кант Тельмана ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1857),
('8984cac9-552d-1030-9562-001022fda270', 'Кант Тоголок молдо ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1858),
('8984ccdf-552d-1030-9562-001022fda270', 'Кант Токтогула ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1859),
('8984ce66-552d-1030-9562-001022fda270', 'Кант Тулебердиева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1860),
('8984cfd7-552d-1030-9562-001022fda270', 'Кант Фрунзе ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1861),
('8984d14a-552d-1030-9562-001022fda270', 'Кант Фрунзенская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1862),
('8984d2aa-552d-1030-9562-001022fda270', 'Кант Фучика ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1863),
('8984d41e-552d-1030-9562-001022fda270', 'Кант Цемзаводская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1864),
('8984d58c-552d-1030-9562-001022fda270', 'Кант Центральная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1865),
('8984d710-552d-1030-9562-001022fda270', 'Кант Чапаева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1866),
('8984d892-552d-1030-9562-001022fda270', 'Кант Чернышевского ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1867),
('8984da1b-552d-1030-9562-001022fda270', 'Кант Чехова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1868),
('8984dba5-552d-1030-9562-001022fda270', 'Кант Чкалова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1869),
('8984de52-552d-1030-9562-001022fda270', 'Кант Чуйская ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1870),
('8984e0a8-552d-1030-9562-001022fda270', 'Кант Шапошникова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1871),
('8984e267-552d-1030-9562-001022fda270', 'Кант Шевченко ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1872),
('8984e407-552d-1030-9562-001022fda270', 'Кант Школьный пер', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1873),
('8984e5f3-552d-1030-9562-001022fda270', 'Кант Шмелева ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1874),
('8984e7de-552d-1030-9562-001022fda270', 'Кант Шолохова ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1875),
('8984e9b4-552d-1030-9562-001022fda270', 'Кант Щорса ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1876),
('8984eb73-552d-1030-9562-001022fda270', 'Кант Энгельса ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1877),
('8984ed3d-552d-1030-9562-001022fda270', 'Кант Южная ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1878),
('8984eef3-552d-1030-9562-001022fda270', 'Кант 25 партсъезда ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1879),
('8984f1bc-552d-1030-9562-001022fda270', 'Кант 3800 км ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1880),
('8984f428-552d-1030-9562-001022fda270', 'Кант 50 лет октября ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1881),
('8984f627-552d-1030-9562-001022fda270', 'Кант 60 лет киргизии ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1882),
('8984f802-552d-1030-9562-001022fda270', 'Кант 60 лет лксм ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1883),
('8984faaf-552d-1030-9562-001022fda270', 'Кант 60 лет октября ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1884),
('8984fc38-552d-1030-9562-001022fda270', 'Кант 60 лет ссср ул.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1885);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

--
-- Dumping data for table `aknet_tvtariff`
--

INSERT INTO `aknet_tvtariff` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `billing_tariff_id`) VALUES
('671673e6-062e-91b8-a9a4-50813b9443ce', 'Family', '2012-10-19 11:37:57', '2012-10-19 11:37:57', '1', '1', '', 0, NULL, 1);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `category` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` text,
  KEY `idx_config_cat` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`category`, `name`, `value`) VALUES
('notify', 'fromaddress', 'do_not_reply@example.com'),
('notify', 'fromname', 'Aknet ISP'),
('notify', 'send_by_default', '1'),
('notify', 'on', '1'),
('notify', 'send_from_assigning_user', '0'),
('info', 'sugar_version', '6.5.4'),
('MySettings', 'tab', 'YToyNTp7czo0OiJIb21lIjtzOjQ6IkhvbWUiO3M6ODoiQWNjb3VudHMiO3M6ODoiQWNjb3VudHMiO3M6ODoiQ29udGFjdHMiO3M6ODoiQ29udGFjdHMiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6NToiTGVhZHMiO3M6NToiTGVhZHMiO3M6ODoiQ2FsZW5kYXIiO3M6ODoiQ2FsZW5kYXIiO3M6OToiRG9jdW1lbnRzIjtzOjk6IkRvY3VtZW50cyI7czo2OiJFbWFpbHMiO3M6NjoiRW1haWxzIjtzOjk6IkNhbXBhaWducyI7czo5OiJDYW1wYWlnbnMiO3M6NToiQ2FsbHMiO3M6NToiQ2FsbHMiO3M6ODoiTWVldGluZ3MiO3M6ODoiTWVldGluZ3MiO3M6NToiVGFza3MiO3M6NToiVGFza3MiO3M6NToiTm90ZXMiO3M6NToiTm90ZXMiO3M6NToiQ2FzZXMiO3M6NToiQ2FzZXMiO3M6OToiUHJvc3BlY3RzIjtzOjk6IlByb3NwZWN0cyI7czoxMzoiUHJvc3BlY3RMaXN0cyI7czoxMzoiUHJvc3BlY3RMaXN0cyI7czoyMToiQWtuZXRfU2VydmljZUludGVybmV0IjtzOjIxOiJBa25ldF9TZXJ2aWNlSW50ZXJuZXQiO3M6MTI6IkFrbmV0X1N0cmVldCI7czoxMjoiQWtuZXRfU3RyZWV0IjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO3M6MTU6IkFrbmV0X1NlcnZpY2VUViI7czoxODoiQWtuZXRfU2VydmljZVZQTkwyIjtzOjE4OiJBa25ldF9TZXJ2aWNlVlBOTDIiO3M6MTA6Impqd2FfVG9vbHMiO3M6MTA6Impqd2FfVG9vbHMiO3M6MTI6Impqd2FfUmVwb3J0cyI7czoxMjoiamp3YV9SZXBvcnRzIjtzOjIwOiJBa25ldF9JbnRlcm5ldFRhcmlmZiI7czoyMDoiQWtuZXRfSW50ZXJuZXRUYXJpZmYiO3M6MTQ6IkFrbmV0X1RWVGFyaWZmIjtzOjE0OiJBa25ldF9UVlRhcmlmZiI7czoxNToiSW52ZW50b3J5X2l0ZW1zIjtzOjE1OiJJbnZlbnRvcnlfaXRlbXMiO30='),
('portal', 'on', '0'),
('tracker', 'Tracker', '1'),
('system', 'skypeout_on', '1'),
('sugarfeed', 'enabled', '1'),
('sugarfeed', 'module_UserFeed', '1'),
('sugarfeed', 'module_Leads', '1'),
('sugarfeed', 'module_Cases', '1'),
('sugarfeed', 'module_Opportunities', '1'),
('sugarfeed', 'module_Contacts', '1'),
('Update', 'CheckUpdates', 'automatic'),
('system', 'name', 'Aknet ISP'),
('license', 'msg_admin', ''),
('license', 'msg_all', ''),
('license', 'last_validation', 'success'),
('license', 'latest_versions', 'YToxOntpOjA7YToyOntzOjc6InZlcnNpb24iO3M6NToiNi41LjUiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjE2MjoiVGhlIGxhdGVzdCB2ZXJzaW9uIG9mIFN1Z2FyQ1JNIGlzIDYuNS41LiAgUGxlYXNlIHZpc2l0IDxhIGhyZWY9Imh0dHA6Ly9zdXBwb3J0LnN1Z2FyY3JtLmNvbSIgdGFyZ2V0PSJfbmV3Ij5zdXBwb3J0LnN1Z2FyY3JtLmNvbTwvYT4gdG8gYWNxdWlyZSB0aGUgbGF0ZXN0IHZlcnNpb24uIjt9fQ=='),
('Update', 'last_check_date', '1354503535'),
('Update', 'last_check_version', '6.5.5'),
('system', 'adminwizard', '1'),
('notify', 'allow_default_outbound', '0'),
('proxy', 'on', '0'),
('proxy', 'host', ''),
('proxy', 'port', ''),
('proxy', 'auth', '0'),
('proxy', 'username', 'admin'),
('proxy', 'password', 'e0tuPrld718=');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `salutation`, `first_name`, `last_name`, `title`, `department`, `do_not_call`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `primary_address_street`, `primary_address_city`, `primary_address_state`, `primary_address_postalcode`, `primary_address_country`, `alt_address_street`, `alt_address_city`, `alt_address_state`, `alt_address_postalcode`, `alt_address_country`, `assistant`, `assistant_phone`, `lead_source`, `reports_to_id`, `birthdate`, `campaign_id`) VALUES
('95f25806-a654-b8df-5e99-5077f6e2e412', '2012-10-12 10:50:57', '2012-10-18 04:54:57', '1', '1', '', 1, '1', '', 'Алексей', 'Ким', 'Программист', '', 0, '', '0555810509', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
('b83b2268-2611-fc55-39b2-507bd92bca49', '2012-10-15 09:37:33', '2012-10-18 04:54:57', '1', '1', '', 1, '1', '', 'Темир', 'Умурзаков', '', '', 0, '', '0555810509', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
('14778e91-0f44-8a10-f913-507bddd97f57', '2012-10-15 09:53:59', '2012-10-18 04:54:57', '1', '1', '', 1, '1', '', 'Ильдар', 'Мурсалимов', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
('299ff1c9-daf2-4902-14f9-507bf17f8e1a', '2012-10-15 11:21:37', '2012-10-18 04:54:57', '1', '1', '', 1, '1', '', 'Чак', 'Норрис', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
('efe00d56-224a-4112-510b-507bf2ab17ab', '2012-10-15 11:23:37', '2012-10-18 04:54:57', '1', '1', '', 1, '1', '', 'Вуппи', 'Голдберг', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
('89533606-ae36-9786-cf61-507bf36ae5d9', '2012-10-15 11:28:54', '2012-10-18 04:54:57', '1', '1', '', 1, '1', '', 'Борис', 'Пастернак', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
('166b0520-9b3f-b021-0b82-507bf4d00101', '2012-10-15 11:35:05', '2012-10-18 04:54:57', '1', '1', '', 1, '1', '', 'Лев', 'Толстой', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
('bf2aac70-728c-1541-75f6-507bf5ae0074', '2012-10-15 11:38:55', '2012-10-18 04:54:57', '1', '1', '', 1, '1', '', 'Леонид', 'Ульянов', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
('d6511074-76ff-657b-d5fb-507bf67c1964', '2012-10-15 11:40:47', '2012-10-18 04:54:57', '1', '1', '', 1, '1', '', 'Александр', 'Пушкин', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
('604aa8fc-1901-7f9e-bc96-507bf678ccb3', '2012-10-15 11:43:30', '2012-10-18 04:54:57', '1', '1', '', 1, '1', '', 'Александр', 'Блок', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, ''),
('7b7cc131-186f-465f-2f9f-50810b169a16', '2012-10-19 08:10:52', '2012-10-19 11:17:20', '1', '1', NULL, 0, '1', NULL, 'Ололош', 'Ололоев', NULL, NULL, 0, NULL, '0555810509', '0312611155', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, ''),
('36de02a6-3097-7240-9037-50a479768785', '2012-11-15 05:13:06', '2012-11-15 05:13:06', '1', '1', '', 0, '1', '', 'Alexey', 'Kim', '', '', 0, '', '0555810509', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_cstm`
--

CREATE TABLE IF NOT EXISTS `contacts_cstm` (
  `id_c` char(36) NOT NULL,
  `address_country_c` varchar(100) DEFAULT 'KYRGYZSTAN',
  `address_city_c` varchar(100) DEFAULT 'bishkek',
  `address_state_c` varchar(100) DEFAULT 'chui',
  `address_building_c` varchar(255) DEFAULT NULL,
  `address_appartment_c` varchar(255) DEFAULT NULL,
  `address_postcode_c` varchar(255) DEFAULT NULL,
  `email_c` varchar(255) DEFAULT NULL,
  `address_street_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts_cstm`
--

INSERT INTO `contacts_cstm` (`id_c`, `address_country_c`, `address_city_c`, `address_state_c`, `address_building_c`, `address_appartment_c`, `address_postcode_c`, `email_c`, `address_street_c`) VALUES
('95f25806-a654-b8df-5e99-5077f6e2e412', 'KYRGYZSTAN', 'bishkek', 'chui', '59', '40', '', 'tima@aknet.kg', NULL),
('b83b2268-2611-fc55-39b2-507bd92bca49', 'KYRGYZSTAN', 'bishkek', 'chui', '86', '40', '720083', 'temonix@gmail.com', NULL),
('14778e91-0f44-8a10-f913-507bddd97f57', 'KYRGYZSTAN', 'bishkek', 'chui', '265', 'а', '720071', '', NULL),
('299ff1c9-daf2-4902-14f9-507bf17f8e1a', 'KYRGYZSTAN', 'bishkek', 'chui', '', '', '', '', NULL),
('efe00d56-224a-4112-510b-507bf2ab17ab', 'KYRGYZSTAN', 'bishkek', 'chui', '', '', '', '', NULL),
('89533606-ae36-9786-cf61-507bf36ae5d9', 'KYRGYZSTAN', 'bishkek', 'chui', '', '', '', '', NULL),
('166b0520-9b3f-b021-0b82-507bf4d00101', 'KYRGYZSTAN', 'bishkek', 'chui', '', '', '', '', NULL),
('bf2aac70-728c-1541-75f6-507bf5ae0074', 'KYRGYZSTAN', 'bishkek', 'chui', '', '', '', '', NULL),
('d6511074-76ff-657b-d5fb-507bf67c1964', 'KYRGYZSTAN', 'bishkek', 'chui', '', '', '', '', NULL),
('604aa8fc-1901-7f9e-bc96-507bf678ccb3', 'KYRGYZSTAN', 'bishkek', 'chui', '', '', '', '', NULL),
('7b7cc131-186f-465f-2f9f-50810b169a16', 'KYRGYZSTAN', 'bishkek', 'chui', '40', '86', '', '', '89762d90-552d-1030-9562-001022fda270'),
('36de02a6-3097-7240-9037-50a479768785', 'KYRGYZSTAN', 'bishkek', 'chui', '10', '5', '', '', '8975bdc6-552d-1030-9562-001022fda270');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `iso4217`, `conversion_rate`, `status`, `deleted`, `date_entered`, `date_modified`, `created_by`) VALUES
('870dffe7-bd67-c942-03ec-507bd6ca368f', 'US Dollar', '$', 'USD', 47, 'Active', 0, '2012-10-15 09:23:46', '2012-10-15 09:23:46', '1');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_addresses`
--

INSERT INTO `email_addresses` (`id`, `email_address`, `email_address_caps`, `invalid_email`, `opt_out`, `date_created`, `date_modified`, `deleted`) VALUES
('e526e602-ed3e-e840-90ad-50724ebc0bca', 'tima@aknet.kg', 'TIMA@AKNET.KG', 0, 0, '2012-10-08 03:53:09', '2012-10-18 11:16:20', 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_addr_bean_rel`
--

INSERT INTO `email_addr_bean_rel` (`id`, `email_address_id`, `bean_id`, `bean_module`, `primary_address`, `reply_to_address`, `date_created`, `date_modified`, `deleted`) VALUES
('e47b2a4c-f4e9-e9fd-50e9-50724e24b28a', 'e526e602-ed3e-e840-90ad-50724ebc0bca', '1', 'Users', 1, 0, '2012-10-08 03:53:09', '2012-10-08 03:53:09', 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_cache`
--

INSERT INTO `email_cache` (`ie_id`, `mbox`, `subject`, `fromaddr`, `toaddr`, `senddate`, `message_id`, `mailsize`, `imap_uid`, `msgno`, `recent`, `flagged`, `answered`, `deleted`, `seen`, `draft`) VALUES
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'webcam', 'roman@aknet.kg', 'tima@aknet.kg', '2011-02-16 06:48:50', '<e774fd49fd73ffabf928601edd9bd172@aknet.kg>', 3031082, 1917, 1, 0, 0, 1, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Fwd: Re: webkit console', 'Alisher Kovalev <alisher@aknet.kg>', 'tima@aknet.kg', '2012-06-05 08:47:51', '<7cef400f86404de67d2259646c479189@aknet.kg>', 2781, 5477, 2, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?windows-1251?B?7vLs5e3g?=', 'Diana <d.akopyan@neotech.kg>', 'tima@aknet.kg', '2012-06-05 10:06:22', '<393947539.20120605160622@neotech.kg>', 177770, 5478, 3, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'ATF24. Card statement 2012-06-05 [Cyrillic (Windows-1251)]', 'card-info-out@atfbank.kz', 'tima@aknet.kg', '2012-06-05 10:12:21', '<0558998d-1616-4bdb-82a8-dd37da721d08@exnlb2.corp.atfbank.kz>', 12288, 5479, 4, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'ATF24. Card statement 2012-06-05 [Cyrillic (Windows-1251)]', 'card-info-out@atfbank.kz', 'tima@aknet.kg', '2012-06-05 10:28:07', '<4c7dfcbc-95c3-4ce3-97a1-cd6739740eae@exnlb2.corp.atfbank.kz>', 14693, 5480, 5, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-05 11:10:02', '<201206051110.q55BA2WZ018039@billing.aknet.kg>', 930, 5481, 6, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-06 06:10:02', '<201206060610.q566A2P4041885@billing.aknet.kg>', 929, 5482, 7, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-06 11:10:02', '<201206061110.q56BA2d9003763@billing.aknet.kg>', 931, 5483, 8, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?windows-1251?B?6u7w8OXq8ujw7uLq4A==?=', 'Diana <d.akopyan@neotech.kg>', '=?windows-1251?B?0+zz8Ofg6u7iINLl7Ojw?= <tima@aknet.kg>', '2012-06-07 03:34:16', '<779775779.20120607093416@neotech.kg>', 176584, 5484, 9, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Fwd: Resume', 'Ildar Mursalimov <ildar@aknet.kg>', 'tima@aknet.kg', '2012-06-07 06:05:47', '<c656d7cdb29b4fbaa6e27d611b1fa687@aknet.kg>', 24232, 5485, 10, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'test', 'Umurzakov Temir <temir@umurzakov.com>', 'tima@aknet.kg', '2012-06-08 11:50:51', '<CA+hL74DpOd_nHUsexP4koqhGPfk9zL-fdC13E+1Wz1fBK0kamg@mail.gmail.com>', 2144, 5486, 11, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?RndkOiDQotC40LzQtQ==?=', '=?UTF-8?B?0J3QsNGC0LDQu9GM0Y8g0KLQuNGF0L7QvNC40YDQvtCy0LA=?= <nataliatim@mail.ru>', 'tima@aknet.kg', '2012-06-08 11:57:25', '<1339156645.923447340@f39.mail.ru>', 280170, 5488, 12, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?Q?=D0=9F=D0=BB=D0=B7?= =?utf-8?Q?_=D0=BF=D1=80=D0=BE=D0=BF=D0=B8=D1=88=D0=B8?= =?utf-8?Q?_=D0=BE=D0=B3=D1=80=D0=B0=D0=BD=D0=B8=D1=87=D0=B5=D0=BD?= =?utf-8?Q?=D0=B8=D1=8F_=D0=BD=D0=B0_phpmyadmin_=D0=BF=D0=BE_i?= =?utf-8?Q?p_=D0=B0=D0=B4=D1=80=D0=B5', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-06-10 16:37:33', '<20120610163733.94829.767343789.swift@crm.aknet.kg>', 3208, 5489, 13, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-12 11:10:02', '<201206121110.q5CBA2Ji021790@billing.aknet.kg>', 933, 5490, 14, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?Q?=D0=91=D0=BE=D1=80=D1=8C=D0=B1=D0=B0_=D1=81?= =?utf-8?Q?_=D0=BB=D0=B5=D0=BD=D1=8C=D1=8E.?=', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-06-12 14:33:23', '<20120612143323.50289.620215647.swift@crm.aknet.kg>', 9597, 5491, 15, 0, 0, 1, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-13 06:10:01', '<201206130610.q5D6A1Nl046150@billing.aknet.kg>', 932, 5492, 16, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-13 11:10:02', '<201206131110.q5DBA1c0008357@billing.aknet.kg>', 1003, 5493, 17, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-14 05:15:01', '<201206140515.q5E5F15U022390@billing.aknet.kg>', 877, 5494, 18, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?Rlc6INCh0YLQsNGC0LjRgdGC0LjQutCwINC/0L7QtNC60LvRjtGH0LXQvdC40Lk=?=', '=?UTF-8?B?0KHRg9GA0LDQtdCy0LAg0JDQu9C10LrRgdCw0L3QtNGA0LA=?= <alexandra@aknet.kg>', '=?UTF-8?B?0KPQvNGD0YDQt9Cw0LrQvtCyINCi0LjQvNCw?= <tima@aknet.kg>', '2012-06-14 05:54:46', '<!&!AAAAAAAAAAAYAAAAAAAAAAPjTvJoRsNMmODq5IuT8+iCgQAAEAAAAIrk49LnYFBHjuBc1hw3uqwBAAAAAA==@aknet.kg>', 34112, 5495, 19, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-14 06:10:02', '<201206140610.q5E6A2MS032916@billing.aknet.kg>', 931, 5496, 20, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-15 05:15:00', '<201206150515.q5F5F05C010736@billing.aknet.kg>', 877, 5497, 21, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Aknet Mobilnik Internet 2012-06-10 2012-06-15', 'Charlie Root <root@jail.aknet.kg>', 'tima@aknet.kg', '2012-06-15 05:17:36', '<20120615111736.biabam.nc932B@biabam>', 18620, 5498, 22, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'CRM', '=?UTF-8?Q?=D0=A1=D0=B0=D0=B4=D1=8B=D0=BA=D0=BE=D0=B2_=D0=90=D0=B7?= =?UTF-8?Q?=D0=B8=D0=B7?= <S.Aziz', 'tima@aknet.kg', '2012-06-15 05:38:11', '<ec511cd265428a92d7b979e62a30aaa5@aknet.kg>', 1685, 5499, 23, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-15 06:10:03', '<201206150610.q5F6A3wh021693@billing.aknet.kg>', 933, 5500, 24, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-15 11:10:01', '<201206151110.q5FBA15A084036@billing.aknet.kg>', 1003, 5501, 25, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?Q?=D0=9D=D1=83=D0=B6=D0=BD=D1=8B?= =?utf-8?Q?_=D0=B8=D0=B7=D0=BC=D0=B5=D0=BD=D0=B5=D0=BD=D0=B8=D1=8F_?= =?utf-8?Q?=D0=BD=D0=B0_=D0=BC=D0=BE=D1=81=D1=82=D1=83?= =?utf-8?Q?_=D0=B4=D0=BE=D0=BC_=D1=81=D0=B5=D1=82=D0=B8_(101.1?= =?utf-8?Q?74)?=', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-06-15 17:02:09', '<20120615170209.35128.521760952.swift@crm.aknet.kg>', 4018, 5502, 26, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-16 05:15:00', '<201206160515.q5G5F0jp097334@billing.aknet.kg>', 877, 5503, 27, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-16 06:10:02', '<201206160610.q5G6A2Ww007823@billing.aknet.kg>', 933, 5504, 28, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-16 11:10:02', '<201206161110.q5GBA2WK067904@billing.aknet.kg>', 933, 5505, 29, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-17 05:15:00', '<201206170515.q5H5F0i7080362@billing.aknet.kg>', 877, 5506, 30, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Fwd: =?UTF-8?Q?=D0=B2=D0=BE=D0=BF=D1=80=D0=BE=D1=81=D1=8B=20?= =?UTF-8?Q?=D1=82=D0=B5=D1=85=D0=BD=2E=D0=B8=D0=BD=D1=82=D0=B5=D0=B3=D1=80?= =?UTF-8?Q?=D0=B0=D1=86=D0=B8=D0=B8?=', 'Alisher Kovalev <alisher@aknet.kg>', 'tima@aknet.kg', '2012-06-18 03:50:22', '<00f33ce2317d0710c10a0a3f45ee9b1a@aknet.kg>', 2327, 5507, 31, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?windows-1251?B?7vLs5e3g?=', 'Diana <d.akopyan@neotech.kg>', 'tima@aknet.kg', '2012-06-18 04:39:10', '<256583093.20120618103910@neotech.kg>', 183933, 5508, 32, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-18 05:15:00', '<201206180515.q5I5F0iT073402@billing.aknet.kg>', 877, 5509, 33, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-18 06:10:01', '<201206180610.q5I6A1KA084591@billing.aknet.kg>', 1001, 5510, 34, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-18 11:10:02', '<201206181110.q5IBA29h047073@billing.aknet.kg>', 1002, 5511, 35, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Fwd: =?UTF-8?Q?=D0=A2=D0=97=20=D0=BA=20=D0=B8=D0=BD=D1=82=D0=B5?= =?UTF-8?Q?=D1=80=D0=B0=D0=BA=D1=82=D0=B8=D0=B2=D0=BD=D1=8B=D0=BC=20=D1=84?= =?UTF-8?Q?=D1=83=D0=BD=D0=BA=D1=86=D0=B8=D1=8F=D0=BC=2E?=', 'Alisher Kovalev <alisher@aknet.kg>', 'tima@aknet.kg', '2012-06-19 03:32:06', '<6d048f374b0b598859039b9d12a14cd9@aknet.kg>', 49485, 5512, 36, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-19 05:15:00', '<201206190515.q5J5F0dd064472@billing.aknet.kg>', 877, 5513, 37, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-19 06:10:01', '<201206190610.q5J6A13Y075241@billing.aknet.kg>', 1001, 5514, 38, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Fwd: JUMP 18.06.12', 'Ildar Mursalimov <ildar@aknet.kg>', 'tima@aknet.kg', '2012-06-19 06:16:04', '<875e31e86b3dd8bd3a7cdbb0cbe91909@aknet.kg>', 145553, 5515, 39, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-19 11:10:02', '<201206191110.q5JBA2CA036816@billing.aknet.kg>', 1002, 5516, 40, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-20 05:15:01', '<201206200515.q5K5F1Ra053873@billing.aknet.kg>', 877, 5517, 41, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-20 06:10:01', '<201206200610.q5K6A1oR064481@billing.aknet.kg>', 1073, 5518, 42, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?Q?=D0=A0=D0=B5=D0=B7=D1=83=D0=BB=D1=8C=D1=82=D0=B0=D1=82?= =?UTF-8?Q?=D1=8B=20=D1=80=D0=B0=D0=B1=D0=BE=D1=87=D0=B5=D0=B9=20=D0=B2?= =?UTF-8?Q?=D1=81=D1=82=D1=80=D0=B5=D1=87=D0=B8=20=D0=BF=D0=BE=20=D0=B4?= =?UTF-8?Q?=D0=BE=D0=BF=2E=2E=D1=83=D1=81=D', 'Rostam Shahi <r.shahi@aknet.kg>', 'info@aknet.kg', '2012-06-20 09:22:56', '<7cd8100b5f479f7ba15bb72029f82d47@aknet.kg>', 22257, 5519, 43, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?windows-1251?B?z/Du9Ojr4Ory6Pfl8ero5SDw4OHu8vs=?=', 'Diana <d.akopyan@neotech.kg>', 'undisclosed-recipients: ', '2012-06-20 10:13:36', '<79656695.20120620161336@neotech.kg>', 2229, 5520, 44, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-20 11:10:02', '<201206201110.q5KBA2Nu024603@billing.aknet.kg>', 1074, 5521, 45, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Re: =?UTF-8?Q?=D0=A0=D0=B5=D0=B7=D1=83=D0=BB=D1=8C=D1=82=D0=B0?= =?UTF-8?Q?=D1=82=D1=8B=20=D1=80=D0=B0=D0=B1=D0=BE=D1=87=D0=B5=D0=B9=20?= =?UTF-8?Q?=D0=B2=D1=81=D1=82=D1=80=D0=B5=D1=87=D0=B8=20=D0=BF=D0=BE=20?= =?UTF-8?Q?=D0=B4=D0=BE=D0=BF=2E=2E=D1=83=D1=', 'Rostam Shahi <r.shahi@aknet.kg>', 'info@aknet.kg', '2012-06-20 12:29:14', '<34428aabde9cacd473132341ed9bb221@aknet.kg>', 26096, 5522, 46, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-21 05:15:01', '<201206210515.q5L5F1Lk037243@billing.aknet.kg>', 877, 5523, 47, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-21 06:10:01', '<201206210610.q5L6A183047721@billing.aknet.kg>', 1075, 5524, 48, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-21 11:10:02', '<201206211110.q5LBA2Rw009565@billing.aknet.kg>', 1215, 5525, 49, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?Q?=D0=97=D0=B0=D0=BF=D1=80=D0=BE=D1=81=20=D0=BD=D0=B0=20?= =?UTF-8?Q?=D0=B2=D0=BE=D0=B7=D0=BC=D0=BE=D0=B6=D0=BD=D0=BE=D1=81=D1=82?= =?UTF-8?Q?=D1=8C=20=D0=BF=D1=80=D0=B5=D0=B4=D0=BE=D1=81=D1=82=D0=B0=D0=B2?= =?UTF-8?Q?=D0=BB=D0=B5=D0=BD=D0=B8=D1=8', 'a.bakirov@aknet.kg', 'tima@aknet.kg', '2012-06-22 03:27:07', '<139ce32368a8d6bb8d20197b4384b45d@aknet.kg>', 1785, 5526, 50, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-22 05:15:00', '<201206220515.q5M5F0uD025559@billing.aknet.kg>', 877, 5527, 51, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-22 06:10:02', '<201206220610.q5M6A2Df035955@billing.aknet.kg>', 1074, 5528, 52, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-22 11:10:01', '<201206221110.q5MBA14v096054@billing.aknet.kg>', 1077, 5529, 53, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-23 05:15:00', '<201206230515.q5N5F09g008050@billing.aknet.kg>', 877, 5530, 54, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-23 06:10:02', '<201206230610.q5N6A2eM019091@billing.aknet.kg>', 1212, 5531, 55, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?Q?=D0=A2=D0=B0=D1=80=D0=B8=D1=84=D1=8B=20=D1=81=20=D1=82=D1=80?= =?UTF-8?Q?=D0=B0=D1=84=D0=B8=D0=BA=D0=BE=D0=BC?=', '=?UTF-8?Q?=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB_=D0=9B=D0=B5=D1=85=D1=82=D0=BC=D0=B0=D0=BD?= <mlehtma', 'info@aknet.kg', '2012-06-23 09:30:06', '<9ce0a1705d59f903f5064ca51e9467ac@localhost>', 133578, 5532, 56, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-23 11:10:01', '<201206231110.q5NBA16l079504@billing.aknet.kg>', 1286, 5533, 57, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Re: =?UTF-8?Q?=D0=A2=D0=B0=D1=80=D0=B8=D1=84=D1=8B=20=D1=81=20=D1=82?= =?UTF-8?Q?=D1=80=D0=B0=D1=84=D0=B8=D0=BA=D0=BE=D0=BC?=', '=?UTF-8?Q?=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB_=D0=9B=D0=B5=D1=85=D1=82=D0=BC=D0=B0=D0=BD?= <mlehtma', 'info@aknet.kg', '2012-06-23 12:57:26', '<8c10809557e70cf59eab4197016c17df@localhost>', 2132, 5534, 58, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-24 05:15:00', '<201206240515.q5O5F0wA091867@billing.aknet.kg>', 877, 5535, 59, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?RldEOtGC0LXRhdC90LjRh9C1?= =?UTF-8?B?0YHQutC40Lkg0YDQtdCz0LvQsNC80LXQvdGC?=', '=?UTF-8?B?0JzQuNGF0LDQuNC7INCb0LXRhdGC0LzQsNC9?= <mlehtman@prosto.kg>', 'tima@aknet.kg', '2012-06-24 19:15:59', '<7jvbbln8qt5wmc3ebet1cb0y.1340565359847@email.android.com>', 213437, 5536, 60, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Re: =?UTF-8?Q?=D1=82=D0=B5=D1=85=D0=BD=D0=B8=D1=87=D0=B5=D1=81=D0=BA?= =?UTF-8?Q?=D0=B8=D0=B9=20=D1=80=D0=B5=D0=B3=D0=BB=D0=B0=D0=BC=D0=B5=D0=BD?= =?UTF-8?Q?=D1=82?=', '=?UTF-8?Q?=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB_=D0=9B=D0=B5=D1=85=D1=82=D0=BC=D0=B0=D0=BD?= <mlehtma', 'Umurzakov Temir <tima@aknet.kg>', '2012-06-24 15:08:51', '<24095027d3a68226aac0e6237490031c@localhost>', 2897, 5537, 61, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?Q?=D0=9D=D0=B0_=D0=BC=D0=BE=D1=81=D1=82=D1=83?= =?utf-8?Q?_=D0=AD=D0=BA=D1=81=D0=BD=D0=B5=D1=82?= =?utf-8?Q?_=D1=81=D0=B4=D0=B5=D0=BB=D0=B0=D0=BB?= =?utf-8?Q?_=D1=82=D0=B0=D0=B1=D0=BB=D0=B8=D1=87=D0=BD=D1=83=D1=8E_?= =?utf-8?Q?=D1=87=D0=B0=D1=81=D', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-06-24 17:36:41', '<20120624173641.40519.797886161.swift@crm.aknet.kg>', 2410, 5538, 62, 0, 0, 1, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Re: =?UTF-8?Q?=D1=82=D0=B5=D1=85=D0=BD=D0=B8=D1=87=D0=B5=D1=81=D0=BA?= =?UTF-8?Q?=D0=B8=D0=B9=20=D1=80=D0=B5=D0=B3=D0=BB=D0=B0=D0=BC=D0=B5=D0=BD?= =?UTF-8?Q?=D1=82?=', '=?UTF-8?Q?=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB_=D0=9B=D0=B5=D1=85=D1=82=D0=BC=D0=B0=D0=BD?= <mlehtma', 'Umurzakov Temir <tima@aknet.kg>', '2012-06-25 02:24:21', '<50e5e0f74846b8e0f6c029ad0d7c7a78@localhost>', 4438, 5539, 63, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?Q?=D1=80=D0=B5=D0=B5=D1=81=D1=82=D1=80?=', 'Office Aknet <office@aknet.kg>', 'tima@aknet.kg', '2012-06-25 04:30:51', '<20120625043051.52471.1226911248.swift@crm.aknet.kg>', 810918, 5540, 64, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-25 05:15:00', '<201206250515.q5P5F0KN075508@billing.aknet.kg>', 877, 5541, 65, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-25 06:10:01', '<201206250610.q5P6A14Y086161@billing.aknet.kg>', 1004, 5542, 66, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-25 11:10:01', '<201206251110.q5PBA12M046786@billing.aknet.kg>', 1146, 5543, 67, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-26 05:15:00', '<201206260515.q5Q5F0mi060515@billing.aknet.kg>', 877, 5544, 68, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-26 06:10:01', '<201206260610.q5Q6A1rA070767@billing.aknet.kg>', 1144, 5545, 69, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Neotech', 'Diana <d.akopyan@neotech.kg>', '=?windows-1251?B?0+zz8Ofg6u7iINLl7Ojw?= <tima@aknet.kg>', '2012-06-26 06:16:48', '<1201662920.20120626121648@neotech.kg>', 127096, 5546, 70, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-26 11:10:02', '<201206261110.q5QBA2j9031453@billing.aknet.kg>', 1215, 5547, 71, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-27 05:15:00', '<201206270515.q5R5F00L046184@billing.aknet.kg>', 877, 5548, 72, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-27 06:10:01', '<201206270610.q5R6A1wA057168@billing.aknet.kg>', 1074, 5549, 73, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?0J3QtSDQstGB0LXQs9C00LAg0LDQstGC0L7QvNCw0YLQuNGH0LXRgdC60Lgg?= =?UTF-8?B?0YTQvtGA0LzQsNGC0LjRgNGD0LXRgiBNQUMg0LIg0LHQuNC70LvQuNC90LPQtQ==?=', '=?UTF-8?B?0KHQtdC80ZHQvdC+0LIg0JHQvtGA0LjRgQ==?= <boris@aknet.kg>', 'Umurzakov Temir <tima@aknet.kg>', '2012-06-27 10:53:12', '<35B892BB29F747C19C23115D387163CC@Boris>', 3374, 5550, 74, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-27 11:10:02', '<201206271110.q5RBA2ET019226@billing.aknet.kg>', 1145, 5551, 75, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-28 05:15:00', '<201206280515.q5S5F0bW034160@billing.aknet.kg>', 877, 5552, 76, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-28 06:10:02', '<201206280610.q5S6A2SW044790@billing.aknet.kg>', 1284, 5553, 77, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-28 11:10:01', '<201206281110.q5SBA1Xp007305@billing.aknet.kg>', 1286, 5554, 78, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-29 05:15:01', '<201206290515.q5T5F1g1020915@billing.aknet.kg>', 877, 5555, 79, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-29 06:10:02', '<201206290610.q5T6A2U4031992@billing.aknet.kg>', 1076, 5556, 80, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-29 11:10:01', '<201206291110.q5TBA1OA093034@billing.aknet.kg>', 1148, 5557, 81, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-30 05:15:00', '<201206300515.q5U5F0Mg008374@billing.aknet.kg>', 877, 5558, 82, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-30 06:10:02', '<201206300610.q5U6A2FI019379@billing.aknet.kg>', 1005, 5559, 83, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-06-30 11:10:01', '<201206301110.q5UBA1hP081413@billing.aknet.kg>', 1149, 5560, 84, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-01 05:15:00', '<201207010515.q615F02d001598@billing.aknet.kg>', 874, 5561, 85, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-01 06:10:02', '<201207010610.q616A2AP012197@billing.aknet.kg>', 1282, 5562, 86, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-01 11:10:03', '<201207011110.q61BA3BE069506@billing.aknet.kg>', 1208, 5563, 87, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-02 05:15:00', '<201207020515.q625F0DV079513@billing.aknet.kg>', 874, 5564, 88, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-02 06:10:03', '<201207020610.q626A32g089349@billing.aknet.kg>', 999, 5565, 89, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-02 11:10:02', '<201207021110.q62BA2P0044519@billing.aknet.kg>', 1000, 5566, 90, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-03 05:15:01', '<201207030515.q635F1wc054836@billing.aknet.kg>', 874, 5567, 91, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-03 06:10:01', '<201207030610.q636A1kS066060@billing.aknet.kg>', 998, 5568, 92, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?windows-1251?B?7vLs5e3g?=', 'Diana <d.akopyan@neotech.kg>', '=?windows-1251?B?0+zz8Ofg6u7iINLl7Ojw?= <tima@aknet.kg>', '2012-07-03 06:32:48', '<16610312823.20120703123248@neotech.kg>', 177998, 5569, 93, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'office@gazprom-neft.kg', '2012-07-03 09:09:51', '<20120703090953.785B81CD31@mx.aknet.kg>', 130098, 5570, 94, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'office@gazprom-neft.kg', '2012-07-03 09:09:51', '<20120703090953.866621CD3E@mx.aknet.kg>', 136584, 5571, 95, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'beniceontime@yahoo.com', '2012-07-03 09:09:52', '<20120703090953.DDAB11CD6A@mx.aknet.kg>', 129632, 5572, 96, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Neotech', 'Diana <d.akopyan@neotech.kg>', '=?windows-1251?B?0+zz8Ofg6u7iINLl7Ojw?= <tima@aknet.kg>', '2012-07-03 09:31:22', '<1308198267.20120703153122@neotech.kg>', 180005, 5573, 97, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?Q?access-list_5_=D0=B4=D0=BB=D1=8F_SNMP?=', '=?UTF-8?B?0KHQtdC80ZHQvdC+0LIg0JHQvtGA0LjRgQ==?= <boris@aknet.kg>', 'Umurzakov Temir <tima@aknet.kg>', '2012-07-03 09:36:21', '<D4A2448CB2ED456ABD9C3F40CD6DF0A6@Boris>', 7766, 5574, 98, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'office@gazprom-neft.kg', '2012-07-03 10:35:44', '<20120703103546.3275A1CCBF@mx.aknet.kg>', 130800, 5575, 99, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-03 11:10:02', '<201207031110.q63BA2I4010806@billing.aknet.kg>', 999, 5576, 100, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?Rlc6IOnO09TS1cvDydEg0M8g0sHCz9TFINMgxMXCydTP0iDawcTPzNbFzs4=?= =?koi8-r?B?z9PU2MA=?=', '=?koi8-r?B?98XOxdLBIOHKzcHOwsHF18E=?= <v.aimanbaeva@aknet.kg>', 'tima@aknet.kg', '2012-07-04 05:03:52', '<C15F695F8BC740B3A366A0932C1D6398@user969b3c6743>', 286508, 5577, 101, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'ATF24. Card statement 2012-07-04 [Cyrillic (Windows-1251)]', 'card-info-out@atfbank.kz', 'tima@aknet.kg', '2012-07-04 05:02:52', '<24b37d91-c1a2-4519-8911-57f99b714e8a@exnlb1.corp.atfbank.kz>', 12216, 5578, 102, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Fwd: =?UTF-8?Q?=D0=A1=D1=82=D0=B0=D1=82=D0=B8=D1=81=D1=82=D0=B8?= =?UTF-8?Q?=D0=BA=D0=B0?=', 'Alisher Kovalev <alisher@aknet.kg>', 'tima@aknet.kg', '2012-07-04 05:14:21', '<ccaed1abe961406d443e0d23b0a1ab91@aknet.kg>', 2788, 5579, 103, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-04 05:15:01', '<201207040515.q645F19X073571@billing.aknet.kg>', 874, 5580, 104, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?windows-1251?B?7vLs5e3g?=', 'Diana <d.akopyan@neotech.kg>', '=?windows-1251?B?0+zz8Ofg6u7iINLl7Ojw?= <tima@aknet.kg>', '2012-07-04 05:18:28', '<210254679.20120704111828@neotech.kg>', 179546, 5581, 105, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'ATF24. Card statement 2012-07-04 [Cyrillic (Windows-1251)]', 'card-info-out@atfbank.kz', 'tima@aknet.kg', '2012-07-04 05:17:48', '<352feedd-d6ef-46b6-a4e6-357eba7fa9e6@exnlb1.corp.atfbank.kz>', 13284, 5582, 106, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?windows-1251?B?7vLs5e3g?=', 'Diana <d.akopyan@neotech.kg>', '=?windows-1251?B?0+zz8Ofg6u7iINLl7Ojw?= <tima@aknet.kg>', '2012-07-04 08:43:39', '<33962641.20120704144339@neotech.kg>', 180959, 5583, 107, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?0KHQvtCx0YDQsNC90LjQtSDQsdGD0YXQs9Cw0LvRgtC10YDQuNC4IDA0LjA3LjIw?= =?UTF-8?B?MTI=?=', '=?UTF-8?B?0JzQuNGF0LDQuNC7INCb0LXRhdGC0LzQsNC9?= <mlehtman@aknet.kg>', 'tima@aknet.kg', '2012-07-05 04:18:24', '<00a701cd5a65$3843da20$a8cb8e60$@kg>', 5248, 5588, 108, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?68/Myd7F09TXzyDBy9TJ187ZyCDBws/Oxc7Uz9cg0M8g0MHLxdTBzQ==?=', '=?koi8-r?B?89fF1MHexdfBIOXLwdTF0snOwQ==?= <pr@aknet.kg>', 'tima@aknet.kg', '2012-07-05 06:19:22', '<001201cd5a76$1e8732b0$5b959810$@kg>', 3096, 5589, 109, 0, 0, 1, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-07-05 05:05:05', '<201207050505.q65555Rb002564@groupoffice.aknet.kg>', 1150, 5590, 110, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-05 05:15:00', '<201207050515.q655F0wI058377@billing.aknet.kg>', 874, 5591, 111, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?UkU6INCa0L7Qu9C40YfQtdGB0YLQstC+INCw0LrRgtC40LLQvdGL0YUg0LA=?= =?UTF-8?B?0LHQvtC90LXQvdGC0L7QsiDQv9C+INC/0LDQutC10YLQsNC8?=', '=?UTF-8?B?0KHQstC10YLQsNGH0LXQstCwINCV0LrQsNGC0LXRgNC40L3QsA==?= <pr@aknet.kg>', '=?UTF-8?B?J9Cj0LzRg9GA0LfQsNC60L7QsiDQotC10LzQuNGAJw==?= <tima@aknet.kg>', '2012-07-05 07:45:12', '<002401cd5a82$1c4eb160$54ec1420$@kg>', 3421, 5592, 112, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-07-05 06:05:05', '<201207050605.q65655FA004361@groupoffice.aknet.kg>', 1173, 5593, 113, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-07-05 08:05:06', '<201207050805.q65856pL007529@groupoffice.aknet.kg>', 1176, 5594, 114, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-07-05 11:05:07', '<201207051105.q65B57aY012897@groupoffice.aknet.kg>', 1211, 5595, 115, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-06 05:15:01', '<201207060515.q665F1Oc034688@billing.aknet.kg>', 874, 5596, 116, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-06 11:10:02', '<201207061110.q66BA24E004790@billing.aknet.kg>', 928, 5597, 117, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-07 05:15:00', '<201207070515.q675F0Kv013845@billing.aknet.kg>', 874, 5598, 118, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-07-07 05:55:04', '<201207070555.q675t49J062875@groupoffice.aknet.kg>', 1156, 5599, 119, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-07 11:10:01', '<201207071110.q67BA1OI082582@billing.aknet.kg>', 926, 5600, 120, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-08 05:15:01', '<201207080515.q685F1GI089970@billing.aknet.kg>', 874, 5601, 121, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-09 05:15:00', '<201207090515.q695F0Wd068632@billing.aknet.kg>', 874, 5602, 122, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-09 11:10:01', '<201207091110.q69BA1NI041377@billing.aknet.kg>', 927, 5603, 123, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-10 05:15:00', '<201207100515.q6A5F063051762@billing.aknet.kg>', 877, 5604, 124, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-10 06:10:02', '<201207100610.q6A6A2gS062072@billing.aknet.kg>', 930, 5605, 125, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-10 11:10:01', '<201207101110.q6ABA1Or022410@billing.aknet.kg>', 930, 5606, 126, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-11 05:15:00', '<201207110515.q6B5F0lx034366@billing.aknet.kg>', 877, 5607, 127, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-11 06:10:03', '<201207110610.q6B6A3E4044390@billing.aknet.kg>', 931, 5608, 128, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-11 11:10:03', '<201207111110.q6BBA3hr003991@billing.aknet.kg>', 931, 5609, 129, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-12 05:15:00', '<201207120515.q6C5F0vh016640@billing.aknet.kg>', 877, 5610, 130, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-12 06:10:02', '<201207120610.q6C6A2pQ027292@billing.aknet.kg>', 931, 5611, 131, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-12 11:10:01', '<201207121110.q6CBA1X3087373@billing.aknet.kg>', 932, 5612, 132, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-13 05:15:00', '<201207130515.q6D5F08D000247@billing.aknet.kg>', 877, 5613, 133, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'UnicreditBank Kyrgyzstan. Promotion.', 'card-info-out@atfbank.kz', 'tima@aknet.kg', '2012-07-13 06:39:38', '<761e0ba5-585b-4058-afc0-adf0d0d909cd@exnlb1.corp.atfbank.kz>', 2426745, 5614, 134, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'UnicreditBank Kyrgyzstan. Promotion.', 'card-info-out@atfbank.kz', 'tima@aknet.kg', '2012-07-13 06:39:44', '<69951bad-eefe-41bd-aeea-f73f939b5337@exnlb1.corp.atfbank.kz>', 2426743, 5615, 135, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-14 05:15:00', '<201207140515.q6E5F0tI080949@billing.aknet.kg>', 877, 5616, 136, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-07-14 09:55:04', '<201207140955.q6E9t4an098337@groupoffice.aknet.kg>', 1160, 5617, 137, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-07-14 10:55:05', '<201207141055.q6EAt5S0099597@groupoffice.aknet.kg>', 1176, 5618, 138, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-15 05:15:00', '<201207150515.q6F5F0LB058428@billing.aknet.kg>', 877, 5619, 139, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-16 05:15:01', '<201207160515.q6G5F1QM035896@billing.aknet.kg>', 877, 5620, 140, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-16 06:10:01', '<201207160610.q6G6A127046406@billing.aknet.kg>', 932, 5621, 141, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-16 11:10:02', '<201207161110.q6GBA2OR007679@billing.aknet.kg>', 1004, 5622, 142, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-18 06:10:02', '<201207180610.q6I6A2ET015288@billing.aknet.kg>', 1001, 5623, 143, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?windows-1251?B?7uHn4u7tIOTu6+bt6Oru4iDExw==?=', '=?windows-1251?B?zOj14OjrIMvl9fLs4O0=?= <mlehtman@aknet.kg>', '=?windows-1251?B?J9Hz8ODl4uAgwOvl6vHg7eTw4Cc=?= <alexandra@aknet.kg>', '2012-07-18 08:18:22', '<00b401cd64bd$e5c76920$b1563b60$@kg>', 9379, 5624, 144, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-18 11:10:01', '<201207181110.q6IBA1ku075834@billing.aknet.kg>', 1002, 5625, 145, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Fwd: RE: =?UTF-8?Q?=31=32=30=37=31=38=5F=D0=9F=D1=80=D0=B8=D0=BA?= =?UTF-8?Q?=D0=B0=D0=B7=5F=D0=A2=D0=9F=D0=A1=D0=B5=D0=BC=D0=B5=D0=B9=D0=BD?= =?UTF-8?Q?=D1=8B=D0=B9=5F=31=31=D0=B4=D0=BD=D0=B5=D0=B9=D1=82=D0=B5=D1=81?= =?UTF-8?Q?=D1=82=D0=B0=5Fdraft=23=31', 'Alisher Kovalev <alisher@aknet.kg>', 'tima@aknet.kg', '2012-07-19 05:34:28', '<cf81fadd538f60fc0dcda25be5fabeb2@aknet.kg>', 6783, 5626, 146, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Fwd: RE: =?UTF-8?Q?=31=32=30=37=31=38=5F=D0=9F=D1=80=D0=B8=D0=BA?= =?UTF-8?Q?=D0=B0=D0=B7=5F=D0=A2=D0=9F=D0=A1=D0=B5=D0=BC=D0=B5=D0=B9=D0=BD?= =?UTF-8?Q?=D1=8B=D0=B9=5F=31=31=D0=B4=D0=BD=D0=B5=D0=B9=D1=82=D0=B5=D1=81?= =?UTF-8?Q?=D1=82=D0=B0=5Fdraft=23=31', 'Alisher Kovalev <alisher@aknet.kg>', 'tima@aknet.kg', '2012-07-19 05:35:49', '<602b807b00687bbebaa4908b83ef0f7f@aknet.kg>', 34573, 5627, 147, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-19 06:10:01', '<201207190610.q6J6A1ri002470@billing.aknet.kg>', 1001, 5628, 148, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-19 11:10:02', '<201207191110.q6JBA2IY062468@billing.aknet.kg>', 931, 5629, 149, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir , welcome to Alibaba.com! Start sourcing online today', '"alibaba@service.alibaba.com" <alibaba@service.alibaba.com>', '"tima@aknet.kg" <tima@aknet.kg>', '2012-07-20 04:08:54', '<611192161.102551342757334043.JavaMail.admin@sysmail.alibaba.com>', 18425, 5630, 150, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?Rlc6IDEyMDcxOF/w0snLwdpf9PDzxc3Fys7Zyl8xMcTOxcrUxdPUwQ==?= =?koi8-r?B?X2RyYWZ0IzE=?=', '=?koi8-r?B?89XSwcXXwSDhzMXL08HOxNLB?= <alexandra@aknet.kg>', 'v_natali@aknet.kg', '2012-07-20 05:01:19', '<001601cd6634$b33722c0$19a56840$@aknet.kg>', 58163, 5631, 151, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-20 06:10:01', '<201207200610.q6K6A1K7086917@billing.aknet.kg>', 1002, 5632, 152, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-20 11:10:08', '<201207201110.q6KBA8WJ049042@billing.aknet.kg>', 1072, 5633, 153, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-21 06:10:03', '<201207210610.q6L6A3mr073225@billing.aknet.kg>', 1072, 5634, 154, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-21 11:10:01', '<201207211110.q6LBA1xA032825@billing.aknet.kg>', 1002, 5635, 155, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, want the latest price for < Packaging Label>?', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-07-21 16:41:18', '<1109073318.31234021342888878072.JavaMail.admin@crm-eve-web06.hst.dsl.crm.alidc.net>', 18823, 5636, 156, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?Q?=D0=9D=D0=B0_=D0=BC=D0=BE=D1=81=D1=82=D1=83?= =?utf-8?Q?_=D0=B4=D0=BE=D0=BC_=D1=81=D0=B5=D1=82=D0=B8_101.17?= =?utf-8?Q?4_=D1=81=D0=B4=D0=B5=D0=BB=D0=B0=D0=BB?= =?utf-8?Q?_=D1=82=D0=B0=D0=B1=D0=BB=D0=B8=D1=86=D1=83_66?= =?utf-8?Q?_=D0=B4=D0=BB=D', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-07-22 09:43:20', '<20120722094320.90113.739973975.swift@crm.aknet.kg>', 2875, 5637, 157, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-22 11:10:01', '<201207221110.q6MBA1nq014749@billing.aknet.kg>', 1000, 5638, 158, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?Q?=D0=9C=D0=BE=D0=B6=D0=BD=D0=BE_=D0=BB=D0=B8?= =?utf-8?Q?_=D0=B8=D0=BD=D1=82=D0=B5=D0=B3=D1=80=D0=B8=D1=80=D0=BE?= =?utf-8?Q?=D0=B2=D0=B0=D1=82=D1=8C_=D1=81_=D0=A1=D0=A0=D0=9C?= =?utf-8?Q?_=D1=81=D0=B8=D1=81=D1=82=D0=B5=D0=BC=D1=83?= =?utf-8?Q?_=', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-07-22 11:45:00', '<20120722114500.92508.565167858.swift@crm.aknet.kg>', 2563, 5639, 159, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'neotech', 'Diana <d.akopyan@neotech.kg>', 'tima@aknet.kg', '2012-07-23 06:04:40', '<316207896.20120723120440@neotech.kg>', 179539, 5640, 160, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-23 06:10:01', '<201207230610.q6N6A1ZM035180@billing.aknet.kg>', 1143, 5641, 161, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?Q?=E7=AD=94=E5=A4=8D:_=5Btima=40aknet.kg=5DInquiry_from_?= =?UTF-8?Q?popular_customized_thermal_trans?= =?UTF-8?Q?fer_paper?=', 'JESSICA SHIEH <jshieh@protex-tech.com>', '''Temir Umurzakov'' <tima@aknet.kg>', '2012-07-23 06:44:36', '<006b01cd689e$a17edde0$e47c99a0$@com>', 38634, 5642, 162, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Welcome to Ricoh eService', 'Ricoh eService <support@ricoheservice.co.uk>', 'Temir Umurzakov <tima@aknet.kg>', '2012-07-23 09:37:09', '<1D937D1D02A041B5B1000D07C70200E3@nrggroup.co.uk>', 3926, 5643, 163, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'neotech', 'Diana <d.akopyan@neotech.kg>', 'tima@aknet.kg', '2012-07-23 10:53:32', '<11800268.20120723165332@neotech.kg>', 181930, 5644, 164, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-23 11:10:02', '<201207231110.q6NBA2We095012@billing.aknet.kg>', 1072, 5645, 165, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Top ranking and fastest-moving products in your categories', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-07-24 02:35:26', '<1408795622.1812181343097326783.JavaMail.admin@crm-eve-web04.hst.dsl.crm.alidc.net>', 106577, 5646, 166, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?9MHCzMnDwSDOwSDX2dDJ08HOztnFINPexdQtxsHL1NXS2Q==?=', '=?koi8-r?B?/MzY18nSwSDrz9rVwsXLz9fB?= <elvira@aknet.kg>', 'tima@aknet.kg', '2012-07-24 05:52:12', '<000001cd6960$78839a80$698acf80$@aknet.kg>', 61244, 5647, 167, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-24 06:10:02', '<201207240610.q6O6A2pk018495@billing.aknet.kg>', 1003, 5648, 168, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-24 11:10:02', '<201207241110.q6OBA2T0079968@billing.aknet.kg>', 1076, 5649, 169, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Ms Maria Guan: RE: Inquiry from Thermal blank Barcode label printer with different size', '"alibaba.com" <message-noreply@service.alibaba.com>', '"tima@aknet.kg" <tima@aknet.kg>', '2012-07-25 02:20:09', '<1427296662.1343182809863.JavaMail.admin@rapid-smtp.vip.scl.en.alidc.net>', 16541, 5650, 170, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-25 06:10:01', '<201207250610.q6P6A1mk003825@billing.aknet.kg>', 1003, 5651, 171, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?UkU6INCh0LrQuNC00LrQuCAy?=', '=?utf-8?B?0JzQuNGF0LDQuNC7INCb0LXRhdGC0LzQsNC9?= <mlehtman@aknet.kg>', '''Umurzakov Temir'' <tima@aknet.kg>', '2012-07-25 06:16:30', '<009c01cd6a2d$07dc40c0$1794c240$@kg>', 1517, 5652, 172, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Label Direct - Your Contact Request', 'Label Direct <Customerservice@labelsdirect.com>', 'Temir Umurzakov <tima@aknet.kg>', '2012-07-25 07:32:29', '<201207250032385.SM1038620@173800-APP2>', 2058, 5653, 173, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-25 11:10:02', '<201207251110.q6PBA2lN064374@billing.aknet.kg>', 1072, 5654, 174, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'RE: Label Direct - Contact Request', 'Customer Service <CustomerService@labelsdirect.com>', 'Temir Umurzakov <tima@aknet.kg>', '2012-07-25 13:17:07', '<4C18033CB6605A46BB7B5EB890E460217E345834D1@LDISBS2008.labelsdirect.local>', 3319, 5655, 175, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, tips to get better quotes from suppliers', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-07-25 18:22:33', '<191597384.2931031343240553708.JavaMail.admin@crm-eve-web01.hst.dsl.crm.alidc.net>', 66561, 5656, 176, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?9MHSycbZ?=', '=?koi8-r?B?7cnIwcnMIOzFyNTNwc4=?= <mlehtman@aknet.kg>', '=?koi8-r?B?J/LV09TBzSD7wcjJJw==?= <r.shahi@aknet.kg>', '2012-07-26 04:49:29', '<012d01cd6aea$0a983090$1fc891b0$@kg>', 97962, 5657, 177, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Fwd: =?UTF-8?Q?=D0=A0=D0=B5=D0=B7=D1=8E=D0=BC=D0=B5=20=D0=90?= =?UTF-8?Q?=D0=BD=D0=B4=D1=80=D0=B5=D0=B9=20=D0=9A=D0=B0=D1=82=D1=83=D0=BD?= =?UTF-8?Q?=D0=B8=D0=BD=20IT-=D1=81=D0=BF=D0=B5=D1=86=D0=B8=D0=B0=D0=BB?= =?UTF-8?Q?=D0=B8=D1=81=D1=82?=', '=?UTF-8?Q?=D0=9A=D1=81=D0=B5=D0=BD=D0=B8=D1=8F_=D0=A1=D0=B5=D0=BB?= =?UTF-8?Q?=D1=8F=D0=B2=D1=81=D0=', 'tima@aknet.kg', '2012-07-26 05:40:14', '<5f9a17000b47cbb7f8f8e34e7c7370d2@aknet.kg>', 272091, 5658, 178, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-26 06:10:02', '<201207260610.q6Q6A2tC087070@billing.aknet.kg>', 1212, 5659, 179, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'DirectIndustry --- New products', 'noreply directindustry <noreply@directindustry.com>', 'tima@aknet.kg', '2012-07-26 03:39:25', '<1db9166f5d0d3fbbb41ad84312c1a86d@directindustry.com>', 121330, 5660, 180, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir,Top ranking and fastest-moving products in your categories', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-07-26 09:22:27', '<759589642.4269091343294547993.JavaMail.admin@crm-eve-web05.hst.dsl.crm.alidc.net>', 107330, 5661, 181, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-26 11:10:02', '<201207261110.q6QBA2g1048299@billing.aknet.kg>', 1070, 5662, 182, 0, 0, 0, 0, 1, 0);
INSERT INTO `email_cache` (`ie_id`, `mbox`, `subject`, `fromaddr`, `toaddr`, `senddate`, `message_id`, `mailsize`, `imap_uid`, `msgno`, `recent`, `flagged`, `answered`, `deleted`, `seen`, `draft`) VALUES
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?Rlc6INDSxcTMz9bFzsnFIM3B0svF1MnOx8/Xz8ogwcvUydfOz9PUyQ==?=', '=?koi8-r?B?7cnIwcnMIOzFyNTNwc4=?= <mlehtman@aknet.kg>', '"''IT Department, AkNet ISP''" <info@aknet.kg>', '2012-07-26 11:21:01', '<009701cd6b20$bd1cf710$3756e530$@kg>', 148272, 5663, 183, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-27 06:10:01', '<201207270610.q6R6A1Z8071141@billing.aknet.kg>', 1072, 5664, 184, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-27 11:10:01', '<201207271110.q6RBA1Wk031152@billing.aknet.kg>', 1141, 5665, 185, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-28 06:10:02', '<201207280610.q6S6A2IQ053934@billing.aknet.kg>', 1140, 5666, 186, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-28 11:10:02', '<201207281110.q6SBA282011981@billing.aknet.kg>', 1070, 5667, 187, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, you have new Unread Message(s) on Alibaba.com', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-07-28 19:17:36', '<1871499126.2862131343503056060.JavaMail.admin@crm-eve-web02.hst.dsl.crm.alidc.net>', 68641, 5668, 188, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-29 06:10:01', '<201207290610.q6T6A1bg032131@billing.aknet.kg>', 931, 5669, 189, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?Q?=D0=90=D0=B2=D1=82=D0=BE=D0=BC=D0=B0=D1=82=D0=B8?= =?utf-8?Q?=D0=B7=D0=B0=D1=86=D0=B8=D1=8F?= =?utf-8?Q?_=D1=80=D0=B0=D0=B1=D0=BE=D1=82=D1=8B_=D1=81?= =?utf-8?Q?_=D1=82=D0=B0=D0=B1=D0=BB=D0=B8=D1=86=D0=B0=D0=BC=D0=B8_?= =?utf-8?Q?=D0=BD=D0=B0_=D', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-07-29 09:37:59', '<20120729093759.4346.76598045.swift@crm.aknet.kg>', 7932, 5670, 190, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-07-29 09:55:04', '<201207290955.q6T9t44I004710@groupoffice.aknet.kg>', 1158, 5671, 191, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-29 11:10:02', '<201207291110.q6TBA2eY091434@billing.aknet.kg>', 931, 5672, 192, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-07-29 11:55:04', '<201207291155.q6TBt4LQ007003@groupoffice.aknet.kg>', 1158, 5673, 193, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-30 06:10:01', '<201207300610.q6U6A1kY008471@billing.aknet.kg>', 1002, 5674, 194, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Fwd: =?UTF-8?Q?=D0=9F=D1=81=D0=B8=D1=85=D0=BE=D0=BB=D0=BE=D0=B3?= =?UTF-8?Q?=D0=B8=D1=87=D0=B5=D1=81=D0=BA=D0=B0=D1=8F=20=D1=85=D0=B0=D1=80?= =?UTF-8?Q?=D0=B0=D0=BA=D1=82=D0=B5=D1=80=D0=B8=D1=81=D1=82=D0=B8=D0=BA?= =?UTF-8?Q?=D0=B0?=', '=?UTF-8?Q?=D0=9A=D1=81=D0=B5=D0=BD=D0=B8=D1=8F_=D0=A1=D0=B5=D0=BB?= =?UTF-8?Q?=D1=8F=D0=B2=D1=81=D0=', 'tima@aknet.kg', '2012-07-30 06:55:42', '<aa3591d0b3fab5813b36391b71acd9a9@aknet.kg>', 24789, 5675, 195, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-30 11:10:03', '<201207301110.q6UBA3Io069970@billing.aknet.kg>', 1143, 5676, 196, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-31 06:10:02', '<201207310610.q6V6A2q6097010@billing.aknet.kg>', 1143, 5677, 197, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Fwd: =?UTF-8?Q?=D0=9C=D0=B5=D0=BD=D1=8E=20=D1=81=D0=B0=D0=BC?= =?UTF-8?Q?=D0=BE=D0=BE=D0=B1=D1=81=D0=BB=D1=83=D0=B6=D0=B8=D0=B2=D0=B0?= =?UTF-8?Q?=D0=BD=D0=B8=D1=8F=20=28=D0=BF=D1=80=D0=BE=D0=B5=D0=BA=D1=82=29?=', 'Alisher Kovalev <alisher@aknet.kg>', 'tima@aknet.kg', '2012-07-31 08:45:30', '<177f0e15cc181356bee4fb3a5c4b45c0@aknet.kg>', 251233, 5678, 198, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Re: =?UTF-8?Q?=D0=9C=D0=B5=D0=BD=D1=8E=20=D1=81=D0=B0=D0=BC=D0=BE?= =?UTF-8?Q?=D0=BE=D0=B1=D1=81=D0=BB=D1=83=D0=B6=D0=B8=D0=B2=D0=B0=D0=BD?= =?UTF-8?Q?=D0=B8=D1=8F=20IVR?=', 'Alisher Kovalev <alisher@aknet.kg>', '=?UTF-8?Q?=D0=90=D0=B9=D0=B4=D0=B0=D1=80_=D0=91=D0=B0=D0=BA=D0=B8?= =?UTF-8?Q?=D1=80=D0=BE=D0=B2?= <a.bakirov@aknet.kg>', '2012-07-31 08:54:40', '<3899b4a9227c8cae78908a13804bfeff@aknet.kg>', 3177, 5679, 199, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-07-31 11:10:01', '<201207311110.q6VBA1X9060119@billing.aknet.kg>', 1215, 5680, 200, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-01 06:10:04', '<201208010610.q716A40k088222@billing.aknet.kg>', 1001, 5681, 201, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'office@gazprom-neft.kg', '2012-08-01 08:25:53', '<20120801082556.32D2D1CCF8@mx.aknet.kg>', 131212, 5682, 202, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'office@gazprom-neft.kg', '2012-08-01 08:26:23', '<20120801082625.4EE491CD04@mx.aknet.kg>', 137214, 5683, 203, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-01 11:10:03', '<201208011110.q71BA32m043945@billing.aknet.kg>', 1001, 5684, 204, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-02 11:10:01', '<201208021110.q72BA1Jo017250@billing.aknet.kg>', 999, 5685, 205, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir,TOP Popular and Peak Growth products in your preferred categories', '"Alibaba.com" <tradealert@service.alibaba.com>', 'tima@aknet.kg', '2012-08-02 09:57:29', '<1838561980.3461411343901449929.JavaMail.admin@crm-eve-web01.hst.dsl.crm.alidc.net>', 108713, 5686, 206, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'ATF24. Card statement 2012-08-03 [Cyrillic (Windows-1251)]', 'card-info-out@atfbank.kz', 'tima@aknet.kg', '2012-08-03 03:49:33', '<0d9507bf-31ee-42e8-bca8-327c6b395096@exnlb1.corp.atfbank.kz>', 12219, 5687, 207, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?windows-1251?B?7vLs5e3q4A==?=', 'Diana <d.akopyan@neotech.kg>', 'tima@aknet.kg', '2012-08-03 03:58:36', '<174744302.20120803095836@neotech.kg>', 186062, 5688, 208, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'ATF24. Card statement 2012-08-03 [Cyrillic (Windows-1251)]', 'card-info-out@atfbank.kz', 'tima@aknet.kg', '2012-08-03 04:05:14', '<7ec7c142-77c6-4107-8dc6-d2a40557ba81@exnlb1.corp.atfbank.kz>', 13853, 5689, 209, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-03 11:10:03', '<201208031110.q73BA318099535@billing.aknet.kg>', 998, 5690, 210, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?Q?=D0=9D=D0=B0=D0=B4=D0=BE?= =?utf-8?Q?_=D0=B4=D0=BE=D0=B4=D0=B5=D0=BB=D0=B0=D0=BB=D0=B0=D1=82?= =?utf-8?Q?=D1=8C?= =?utf-8?Q?_=D0=BC=D0=B5=D1=85=D0=B0=D0=BD=D0=B8=D0=B7=D0=BC?= =?utf-8?Q?_=D0=B7=D0=B0=D0=BC=D0=BE=D1=80=D0=BE=D0=B7=D0=BA=D0=B8_?= ', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-08-04 04:33:19', '<20120804043319.55124.1652460039.swift@crm.aknet.kg>', 3556, 5691, 211, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'beniceontime@yahoo.com', '2012-08-04 06:13:16', '<20120804061321.E90A81CD72@mx.aknet.kg>', 129838, 5692, 212, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'office@gazprom-neft.kg', '2012-08-04 06:15:34', '<20120804061540.0114B1CE5D@mx.aknet.kg>', 131220, 5693, 213, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'office@gazprom-neft.kg', '2012-08-04 07:10:27', '<20120804071032.DE77C1CE45@mx.aknet.kg>', 137222, 5694, 214, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Follow-up for your requests on DirectIndustry', 'followup directindustry <followup@directindustry.com>', 'tima@aknet.kg', '2012-08-04 08:03:52', '<5633bd1fe736654251c9bd7e8a0d9dd7@directindustry.com>', 3804, 5695, 215, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?Q?=D0=92?= =?utf-8?Q?_=D1=80=D0=B0=D1=81=D1=88=D0=B8=D1=80=D0=B5=D0=BD=D0=BD?= =?utf-8?Q?=D0=BE=D0=BC_=D0=BF=D0=BE=D0=B8=D1=81=D0=BA=D0=B5?= =?utf-8?Q?_=D0=BF=D0=BE_=D0=A1=D0=A0=D0=9C_=D0=BD=D0=B5?= =?utf-8?Q?_=D0=BD=D0=B0=D1=88=D0=B5=D0=BB?= =?ut', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-08-05 07:29:38', '<20120805072938.87612.413919673.swift@crm.aknet.kg>', 2436, 5696, 216, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-08-05 08:55:05', '<201208050855.q758t5ZT089461@groupoffice.aknet.kg>', 1155, 5697, 217, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-07 11:10:01', '<201208071110.q77BA1d5009910@billing.aknet.kg>', 928, 5698, 218, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?Rlc6INDSz8LMxc3BIA==?=', '=?koi8-r?B?7cnIwcnMIOzFyNTNwc4=?= <mlehtman@aknet.kg>', '"''IT Department, AkNet ISP''" <info@aknet.kg>', '2012-08-07 11:48:58', '<046b01cd7492$a126bc50$e37434f0$@kg>', 18951, 5699, 219, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-08 06:10:02', '<201208080610.q786A25S029533@billing.aknet.kg>', 929, 5700, 220, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-08 11:10:01', '<201208081110.q78BA1qq090665@billing.aknet.kg>', 929, 5701, 221, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-09 06:10:01', '<201208090610.q796A1UK013519@billing.aknet.kg>', 929, 5702, 222, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?79vJwsvB?=', '=?koi8-r?B?4crEwdIg4sHLydLP1w==?= <a.bakirov@aknet.kg>', 'tima@aknet.kg', '2012-08-09 07:30:48', '<004c01cd7600$e556a1f0$b003e5d0$@aknet.kg>', 360640, 5703, 223, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir,TOP Popular and Peak Growth products in your preferred categories', '"Alibaba.com" <tradealert@service.alibaba.com>', 'tima@aknet.kg', '2012-08-09 08:44:31', '<210768926.1889991344501871453.JavaMail.admin@crm-eve-web05.hst.dsl.crm.alidc.net>', 105959, 5704, 224, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-09 11:10:02', '<201208091110.q79BA2Jn073793@billing.aknet.kg>', 929, 5705, 225, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, more product ideas matching your recent inquiry', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-08-09 19:31:17', '<797621812.6465811344540677588.JavaMail.admin@crm-eve-web01.hst.dsl.crm.alidc.net>', 64277, 5706, 226, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-10 06:10:02', '<201208100610.q7A6A20J094678@billing.aknet.kg>', 1002, 5707, 227, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-11 06:10:01', '<201208110610.q7B6A1on074159@billing.aknet.kg>', 1003, 5708, 228, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-11 11:10:02', '<201208111110.q7BBA240032524@billing.aknet.kg>', 1003, 5709, 229, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-12 06:10:02', '<201208120610.q7C6A2jT049727@billing.aknet.kg>', 1003, 5710, 230, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-08-12 09:55:06', '<201208120955.q7C9t6HA040589@groupoffice.aknet.kg>', 1176, 5711, 231, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-12 11:10:04', '<201208121110.q7CBA4xB007914@billing.aknet.kg>', 1003, 5712, 232, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-13 06:10:02', '<201208130610.q7D6A2O4027096@billing.aknet.kg>', 1000, 5713, 233, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Fwd: Re[2]: =?UTF-8?Q?=D0=94=D0=BB=D1=8F=20=D0=90=D0=B7=D0=B0?= =?UTF-8?Q?=D0=BC=D0=B0=D1=82=D0=B0?=', 'info@aknet.kg', 'tima@aknet.kg', '2012-08-13 06:34:05', '<3646bea5164b00b19627b29c9431b206@aknet.kg>', 32241, 5714, 234, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-13 11:10:01', '<201208131110.q7DBA1CJ087737@billing.aknet.kg>', 1000, 5715, 235, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-14 06:10:02', '<201208140610.q7E6A2n5004376@billing.aknet.kg>', 1002, 5716, 236, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-14 11:10:02', '<201208141110.q7EBA2rB068337@billing.aknet.kg>', 1002, 5717, 237, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, contact suppliers for the latest prices', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-08-15 17:33:49', '<117240705.11055131345052029619.JavaMail.admin@crm-eve-web04.hst.dsl.crm.alidc.net>', 70575, 5718, 238, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-16 06:10:01', '<201208160610.q7G6A1kL066257@billing.aknet.kg>', 1076, 5719, 239, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir,Top ranking and fastest-growing products this past week', '"Alibaba.com" <tradealert@service.alibaba.com>', 'tima@aknet.kg', '2012-08-16 08:52:33', '<862018144.14699511345107153597.JavaMail.admin@crm-eve-web06.hst.dsl.crm.alidc.net>', 108765, 5720, 240, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-16 11:10:02', '<201208161110.q7GBA2Nm025593@billing.aknet.kg>', 1076, 5721, 241, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-17 06:10:02', '<201208170610.q7H6A2k2042619@billing.aknet.kg>', 1074, 5722, 242, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-17 11:10:01', '<201208171110.q7HBA1p4002438@billing.aknet.kg>', 1073, 5723, 243, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-18 05:15:00', '<201208180515.q7I5F0U4010401@billing.aknet.kg>', 877, 5724, 244, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-18 06:10:03', '<201208180610.q7I6A3YL020273@billing.aknet.kg>', 1211, 5725, 245, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-18 11:10:06', '<201208181110.q7IBA6uP077842@billing.aknet.kg>', 1215, 5726, 246, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-19 05:15:00', '<201208190515.q7J5F0tM082701@billing.aknet.kg>', 877, 5727, 247, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-19 06:10:02', '<201208190610.q7J6A2hJ092500@billing.aknet.kg>', 1001, 5728, 248, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-19 11:10:04', '<201208191110.q7JBA4vH049377@billing.aknet.kg>', 1002, 5729, 249, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-20 05:15:01', '<201208200515.q7K5F1FO055507@billing.aknet.kg>', 877, 5730, 250, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-20 06:10:02', '<201208200610.q7K6A2Bd065386@billing.aknet.kg>', 1002, 5731, 251, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-20 11:10:02', '<201208201110.q7KBA2AF026601@billing.aknet.kg>', 1073, 5732, 252, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?5M/T1NXQIMsgQ1JN?=', '=?koi8-r?B?7cnIwcnMIOzFyNTNwc4=?= <mlehtman@aknet.kg>', 'tima@aknet.kg', '2012-08-21 03:25:52', '<008801cd7f4c$ab1e63b0$015b2b10$@kg>', 3970, 5733, 253, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-21 05:15:00', '<201208210515.q7L5F0k3038519@billing.aknet.kg>', 877, 5734, 254, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-21 06:10:01', '<201208210610.q7L6A1vp048858@billing.aknet.kg>', 1145, 5735, 255, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?Rlc6INCU0L7RgdGC0YPQvyDQuiBDUk0=?=', '=?UTF-8?B?0JzQuNGF0LDQuNC7INCb0LXRhdGC0LzQsNC9?= <mlehtman@aknet.kg>', '''E leonova'' <e.leonova@aknet.kg>', '2012-08-21 10:51:15', '<00d001cd7f8a$e2e05720$a8a10560$@kg>', 1984, 5736, 256, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-21 11:10:01', '<201208211110.q7LBA1x3009052@billing.aknet.kg>', 1076, 5737, 257, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'HomeNet SRVs A-54', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-08-21 15:39:46', '<20120821153947.43849.1633265490.swift@crm.aknet.kg>', 4601, 5738, 258, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?UkU6IEZXOiDQlNC+0YHRgtGD0L8g0LogQ1JN?=', '=?UTF-8?B?0JzQuNGF0LDQuNC7INCb0LXRhdGC0LzQsNC9?= <mlehtman@aknet.kg>', '''Umurzakov Temir'' <tima@aknet.kg>', '2012-08-22 03:11:53', '<00e001cd8013$e172e630$a458b290$@kg>', 3118, 5739, 259, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?28HCzM/OINPBytTB?=', '=?koi8-r?B?4czFy9PBzsTSIOvJzQ==?= <kim.a@aknet.kg>', 'tima@aknet.kg', '2012-08-22 06:24:09', '<000301cd802e$bd6e5d30$384b1790$@a@aknet.kg>', 5375, 5740, 260, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-22 05:15:00', '<201208220515.q7M5F0eo019294@billing.aknet.kg>', 877, 5741, 261, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-22 06:10:01', '<201208220610.q7M6A1qV029852@billing.aknet.kg>', 1075, 5742, 262, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-22 11:10:02', '<201208221110.q7MBA2LD089821@billing.aknet.kg>', 1147, 5743, 263, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?UkU6IDIg0YXQsNC70Y/QstC90YvRhSDQutCw0L3QsNC70LA=?=', '=?UTF-8?B?0JzQuNGF0LDQuNC7INCb0LXRhdGC0LzQsNC9?= <mlehtman@aknet.kg>', '''Umurzakov Temir'' <tima@aknet.kg>', '2012-08-23 03:22:23', '<005501cd80de$82fd0f10$88f72d30$@kg>', 2235, 5744, 264, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?0NLVxg==?=', '=?koi8-r?B?5cvB1MXSyc7BIOzFz87P18E=?= <e.leonova@aknet.kg>', 'info@aknet.kg', '2012-08-23 04:23:02', '<!&!AAAAAAAAAAAYAAAAAAAAAMys9c0AKqlKsS7JqNFz1TLCgAAAEAAAAJS+AgJL7M5OrL3hc2bBmEsBAAAAAA==@aknet.kg>', 11928, 5745, 265, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-23 05:15:00', '<201208230515.q7N5F0GN004009@billing.aknet.kg>', 877, 5746, 266, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-23 06:10:01', '<201208230610.q7N6A1nX014704@billing.aknet.kg>', 1004, 5747, 267, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?Q?=D0=A1=D0=BB=D1=83=D0=B6=D0=B5=D0=B1=D0=BA=D0=B0?=', '=?UTF-8?Q?=D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B0=D0=BD=D0=B4=D1=80_?= =?UTF-8?Q?=D0=9A=D0=B8=D0=BC?= <', 'tima@aknet.kg', '2012-08-23 09:30:21', '<015f6d00e9cf1d7584dda0c6b5e3fa5b@aknet.kg>', 228980, 5748, 268, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'shit', 'Ildar Mursalimov <ildar@aknet.kg>', 'tima@aknet.kg', '2012-08-23 10:02:19', '<fe4f5966b0b899730861bc44200d24ac@aknet.kg>', 144962, 5749, 269, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-23 11:10:13', '<201208231110.q7NBADb7074794@billing.aknet.kg>', 1148, 5750, 270, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Top ranking and fastest-moving products this past week', '"Alibaba.com" <tradealert@service.alibaba.com>', 'tima@aknet.kg', '2012-08-23 14:56:35', '<418432167.1434631345733795589.JavaMail.admin@crm-eve-web04.hst.dsl.crm.alidc.net>', 107197, 5751, 271, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-24 05:15:01', '<201208240515.q7O5F1bp084961@billing.aknet.kg>', 877, 5752, 272, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-24 06:10:02', '<201208240610.q7O6A2JG095286@billing.aknet.kg>', 1004, 5753, 273, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-24 11:10:01', '<201208241110.q7OBA1YC055403@billing.aknet.kg>', 1218, 5754, 274, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-25 05:15:00', '<201208250515.q7P5F0Rw069898@billing.aknet.kg>', 877, 5755, 275, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-25 06:10:04', '<201208250610.q7P6A4Vb080009@billing.aknet.kg>', 1144, 5756, 276, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?windows-1251?B?0+Ll5O7s6+Xt6OUhISE=?=', 'Diana <d.akopyan@neotech.kg>', 'undisclosed-recipients: ', '2012-08-25 09:13:24', '<903910972.20120825151324@neotech.kg>', 1353, 5757, 277, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-25 11:10:03', '<201208251110.q7PBA30T040412@billing.aknet.kg>', 1216, 5758, 278, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?windows-1251?B?7vLs5e3g?=', 'Diana <d.akopyan@neotech.kg>', '=?windows-1251?B?0+zz8Ofg6u7iINLl7Ojw?= <tima@aknet.kg>', '2012-08-25 12:15:19', '<8210253297.20120825181519@neotech.kg>', 741321, 5759, 279, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-26 05:15:00', '<201208260515.q7Q5F09t050887@billing.aknet.kg>', 877, 5760, 280, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-26 06:10:03', '<201208260610.q7Q6A30v061085@billing.aknet.kg>', 1073, 5761, 281, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-26 11:10:01', '<201208261110.q7QBA1lV020682@billing.aknet.kg>', 1145, 5762, 282, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, browse hot searching products on Alibaba.com', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-08-26 19:42:50', '<1966398384.4970651346010170972.JavaMail.admin@crm-eve-web03.hst.dsl.crm.alidc.net>', 47577, 5763, 283, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-27 05:15:00', '<201208270515.q7R5F016034131@billing.aknet.kg>', 877, 5764, 284, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-27 06:10:02', '<201208270610.q7R6A2VV044405@billing.aknet.kg>', 1287, 5765, 285, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Re: Terminal specs', 'GEOFANCI <geofanci@geofanci.com>', 'Umurzakov Temir <tima@aknet.kg>', '2012-08-27 07:40:16', '<201208271540133288226@geofanci.com>', 19466, 5766, 286, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-27 11:10:01', '<201208271110.q7RBA1cd004647@billing.aknet.kg>', 1288, 5767, 287, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'php', 'Ildar Mursalimov <ildar@aknet.kg>', 'tima@aknet.kg', '2012-08-27 15:44:09', '<d65c57c12bcb39e8d68712692552853e@aknet.kg>', 7880, 5768, 288, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-28 05:15:00', '<201208280515.q7S5F0qj014108@billing.aknet.kg>', 877, 5769, 289, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-28 06:10:01', '<201208280610.q7S6A13s024159@billing.aknet.kg>', 1143, 5770, 290, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'DirectIndustry --- New products', 'Newsletter DirectIndustry <noreply@directindustry.com>', 'tima@aknet.kg', '2012-08-28 07:23:12', '<f51c69bd65a2e210f2366402f4ade460@directindustry.com>', 124162, 5771, 291, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-28 11:10:02', '<201208281110.q7SBA2Ra083868@billing.aknet.kg>', 1216, 5772, 292, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-29 05:15:00', '<201208290515.q7T5F0Vm095360@billing.aknet.kg>', 877, 5773, 293, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-29 06:10:01', '<201208290610.q7T6A1iC005822@billing.aknet.kg>', 1145, 5774, 294, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-29 11:10:03', '<201208291110.q7TBA3Yw066041@billing.aknet.kg>', 1216, 5775, 295, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, Thermal blank Barcode label printe, UHF RFID reader trade opportunities [29 Aug 2012]', 'Alibaba Trade Alert <tradealert@service.alibaba.com>', '"tima@aknet.kg" <tima@aknet.kg>', '2012-08-29 19:21:50', '<1053675430.1346268110137.JavaMail.admin@vipsmtp.alibaba.com>', 93165, 5776, 296, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-30 05:15:00', '<201208300515.q7U5F0EP077531@billing.aknet.kg>', 877, 5777, 297, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Top ranking and fastest-moving products this past week', '"Alibaba.com" <tradealert@service.alibaba.com>', 'tima@aknet.kg', '2012-08-30 02:17:06', '<1145763673.4631431346293026681.JavaMail.admin@crm-eve-task2.hst.dsl.crm.alidc.net>', 203443, 5778, 298, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-30 06:10:01', '<201208300610.q7U6A1w5087656@billing.aknet.kg>', 1215, 5779, 299, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-08-30 11:10:02', '<201208301110.q7UBA2IK048174@billing.aknet.kg>', 1286, 5780, 300, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'RFID UHF handheld(PDA) reader', 'Luke Lin <rfidmtc@vip.163.com>', 'tima@aknet.kg', '2012-08-30 11:24:34', '<69e0e499.196e5.139774685eb.Coremail.rfidmtc@vip.163.com>', 330487, 5781, 301, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-08-31 03:55:07', '<201208310355.q7V3t7E5082440@groupoffice.aknet.kg>', 1176, 5782, 302, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'UHF inlay', 'Luke Lin <rfidmtc@vip.163.com>', 'tima@aknet.kg', '2012-08-31 07:31:23', '<56080f6a.8229.1397b9766c8.Coremail.rfidmtc@vip.163.com>', 127024, 5783, 303, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-08-31 07:55:06', '<201208310755.q7V7t6tw087240@groupoffice.aknet.kg>', 1134, 5784, 304, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-08-31 08:55:05', '<201208310855.q7V8t5CC088468@groupoffice.aknet.kg>', 1118, 5785, 305, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-08-31 09:55:05', '<201208310955.q7V9t5cS089671@groupoffice.aknet.kg>', 1154, 5786, 306, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-08-31 10:55:05', '<201208311055.q7VAt57v090796@groupoffice.aknet.kg>', 1138, 5787, 307, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-08-31 11:55:06', '<201208311155.q7VBt6ZC091944@groupoffice.aknet.kg>', 1116, 5788, 308, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-01 05:15:00', '<201209010515.q815F0U1050992@billing.aknet.kg>', 874, 5789, 309, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-01 06:10:02', '<201209010610.q816A2WP061400@billing.aknet.kg>', 1138, 5790, 310, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Fwd: SalesPlatform.ru CRM demo login details', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-09-01 08:36:23', '<20120901083623.12220.1811936738.swift@crm.aknet.kg>', 2674, 5791, 311, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-01 11:10:02', '<201209011110.q81BA2oW019129@billing.aknet.kg>', 1067, 5792, 312, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, suppliers matching your recent search on Alibaba.com', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-09-01 18:03:05', '<772888084.394531346522585152.JavaMail.admin@crm-eve-web01.hst.dsl.crm.alidc.net>', 71159, 5793, 313, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-09-02 04:55:05', '<201209020455.q824t5dT071019@groupoffice.aknet.kg>', 1135, 5794, 314, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-02 05:15:00', '<201209020515.q825F0lq030384@billing.aknet.kg>', 874, 5795, 315, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-09-02 05:55:05', '<201209020555.q825t5Yv072044@groupoffice.aknet.kg>', 1119, 5796, 316, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-09-02 07:55:05', '<201209020755.q827t51a074250@groupoffice.aknet.kg>', 1097, 5797, 317, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-09-02 09:55:05', '<201209020955.q829t5GK076714@groupoffice.aknet.kg>', 1097, 5798, 318, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'office@gazprom-neft.kg', '2012-09-03 04:28:27', '<20120903042831.DD03E1CCBC@mx.aknet.kg>', 131200, 5799, 319, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'office@gazprom-neft.kg', '2012-09-03 04:28:27', '<20120903042831.E9FC71CCD0@mx.aknet.kg>', 137268, 5800, 320, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-03 05:15:01', '<201209030515.q835F16g002083@billing.aknet.kg>', 874, 5801, 321, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0YHQutGA0LjQvdGL?=', '=?utf-8?B?0JTQvNC40YLRgNC40Lkg0KHQvtCx0L7Qu9C10LI=?= <dsobolev@kts.kg>', 'tima@aknet.kg', '2012-09-03 05:48:11', '<1433407.1791346651291359.JavaMail.root@webmail>', 26792, 5802, 322, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?0L/QviDQv9C+0LLQvtC00YMgIGNybS5ha25ldC5rZy9iZXRhLw==?=', '=?UTF-8?B?0JIu0Kcu?= <v0ff@bk.ru>', 'tima@aknet.kg', '2012-09-03 08:06:39', '<1346659599.359252080@m.mail.ru>', 2682, 5803, 323, 0, 0, 1, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?Q?=D0=97=D0=B0=D0=BC=D1=83=D1=82=D0=B8=D1=82=D1=8C=20=D1=82=D0=B0?= =?UTF-8?Q?=D1=80=D0=B8=D1=84?=', 'Roman Melnik <roman@prosto.kg>', 'tima@aknet.kg', '2012-09-03 08:22:33', '<d7a15a84c0c5e5e38d0a4481feb32033@localhost>', 1106, 5804, 324, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?UmU6INCQ0LrQvdC10YIuINCe0YjQuNCx0LrQsCDQv9C70LDRgtC10LbQsA==?=', 'Timur Adilov <timur.adilov@gmail.com>', 'Umurzakov Temir <tima@aknet.kg>', '2012-09-03 10:06:33', '<CAPgHt37cqxFdAP5i9g+9-S80PTYy=5RbyLNg9BqSQYW+K7_b=Q@mail.gmail.com>', 5331, 5805, 325, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-03 11:10:01', '<201209031110.q83BA1GB065210@billing.aknet.kg>', 928, 5806, 326, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'beniceontime@yahoo.com', '2012-09-04 03:31:58', '<20120904033201.98B8A1CD9A@mx.aknet.kg>', 130726, 5807, 327, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'office@gazprom-neft.kg', '2012-09-04 03:35:32', '<20120904033535.E0FF21CD4C@mx.aknet.kg>', 131208, 5808, 328, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'office@gazprom-neft.kg', '2012-09-04 03:35:32', '<20120904033536.693E21CE11@mx.aknet.kg>', 137276, 5809, 329, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-04 05:15:00', '<201209040515.q845F037078591@billing.aknet.kg>', 874, 5810, 330, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-09-04 07:55:06', '<201209040755.q847t6EK033711@groupoffice.aknet.kg>', 1097, 5811, 331, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?UmVbMl06INC/0L4g0L/QvtCy0L7QtNGDICBjcm0uYWtuZXQua2cvYmV0YS8=?=', '=?UTF-8?B?0JIu0Kcu?= <v0ff@bk.ru>', '=?UTF-8?B?0KPQvNGD0YDQt9Cw0LrQvtCyINCi0LXQvNC40YA=?= <tima@aknet.kg>', '2012-09-04 09:17:53', '<1346750273.813868116@m.mail.ru>', 2324, 5812, 332, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'ATF24. Card statement 2012-09-05 [Cyrillic (Windows-1251)]', 'card-info-out@atfbank.kz', 'tima@aknet.kg', '2012-09-05 03:39:18', '<b638e344-1cb9-49c9-b09b-80551e265cda@exnlb1.corp.atfbank.kz>', 12221, 5813, 333, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'ATF24. Card statement 2012-09-05 [Cyrillic (Windows-1251)]', 'card-info-out@atfbank.kz', 'tima@aknet.kg', '2012-09-05 03:55:58', '<884e65ec-b71e-46c9-a8a3-fce27970607c@exnlb1.corp.atfbank.kz>', 13579, 5814, 334, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-05 05:15:00', '<201209050515.q855F05G049393@billing.aknet.kg>', 874, 5815, 335, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-05 06:10:02', '<201209050610.q856A2vN059988@billing.aknet.kg>', 999, 5816, 336, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'RE: KPI', '=?UTF-8?B?0JzQuNGF0LDQuNC7INCb0LXRhdGC0LzQsNC9?= <mlehtman@aknet.kg>', '''Umurzakov Temir'' <tima@aknet.kg>', '2012-09-05 09:34:15', '<007001cd8b49$9d73d520$d85b7f60$@kg>', 1397, 5817, 337, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'RE: Re: =?UTF-8?Q?=D0=BA=D0=BE=D0=BC=D0=BC=D0=B5=D1=80=D1=87?= =?UTF-8?Q?=D0=B5=D1=81=D0=BA=D0=BE=D0=B5=20=D0=BF=D1=80=D0=B5=D0=B4=D0=BB?= =?UTF-8?Q?=D0=BE=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=20=D0=BE=D1=82=20=D0=BA?= =?UTF-8?Q?=D0=BE=D0=BC=D0=BF=D0=B0=D0=BD=D0', '=?UTF-8?Q?=D0=95=D0=BA=D0=B0=D1=82=D0=B5=D1=80=D0=B8=D0=BD=D0=B0_?= =?UTF-8?Q?=D0=A1=D0=B2=D0=B5=D1=', '=?UTF-8?Q?=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB_=D0=9B=D0=B5=D1=85?= =?UTF-8?Q?=D1=82=D0=BC=D0=B0=D0=BD?= <mlehtman@aknet.kg>', '2012-09-05 09:45:27', '<feec4df109cdf1c7a601cda72b5617ab@aknet.kg>', 10584, 5818, 338, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?UkU6IFJlOiDQutC+0LzQvNC10YDRh9C10YHQutC+0LUg0L/RgNC10LTQuw==?= =?UTF-8?B?0L7QttC10L3QuNC1INC+0YIg0LrQvtC80L/QsNC90LjQuCAi0JDQutC90LXRgiI=?=', '=?UTF-8?B?0JzQuNGF0LDQuNC7INCb0LXRhdGC0LzQsNC9?= <mlehtman@aknet.kg>', '=?UTF-8?B?J9CV0LrQsNGC0LXRgNC40L3QsCDQodCy0LXRgtCw0YfQtdCy0LAn?= <pr@aknet.kg>', '2012-09-05 09:48:52', '<00a401cd8b4b$a8152ae0$f83f80a0$@kg>', 17769, 5819, 339, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-09-05 10:55:07', '<201209051055.q85At7wL073156@groupoffice.aknet.kg>', 1174, 5820, 340, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-05 11:10:02', '<201209051110.q85BA27e018913@billing.aknet.kg>', 928, 5821, 341, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, Thermal blank Barcode label printe, UHF RFID reader trade opportunities [5 Sep 2012]', 'Alibaba Trade Alert <tradealert@service.alibaba.com>', '"tima@aknet.kg" <tima@aknet.kg>', '2012-09-05 11:29:23', '<2119598477.1346844563576.JavaMail.admin@vipsmtp.alibaba.com>', 94677, 5822, 342, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-09-05 11:55:07', '<201209051155.q85Bt7rc074893@groupoffice.aknet.kg>', 1135, 5823, 343, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-09-05 12:55:07', '<201209051255.q85Ct7pY076461@groupoffice.aknet.kg>', 1152, 5824, 344, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?7sEgy8/S0sXL1MnSz9fL1Q==?=', 'Dzhanybek S Usenaliev <D.Usenaliev@qiwi.com>', '"tima@aknet.kg" <tima@aknet.kg>', '2012-09-05 12:21:45', '<94D2680D1A0AC149AA846C1942D72A9A5AA5C995@mbx02.usrp.rt.local>', 1307221, 5825, 345, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-09-05 13:55:08', '<201209051355.q85Dt8Xh077813@groupoffice.aknet.kg>', 1136, 5826, 346, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '', 'Dzhanybek S Usenaliev <D.Usenaliev@qiwi.com>', '"tima@aknet.kg" <tima@aknet.kg>', '2012-09-05 14:05:03', '<94D2680D1A0AC149AA846C1942D72A9A5AA5C9FC@mbx02.usrp.rt.local>', 657206, 5827, 347, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-09-05 14:55:07', '<201209051455.q85Et7Sk079123@groupoffice.aknet.kg>', 1130, 5828, 348, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, browse products you might be interested in', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-09-05 18:36:25', '<899661009.762801346870185331.JavaMail.admin@crm-eve-web05.hst.dsl.crm.alidc.net>', 69595, 5829, 349, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Top ranking and fastest-moving products this past week', '"Alibaba.com" <tradealert@service.alibaba.com>', 'tima@aknet.kg', '2012-09-06 00:48:02', '<1722032334.1690371346892482016.JavaMail.admin@crm-eve-web01.hst.dsl.crm.alidc.net>', 201685, 5830, 350, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-06 05:15:00', '<201209060515.q865F0ag034103@billing.aknet.kg>', 874, 5831, 351, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '', 'Dzhanybek S Usenaliev <D.Usenaliev@qiwi.com>', '"tima@aknet.kg" <tima@aknet.kg>', '2012-09-06 06:44:13', '<94D2680D1A0AC149AA846C1942D72A9A5AA5CA7D@mbx02.usrp.rt.local>', 691159, 5832, 352, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?Q?=D0=97=D0=B0=D0=B4=D0=B0=D1=87=D0=B0?=', '=?UTF-8?Q?=D0=9E=D1=82=D0=B4=D0=B5=D0=BB_=D0=BC=D0=B0=D1=80=D0=BA?= =?UTF-8?Q?=D0=B5=D1=82=D0=B8=D0=', 'alisher@aknet.kg', '2012-09-06 11:14:11', '<5217c667b7da83a702ef6b2fb6be4473@aknet.kg>', 23793, 5833, 353, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?UkU6INCX0LDQtNCw0YfQsA==?=', '=?UTF-8?B?0JzQuNGF0LDQuNC7INCb0LXRhdGC0LzQsNC9?= <mlehtman@aknet.kg>', '=?UTF-8?B?J9Ce0YLQtNC10Lsg0LzQsNGA0LrQtdGC0LjQvdCz0LAgaVRWJw==?= <marketing@aknet.kg>', '2012-09-06 11:30:07', '<004c01cd8c22$f75b60b0$e6122210$@kg>', 11933, 5834, 354, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Fwd: =?UTF-8?Q?=D0=97=D0=B0=D0=B4=D0=B0=D1=87=D0=B0?=', 'Alisher Kovalev <alisher@aknet.kg>', 'tima@aknet.kg', '2012-09-06 11:36:18', '<08b5a97a3946f84550e6549ad0ddb4fd@aknet.kg>', 2150, 5835, 355, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?Rlc6INGC0LXRhS7Qt9Cw0LTQsNC90LjQtSAi0J3QvtCy0L7RgdGC0Lgg0Jo=?= =?UTF-8?B?0YvRgNCz0YvQt9GB0YLQsNC90LAi?=', '=?UTF-8?B?0JzQuNGF0LDQuNC7INCb0LXRhdGC0LzQsNC9?= <mlehtman@aknet.kg>', 'tima@aknet.kg', '2012-09-06 12:09:58', '<006e01cd8c28$888f5e10$99ae1a30$@kg>', 173767, 5836, 356, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Fwd: FW: =?UTF-8?Q?=D0=A1=D0=A0=D0=9E=D0=A7=D0=9D=D0=9E!=20=D0=9F?= =?UTF-8?Q?=D0=B8=D1=81=D1=8C=D0=BC=D0=BE=20=D0=B8=D0=B7=20=D0=93=D0=9A?= =?UTF-8?Q?=D0=9D=D0=91?=', 'Ildar Mursalimov <ildar@aknet.kg>', 'tima@aknet.kg', '2012-09-07 03:27:06', '<8af306a4080ba8b707e185d85613238e@aknet.kg>', 3498119, 5837, 357, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?Q?=D0=A0=D0=B0=D0=B7=D1=80=D0=B5=D1=88=D0=B8=D1=82=D0=B5?= =?UTF-8?Q?=D0=BB=D1=8C=D0=BD=D0=BE=D0=B5=20=D0=BF=D0=B8=D1=81=D1=8C=D0=BC?= =?UTF-8?Q?=D0=BE=20=D0=BE=D1=82=20=D0=92=D0=B5=D1=87=D0=B5=D1=80=D0=BD?= =?UTF-8?Q?=D0=B5=D0=B3=D0=BE=20=D0=91=D', '=?UTF-8?Q?=D0=9E=D1=82=D0=B4=D0=B5=D0=BB_=D0=BC=D0=B0=D1=80=D0=BA?= =?UTF-8?Q?=D0=B5=D1=82=D0=B8=D0=', '=?UTF-8?Q?=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB_=D0=9B=D0=B5=D1=85?= =?UTF-8?Q?=D1=82=D0=BC=D0=B0=D0=BD?= <mlehtman@aknet.kg>', '2012-09-07 04:22:52', '<11d0d8d0b37d95c4b3d70a433a07777b@aknet.kg>', 1143119, 5838, 358, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '', '=?koi8-r?B?5cvB1MXSyc7BIOzFz87P18E=?= <e.leonova@aknet.kg>', 'tima@aknet.kg', '2012-09-07 06:40:54', '<!&!AAAAAAAAAAAYAAAAAAAAAMys9c0AKqlKsS7JqNFz1TLCgAAAEAAAAMl6AqIXgd9Gqmr/DE6Js78BAAAAAA==@aknet.kg>', 4108, 5839, 359, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'RE: ', '=?UTF-8?B?0JXQutCw0YLQtdGA0LjQvdCwINCb0LXQvtC90L7QstCw?= <e.leonova@aknet.kg>', '''Umurzakov Temir'' <tima@aknet.kg>', '2012-09-07 08:21:36', '<!&!AAAAAAAAAAAYAAAAAAAAAMys9c0AKqlKsS7JqNFz1TLCgAAAEAAAAIeD88DMklVJmrmm7hA/qtwBAAAAAA==@aknet.kg>', 4061, 5840, 360, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-07 11:10:02', '<201209071110.q87BA2Cx093362@billing.aknet.kg>', 999, 5841, 361, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-09-08 05:55:05', '<201209080555.q885t5On061130@groupoffice.aknet.kg>', 1119, 5842, 362, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-09-08 10:55:08', '<201209081055.q88At881068655@groupoffice.aknet.kg>', 1151, 5843, 363, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, browse suppliers selling popular products in your industry', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-09-08 19:36:21', '<543903745.8161701347132981415.JavaMail.admin@crm-eve-task2.hst.dsl.crm.alidc.net>', 71669, 5844, 364, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'regexp e-mail', 'Ildar Mursalimov <ildar@aknet.kg>', 'tima@aknet.kg', '2012-09-09 08:15:07', '<5505eb9c21eb20fe3c2785a92250e57e@aknet.kg>', 6025, 5845, 365, 0, 0, 0, 0, 1, 0);
INSERT INTO `email_cache` (`ie_id`, `mbox`, `subject`, `fromaddr`, `toaddr`, `senddate`, `message_id`, `mailsize`, `imap_uid`, `msgno`, `recent`, `flagged`, `answered`, `deleted`, `seen`, `draft`) VALUES
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?UkU6IFJGSUQgINCh0L7QsdGA0LDQvdC40LUg0L/QviDQtNCw0L3QvdC+0LzRgyA=?= =?utf-8?B?0LLQvtC/0YDQvtGB0YMg0LHRg9C00LXRgiDRgdC10LPQvtC00L3RjyDQsiAxNCww?= =?utf-8?B?MCDRh9Cw0YHQvtCy?=', '=?utf-8?B?0JzQsNGA0LDRgg==?= <marat@aknet.kg>', '''Umurzakov Temir'' <tima@aknet.kg>', '2012-09-10 04:15:35', '<002301cd8f0a$ed3ceb90$c7b6c2b0$@kg>', 1588, 5846, 366, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'GKNB', 'User Azamy <azamy@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-10 04:32:25', '<201209100432.q8A4WPQF063482@billing.aknet.kg>', 30162, 5847, 367, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Did you find what you were looking for?', 'Oisin Connell <oconnell@salesforce.com>', '"tima@aknet.kg" <tima@aknet.kg>', '2012-09-10 07:43:49', '<0A8KN000000000000000000000000000000000000000000000MA4IT100z5AgEOgBRKiduC34ynMhOQ@sfdc.net>', 10242, 5848, 368, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?0JTQsNC90L3Ri9C1INCf0L7Qu9GM0LfQvtCy0LDRgtC10LvRjyDQtNC70Y8g?= =?UTF-8?B?0JLRhdC+0LTQsA==?=', 'your-support name <admin@bscrm.com.ua>', 'tima@aknet.kg', '2012-09-10 08:05:58', '<7903bf80ded2b79311f6af0e02a58f15@vm1.salesplatform.ru>', 3381, 5849, 369, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?0JTQsNC90L3Ri9C1INCf0L7Qu9GM0LfQvtCy0LDRgtC10LvRjyDQtNC70Y8g?= =?UTF-8?B?0JLRhdC+0LTQsA==?=', 'your-support name <admin@bscrm.com.ua>', 'tima@aknet.kg', '2012-09-10 08:06:25', '<44d3628c4a72033b6fcdcbb66362b256@vm1.salesplatform.ru>', 3317, 5850, 370, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?0JTQsNC90L3Ri9C1INCf0L7Qu9GM0LfQvtCy0LDRgtC10LvRjyDQtNC70Y8g?= =?UTF-8?B?0JLRhdC+0LTQsA==?=', 'your-support name <admin@bscrm.com.ua>', 'tima@aknet.kg', '2012-09-10 08:06:44', '<1b48bf237d2e6038d5f18bcc1ddb6c5c@vm1.salesplatform.ru>', 3311, 5851, 371, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?0JTQsNC90L3Ri9C1INCf0L7Qu9GM0LfQvtCy0LDRgtC10LvRjyDQtNC70Y8g?= =?UTF-8?B?0JLRhdC+0LTQsA==?=', 'your-support name <admin@bscrm.com.ua>', 'tima@aknet.kg', '2012-09-10 08:06:57', '<c26f42647bb4e2476df70d1054257cb6@vm1.salesplatform.ru>', 3266, 5852, 372, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?0JTQsNC90L3Ri9C1INCf0L7Qu9GM0LfQvtCy0LDRgtC10LvRjyDQtNC70Y8g?= =?UTF-8?B?0JLRhdC+0LTQsA==?=', 'your-support name <admin@bscrm.com.ua>', 'tima@aknet.kg', '2012-09-10 08:05:02', '<3c7153f67a3087ed564f47cff7361814@vm1.salesplatform.ru>', 3319, 5853, 373, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?0JLQsNC8INC+0YLQutGA0YvRgiDQlNC+0YHRgtGD0L8g0LIgQlNDUk0=?=', '=?UTF-8?B?0JDQu9C10LrRgdC10Lkg0JrRg9C00LvQsNC10L3QutC+?= <admin@bscrm.com.ua>', 'tima@aknet.kg', '2012-09-10 08:07:11', '<a003c49dc4f3f45632259fc74e8a173b@127.0.0.1>', 8016, 5854, 374, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'RE:', 'e.leonova@aknet.kg', 'Umurzakov Temir <tima@aknet.kg>', '2012-09-12 04:12:34', '<8288d34df40c4660b0a9cda1bee68778@aknet.kg>', 1476, 5855, 375, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Re:', 'e.leonova@aknet.kg', 'Umurzakov Temir <tima@aknet.kg>', '2012-09-12 04:51:42', '<0b175ed675e6e50a811f73c3dfe182a7@aknet.kg>', 2223, 5856, 376, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?Q?=D0=BB=D0=BE=D0=B3=D0=BE=D1=82=D0=B8=D0=BF=20=D0=BE?= =?UTF-8?Q?=D1=82=20K-News?=', '=?UTF-8?Q?=D0=9E=D1=82=D0=B4=D0=B5=D0=BB_=D0=BC=D0=B0=D1=80=D0=BA?= =?UTF-8?Q?=D0=B5=D1=82=D0=B8=D0=', 'tima@aknet.kg', '2012-09-12 04:56:50', '<ab758140e00ff687f17360b5839ed084@aknet.kg>', 116083, 5857, 377, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?Q?Fwd:_=D0=9F=D1=80=D0=B8=D0=BA=D0=B0=D0=B7?= =?utf-8?Q?_=D0=BF=D0=BE?= =?utf-8?Q?_=D1=80=D0=B0=D1=81=D1=81=D1=80=D0=BE=D1=87=D0=BA=D0=B5?=', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-09-12 05:36:47', '<20120912053647.11612.1948657431.swift@crm.aknet.kg>', 489997, 5858, 378, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Re:', 'e.leonova@aknet.kg', 'Umurzakov Temir <tima@aknet.kg>', '2012-09-12 05:42:44', '<5fc799805bc6da9d740d1f2d1cfef4cd@aknet.kg>', 2596, 5859, 379, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '', '=?koi8-r?B?5cvB1MXSyc7BIOzFz87P18E=?= <e.leonova@aknet.kg>', 'tima@aknet.kg', '2012-09-12 08:41:15', '<!&!AAAAAAAAAAAYAAAAAAAAAMys9c0AKqlKsS7JqNFz1TLCgAAAEAAAAFMxKaLAlJFDqn7IVT1AcjABAAAAAA==@aknet.kg>', 361810, 5860, 380, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, Thermal blank Barcode label printe, UHF RFID reader trade opportunities [12 Sep 2012]', 'Alibaba Trade Alert <tradealert@service.alibaba.com>', '"tima@aknet.kg" <tima@aknet.kg>', '2012-09-12 12:03:43', '<286326087.1347451423104.JavaMail.admin@vipsmtp.alibaba.com>', 95307, 5861, 381, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Top ranking and fastest-moving products this past week', '"Alibaba.com" <tradealert@service.alibaba.com>', 'tima@aknet.kg', '2012-09-13 00:50:08', '<1907553564.3517651347497408100.JavaMail.admin@crm-eve-web03.hst.dsl.crm.alidc.net>', 201188, 5862, 382, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Re:', 'e.leonova@aknet.kg', 'Umurzakov Temir <tima@aknet.kg>', '2012-09-13 04:16:39', '<260352e8afde4874750f27c0ccb22159@aknet.kg>', 1647, 5863, 383, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-13 06:10:01', '<201209130610.q8D6A1Gt033227@billing.aknet.kg>', 1002, 5864, 384, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?Q?Fwd:?= =?utf-8?Q?_=D0=A1=D0=BB=D1=83=D0=B6=D0=B5=D0=B1=D0=BD=D0=B0=D1=8F_?= =?utf-8?Q?=D0=B7=D0=B0=D0=BF=D0=B8=D1=81=D0=BA=D0=B0?= =?utf-8?Q?_=D0=94=D0=A1?=', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-09-13 09:03:59', '<20120913090359.50547.1082240262.swift@crm.aknet.kg>', 189760, 5865, 385, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-13 11:10:02', '<201209131110.q8DBA22A093167@billing.aknet.kg>', 1071, 5866, 386, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-14 11:10:02', '<201209141110.q8EBA2TA076493@billing.aknet.kg>', 932, 5867, 387, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?Q?=D0=B2?= =?utf-8?Q?_=D0=BF=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD?= =?utf-8?Q?=D0=B8=D0=BA?= =?utf-8?Q?_=D0=B2=D0=BA=D0=BB=D1=8E=D1=87=D0=B0=D0=B9?= =?utf-8?Q?_=D1=82=D0=B0=D0=B1=D0=BB=D0=B8=D1=86=D1=8B_66?= =?utf-8?Q?_=D0=BD=D0=B0_=D0=', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-09-14 16:37:00', '<20120914163700.94988.1837244288.swift@crm.aknet.kg>', 2255, 5868, 388, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'New Totel Network', 'Ildar Mursalimov <ildar@aknet.kg>', 'info@aknet.kg', '2012-09-15 05:25:12', '<5953dc55644ef46b9273a6a8c218107b@aknet.kg>', 3328, 5869, 389, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?KOI8-R?B?4snMzMnOxw==?=', 'Ruslan Karimberdiev <inspiration312@gmail.com>', 'tima@aknet.kg', '2012-09-17 04:22:04', '<CADLHJKB8aa7ZburQ9AkVGoh3FaND5K-Ornr6pK5EE=TreVWQDQ@mail.gmail.com>', 1886, 5871, 390, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0JTRg9Cx0LvRjA==?=', '=?utf-8?B?0JTQvNC40YLRgNC40Lkg0KHQvtCx0L7Qu9C10LI=?= <dsobolev@kts.kg>', 'tima@aknet.kg', '2012-09-17 05:13:22', '<1866828.1551347858802268.JavaMail.root@webmail>', 2464, 5872, 391, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?UmU6INCi0LXRhdC90LjRh9C10YHQutC+0LUg0LfQsNC00LDQvdC40LUuINCo0YLRgNC40YUg?= =?utf-8?B?0LrQvtC0LiDQkNC60L3QtdGC?=', 'Igor <igor@scs.kg>', 'Umurzakov Temir <tima@aknet.kg>', '2012-09-17 08:50:20', '<298032888.20120917145020@scs.kg>', 2830, 5873, 392, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'CRM', '=?koi8-r?B?7cnIwcnMIOzFyNTNwc4=?= <mlehtman@aknet.kg>', 'tima@aknet.kg', '2012-09-17 10:51:38', '<008201cd94c2$6a36b970$3ea42c50$@kg>', 3648, 5874, 393, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?UmVbMl06INCi0LXRhdC90LjRh9C10YHQutC+0LUg0LfQsNC00LDQvdC40LUuINCo0YLRgNC4?= =?utf-8?B?0YUg0LrQvtC0LiDQkNC60L3QtdGC?=', 'Igor <igor@scs.kg>', 'Umurzakov Temir <tima@aknet.kg>', '2012-09-17 11:25:03', '<1225181343.20120917172503@scs.kg>', 4141, 5875, 394, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?Q?=D0=9A=D0=B0=D0=BA=D0=BE=D0=B9_=D1=82=D0=BE?= =?utf-8?Q?_=D0=BF=D0=BE=D1=80=D1=82=D0=B0=D0=BB_=D1=81?= =?utf-8?Q?_=D0=BC=D0=BE=D0=B4=D1=83=D0=BB=D1=8F=D0=BC=D0=B8?= =?utf-8?Q?_=D0=B4=D0=BB=D1=8F?= =?utf-8?Q?_=D0=A8=D1=83=D0=B3=D0=B0=D1=80=D0=A1=', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-09-17 14:06:32', '<20120917140632.4699.1399964106.swift@crm.aknet.kg>', 2147, 5876, 395, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?Q?=D0=9C=D0=BE=D0=B4=D1=83=D0=BB=D1=8C_ProcessMaker_O?= =?utf-8?Q?pen_Source_Workflow_BPM_=D0=B4=D0=BB=D1=8F?= =?utf-8?Q?_=D0=A8=D1=83=D0=B3=D0=B0=D1=80?=', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-09-17 14:10:53', '<20120917141053.4795.2126571821.swift@crm.aknet.kg>', 2557, 5877, 396, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?Q?Case_-_=D0=BF=D0=BE=D1=85=D0=BE=D0=B6=D0=B5?= =?utf-8?Q?_=D1=8D=D1=82=D0=BE_=D1=82=D0=B5=D1=85?= =?utf-8?Q?_=D0=BF=D0=BE=D0=B4=D0=B4=D0=B5=D1=80=D0=B6=D0=BD=D1=8B?= =?utf-8?Q?=D0=B5_=D0=B4=D0=B5=D0=BB=D0=B0.?=', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-09-17 14:16:54', '<20120917141654.4788.770091634.swift@crm.aknet.kg>', 2064, 5878, 397, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?UmVbNF06INCi0LXRhdC90LjRh9C10YHQutC+0LUg0LfQsNC00LDQvdC40LUuINCo0YLRgNC4?= =?utf-8?B?0YUg0LrQvtC0LiDQkNC60L3QtdGC?=', 'Igor <igor@scs.kg>', 'Umurzakov Temir <tima@aknet.kg>', '2012-09-18 05:01:02', '<1708144818.20120918110102@scs.kg>', 6658, 5879, 398, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-18 06:10:02', '<201209180610.q8I6A2OL029231@billing.aknet.kg>', 1075, 5880, 399, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-18 11:10:02', '<201209181110.q8IBA2Gi087647@billing.aknet.kg>', 1218, 5881, 400, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Corp mail', 'Azamat Souzbekov <fargus.kg@gmail.com>', 'ildar@aknet.kg', '2012-09-18 11:24:08', '<CAEM0_eXG4FfprUbYdQw=6DHntLkrKMYB7UWcw8JOH4CWk_m4cA@mail.gmail.com>', 2284, 5882, 401, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Re: Corp mail', 'Ildar Mursalimov <ildar@aknet.kg>', 'tima@aknet.kg', '2012-09-18 11:53:44', '<8d66e41f2346ba453713a121adab2d31@aknet.kg>', 4787, 5883, 402, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?Q?=D0=9F=D1=80=D0=BE=20RSS?=', '=?UTF-8?Q?=D0=95=D0=BA=D0=B0=D1=82=D0=B5=D1=80=D0=B8=D0=BD=D0=B0_?= =?UTF-8?Q?=D0=A1=D0=B2=D0=B5=D1=', 'tima@aknet.kg', '2012-09-19 03:32:12', '<09a8704904c30071c15c38f3358199e7@aknet.kg>', 2476, 5884, 403, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?UkU6INCf0YDQviBSU1M=?=', '=?UTF-8?B?0JzQuNGF0LDQuNC7INCb0LXRhdGC0LzQsNC9?= <mlehtman@aknet.kg>', '=?UTF-8?B?J9CV0LrQsNGC0LXRgNC40L3QsCDQodCy0LXRgtCw0YfQtdCy0LAn?= <pr@aknet.kg>', '2012-09-19 03:47:35', '<012801cd9619$81b58c40$8520a4c0$@kg>', 8128, 5885, 404, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-19 06:10:02', '<201209190610.q8J6A22R007267@billing.aknet.kg>', 1075, 5886, 405, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?gb2312?B?p7Kn0afZp9Wn1qfdIKeqp6Sn4qftIKfTIKfap9+n5qfgp+Gn4Kfip+Sn0afd?= =?gb2312?B?p9Y=?=', '=?gb2312?B?p66n2qfnp9Gn2qfdIKetp9an56fkp96n0aff?= <mlehtman@aknet.kg>', 'tima@aknet.kg', '2012-09-19 09:23:43', '<019d01cd9648$76e78af0$64b6a0d0$@kg>', 6613, 5887, 406, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-19 11:10:02', '<201209191110.q8JBA2bd065974@billing.aknet.kg>', 1076, 5888, 407, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, Thermal blank Barcode label printe, UHF RFID reader trade opportunities [19 Sep 2012]', 'Alibaba Trade Alert <tradealert@service.alibaba.com>', '"tima@aknet.kg" <tima@aknet.kg>', '2012-09-19 18:32:31', '<1491500277.1348079551671.JavaMail.admin@vipsmtp.alibaba.com>', 91807, 5889, 408, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Top ranking and fastest-moving products this past week', '"Alibaba.com" <tradealert@service.alibaba.com>', 'tima@aknet.kg', '2012-09-20 02:41:45', '<1907666101.2835441348108905815.JavaMail.admin@crm-eve-web01.hst.dsl.crm.alidc.net>', 198707, 5890, 409, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?UmVbMl06INC/0L4g0L/QvtCy0L7QtNGDICBjcm0uYWtuZXQua2cvYmV0YS8=?=', '=?UTF-8?B?0JIu0Kcu?= <v0ff@bk.ru>', '=?UTF-8?B?0KPQvNGD0YDQt9Cw0LrQvtCyINCi0LXQvNC40YA=?= <tima@aknet.kg>', '2012-09-20 05:12:15', '<1348117935.550147325@m.mail.ru>', 2182, 5891, 410, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Server for pfSense', 'azamat.s@aknet.kg', 'tima@aknet.kg', '2012-09-20 07:27:05', '<d8fa4c8eef4f68fc3c686e07073e094b@aknet.kg>', 1014, 5892, 411, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-21 06:10:02', '<201209210610.q8L6A2Rg058764@billing.aknet.kg>', 1004, 5893, 412, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-21 11:10:02', '<201209211110.q8LBA25V018122@billing.aknet.kg>', 1076, 5894, 413, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-22 06:10:03', '<201209220610.q8M6A3dg036181@billing.aknet.kg>', 1075, 5895, 414, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-22 11:10:01', '<201209221110.q8MBA1aY094028@billing.aknet.kg>', 1074, 5896, 415, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-23 06:10:04', '<201209230610.q8N6A4oO009946@billing.aknet.kg>', 1073, 5897, 416, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-23 11:10:02', '<201209231110.q8NBA2F6068099@billing.aknet.kg>', 1074, 5898, 417, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, browse products popular with buyers in your industry', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-09-23 19:45:56', '<1764051547.6148761348429556018.JavaMail.admin@crm-eve-task2.hst.dsl.crm.alidc.net>', 69034, 5899, 418, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-24 06:10:01', '<201209240610.q8O6A17T085271@billing.aknet.kg>', 1004, 5900, 419, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-24 11:10:03', '<201209241110.q8OBA3U5045113@billing.aknet.kg>', 1075, 5901, 420, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?Rlc6IM7B3snTzMXOycUgwcLPzsXO08vPyiDQzMHU2SDQz9PMxSDP1A==?= =?koi8-r?B?y8zA3sXOydEgwcDPzsXO1MEgz9Qg1dPM1cc=?=', '=?koi8-r?B?5cvB1MXSyc7BIOzFz87P18E=?= <e.leonova@aknet.kg>', 'tima@aknet.kg', '2012-09-25 04:30:51', '<!&!AAAAAAAAAAAYAAAAAAAAAMys9c0AKqlKsS7JqNFz1TLCgAAAEAAAAPYJM1WUy7NGiCaMCGYQ7jwBAAAAAA==@aknet.kg>', 29389, 5902, 421, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-25 06:10:02', '<201209250610.q8P6A242067471@billing.aknet.kg>', 1005, 5903, 422, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, browse new products that meet your demands', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-09-25 05:06:35', '<277735669.560031348549595117.JavaMail.admin@crm-eve-web01.hst.dsl.crm.alidc.net>', 69089, 5904, 423, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-25 11:10:02', '<201209251110.q8PBA2Gr027015@billing.aknet.kg>', 1147, 5905, 424, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-26 06:10:02', '<201209260610.q8Q6A2mv049581@billing.aknet.kg>', 1144, 5906, 425, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-26 11:10:02', '<201209261110.q8QBA21P009341@billing.aknet.kg>', 1146, 5907, 426, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, Thermal blank Barcode label printe, UHF RFID reader trade opportunities [26 Sep 2012]', 'Alibaba Trade Alert <tradealert@service.alibaba.com>', '"tima@aknet.kg" <tima@aknet.kg>', '2012-09-26 13:05:38', '<178947420.1348664738525.JavaMail.admin@vipsmtp.alibaba.com>', 92378, 5908, 427, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, contact suppliers for the latest prices', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-09-26 17:38:32', '<396230400.12073201348681112535.JavaMail.admin@crm-eve-task2.hst.dsl.crm.alidc.net>', 68783, 5909, 428, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'DirectIndustry --- New products', 'Newsletter DirectIndustry <noreply@directindustry.com>', 'tima@aknet.kg', '2012-09-27 00:21:47', '<6c6a4c4e1be0a286f591ef1e662813e0@directindustry.com>', 123682, 5910, 429, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-27 05:15:00', '<201209270515.q8R5F0hh020638@billing.aknet.kg>', 877, 5911, 430, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'User Azamy <azamy@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-27 05:47:09', '<201209270547.q8R5l9MB026800@billing.aknet.kg>', 1427, 5912, 431, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'User Azamy <azamy@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-27 05:51:53', '<201209270551.q8R5prn0027577@billing.aknet.kg>', 1216, 5913, 432, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Top ranking and fastest-moving products this past week', '"Alibaba.com" <tradealert@service.alibaba.com>', 'tima@aknet.kg', '2012-09-27 05:10:31', '<1400138669.17879241348722631248.JavaMail.admin@crm-eve-web06.hst.dsl.crm.alidc.net>', 202640, 5914, 433, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?Rlc6IPPM1dbFwsvBIM7BIMTP09TV0CDLIMLJzMzJzsfV?=', '=?koi8-r?B?78zYx8Eg7MHX0s/XwQ==?= <o.lavrova@aknet.kg>', 'tima@aknet.kg', '2012-09-27 12:18:11', '<006d01cd9caa$298a1120$7c9e3360$@lavrova@aknet.kg>', 173894, 5915, 434, 0, 0, 1, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?UkU6IEZXOiDQodC70YPQttC10LHQutCwINC90LAg0LTQvtGB0YLRg9C/INC6?= =?UTF-8?B?INCx0LjQu9C70LjQvdCz0YM=?=', '=?UTF-8?B?0J7Qu9GM0LPQsCDQm9Cw0LLRgNC+0LLQsA==?= <o.lavrova@aknet.kg>', '=?UTF-8?B?J9Cj0LzRg9GA0LfQsNC60L7QsiDQotC10LzQuNGAJw==?= <tima@aknet.kg>', '2012-09-27 12:27:45', '<007101cd9cab$7fb9dc00$7f2d9400$@lavrova@aknet.kg>', 3329, 5916, 435, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?7sHeydPMxc7JxSDh8A==?=', '=?koi8-r?B?7cnIwcnMIOzFyNTNwc4=?= <mlehtman@aknet.kg>', '=?koi8-r?B?J+3B0sHUJw==?= <marat@aknet.kg>', '2012-09-28 03:13:52', '<024f01cd9d27$49a26fc0$dce74f40$@kg>', 129532, 5917, 436, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?UkU6IO7B3snTzMXOycUg4fA=?=', '=?koi8-r?B?7cnIwcnMIOzFyNTNwc4=?= <mlehtman@aknet.kg>', '=?koi8-r?B?J+3B0sHUJw==?= <marat@aknet.kg>', '2012-09-28 04:22:17', '<025e01cd9d30$d80f12f0$882d38d0$@kg>', 137124, 5918, 437, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-28 05:15:00', '<201209280515.q8S5F0Nc005064@billing.aknet.kg>', 877, 5919, 438, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?UkU6IO7B3snTzMXOycUg4fA=?=', '=?koi8-r?B?7cnIwcnMIOzFyNTNwc4=?= <mlehtman@aknet.kg>', '=?koi8-r?B?J+3B0sHUJw==?= <marat@aknet.kg>', '2012-09-28 10:26:25', '<028701cd9d63$b6ea8b80$24bfa280$@kg>', 15870, 5920, 439, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-29 05:15:00', '<201209290515.q8T5F0Q2095109@billing.aknet.kg>', 877, 5921, 440, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-09-30 04:55:05', '<201209300455.q8U4t5WH036942@groupoffice.aknet.kg>', 1159, 5922, 441, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-30 06:10:06', '<201209300610.q8U6A6EX057591@billing.aknet.kg>', 1004, 5923, 442, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-09-30 07:55:05', '<201209300755.q8U7t5ei041576@groupoffice.aknet.kg>', 1122, 5924, 443, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-09-30 08:55:07', '<201209300855.q8U8t7I1042963@groupoffice.aknet.kg>', 1100, 5925, 444, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-09-30 10:55:07', '<201209301055.q8UAt7Ck045777@groupoffice.aknet.kg>', 1083, 5926, 445, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-09-30 11:10:27', '<201209301110.q8UBARPm084664@billing.aknet.kg>', 1075, 5927, 446, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?Q?=D0=A7=D1=82=D0=BE_=D1=82=D0=BE_=D0=BD=D0=B5?= =?utf-8?Q?_=D0=BC=D0=BE=D0=B3=D1=83?= =?utf-8?Q?_=D0=B2=D0=BE=D1=81=D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE?= =?utf-8?Q?=D0=B2=D0=B0=D1=82=D1=8C=D1=81=D1=8F?= =?utf-8?Q?_=D1=84=D0=B8=D0=BB=D1=8C=D1=82=D', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-09-30 18:20:53', '<20120930182053.54469.1535214091.swift@crm.aknet.kg>', 2880, 5928, 447, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?windows-1251?B?yu7w8OXq8ujw7uLq4A==?=', 'Diana <d.akopyan@neotech.kg>', '=?windows-1251?B?0+zz8Ofg6u7iINLl7Ojw?= <tima@aknet.kg>', '2012-10-01 07:17:34', '<1263251444.20121001131734@neotech.kg>', 767476, 5929, 448, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, browse products matching your recent searches', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-10-01 18:27:04', '<1907224811.8421801349116024363.JavaMail.admin@crm-eve-web03.hst.dsl.crm.alidc.net>', 67769, 5930, 449, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?8NLJy8HaIM7BINPPx8zB08/Xwc7JxQ==?=', '=?koi8-r?B?78zYx8Eg7MHX0s/XwQ==?= <o.lavrova@aknet.kg>', 'tima@aknet.kg', '2012-10-02 06:53:22', '<002101cda06a$9cdd51a0$d697f4e0$@lavrova@aknet.kg>', 154690, 5931, 450, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?8NLJy8HaINDPIOHw?=', '=?koi8-r?B?7cnIwcnMIOzFyNTNwc4=?= <mlehtman@aknet.kg>', '=?koi8-r?B?J+3B0sHUJw==?= <marat@aknet.kg>', '2012-10-02 05:35:14', '<046701cda05f$b29cf320$17d6d960$@kg>', 124587, 5932, 451, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-02 06:10:13', '<201210020610.q926ADc4066979@billing.aknet.kg>', 928, 5933, 452, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?y8/Myd7F09TP1yDBws/Oxc7Uz9cgzsEg9PAgy9fB0tTJ0s7ZyiDJIA==?= =?koi8-r?B?4cvUydfO2co=?=', '=?koi8-r?B?78zYx8Eg7MHX0s/XwQ==?= <o.lavrova@aknet.kg>', 'tima@aknet.kg', '2012-10-02 08:14:56', '<004c01cda076$02261e10$06725a30$@lavrova@aknet.kg>', 4590, 5934, 453, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'office@gazprom-neft.kg', '2012-10-02 08:53:27', '<20121002085330.839371CC8E@mx.aknet.kg>', 131824, 5935, 454, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'office@gazprom-neft.kg', '2012-10-02 08:53:49', '<20121002085353.05FCA1CC58@mx.aknet.kg>', 137378, 5936, 455, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'ocmp', 'Diana <d.akopyan@neotech.kg>', '=?windows-1251?B?0+zz8Ofg6u7iINLl7Ojw?= <tima@aknet.kg>', '2012-10-02 10:18:11', '<494437023.20121002161811@neotech.kg>', 751924, 5937, 456, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Re: ocmp', 'Diana <d.akopyan@neotech.kg>', 'Umurzakov Temir <tima@aknet.kg>', '2012-10-02 10:49:44', '<1401017977.20121002164944@neotech.kg>', 2749, 5938, 457, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-02 11:10:03', '<201210021110.q92BA3xk091416@billing.aknet.kg>', 999, 5939, 458, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?Q?=D0=9F=D0=BB=D0=B7?= =?utf-8?Q?_=D0=B4=D0=BE=D0=B1=D0=B0=D0=B2=D1=8C?= =?utf-8?Q?_=D0=BF=D0=BE=D0=B4=D1=81=D0=B5=D1=82=D1=8C?= =?utf-8?Q?_=D0=B4=D0=BB=D1=8F_=D0=9A=D0=B0=D0=BD=D1=82=D0=B0?= =?utf-8?Q?_=D0=B2_=D0=B1=D0=B8=D0=BB=D0=B8=D0=BD=D0=B3?', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-10-02 18:20:06', '<20121002182006.54327.1316108200.swift@crm.aknet.kg>', 2386, 5940, 459, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?UkU6IPDSycvB2iDQzyDh8A==?=', '=?koi8-r?B?7cnIwcnMIOzFyNTNwc4=?= <mlehtman@aknet.kg>', '=?koi8-r?B?J+3B0sHUJw==?= <marat@aknet.kg>', '2012-10-03 03:51:46', '<056d01cda11a$68b6bb40$3a2431c0$@kg>', 136749, 5941, 460, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'ocmp', 'Diana <d.akopyan@neotech.kg>', 'Umurzakov Temir <tima@aknet.kg>', '2012-10-03 05:19:08', '<1181719100.20121003111908@neotech.kg>', 772037, 5942, 461, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Re: ocmp', 'Diana <d.akopyan@neotech.kg>', 'Umurzakov Temir <tima@aknet.kg>', '2012-10-03 05:25:40', '<1144274540.20121003112540@neotech.kg>', 2472, 5943, 462, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'ocmp', 'Diana <d.akopyan@neotech.kg>', 'Umurzakov Temir <tima@aknet.kg>', '2012-10-03 11:10:51', '<1267810948.20121003171051@neotech.kg>', 781233, 5944, 463, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, Thermal blank Barcode label printe, UHF RFID reader trade opportunities [3 Oct 2012]', 'Alibaba Trade Alert <tradealert@service.alibaba.com>', '"tima@aknet.kg" <tima@aknet.kg>', '2012-10-03 20:47:04', '<1893843555.1349297224526.JavaMail.admin@vipsmtp.alibaba.com>', 93968, 5945, 464, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Top ranking and fastest-moving products this past week', '"Alibaba.com" <tradealert@service.alibaba.com>', 'tima@aknet.kg', '2012-10-04 05:08:59', '<7943582.15096041349327339786.JavaMail.admin@crm-eve-web05.hst.dsl.crm.alidc.net>', 202233, 5946, 465, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?Rlc6INfPINfMz9bFzs7PzSDGwcrMxSDQ0s/J2tcuINDSycvB2g==?=', '=?koi8-r?B?89XSwcXXwSDhzMXL08HOxNLB?= <alexandra@aknet.kg>', 'v_natali@aknet.kg', '2012-10-04 09:57:31', '<013c01cda216$ab8c20c0$02a46240$@aknet.kg>', 957798, 5947, 466, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-04 11:10:01', '<201210041110.q94BA19Q098140@billing.aknet.kg>', 929, 5948, 467, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'beniceontime@yahoo.com', '2012-10-04 11:13:18', '<20121004111319.9F4AD1CCE1@mx.aknet.kg>', 130850, 5949, 468, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'office@gazprom-neft.kg', '2012-10-04 11:20:56', '<20121004112057.A2D351CE18@mx.aknet.kg>', 131832, 5950, 469, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?utf-8?B?0KHRh9C10YIt0YTQsNC60YLRg9GA0LA=?=', 'olya_n@aknet.kg', 'office@gazprom-neft.kg', '2012-10-04 11:28:06', '<20121004112807.7E78B1CD8F@mx.aknet.kg>', 137386, 5951, 470, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'ATF24. Card statement 2012-10-05 [Cyrillic (Windows-1251)]', 'card-info-out@atfbank.kz', 'tima@aknet.kg', '2012-10-05 05:31:45', '<b428607a-b0ab-4bcd-beb4-9550af8b4b6c@exnlb1.corp.atfbank.kz>', 12221, 5952, 471, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'ATF24. Card statement 2012-10-05 [Cyrillic (Windows-1251)]', 'card-info-out@atfbank.kz', 'tima@aknet.kg', '2012-10-05 05:48:59', '<b3c371cc-cf5f-4512-bb8f-47f0e0f71b39@exnlb1.corp.atfbank.kz>', 13892, 5953, 472, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Fwd: Tablet PC&IPTV BOX', '"IT Department, AkNet ISP" <info@aknet.kg>', 'tima@aknet.kg', '2012-10-05 08:11:18', '<20121005081118.37649.778560339.swift@crm.aknet.kg>', 570102, 5954, 473, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-05 11:10:23', '<201210051110.q95BANx9047578@billing.aknet.kg>', 929, 5955, 474, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?Rlc6IFJlWzEyXTog+s/OwSDPyNfB1ME=?=', '=?koi8-r?B?7cnIwcnMIOzFyNTNwc4=?= <mlehtman@aknet.kg>', 'tima@aknet.kg', '2012-10-05 11:54:38', '<08a701cda2f0$327d0fc0$97772f40$@kg>', 10158, 5956, 475, 0, 0, 1, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Re: FW: Re[12]: =?UTF-8?Q?=D0=97=D0=BE=D0=BD=D0=B0=20=D0=BE=D1=85?= =?UTF-8?Q?=D0=B2=D0=B0=D1=82=D0=B0?=', '=?UTF-8?Q?=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB_=D0=9B=D0=B5=D1=85?= =?UTF-8?Q?=D1=82=D0=BC=D0=B0=D0=', '=?UTF-8?Q?=D0=A3=D0=BC=D1=83=D1=80=D0=B7=D0=B0=D0=BA=D0=BE=D0=B2_?= =?UTF-8?Q?=D0=A2=D0=B5=D0=BC=D0=B8=D1=80?= <tima@aknet.kg>', '2012-10-05 15:08:21', '<a9a863140fda056e74e5b7c5f80aa29f@aknet.kg>', 3952, 5957, 476, 0, 0, 1, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Re: FW: Re[12]: =?UTF-8?Q?=D0=97=D0=BE=D0=BD=D0=B0=20=D0=BE=D1=85?= =?UTF-8?Q?=D0=B2=D0=B0=D1=82=D0=B0?=', '=?UTF-8?Q?=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB_=D0=9B=D0=B5=D1=85?= =?UTF-8?Q?=D1=82=D0=BC=D0=B0=D0=', '=?UTF-8?Q?=D0=A3=D0=BC=D1=83=D1=80=D0=B7=D0=B0=D0=BA=D0=BE=D0=B2_?= =?UTF-8?Q?=D0=A2=D0=B5=D0=BC=D0=B8=D1=80?= <tima@aknet.kg>', '2012-10-05 15:50:38', '<85f7cb5d96322e572b86d6f5ab99cf56@aknet.kg>', 5210, 5958, 477, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, browse hot searching products on Alibaba.com', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-10-05 18:45:49', '<1938149840.18253351349462749491.JavaMail.admin@crm-eve-web02.hst.dsl.crm.alidc.net>', 69767, 5959, 478, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-10-06 04:55:07', '<201210060455.q964t7Vq063488@groupoffice.aknet.kg>', 1153, 5960, 479, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '11.2', 'User Azamy <azamy@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-06 12:04:34', '<201210061204.q96C4Y73089593@billing.aknet.kg>', 866, 5961, 480, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-06 12:20:00', '<201210061220.q96CK0vl090488@billing.aknet.kg>', 873, 5962, 481, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, view products you might be interested in', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-10-06 23:45:07', '<1532156590.20191921349567107374.JavaMail.admin@crm-eve-web04.hst.dsl.crm.alidc.net>', 69662, 5963, 482, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-07 06:10:10', '<201210070610.q976AAqR019947@billing.aknet.kg>', 1069, 5964, 483, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-07 11:10:48', '<201210071110.q97BAmAf049188@billing.aknet.kg>', 1071, 5965, 484, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?xM/Qz8zOxc7J0SDLIM/U3sXU1Q==?=', '=?koi8-r?B?7sHUwczY0SD3xdLexc7Lzw==?= <v_natali@aknet.kg>', 'tima@aknet.kg', '2012-10-08 02:06:28', '<000601cda4f9$8712f170$9538d450$@kg>', 3801, 5966, 485, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-08 06:10:00', '<201210080610.q986A09A089383@billing.aknet.kg>', 999, 5967, 486, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-08 11:10:01', '<201210081110.q98BA1id020642@billing.aknet.kg>', 1144, 5968, 487, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-08 12:00:00', '<201210081200.q98C0089025573@billing.aknet.kg>', 874, 5969, 488, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-08 12:20:00', '<201210081220.q98CK05E027365@billing.aknet.kg>', 874, 5970, 489, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-08 12:40:00', '<201210081240.q98Ce0s0029253@billing.aknet.kg>', 874, 5971, 490, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?UkU6IPDSycvB2iDQzyDh8A==?=', '=?koi8-r?B?7cnIwcnMIOzFyNTNwc4=?= <mlehtman@aknet.kg>', '=?koi8-r?B?J+3JyMHJzCDsxcjUzcHOJw==?= <mlehtman@aknet.kg>', '2012-10-08 12:51:02', '<09f601cda553$92dce0b0$b896a210$@kg>', 133855, 5972, 491, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-08 13:00:01', '<201210081300.q98D01qF030460@billing.aknet.kg>', 874, 5973, 492, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-08 13:20:00', '<201210081320.q98DK0Oe031661@billing.aknet.kg>', 874, 5974, 493, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-08 13:40:00', '<201210081340.q98De022032932@billing.aknet.kg>', 874, 5975, 494, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-08 14:00:00', '<201210081400.q98E00ms034064@billing.aknet.kg>', 874, 5976, 495, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-08 14:20:00', '<201210081420.q98EK0wv035036@billing.aknet.kg>', 874, 5977, 496, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-08 14:40:00', '<201210081440.q98Ee0k4036117@billing.aknet.kg>', 874, 5978, 497, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-08 15:00:00', '<201210081500.q98F00hb037730@billing.aknet.kg>', 874, 5979, 498, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 03:40:00', '<201210090340.q993e0Bh044048@billing.aknet.kg>', 874, 5980, 499, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 04:00:00', '<201210090400.q994008A046327@billing.aknet.kg>', 874, 5981, 500, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 04:20:00', '<201210090420.q994K08s048627@billing.aknet.kg>', 874, 5982, 501, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 04:40:00', '<201210090440.q994e0XF050995@billing.aknet.kg>', 874, 5983, 502, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 05:00:00', '<201210090500.q99500Ie053163@billing.aknet.kg>', 874, 5984, 503, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?68/Myd7F09TXzyDBws/Oxc7Uz9cgzsEg9PA=?=', '=?koi8-r?B?78zYx8Eg7MHX0s/XwQ==?= <o.lavrova@aknet.kg>', 'tima@aknet.kg', '2012-10-09 07:17:13', '<002301cda5ee$1ae754a0$50b5fde0$@lavrova@aknet.kg>', 3968, 5985, 504, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 05:20:00', '<201210090520.q995K0bM055351@billing.aknet.kg>', 874, 5986, 505, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 05:40:00', '<201210090540.q995e02B057577@billing.aknet.kg>', 874, 5987, 506, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 06:00:00', '<201210090600.q99600lf059728@billing.aknet.kg>', 874, 5988, 507, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 06:10:02', '<201210090610.q996A27n060741@billing.aknet.kg>', 1000, 5989, 508, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 06:20:00', '<201210090620.q996K0QW061788@billing.aknet.kg>', 874, 5990, 509, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 06:40:00', '<201210090640.q996e0Wg063752@billing.aknet.kg>', 874, 5991, 510, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 07:00:00', '<201210090700.q99700ZZ065787@billing.aknet.kg>', 874, 5992, 511, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 07:20:00', '<201210090720.q997K0nO067880@billing.aknet.kg>', 874, 5993, 512, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 07:40:00', '<201210090740.q997e0uf069922@billing.aknet.kg>', 874, 5994, 513, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 08:00:02', '<201210090800.q998023L071961@billing.aknet.kg>', 874, 5995, 514, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 08:20:00', '<201210090820.q998K0CB074012@billing.aknet.kg>', 874, 5996, 515, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 08:40:00', '<201210090840.q998e070076066@billing.aknet.kg>', 874, 5997, 516, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 09:00:00', '<201210090900.q99900SF078186@billing.aknet.kg>', 874, 5998, 517, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 09:20:00', '<201210090920.q999K0o3080260@billing.aknet.kg>', 874, 5999, 518, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 09:40:01', '<201210090940.q999e1K7082286@billing.aknet.kg>', 874, 6000, 519, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 10:00:00', '<201210091000.q99A00jM084389@billing.aknet.kg>', 874, 6001, 520, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 10:20:00', '<201210091020.q99AK0aP086483@billing.aknet.kg>', 874, 6002, 521, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 10:40:00', '<201210091040.q99Ae007088584@billing.aknet.kg>', 874, 6003, 522, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 11:00:00', '<201210091100.q99B00r4090676@billing.aknet.kg>', 874, 6004, 523, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 11:10:01', '<201210091110.q99BA1iM091720@billing.aknet.kg>', 1001, 6005, 524, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 11:20:00', '<201210091120.q99BK0P0092691@billing.aknet.kg>', 874, 6006, 525, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 11:40:00', '<201210091140.q99Be0Zk094673@billing.aknet.kg>', 874, 6007, 526, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 12:00:00', '<201210091200.q99C00qR096568@billing.aknet.kg>', 874, 6008, 527, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 12:20:00', '<201210091220.q99CK0Rn098408@billing.aknet.kg>', 874, 6009, 528, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 12:40:00', '<201210091240.q99Ce03W000472@billing.aknet.kg>', 874, 6010, 529, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 13:00:00', '<201210091300.q99D00fZ002357@billing.aknet.kg>', 874, 6011, 530, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 13:20:00', '<201210091320.q99DK0Cg004227@billing.aknet.kg>', 874, 6012, 531, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 13:40:01', '<201210091340.q99De1Ew005823@billing.aknet.kg>', 874, 6013, 532, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 14:00:00', '<201210091400.q99E00cU007439@billing.aknet.kg>', 874, 6014, 533, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 14:20:00', '<201210091420.q99EK0cU008976@billing.aknet.kg>', 874, 6015, 534, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 14:40:00', '<201210091440.q99Ee0cA010610@billing.aknet.kg>', 874, 6016, 535, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 15:00:00', '<201210091500.q99F00nt011914@billing.aknet.kg>', 874, 6017, 536, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 15:20:00', '<201210091520.q99FK0tU013169@billing.aknet.kg>', 874, 6018, 537, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 15:40:00', '<201210091540.q99Fe0Ar014527@billing.aknet.kg>', 874, 6019, 538, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 16:00:01', '<201210091600.q99G014V016340@billing.aknet.kg>', 874, 6020, 539, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 16:20:00', '<201210091620.q99GK06g017978@billing.aknet.kg>', 874, 6021, 540, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 16:40:01', '<201210091640.q99Ge1v6019631@billing.aknet.kg>', 874, 6022, 541, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 17:00:01', '<201210091700.q99H01kZ021372@billing.aknet.kg>', 874, 6023, 542, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 17:20:00', '<201210091720.q99HK0qU023124@billing.aknet.kg>', 874, 6024, 543, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 17:40:00', '<201210091740.q99He0FN024944@billing.aknet.kg>', 874, 6025, 544, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 18:00:00', '<201210091800.q99I00Zi026669@billing.aknet.kg>', 877, 6026, 545, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 18:20:00', '<201210091820.q99IK0HE029900@billing.aknet.kg>', 877, 6027, 546, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 18:40:00', '<201210091840.q99Ie0se033144@billing.aknet.kg>', 877, 6028, 547, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, contact suppliers for the latest prices', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-10-09 17:36:50', '<755178669.1577111349804210597.JavaMail.admin@crm-eve-web02.hst.dsl.crm.alidc.net>', 69610, 6029, 548, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 19:00:00', '<201210091900.q99J00wd036087@billing.aknet.kg>', 877, 6030, 549, 0, 0, 0, 0, 1, 0);
INSERT INTO `email_cache` (`ie_id`, `mbox`, `subject`, `fromaddr`, `toaddr`, `senddate`, `message_id`, `mailsize`, `imap_uid`, `msgno`, `recent`, `flagged`, `answered`, `deleted`, `seen`, `draft`) VALUES
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 19:20:00', '<201210091920.q99JK06f038650@billing.aknet.kg>', 877, 6031, 550, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 19:40:00', '<201210091940.q99Je0KN041282@billing.aknet.kg>', 877, 6032, 551, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 20:00:01', '<201210092000.q99K01Z0043923@billing.aknet.kg>', 877, 6033, 552, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 20:20:00', '<201210092020.q99KK0HT046663@billing.aknet.kg>', 877, 6034, 553, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 20:40:00', '<201210092040.q99Ke0ec049578@billing.aknet.kg>', 877, 6035, 554, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 21:00:00', '<201210092100.q99L009D052680@billing.aknet.kg>', 877, 6036, 555, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 21:20:00', '<201210092120.q99LK0Zw056038@billing.aknet.kg>', 877, 6037, 556, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 21:40:00', '<201210092140.q99Le0eU059041@billing.aknet.kg>', 877, 6038, 557, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 22:00:00', '<201210092200.q99M0020062197@billing.aknet.kg>', 877, 6039, 558, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 22:20:00', '<201210092220.q99MK0Vr065250@billing.aknet.kg>', 877, 6040, 559, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 22:40:00', '<201210092240.q99Me0qS068560@billing.aknet.kg>', 877, 6041, 560, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 23:00:00', '<201210092300.q99N00l2071900@billing.aknet.kg>', 877, 6042, 561, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 23:20:00', '<201210092320.q99NK0Gd075313@billing.aknet.kg>', 877, 6043, 562, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-09 23:40:00', '<201210092340.q99Ne0iA078554@billing.aknet.kg>', 877, 6044, 563, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 00:00:00', '<201210100000.q9A000wI081940@billing.aknet.kg>', 877, 6045, 564, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 00:20:00', '<201210100020.q9A0K0j6085247@billing.aknet.kg>', 877, 6046, 565, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 00:40:00', '<201210100040.q9A0e0i8088124@billing.aknet.kg>', 877, 6047, 566, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 01:00:00', '<201210100100.q9A100L3091141@billing.aknet.kg>', 877, 6048, 567, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 01:20:00', '<201210100120.q9A1K03X094082@billing.aknet.kg>', 877, 6049, 568, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 01:40:00', '<201210100140.q9A1e0Ap096880@billing.aknet.kg>', 877, 6050, 569, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 02:00:00', '<201210100200.q9A200Tq099494@billing.aknet.kg>', 877, 6051, 570, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 02:20:00', '<201210100220.q9A2K08E002162@billing.aknet.kg>', 877, 6052, 571, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 02:40:00', '<201210100240.q9A2e0i3004569@billing.aknet.kg>', 877, 6053, 572, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 03:00:00', '<201210100300.q9A300Yo006734@billing.aknet.kg>', 877, 6054, 573, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 03:20:00', '<201210100320.q9A3K0Rd008617@billing.aknet.kg>', 877, 6055, 574, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 03:40:00', '<201210100340.q9A3e0L8010468@billing.aknet.kg>', 877, 6056, 575, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 04:00:00', '<201210100400.q9A400Ro012799@billing.aknet.kg>', 877, 6057, 576, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 04:20:00', '<201210100420.q9A4K0Bg014988@billing.aknet.kg>', 877, 6058, 577, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 04:40:00', '<201210100440.q9A4e0xr017152@billing.aknet.kg>', 877, 6059, 578, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 05:00:00', '<201210100500.q9A500uZ019453@billing.aknet.kg>', 877, 6060, 579, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 05:20:01', '<201210100520.q9A5K161021607@billing.aknet.kg>', 877, 6061, 580, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 05:40:00', '<201210100540.q9A5e0tE023555@billing.aknet.kg>', 877, 6062, 581, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 06:00:00', '<201210100600.q9A600eS025412@billing.aknet.kg>', 877, 6063, 582, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 06:10:01', '<201210100610.q9A6A1j4026336@billing.aknet.kg>', 932, 6064, 583, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 06:20:01', '<201210100620.q9A6K1d6027209@billing.aknet.kg>', 877, 6065, 584, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 06:40:00', '<201210100640.q9A6e0kL028974@billing.aknet.kg>', 877, 6066, 585, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 07:00:00', '<201210100700.q9A70019030963@billing.aknet.kg>', 877, 6067, 586, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 07:20:00', '<201210100720.q9A7K0aa032847@billing.aknet.kg>', 877, 6068, 587, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 07:40:01', '<201210100740.q9A7e1LS034729@billing.aknet.kg>', 877, 6069, 588, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 08:00:01', '<201210100800.q9A8018p036542@billing.aknet.kg>', 877, 6070, 589, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?Rlc6IOPFzs/Xz8Ug0NLFxMzP1sXOycU=?=', '=?koi8-r?B?/MzY18nSwSDrz9rVwsXLz9fB?= <elvira@aknet.kg>', 'tima@aknet.kg', '2012-10-10 10:18:17', '<002701cda6d0$90b805c0$b2281140$@aknet.kg>', 5963, 6071, 590, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 08:20:00', '<201210100820.q9A8K0CL038599@billing.aknet.kg>', 877, 6072, 591, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?koi8-r?B?9MXMxcbPziDQ0s/H0sHNzcnT1ME=?=', '=?koi8-r?B?/MzY18nSwSDrz9rVwsXLz9fB?= <elvira@aknet.kg>', 'tima@aknet.kg', '2012-10-10 10:20:59', '<003401cda6d0$f1236710$d36a3530$@aknet.kg>', 8991, 6073, 592, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 08:40:00', '<201210100840.q9A8e0vr040532@billing.aknet.kg>', 877, 6074, 593, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 09:00:00', '<201210100900.q9A900hT042316@billing.aknet.kg>', 877, 6075, 594, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 09:20:00', '<201210100920.q9A9K0e3044086@billing.aknet.kg>', 877, 6076, 595, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 09:40:01', '<201210100940.q9A9e186045993@billing.aknet.kg>', 877, 6077, 596, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 10:00:00', '<201210101000.q9AA00HI047964@billing.aknet.kg>', 877, 6078, 597, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 10:20:00', '<201210101020.q9AAK0fY049794@billing.aknet.kg>', 877, 6079, 598, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 10:40:00', '<201210101040.q9AAe0EP051869@billing.aknet.kg>', 877, 6080, 599, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 11:00:00', '<201210101100.q9AB00SR053855@billing.aknet.kg>', 877, 6081, 600, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 11:10:01', '<201210101110.q9ABA1p6054788@billing.aknet.kg>', 1072, 6082, 601, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 11:20:00', '<201210101120.q9ABK0JZ055841@billing.aknet.kg>', 877, 6083, 602, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 11:40:00', '<201210101140.q9ABe0MQ059340@billing.aknet.kg>', 877, 6084, 603, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 12:00:00', '<201210101200.q9AC00iU064307@billing.aknet.kg>', 877, 6085, 604, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 12:20:00', '<201210101220.q9ACK0pE069070@billing.aknet.kg>', 877, 6086, 605, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 12:40:00', '<201210101240.q9ACe0sF073754@billing.aknet.kg>', 877, 6087, 606, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 13:00:00', '<201210101300.q9AD00i9078494@billing.aknet.kg>', 877, 6088, 607, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 13:20:00', '<201210101320.q9ADK0ao083286@billing.aknet.kg>', 877, 6089, 608, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 13:40:00', '<201210101340.q9ADe0pk088016@billing.aknet.kg>', 877, 6090, 609, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, Thermal blank Barcode label printe, UHF RFID reader trade opportunities [10 Oct 2012]', 'Alibaba Trade Alert <tradealert@service.alibaba.com>', '"tima@aknet.kg" <tima@aknet.kg>', '2012-10-10 13:46:53', '<1998835045.1349876813045.JavaMail.admin@vipsmtp.alibaba.com>', 93795, 6091, 610, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 14:00:00', '<201210101400.q9AE00Ej092718@billing.aknet.kg>', 877, 6092, 611, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 14:20:00', '<201210101420.q9AEK0J2097332@billing.aknet.kg>', 877, 6093, 612, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 14:40:00', '<201210101440.q9AEe0Ow002047@billing.aknet.kg>', 877, 6094, 613, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 15:00:00', '<201210101500.q9AF00jw006594@billing.aknet.kg>', 877, 6095, 614, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 15:20:00', '<201210101520.q9AFK0OE011085@billing.aknet.kg>', 877, 6096, 615, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 15:40:00', '<201210101540.q9AFe0bG015595@billing.aknet.kg>', 877, 6097, 616, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 16:00:01', '<201210101600.q9AG01Bp020239@billing.aknet.kg>', 877, 6098, 617, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 16:20:00', '<201210101620.q9AGK0bd024966@billing.aknet.kg>', 877, 6099, 618, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 16:40:00', '<201210101640.q9AGe0hk029595@billing.aknet.kg>', 877, 6100, 619, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 17:00:00', '<201210101700.q9AH00pX034343@billing.aknet.kg>', 877, 6101, 620, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 17:20:00', '<201210101720.q9AHK05W039134@billing.aknet.kg>', 877, 6102, 621, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 17:40:00', '<201210101740.q9AHe0iC043762@billing.aknet.kg>', 877, 6103, 622, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 18:00:01', '<201210101800.q9AI01mN048462@billing.aknet.kg>', 877, 6104, 623, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 18:20:00', '<201210101820.q9AIK0Xu054523@billing.aknet.kg>', 877, 6105, 624, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 18:40:00', '<201210101840.q9AIe0QH060593@billing.aknet.kg>', 877, 6106, 625, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 19:00:00', '<201210101900.q9AJ00EO066407@billing.aknet.kg>', 877, 6107, 626, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 19:20:00', '<201210101920.q9AJK0e3072244@billing.aknet.kg>', 877, 6108, 627, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 19:40:00', '<201210101940.q9AJe0cl077807@billing.aknet.kg>', 877, 6109, 628, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 20:00:00', '<201210102000.q9AK005l083540@billing.aknet.kg>', 877, 6110, 629, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 20:20:00', '<201210102020.q9AKK0qq089336@billing.aknet.kg>', 877, 6111, 630, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 20:40:00', '<201210102040.q9AKe0mD095165@billing.aknet.kg>', 877, 6112, 631, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 21:00:00', '<201210102100.q9AL00Z1001322@billing.aknet.kg>', 877, 6113, 632, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 21:20:00', '<201210102120.q9ALK0rU007502@billing.aknet.kg>', 877, 6114, 633, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 21:40:00', '<201210102140.q9ALe0TM013563@billing.aknet.kg>', 877, 6115, 634, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 22:00:00', '<201210102200.q9AM00Kd019742@billing.aknet.kg>', 877, 6116, 635, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 22:20:00', '<201210102220.q9AMK09D025876@billing.aknet.kg>', 877, 6117, 636, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 22:40:00', '<201210102240.q9AMe07Z032258@billing.aknet.kg>', 877, 6118, 637, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 23:00:00', '<201210102300.q9AN00UI038613@billing.aknet.kg>', 877, 6119, 638, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 23:20:01', '<201210102320.q9ANK1UB044885@billing.aknet.kg>', 877, 6120, 639, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-10 23:40:00', '<201210102340.q9ANe0kS051226@billing.aknet.kg>', 877, 6121, 640, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 00:00:00', '<201210110000.q9B000GY057612@billing.aknet.kg>', 877, 6122, 641, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 00:20:00', '<201210110020.q9B0K018063767@billing.aknet.kg>', 877, 6123, 642, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 00:40:00', '<201210110040.q9B0e0kc069932@billing.aknet.kg>', 877, 6124, 643, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 01:00:00', '<201210110100.q9B100kc076193@billing.aknet.kg>', 877, 6125, 644, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 01:20:00', '<201210110120.q9B1K0Qi082031@billing.aknet.kg>', 877, 6126, 645, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 01:40:00', '<201210110140.q9B1e0CT087893@billing.aknet.kg>', 877, 6127, 646, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 02:00:00', '<201210110200.q9B200x6093554@billing.aknet.kg>', 877, 6128, 647, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 02:20:00', '<201210110220.q9B2K0gL099100@billing.aknet.kg>', 877, 6129, 648, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 02:40:00', '<201210110240.q9B2e0od004602@billing.aknet.kg>', 877, 6130, 649, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 03:00:02', '<201210110300.q9B302Nl009838@billing.aknet.kg>', 877, 6131, 650, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 03:20:00', '<201210110320.q9B3K0IJ015170@billing.aknet.kg>', 877, 6132, 651, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 03:40:00', '<201210110340.q9B3e0If020226@billing.aknet.kg>', 877, 6133, 652, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 04:00:00', '<201210110400.q9B4001X025313@billing.aknet.kg>', 877, 6134, 653, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?UkU6INCe0YLRh9C10YI=?=', '=?UTF-8?B?0J7Qu9GM0LPQsCDQm9Cw0LLRgNC+0LLQsA==?= <o.lavrova@aknet.kg>', '''Umurzakov Temir'' <tima@aknet.kg>', '2012-10-11 06:16:18', '<000e01cda777$ed189350$c749b9f0$@lavrova@aknet.kg>', 1546, 6135, 654, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 04:20:01', '<201210110420.q9B4K15T030579@billing.aknet.kg>', 877, 6136, 655, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 04:40:00', '<201210110440.q9B4e0Pk035976@billing.aknet.kg>', 877, 6137, 656, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'GSM VoIP Wireless Terminal with 8 channels, 8 SIMs, 1WAN, 1LAN VJ-8GV', 'VJtech <sales@szvjtech.com>', 'Elva Ge <sales01@szvjtech.com>', '2012-10-11 04:51:37', '<0F3F3F77432C4CEF8507123EE751C7F5@200911272018>', 54052, 6138, 657, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 05:00:00', '<201210110500.q9B500fP041101@billing.aknet.kg>', 877, 6139, 658, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 05:20:00', '<201210110520.q9B5K0nE046172@billing.aknet.kg>', 877, 6140, 659, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 05:40:00', '<201210110540.q9B5e0LY051115@billing.aknet.kg>', 877, 6141, 660, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 06:00:00', '<201210110600.q9B6004O056216@billing.aknet.kg>', 877, 6142, 661, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'GSM VoIP Wireless Terminal with 8 channels, 8 SIMs, 1WAN, 1LAN VJ-8GV', 'VJtech <szvjtech@gmail.com>', 'Elva Ge <sales01@szvjtech.com>', '2012-10-11 06:02:24', '<D54DE269D4CE4FE3AE69A7F32BD2EE84@200911272018>', 53925, 6143, 662, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 06:20:00', '<201210110620.q9B6K05Q061106@billing.aknet.kg>', 877, 6144, 663, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 06:40:00', '<201210110640.q9B6e0WJ065962@billing.aknet.kg>', 877, 6145, 664, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 07:00:00', '<201210110700.q9B700G8070731@billing.aknet.kg>', 877, 6146, 665, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 07:20:01', '<201210110720.q9B7K17Y075632@billing.aknet.kg>', 877, 6147, 666, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 07:40:01', '<201210110740.q9B7e19E080786@billing.aknet.kg>', 877, 6148, 667, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 08:00:00', '<201210110800.q9B800un085628@billing.aknet.kg>', 877, 6149, 668, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-11 11:10:18', '<201210111110.q9BBAIhB034019@billing.aknet.kg>', 931, 6150, 669, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-12 11:10:01', '<201210121110.q9CBA1bM017464@billing.aknet.kg>', 930, 6151, 670, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-12 12:20:01', '<201210121220.q9CCK1bG034601@billing.aknet.kg>', 877, 6152, 671, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-12 12:40:00', '<201210121240.q9CCe05n039529@billing.aknet.kg>', 877, 6153, 672, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-12 13:00:00', '<201210121300.q9CD00T3044315@billing.aknet.kg>', 877, 6154, 673, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-12 13:20:00', '<201210121320.q9CDK0aE049082@billing.aknet.kg>', 877, 6155, 674, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-12 13:40:00', '<201210121340.q9CDe0Jv053841@billing.aknet.kg>', 877, 6156, 675, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-12 14:00:00', '<201210121400.q9CE00F6058539@billing.aknet.kg>', 877, 6157, 676, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-12 14:20:01', '<201210121420.q9CEK18X063179@billing.aknet.kg>', 877, 6158, 677, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-12 14:40:00', '<201210121440.q9CEe0Ui067717@billing.aknet.kg>', 877, 6159, 678, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-12 15:00:00', '<201210121500.q9CF00Ea072365@billing.aknet.kg>', 877, 6160, 679, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 03:20:00', '<201210130320.q9D3K0wG080465@billing.aknet.kg>', 877, 6161, 680, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 03:40:00', '<201210130340.q9D3e0iE085620@billing.aknet.kg>', 877, 6162, 681, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 04:00:00', '<201210130400.q9D4001q090777@billing.aknet.kg>', 877, 6163, 682, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 04:20:00', '<201210130420.q9D4K0aJ095624@billing.aknet.kg>', 877, 6164, 683, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 04:40:00', '<201210130440.q9D4e0u8000753@billing.aknet.kg>', 877, 6165, 684, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 05:00:00', '<201210130500.q9D500Iq005953@billing.aknet.kg>', 877, 6166, 685, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 05:20:00', '<201210130520.q9D5K0KJ011015@billing.aknet.kg>', 877, 6167, 686, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 05:40:00', '<201210130540.q9D5e0mu016024@billing.aknet.kg>', 877, 6168, 687, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 06:00:00', '<201210130600.q9D600o5020996@billing.aknet.kg>', 877, 6169, 688, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 06:10:29', '<201210130610.q9D6ATET023662@billing.aknet.kg>', 930, 6170, 689, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, is this what you were searching for?', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-10-13 04:31:48', '<16476935.2023831350102708110.JavaMail.admin@crm-eve-web03.hst.dsl.crm.alidc.net>', 68985, 6171, 690, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 06:20:00', '<201210130620.q9D6K0oU025934@billing.aknet.kg>', 877, 6172, 691, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 06:40:00', '<201210130640.q9D6e0q0030858@billing.aknet.kg>', 877, 6173, 692, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 07:00:00', '<201210130700.q9D700k8035695@billing.aknet.kg>', 877, 6174, 693, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'interview', 'Ildar Mursalimov <ildar@aknet.kg>', 'tima@aknet.kg', '2012-10-13 07:10:54', '<fc4c5458fd4aad45086bde7800d454f4@aknet.kg>', 3480, 6175, 694, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 07:20:00', '<201210130720.q9D7K0X6040550@billing.aknet.kg>', 877, 6176, 695, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 07:40:00', '<201210130740.q9D7e0So045301@billing.aknet.kg>', 877, 6177, 696, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 08:00:00', '<201210130800.q9D800lT050334@billing.aknet.kg>', 877, 6178, 697, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 08:20:00', '<201210130820.q9D8K0lR055206@billing.aknet.kg>', 877, 6179, 698, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 08:40:01', '<201210130840.q9D8e1Sd060218@billing.aknet.kg>', 877, 6180, 699, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 09:00:00', '<201210130900.q9D900gl065217@billing.aknet.kg>', 877, 6181, 700, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 09:20:00', '<201210130920.q9D9K0ww070175@billing.aknet.kg>', 877, 6182, 701, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 09:40:00', '<201210130940.q9D9e0Dl075024@billing.aknet.kg>', 877, 6183, 702, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 10:00:00', '<201210131000.q9DA00Aq079973@billing.aknet.kg>', 877, 6184, 703, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 10:20:00', '<201210131020.q9DAK0A0084919@billing.aknet.kg>', 877, 6185, 704, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 10:40:00', '<201210131040.q9DAe0Qg089869@billing.aknet.kg>', 877, 6186, 705, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 11:00:00', '<201210131100.q9DB000O094817@billing.aknet.kg>', 877, 6187, 706, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 11:10:35', '<201210131110.q9DBAZA6097434@billing.aknet.kg>', 930, 6188, 707, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 11:20:00', '<201210131120.q9DBK0pb099717@billing.aknet.kg>', 877, 6189, 708, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 11:40:00', '<201210131140.q9DBe0R5004819@billing.aknet.kg>', 877, 6190, 709, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 12:00:00', '<201210131200.q9DC00xX009743@billing.aknet.kg>', 877, 6191, 710, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Top ranking and fastest-moving products this past week', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-10-13 09:10:11', '<443023804.3140231350119411685.JavaMail.admin@crm-eve-web05.hst.dsl.crm.alidc.net>', 187270, 6192, 711, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 12:20:00', '<201210131220.q9DCK0VJ014477@billing.aknet.kg>', 877, 6193, 712, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 12:40:00', '<201210131240.q9DCe0mw019294@billing.aknet.kg>', 877, 6194, 713, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 13:00:00', '<201210131300.q9DD00cu024224@billing.aknet.kg>', 877, 6195, 714, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 13:20:01', '<201210131320.q9DDK1dx029085@billing.aknet.kg>', 877, 6196, 715, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 13:40:00', '<201210131340.q9DDe0Uf033783@billing.aknet.kg>', 877, 6197, 716, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 14:00:00', '<201210131400.q9DE00sW038585@billing.aknet.kg>', 877, 6198, 717, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 14:20:00', '<201210131420.q9DEK0m6043144@billing.aknet.kg>', 877, 6199, 718, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 14:40:00', '<201210131440.q9DEe0cf047695@billing.aknet.kg>', 877, 6200, 719, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 15:00:00', '<201210131500.q9DF004T052367@billing.aknet.kg>', 877, 6201, 720, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 15:20:00', '<201210131520.q9DFK07v057001@billing.aknet.kg>', 877, 6202, 721, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 15:40:00', '<201210131540.q9DFe0Bk061791@billing.aknet.kg>', 877, 6203, 722, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 16:00:00', '<201210131600.q9DG00iB066589@billing.aknet.kg>', 877, 6204, 723, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 16:20:00', '<201210131620.q9DGK030071346@billing.aknet.kg>', 877, 6205, 724, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 16:40:00', '<201210131640.q9DGe0tL076071@billing.aknet.kg>', 877, 6206, 725, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 17:00:00', '<201210131700.q9DH00Yj080722@billing.aknet.kg>', 877, 6207, 726, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 17:20:00', '<201210131720.q9DHK0ZP085388@billing.aknet.kg>', 877, 6208, 727, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 17:40:00', '<201210131740.q9DHe0PG090290@billing.aknet.kg>', 877, 6209, 728, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 18:00:00', '<201210131800.q9DI00ss095007@billing.aknet.kg>', 877, 6210, 729, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 18:20:00', '<201210131820.q9DIK0do001232@billing.aknet.kg>', 877, 6211, 730, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 18:40:00', '<201210131840.q9DIe0M1007220@billing.aknet.kg>', 877, 6212, 731, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 19:00:00', '<201210131900.q9DJ0045012855@billing.aknet.kg>', 877, 6213, 732, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 19:20:00', '<201210131920.q9DJK0E1018248@billing.aknet.kg>', 877, 6214, 733, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 19:40:00', '<201210131940.q9DJe0NM023756@billing.aknet.kg>', 877, 6215, 734, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 20:00:00', '<201210132000.q9DK00Pp029271@billing.aknet.kg>', 877, 6216, 735, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Temir, browse products you might be interested in', '"Alibaba.com" <alibaba@email.alibaba.com>', 'tima@aknet.kg', '2012-10-13 18:16:17', '<115582264.3966141350152177713.JavaMail.admin@crm-eve-itu02.hst.dsl.crm.alidc.net>', 68126, 6217, 736, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 20:20:00', '<201210132020.q9DKK0r3034879@billing.aknet.kg>', 877, 6218, 737, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 20:40:00', '<201210132040.q9DKe0fG040576@billing.aknet.kg>', 877, 6219, 738, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 21:00:00', '<201210132100.q9DL00TV046389@billing.aknet.kg>', 877, 6220, 739, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 21:20:00', '<201210132120.q9DLK0sJ052484@billing.aknet.kg>', 877, 6221, 740, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 21:40:01', '<201210132140.q9DLe1sA058419@billing.aknet.kg>', 877, 6222, 741, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 22:00:00', '<201210132200.q9DM00P2064383@billing.aknet.kg>', 877, 6223, 742, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 22:20:00', '<201210132220.q9DMK0DL070208@billing.aknet.kg>', 877, 6224, 743, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 22:40:00', '<201210132240.q9DMe09p076291@billing.aknet.kg>', 877, 6225, 744, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 23:00:00', '<201210132300.q9DN008R082384@billing.aknet.kg>', 877, 6226, 745, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 23:20:00', '<201210132320.q9DNK0Yg088553@billing.aknet.kg>', 877, 6227, 746, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-13 23:40:00', '<201210132340.q9DNe0hV094737@billing.aknet.kg>', 877, 6228, 747, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 00:00:00', '<201210140000.q9E0001r001094@billing.aknet.kg>', 877, 6229, 748, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 00:20:00', '<201210140020.q9E0K0ph007477@billing.aknet.kg>', 877, 6230, 749, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 00:40:00', '<201210140040.q9E0e0vs013780@billing.aknet.kg>', 877, 6231, 750, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 01:00:00', '<201210140100.q9E100tP020026@billing.aknet.kg>', 877, 6232, 751, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 01:20:00', '<201210140120.q9E1K0dH026072@billing.aknet.kg>', 877, 6233, 752, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 01:40:00', '<201210140140.q9E1e058032047@billing.aknet.kg>', 877, 6234, 753, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 02:00:00', '<201210140200.q9E200HS037943@billing.aknet.kg>', 877, 6235, 754, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 02:20:00', '<201210140220.q9E2K0Hn043644@billing.aknet.kg>', 877, 6236, 755, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 02:40:00', '<201210140240.q9E2e0Kr049173@billing.aknet.kg>', 877, 6237, 756, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 03:00:00', '<201210140300.q9E300x1054739@billing.aknet.kg>', 877, 6238, 757, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 03:20:00', '<201210140320.q9E3K0I0060032@billing.aknet.kg>', 877, 6239, 758, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 03:40:00', '<201210140340.q9E3e08k065242@billing.aknet.kg>', 877, 6240, 759, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 04:00:00', '<201210140400.q9E4002o070438@billing.aknet.kg>', 877, 6241, 760, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 04:20:00', '<201210140420.q9E4K0e7075511@billing.aknet.kg>', 877, 6242, 761, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 04:40:00', '<201210140440.q9E4e0Yj080493@billing.aknet.kg>', 877, 6243, 762, 0, 0, 0, 0, 1, 0);
INSERT INTO `email_cache` (`ie_id`, `mbox`, `subject`, `fromaddr`, `toaddr`, `senddate`, `message_id`, `mailsize`, `imap_uid`, `msgno`, `recent`, `flagged`, `answered`, `deleted`, `seen`, `draft`) VALUES
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 05:00:00', '<201210140500.q9E50041085380@billing.aknet.kg>', 877, 6244, 763, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 05:20:01', '<201210140520.q9E5K1Xc090450@billing.aknet.kg>', 877, 6245, 764, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 05:40:00', '<201210140540.q9E5e035095484@billing.aknet.kg>', 877, 6246, 765, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 06:00:00', '<201210140600.q9E6001J000680@billing.aknet.kg>', 877, 6247, 766, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 06:10:10', '<201210140610.q9E6AART003317@billing.aknet.kg>', 931, 6248, 767, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 06:20:00', '<201210140620.q9E6K0HV005681@billing.aknet.kg>', 877, 6249, 768, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 06:40:00', '<201210140640.q9E6e0sj010653@billing.aknet.kg>', 877, 6250, 769, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 07:00:00', '<201210140700.q9E700XA015645@billing.aknet.kg>', 877, 6251, 770, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 07:20:00', '<201210140720.q9E7K0pC020644@billing.aknet.kg>', 877, 6252, 771, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 07:40:00', '<201210140740.q9E7e0OA025475@billing.aknet.kg>', 877, 6253, 772, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 08:00:00', '<201210140800.q9E800F2030406@billing.aknet.kg>', 877, 6254, 773, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 08:20:00', '<201210140820.q9E8K0Ow035326@billing.aknet.kg>', 877, 6255, 774, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 08:40:01', '<201210140840.q9E8e1D1040192@billing.aknet.kg>', 877, 6256, 775, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 09:00:00', '<201210140900.q9E900c4045151@billing.aknet.kg>', 877, 6257, 776, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 09:20:00', '<201210140920.q9E9K0uT050091@billing.aknet.kg>', 877, 6258, 777, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 09:40:00', '<201210140940.q9E9e0xs055109@billing.aknet.kg>', 877, 6259, 778, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 10:00:00', '<201210141000.q9EA00c5059977@billing.aknet.kg>', 877, 6260, 779, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 10:20:00', '<201210141020.q9EAK0AY064746@billing.aknet.kg>', 877, 6261, 780, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 10:40:00', '<201210141040.q9EAe0uQ069667@billing.aknet.kg>', 877, 6262, 781, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 11:00:00', '<201210141100.q9EB0001074565@billing.aknet.kg>', 877, 6263, 782, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 11:10:32', '<201210141110.q9EBAWEr077333@billing.aknet.kg>', 931, 6264, 783, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 11:20:00', '<201210141120.q9EBK0PU079499@billing.aknet.kg>', 877, 6265, 784, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 11:40:00', '<201210141140.q9EBe0dA084275@billing.aknet.kg>', 877, 6266, 785, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 12:00:00', '<201210141200.q9EC00f0089011@billing.aknet.kg>', 877, 6267, 786, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 12:20:00', '<201210141220.q9ECK0qx093723@billing.aknet.kg>', 877, 6268, 787, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 12:40:00', '<201210141240.q9ECe0ew098127@billing.aknet.kg>', 877, 6269, 788, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 13:00:00', '<201210141300.q9ED002x002852@billing.aknet.kg>', 877, 6270, 789, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 13:20:00', '<201210141320.q9EDK0TL006990@billing.aknet.kg>', 877, 6271, 790, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 13:40:00', '<201210141340.q9EDe0a1011238@billing.aknet.kg>', 877, 6272, 791, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 14:00:00', '<201210141400.q9EE008o015894@billing.aknet.kg>', 877, 6273, 792, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 14:20:00', '<201210141420.q9EEK08p020485@billing.aknet.kg>', 877, 6274, 793, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 14:40:00', '<201210141440.q9EEe00J025052@billing.aknet.kg>', 877, 6275, 794, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 15:00:00', '<201210141500.q9EF005f029497@billing.aknet.kg>', 877, 6276, 795, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 15:20:00', '<201210141520.q9EFK0nd033942@billing.aknet.kg>', 877, 6277, 796, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 15:40:00', '<201210141540.q9EFe0LB038378@billing.aknet.kg>', 877, 6278, 797, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 16:00:00', '<201210141600.q9EG00Bx042614@billing.aknet.kg>', 877, 6279, 798, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 16:20:01', '<201210141620.q9EGK1HD047222@billing.aknet.kg>', 877, 6280, 799, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 16:40:01', '<201210141640.q9EGe1VX051818@billing.aknet.kg>', 877, 6281, 800, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 17:00:00', '<201210141700.q9EH00cx056420@billing.aknet.kg>', 877, 6282, 801, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 17:20:00', '<201210141720.q9EHK0Yb061068@billing.aknet.kg>', 877, 6283, 802, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 17:40:00', '<201210141740.q9EHe0C4065772@billing.aknet.kg>', 877, 6284, 803, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 18:00:00', '<201210141800.q9EI00Dm070441@billing.aknet.kg>', 877, 6285, 804, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 18:20:00', '<201210141820.q9EIK0pu076597@billing.aknet.kg>', 877, 6286, 805, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 18:40:00', '<201210141840.q9EIe074082538@billing.aknet.kg>', 877, 6287, 806, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 19:00:00', '<201210141900.q9EJ00Ac088285@billing.aknet.kg>', 877, 6288, 807, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 19:20:00', '<201210141920.q9EJK0tg093976@billing.aknet.kg>', 877, 6289, 808, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 19:40:00', '<201210141940.q9EJe0Q9099557@billing.aknet.kg>', 877, 6290, 809, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 20:00:00', '<201210142000.q9EK00bU005309@billing.aknet.kg>', 877, 6291, 810, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 20:20:00', '<201210142020.q9EKK0En011158@billing.aknet.kg>', 877, 6292, 811, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 20:40:00', '<201210142040.q9EKe0YS017250@billing.aknet.kg>', 877, 6293, 812, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 21:00:00', '<201210142100.q9EL00p6023325@billing.aknet.kg>', 877, 6294, 813, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 21:20:00', '<201210142120.q9ELK05C029707@billing.aknet.kg>', 877, 6295, 814, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 21:40:00', '<201210142140.q9ELe0cx035737@billing.aknet.kg>', 877, 6296, 815, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 22:00:00', '<201210142200.q9EM00vP041928@billing.aknet.kg>', 877, 6297, 816, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 22:20:00', '<201210142220.q9EMK0GQ048038@billing.aknet.kg>', 877, 6298, 817, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 22:40:00', '<201210142240.q9EMe0rX054159@billing.aknet.kg>', 877, 6299, 818, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 23:00:00', '<201210142300.q9EN00oM060453@billing.aknet.kg>', 877, 6300, 819, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 23:20:01', '<201210142320.q9ENK1PT066722@billing.aknet.kg>', 877, 6301, 820, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-14 23:40:00', '<201210142340.q9ENe0c4073019@billing.aknet.kg>', 877, 6302, 821, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 00:00:00', '<201210150000.q9F000dN079411@billing.aknet.kg>', 877, 6303, 822, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 00:20:00', '<201210150020.q9F0K0ro085650@billing.aknet.kg>', 877, 6304, 823, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 00:40:00', '<201210150040.q9F0e0CN091768@billing.aknet.kg>', 877, 6305, 824, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 01:00:00', '<201210150100.q9F100ow097754@billing.aknet.kg>', 877, 6306, 825, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 01:20:00', '<201210150120.q9F1K0Ye003851@billing.aknet.kg>', 877, 6307, 826, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 01:40:00', '<201210150140.q9F1e0Fc009847@billing.aknet.kg>', 877, 6308, 827, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 02:00:00', '<201210150200.q9F20026015584@billing.aknet.kg>', 877, 6309, 828, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 02:20:00', '<201210150220.q9F2K09u021138@billing.aknet.kg>', 877, 6310, 829, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 02:40:00', '<201210150240.q9F2e04W026625@billing.aknet.kg>', 877, 6311, 830, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 03:00:00', '<201210150300.q9F300em031780@billing.aknet.kg>', 877, 6312, 831, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 03:20:00', '<201210150320.q9F3K0Yq037024@billing.aknet.kg>', 877, 6313, 832, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 03:40:00', '<201210150340.q9F3e0Y9042176@billing.aknet.kg>', 877, 6314, 833, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 04:00:00', '<201210150400.q9F40029047458@billing.aknet.kg>', 877, 6315, 834, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 04:20:01', '<201210150420.q9F4K0cj052527@billing.aknet.kg>', 877, 6316, 835, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 04:40:00', '<201210150440.q9F4e0Yo057896@billing.aknet.kg>', 877, 6317, 836, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 05:00:00', '<201210150500.q9F500dk063018@billing.aknet.kg>', 877, 6318, 837, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 05:20:01', '<201210150520.q9F5K1Gn068113@billing.aknet.kg>', 877, 6319, 838, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 05:40:00', '<201210150540.q9F5e0AJ073526@billing.aknet.kg>', 877, 6320, 839, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 06:00:00', '<201210150600.q9F600BJ078653@billing.aknet.kg>', 877, 6321, 840, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 06:10:11', '<201210150610.q9F6ABOA081268@billing.aknet.kg>', 931, 6322, 841, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 06:20:00', '<201210150620.q9F6K0uv083626@billing.aknet.kg>', 877, 6323, 842, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 06:40:00', '<201210150640.q9F6e06f088498@billing.aknet.kg>', 877, 6324, 843, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 07:00:01', '<201210150700.q9F70181093344@billing.aknet.kg>', 877, 6325, 844, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 07:20:00', '<201210150720.q9F7K0EC098294@billing.aknet.kg>', 877, 6326, 845, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 07:40:01', '<201210150740.q9F7e184003286@billing.aknet.kg>', 877, 6327, 846, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 08:00:00', '<201210150800.q9F800V2008105@billing.aknet.kg>', 877, 6328, 847, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 08:20:00', '<201210150820.q9F8K0kN013115@billing.aknet.kg>', 877, 6329, 848, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 08:40:00', '<201210150840.q9F8e0kc018164@billing.aknet.kg>', 877, 6330, 849, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 09:00:00', '<201210150900.q9F900gC023202@billing.aknet.kg>', 877, 6331, 850, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 09:20:00', '<201210150920.q9F9K0p4028132@billing.aknet.kg>', 877, 6332, 851, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 09:40:00', '<201210150940.q9F9e0Xp033105@billing.aknet.kg>', 877, 6333, 852, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 10:00:00', '<201210151000.q9FA00FV037849@billing.aknet.kg>', 877, 6334, 853, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 10:20:00', '<201210151020.q9FAK04Q042668@billing.aknet.kg>', 877, 6335, 854, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 10:40:00', '<201210151040.q9FAe0Mu047505@billing.aknet.kg>', 877, 6336, 855, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 11:00:00', '<201210151100.q9FB00UI052231@billing.aknet.kg>', 877, 6337, 856, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 11:10:01', '<201210151110.q9FBA1Jw054637@billing.aknet.kg>', 1000, 6338, 857, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 11:20:00', '<201210151120.q9FBK0LJ057003@billing.aknet.kg>', 877, 6339, 858, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 11:40:00', '<201210151140.q9FBe0NP061910@billing.aknet.kg>', 877, 6340, 859, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 12:00:00', '<201210151200.q9FC00qg066624@billing.aknet.kg>', 877, 6341, 860, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 12:20:00', '<201210151220.q9FCK02p071136@billing.aknet.kg>', 877, 6342, 861, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 12:40:00', '<201210151240.q9FCe0PQ075656@billing.aknet.kg>', 877, 6343, 862, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 13:00:00', '<201210151300.q9FD00uD080253@billing.aknet.kg>', 877, 6344, 863, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 13:20:00', '<201210151320.q9FDK0WC084727@billing.aknet.kg>', 877, 6345, 864, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'The BIG SALE for Small Businesses: Electronics - up to 300% profit + free samples + US $ 10 coupons', '"AliExpress.com" <promotion@aliexpress.com>', 'tima@aknet.kg', '2012-10-15 09:51:28', '<148244615.1526361350294688732.JavaMail.admin@crm-eve-web05.hst.dsl.crm.alidc.net>', 109453, 6346, 865, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 13:40:00', '<201210151340.q9FDe015089431@billing.aknet.kg>', 877, 6347, 866, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 14:00:00', '<201210151400.q9FE004Y093822@billing.aknet.kg>', 877, 6348, 867, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 14:20:01', '<201210151420.q9FEK1Cs098285@billing.aknet.kg>', 877, 6349, 868, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 14:40:00', '<201210151440.q9FEe0Xl002870@billing.aknet.kg>', 877, 6350, 869, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 15:00:00', '<201210151500.q9FF00Ip007476@billing.aknet.kg>', 877, 6351, 870, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 15:20:00', '<201210151520.q9FFK0mv011850@billing.aknet.kg>', 877, 6352, 871, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 15:40:00', '<201210151540.q9FFe0IO016065@billing.aknet.kg>', 877, 6353, 872, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 16:00:00', '<201210151600.q9FG00TU020328@billing.aknet.kg>', 877, 6354, 873, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 16:20:00', '<201210151620.q9FGK0dK024705@billing.aknet.kg>', 877, 6355, 874, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 16:40:00', '<201210151640.q9FGe04M029352@billing.aknet.kg>', 877, 6356, 875, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 17:00:01', '<201210151700.q9FH01mP033863@billing.aknet.kg>', 877, 6357, 876, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 17:20:00', '<201210151720.q9FHK0qF038364@billing.aknet.kg>', 877, 6358, 877, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 17:40:00', '<201210151740.q9FHe0r5042995@billing.aknet.kg>', 877, 6359, 878, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 18:00:00', '<201210151800.q9FI00e8047669@billing.aknet.kg>', 877, 6360, 879, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 18:20:00', '<201210151820.q9FIK0GY053825@billing.aknet.kg>', 877, 6361, 880, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 18:40:00', '<201210151840.q9FIe0qq060070@billing.aknet.kg>', 877, 6362, 881, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 19:00:00', '<201210151900.q9FJ00AI065908@billing.aknet.kg>', 877, 6363, 882, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 19:20:00', '<201210151920.q9FJK089071427@billing.aknet.kg>', 877, 6364, 883, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 19:40:00', '<201210151940.q9FJe0PA076862@billing.aknet.kg>', 877, 6365, 884, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 20:00:00', '<201210152000.q9FK00Cs082550@billing.aknet.kg>', 877, 6366, 885, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 20:20:00', '<201210152020.q9FKK0v4088271@billing.aknet.kg>', 877, 6367, 886, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 20:40:00', '<201210152040.q9FKe092094251@billing.aknet.kg>', 877, 6368, 887, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 21:00:00', '<201210152100.q9FL00ZN000296@billing.aknet.kg>', 877, 6369, 888, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 21:20:00', '<201210152120.q9FLK0hQ006562@billing.aknet.kg>', 877, 6370, 889, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 21:40:00', '<201210152140.q9FLe0xd012543@billing.aknet.kg>', 877, 6371, 890, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 22:00:00', '<201210152200.q9FM00Ma018713@billing.aknet.kg>', 877, 6372, 891, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 22:20:00', '<201210152220.q9FMK05u024930@billing.aknet.kg>', 877, 6373, 892, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 22:40:00', '<201210152240.q9FMe0ZQ031261@billing.aknet.kg>', 877, 6374, 893, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 23:00:00', '<201210152300.q9FN00fC037507@billing.aknet.kg>', 877, 6375, 894, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 23:20:00', '<201210152320.q9FNK0jU043622@billing.aknet.kg>', 877, 6376, 895, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-15 23:40:00', '<201210152340.q9FNe012049971@billing.aknet.kg>', 877, 6377, 896, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 00:00:00', '<201210160000.q9G000Mj056042@billing.aknet.kg>', 877, 6378, 897, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 00:20:00', '<201210160020.q9G0K0WV062089@billing.aknet.kg>', 877, 6379, 898, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 00:40:00', '<201210160040.q9G0e0Jm068249@billing.aknet.kg>', 877, 6380, 899, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 01:00:00', '<201210160100.q9G100oa074291@billing.aknet.kg>', 877, 6381, 900, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 01:20:00', '<201210160120.q9G1K0dE080371@billing.aknet.kg>', 877, 6382, 901, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 01:40:00', '<201210160140.q9G1e0rf086250@billing.aknet.kg>', 877, 6383, 902, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 02:00:00', '<201210160200.q9G2009t091947@billing.aknet.kg>', 877, 6384, 903, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 02:20:00', '<201210160220.q9G2K0AD097529@billing.aknet.kg>', 877, 6385, 904, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 02:40:01', '<201210160240.q9G2e1ho003052@billing.aknet.kg>', 877, 6386, 905, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 03:00:00', '<201210160300.q9G300bI008541@billing.aknet.kg>', 877, 6387, 906, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 03:20:00', '<201210160320.q9G3K0em013961@billing.aknet.kg>', 877, 6388, 907, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 03:40:00', '<201210160340.q9G3e0tO019576@billing.aknet.kg>', 877, 6389, 908, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 04:00:00', '<201210160400.q9G400IJ025002@billing.aknet.kg>', 877, 6390, 909, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 04:20:00', '<201210160420.q9G4K0QV030280@billing.aknet.kg>', 877, 6391, 910, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 04:40:00', '<201210160440.q9G4e0D7035452@billing.aknet.kg>', 877, 6392, 911, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 05:00:00', '<201210160500.q9G5000o040666@billing.aknet.kg>', 877, 6393, 912, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 05:20:00', '<201210160520.q9G5K0AB045660@billing.aknet.kg>', 877, 6394, 913, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 05:40:00', '<201210160540.q9G5e0nI050737@billing.aknet.kg>', 877, 6395, 914, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 06:00:00', '<201210160600.q9G600NN055646@billing.aknet.kg>', 877, 6396, 915, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 06:10:05', '<201210160610.q9G6A5XV058052@billing.aknet.kg>', 932, 6397, 916, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 06:20:01', '<201210160620.q9G6K1Rb060483@billing.aknet.kg>', 877, 6398, 917, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 06:40:00', '<201210160640.q9G6e0wP065255@billing.aknet.kg>', 877, 6399, 918, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 07:00:00', '<201210160700.q9G700Se070237@billing.aknet.kg>', 877, 6400, 919, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 07:20:00', '<201210160720.q9G7K0T8075089@billing.aknet.kg>', 877, 6401, 920, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 07:40:00', '<201210160740.q9G7e0Ih079878@billing.aknet.kg>', 877, 6402, 921, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 08:00:00', '<201210160800.q9G800IU084829@billing.aknet.kg>', 877, 6403, 922, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 08:20:01', '<201210160820.q9G8K1aA089849@billing.aknet.kg>', 877, 6404, 923, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 08:40:00', '<201210160840.q9G8e0uG094898@billing.aknet.kg>', 877, 6405, 924, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 09:00:00', '<201210160900.q9G900G8099897@billing.aknet.kg>', 877, 6406, 925, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 09:20:00', '<201210160920.q9G9K0fp004965@billing.aknet.kg>', 877, 6407, 926, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 09:40:00', '<201210160940.q9G9e0gW009689@billing.aknet.kg>', 877, 6408, 927, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 10:00:01', '<201210161000.q9GA01Ev014181@billing.aknet.kg>', 877, 6409, 928, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?Q?=D0=B2=D0=B5=D0=B1=D1=82=D0=B2=20=D1=81=D0=B0=D0=B9?= =?UTF-8?Q?=D1=82?=', '=?UTF-8?Q?=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB_=D0=9B=D0=B5=D1=85?= =?UTF-8?Q?=D1=82=D0=BC=D0=B0=D0=', 'tima@aknet.kg', '2012-10-16 10:08:17', '<e3907b2e0ffc69fd35d4e2667539d0f4@aknet.kg>', 1122698, 6410, 929, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 10:20:00', '<201210161020.q9GAK0e1018239@billing.aknet.kg>', 877, 6411, 930, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 10:40:00', '<201210161040.q9GAe0Tp022413@billing.aknet.kg>', 877, 6412, 931, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-16 11:00:00', '<201210161100.q9GB00ra026424@billing.aknet.kg>', 877, 6413, 932, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Payment terminal malfunction', 'noreply@aknet.kg', 'tima@aknet.kg', '2012-10-17 04:55:07', '<201210170455.q9H4t7d4066555@groupoffice.aknet.kg>', 1122, 6414, 933, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-17 06:20:00', '<201210170620.q9H6K0Vl035154@billing.aknet.kg>', 877, 6415, 934, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-17 06:40:01', '<201210170640.q9H6e1os040254@billing.aknet.kg>', 877, 6416, 935, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-17 07:00:00', '<201210170700.q9H700I4045280@billing.aknet.kg>', 877, 6417, 936, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-17 07:20:01', '<201210170720.q9H7K1pm050245@billing.aknet.kg>', 877, 6418, 937, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?Q?=D0=9F=D0=BE=D0=BA=D0=B0=D0=B7=D0=B0=D0=BD=D0=B8=D1=8F?= =?UTF-8?Q?=20=D0=B7=D0=B0=20=D0=93=D0=90=D0=97=20=D1=87=D0=B5=D1=80=D0=B5?= =?UTF-8?Q?=D0=B7=20=D0=A2=D0=92?=', '=?UTF-8?Q?=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB_=D0=9B=D0=B5=D1=85?= =?UTF-8?Q?=D1=82=D0=BC=D0=B0=D0=', 'o.lavrova@aknet.kg', '2012-10-17 08:47:36', '<b2e0b55e04ee5306c37b89d4223c3c58@aknet.kg>', 3557, 6419, 938, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'nodeny not blocked users', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-17 11:10:01', '<201210171110.q9HBA14f006522@billing.aknet.kg>', 930, 6420, 939, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-17 13:20:00', '<201210171320.q9HDK0C8034988@billing.aknet.kg>', 877, 6421, 940, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-17 13:40:00', '<201210171340.q9HDe0mV039510@billing.aknet.kg>', 877, 6422, 941, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-17 14:00:00', '<201210171400.q9HE003W044099@billing.aknet.kg>', 877, 6423, 942, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-17 14:20:00', '<201210171420.q9HEK0wd048614@billing.aknet.kg>', 877, 6424, 943, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-17 14:40:00', '<201210171440.q9HEe0lN053569@billing.aknet.kg>', 877, 6425, 944, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-17 15:00:00', '<201210171500.q9HF00uZ057710@billing.aknet.kg>', 877, 6426, 945, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-17 15:20:00', '<201210171520.q9HFK0YJ061480@billing.aknet.kg>', 877, 6427, 946, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-18 01:00:00', '<201210180100.q9I1004O021578@billing.aknet.kg>', 877, 6428, 947, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-18 01:20:00', '<201210180120.q9I1K00l027179@billing.aknet.kg>', 877, 6429, 948, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-18 01:40:00', '<201210180140.q9I1e008032918@billing.aknet.kg>', 877, 6430, 949, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-18 02:00:00', '<201210180200.q9I200Fn038584@billing.aknet.kg>', 877, 6431, 950, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-18 02:20:00', '<201210180220.q9I2K09k044015@billing.aknet.kg>', 877, 6432, 951, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-18 02:40:00', '<201210180240.q9I2e05M049471@billing.aknet.kg>', 877, 6433, 952, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-18 03:00:00', '<201210180300.q9I300xq054578@billing.aknet.kg>', 877, 6434, 953, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-18 03:20:01', '<201210180320.q9I3K1Sw059646@billing.aknet.kg>', 877, 6435, 954, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'overflow 11.2', 'Charlie Root <root@billing.aknet.kg>', 'tima@aknet.kg', '2012-10-18 03:40:00', '<201210180340.q9I3e04J064900@billing.aknet.kg>', 877, 6436, 955, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', '=?UTF-8?B?Rlc6INCi0Jc=?=', '=?UTF-8?B?0J7Qu9GM0LPQsCDQm9Cw0LLRgNC+0LLQsA==?= <o.lavrova@aknet.kg>', 'tima@aknet.kg', '2012-10-18 06:24:26', '<003001cdacf9$3914efc0$ab3ecf40$@lavrova@aknet.kg>', 169943, 6437, 956, 0, 0, 0, 0, 1, 0),
('2cd2c821-997e-8de7-9d55-507f968c43ee', 'INBOX', 'Top ranking and fastest-moving products this past week', '"Alibaba.com" <tradealert@service.alibaba.com>', 'tima@aknet.kg', '2012-10-18 03:38:35', '<1475206797.1967131350531515365.JavaMail.admin@crm-eve-task2.hst.dsl.crm.alidc.net>', 196784, 6438, 957, 0, 0, 0, 0, 1, 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `published`, `name`, `description`, `subject`, `body`, `body_html`, `deleted`, `assigned_user_id`, `text_only`, `type`) VALUES
('4d4d9b37-715b-ba9a-aff9-50724db23d39', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '1', 'off', 'System-generated password email', 'This template is used when the System Administrator sends a new password to a user.', 'New account information', '\nHere is your account username and temporary password:\nUsername : $contact_user_user_name\nPassword : $contact_user_user_hash\n\n$config_site_url\n\nAfter you log in using the above password, you may be required to reset the password to one of your own choice.', '<div><table width="550"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : $contact_user_user_name </p><p>Password : $contact_user_user_hash </p><br /><p>$config_site_url</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr></tbody></table></div>', 0, NULL, 0, NULL),
('619bf6ad-b484-3dad-0a57-50724d02a979', '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '1', 'off', 'Forgot Password email', 'This template is used to send a user a link to click to reset the user''s account password.', 'Reset your account password', '\nYou recently requested on $contact_user_pwd_last_changed to be able to reset your account password.\n\nClick on the link below to reset your password:\n\n$contact_user_link_guid', '<div><table width="550"><tbody><tr><td><p>You recently requested on $contact_user_pwd_last_changed to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> $contact_user_link_guid </p>  </td>         </tr><tr><td></td>         </tr></tbody></table></div>', 0, NULL, 0, NULL);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fields_meta_data`
--

INSERT INTO `fields_meta_data` (`id`, `name`, `vname`, `comments`, `help`, `custom_module`, `type`, `len`, `required`, `default_value`, `date_modified`, `deleted`, `audited`, `massupdate`, `duplicate_merge`, `reportable`, `importable`, `ext1`, `ext2`, `ext3`, `ext4`) VALUES
('Leadsaddress_country_c', 'address_country_c', 'LBL_ADDRESS_COUNTRY', NULL, NULL, 'Leads', 'enum', 100, 0, 'KYRGYZSTAN', '2012-10-18 11:21:44', 0, 1, 0, 0, 1, 'true', 'countries_dom', NULL, NULL, NULL),
('Leadsaddress_state_c', 'address_state_c', 'LBL_ADDRESS_STATE', NULL, NULL, 'Leads', 'enum', 100, 0, 'chui', '2012-10-18 11:21:54', 0, 1, 0, 0, 1, 'true', 'address_state_c_list', NULL, NULL, NULL),
('Leadsaddress_city_c', 'address_city_c', 'LBL_ADDRESS_CITY', NULL, NULL, 'Leads', 'enum', 100, 0, 'bishkek', '2012-10-18 11:21:59', 0, 1, 0, 0, 1, 'true', 'address_city_list', NULL, NULL, NULL),
('Leadsaddress_building_c', 'address_building_c', 'LBL_ADDRESS_BUILDING', NULL, NULL, 'Leads', 'varchar', 255, 0, NULL, '2012-10-18 11:22:13', 0, 1, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('Leadsaddress_appartment_c', 'address_appartment_c', 'LBL_ADDRESS_APPARTMENT', NULL, NULL, 'Leads', 'varchar', 255, 0, NULL, '2012-10-18 11:22:19', 0, 1, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('Contactsaddress_country_c', 'address_country_c', 'LBL_ADDRESS_COUNTRY', '', '', 'Contacts', 'enum', 100, 0, 'KYRGYZSTAN', '2012-10-10 05:00:50', 0, 0, 0, 0, 1, 'true', 'countries_dom', '', '', ''),
('Contactsaddress_city_c', 'address_city_c', 'LBL_ADDRESS_CITY', '', '', 'Contacts', 'enum', 100, 0, 'bishkek', '2012-10-10 05:01:30', 0, 0, 0, 0, 1, 'true', 'address_city_list', '', '', ''),
('Contactsaddress_state_c', 'address_state_c', 'LBL_ADDRESS_STATE', '', '', 'Contacts', 'enum', 100, 0, 'chui', '2012-10-10 05:02:03', 0, 0, 0, 0, 1, 'true', 'address_state_c_list', '', '', ''),
('Contactsaddress_street_c', 'address_street_c', 'LBL_ADDRESS_STREET', '', '', 'Contacts', 'dictionary', 255, 0, NULL, '2012-10-19 11:07:44', 0, 0, 0, 0, 0, 'true', 'aknet_street', 'id', 'name', ''),
('Leadsaddress_postcode_c', 'address_postcode_c', 'LBL_ADDRESS_POSTCODE', NULL, NULL, 'Leads', 'varchar', 255, 0, NULL, '2012-10-18 11:22:25', 0, 1, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('Contactsaddress_building_c', 'address_building_c', 'LBL_ADDRESS_BUILDING', '', '', 'Contacts', 'varchar', 255, 0, '', '2012-10-12 04:33:31', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('Contactsaddress_appartment_c', 'address_appartment_c', 'LBL_ADDRESS_APPARTMENT', '', '', 'Contacts', 'varchar', 255, 0, '', '2012-10-12 04:33:59', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('Contactsaddress_postcode_c', 'address_postcode_c', 'LBL_ADDRESS_POSTCODE', '', '', 'Contacts', 'varchar', 255, 0, '', '2012-10-12 04:35:26', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('Contactsemail_c', 'email_c', 'LBL_EMAIL', '', '', 'Contacts', 'varchar', 255, 0, '', '2012-10-12 04:36:14', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('Leadsemail_c', 'email_c', 'LBL_EMAIL', NULL, NULL, 'Leads', 'varchar', 255, 0, NULL, '2012-10-18 11:22:31', 0, 1, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('Accountsaddress_country_c', 'address_country_c', 'LBL_ADDRESS_COUNTRY', NULL, NULL, 'Accounts', 'enum', 100, 0, 'KYRGYZSTAN', '2012-10-15 05:09:52', 0, 0, 0, 0, 1, 'true', 'countries_dom', NULL, NULL, NULL),
('Accountsaddress_state_c', 'address_state_c', 'LBL_ADDRESS_STATE', '', '', 'Accounts', 'enum', 100, 0, 'chui', '2012-10-15 05:09:33', 0, 0, 0, 0, 1, 'true', 'address_state_c_list', '', '', ''),
('Accountsaddress_city_c', 'address_city_c', 'LBL_ADDRESS_CITY', '', '', 'Accounts', 'enum', 100, 0, 'bishkek', '2012-10-15 05:10:47', 0, 0, 0, 0, 1, 'true', 'address_city_list', '', '', ''),
('Leadsaddress_street_c', 'address_street_c', 'LBL_ADDRESS_STREET', '', '', 'Leads', 'dictionary', 255, 0, NULL, '2012-10-19 11:07:04', 0, 0, 0, 0, 0, 'true', 'aknet_street', 'id', 'name', ''),
('Accountsaddress_building_c', 'address_building_c', 'LBL_ADDRESS_BUILDING', '', '', 'Accounts', 'varchar', 255, 0, '', '2012-10-15 05:12:27', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('Accountsaddress_appartment_c', 'address_appartment_c', 'LBL_ADDRESS_APPARTMENT', '', '', 'Accounts', 'varchar', 255, 0, '', '2012-10-15 05:13:21', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('Accountsaddress_postcode_c', 'address_postcode_c', 'LBL_ADDRESS_POSTCODE', '', '', 'Accounts', 'varchar', 255, 0, '', '2012-10-15 05:14:50', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('Accountsemail_c', 'email_c', 'LBL_EMAIL', '', '', 'Accounts', 'varchar', 255, 0, '', '2012-10-15 05:18:10', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('Accountsphone_alternate1_c', 'phone_alternate1_c', 'LBL_PHONE_ALTERNATE1', NULL, NULL, 'Accounts', 'varchar', 255, 0, NULL, '2012-10-15 05:19:56', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('Accountsphone_alternate2_c', 'phone_alternate2_c', 'LBL_PHONE_ALTERNATE2', '', '', 'Accounts', 'varchar', 255, 0, '', '2012-10-15 05:20:22', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('Accountsokpo_c', 'okpo_c', 'LBL_OKPO', '', '', 'Accounts', 'varchar', 255, 0, '', '2012-10-15 05:29:04', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('Accountsrgni_c', 'rgni_c', 'LBL_RGNI', '', '', 'Accounts', 'enum', 100, 0, '999', '2012-10-15 05:31:35', 0, 0, 0, 0, 1, 'true', 'rgni_list', '', '', ''),
('Accountsbank_c', 'bank_c', 'LBL_BANK', '', '', 'Accounts', 'enum', 100, 0, '112001', '2012-10-15 05:33:41', 0, 0, 0, 0, 1, 'true', 'bank_list', '', '', ''),
('Accountsbank_account_c', 'bank_account_c', 'LBL_BANK_ACCOUNT', '', '', 'Accounts', 'varchar', 255, 0, '', '2012-10-15 05:34:08', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('Accountsinn_c', 'inn_c', 'LBL_INN', '', '', 'Accounts', 'varchar', 255, 0, '', '2012-10-15 05:34:46', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('Accountsbusiness_name_c', 'business_name_c', 'LBL_BUSINESS_NAME', '', '', 'Accounts', 'text', NULL, 0, '', '2012-10-15 05:36:01', 0, 0, 0, 0, 1, 'true', '', '2', '20', ''),
('Accountsbusiness_address_c', 'business_address_c', 'LBL_BUSINESS_ADDRESS', '', '', 'Accounts', 'text', NULL, 0, '', '2012-10-15 05:36:35', 0, 0, 0, 0, 1, 'true', '', '2', '20', ''),
('Accountscontact_id_c', 'contact_id_c', 'LBL_LIST_RELATED_TO', '', '', 'Accounts', 'id', 36, 0, NULL, '2012-10-15 05:38:30', 0, 0, 0, 0, 0, 'true', '', '', '', ''),
('Accountsdirector_c', 'director_c', 'LBL_DIRECTOR', '', '', 'Accounts', 'relate', 255, 0, NULL, '2012-10-15 05:38:30', 0, 0, 0, 0, 1, 'true', '', 'Contacts', 'contact_id_c', ''),
('Accountsaccounting_description_c', 'accounting_description_c', 'LBL_ACCOUNTING_DESCRIPTION', '', '', 'Accounts', 'text', NULL, 0, '', '2012-10-15 06:05:18', 0, 0, 0, 0, 1, 'true', '', '4', '20', ''),
('Leadsmiddle_name_c', 'middle_name_c', 'LBL_MIDDLE_NAME', NULL, NULL, 'Leads', 'varchar', 255, 0, NULL, '2012-10-18 11:22:35', 0, 1, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('Accountsaddress_street_c', 'address_street_c', 'LBL_ADDRESS_STREET', '', '', 'Accounts', 'dictionary', 255, 0, NULL, '2012-10-19 11:08:19', 0, 0, 0, 0, 0, 'true', 'aknet_street', 'id', 'name', '');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `folders`
--

INSERT INTO `folders` (`id`, `name`, `folder_type`, `parent_folder`, `has_child`, `is_group`, `is_dynamic`, `dynamic_query`, `assign_to_id`, `created_by`, `modified_by`, `deleted`) VALUES
('303908af-5d9a-411a-2751-507f94462543', 'Моя почта', 'inbound', '', 1, 0, 1, 'SELECT emails.id polymorphic_id, ''Emails'' polymorphic_module FROM emails\n								   JOIN emails_text on emails.id = emails_text.email_id\n                                   WHERE (type = ''inbound'' OR status = ''inbound'') AND assigned_user_id = ''1'' AND emails.deleted = ''0'' AND status NOT IN (''sent'', ''archived'', ''draft'') AND type NOT IN (''out'', ''archived'', ''draft'')', '', '1', '1', 0),
('3053ee5a-f6ed-028b-22c4-507f94d3cef2', 'Мои черновики', 'draft', '303908af-5d9a-411a-2751-507f94462543', 0, 0, 1, 'SELECT emails.id polymorphic_id, ''Emails'' polymorphic_module FROM emails\n								   JOIN emails_text on emails.id = emails_text.email_id\n                                   WHERE (type = ''draft'' OR status = ''draft'') AND assigned_user_id = ''1'' AND emails.deleted = ''0'' AND status NOT IN (''archived'') AND type NOT IN (''archived'')', '', '1', '1', 0),
('306771f9-bbd3-227e-d83b-507f94a7899a', 'Отправленные E-mail', 'sent', '303908af-5d9a-411a-2751-507f94462543', 0, 0, 1, 'SELECT emails.id polymorphic_id, ''Emails'' polymorphic_module FROM emails\n								   JOIN emails_text on emails.id = emails_text.email_id\n                                   WHERE (type = ''out'' OR status = ''sent'') AND assigned_user_id = ''1'' AND emails.deleted = ''0'' AND status NOT IN (''archived'') AND type NOT IN (''archived'')', '', '1', '1', 0),
('307976ad-6cf3-6004-66f4-507f94868ba9', 'Моя архивная почта', 'archived', '303908af-5d9a-411a-2751-507f94462543', 0, 0, 1, '', '', '1', '1', 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `folders_subscriptions`
--

INSERT INTO `folders_subscriptions` (`id`, `folder_id`, `assigned_user_id`) VALUES
('303cce4d-8596-5630-9c91-507f94276d54', '303908af-5d9a-411a-2751-507f94462543', '1'),
('3055527e-f9ef-d6ac-a6cc-507f9472f1ff', '3053ee5a-f6ed-028b-22c4-507f94d3cef2', '1'),
('3068d6f7-ccfb-04b2-26da-507f94228c4a', '306771f9-bbd3-227e-d83b-507f94a7899a', '1'),
('307ade06-7ea9-3dc8-19f5-507f94817134', '307976ad-6cf3-6004-66f4-507f94868ba9', '1');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inbound_email`
--

INSERT INTO `inbound_email` (`id`, `deleted`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `status`, `server_url`, `email_user`, `email_password`, `port`, `service`, `mailbox`, `delete_seen`, `mailbox_type`, `template_id`, `stored_options`, `group_id`, `is_personal`, `groupfolder_id`) VALUES
('2cd2c821-997e-8de7-9d55-507f968c43ee', 0, '2012-10-18 05:41:38', '2012-10-18 05:41:38', '1', '1', 'Умурзаков Темир', 'Active', 'mail.aknet.kg', 'tima@aknet.kg', 'pcULM6nZt5o=', 143, '::::::imap::novalidate-cert::notls::', 'INBOX', 0, 'pick', NULL, 'YTo4OntzOjk6ImZyb21fbmFtZSI7czoxNToiVGVtaXIgVW11cnpha292IjtzOjk6ImZyb21fYWRkciI7czoxMzoidGltYUBha25ldC5rZyI7czoxMzoicmVwbHlfdG9fYWRkciI7czowOiIiO3M6MTE6InRyYXNoRm9sZGVyIjtzOjU6IlRyYXNoIjtzOjEwOiJzZW50Rm9sZGVyIjtzOjQ6IlNlbnQiO3M6MTA6Im9ubHlfc2luY2UiO2I6MDtzOjEzOiJmaWx0ZXJfZG9tYWluIjtzOjA6IiI7czoxNDoib3V0Ym91bmRfZW1haWwiO3M6MzY6IjgzOTM4NDZlLTljZWQtMjA5Yi0wZjFkLTUwNzI0ZGYzZTVhNSI7fQ==', '1', 1, NULL);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email_cache_ts`
--

CREATE TABLE IF NOT EXISTS `inbound_email_cache_ts` (
  `id` varchar(255) NOT NULL,
  `ie_timestamp` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inbound_email_cache_ts`
--

INSERT INTO `inbound_email_cache_ts` (`id`, `ie_timestamp`) VALUES
('2cd2c821-997e-8de7-9d55-507f968c43ee_INBOX', 1350538903);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_changes`
--

CREATE TABLE IF NOT EXISTS `inventory_changes` (
  `id` char(36) NOT NULL,
  `date_entered` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  `modified_user_id` varchar(36) NOT NULL,
  `assigned_user_id` varchar(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `inventory_item_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `user_name` char(255) NOT NULL,
  `changed_field` varchar(255) NOT NULL,
  `value` char(255) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_items`
--

CREATE TABLE IF NOT EXISTS `inventory_items` (
  `id` char(36) NOT NULL,
  `date_entered` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  `modified_user_id` varchar(36) NOT NULL,
  `assigned_user_id` varchar(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `inventory_number` char(255) NOT NULL,
  `account_name` char(255) NOT NULL,
  `account_id` char(36) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `storage_type` varchar(255) DEFAULT NULL,
  `artist` char(255) NOT NULL,
  `title` char(255) NOT NULL,
  `circa` int(11) DEFAULT NULL,
  `date_received` datetime NOT NULL,
  `date_left` datetime DEFAULT NULL,
  `medium` varchar(255) NOT NULL,
  `description` char(255) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `depth` double DEFAULT NULL,
  `packing` varchar(255) DEFAULT NULL,
  `square_footage` double DEFAULT NULL,
  `in_storage` varchar(255) NOT NULL,
  `value` char(10) DEFAULT NULL,
  `insured` varchar(255) NOT NULL,
  `facility` varchar(255) NOT NULL,
  `location` char(255) DEFAULT NULL,
  `photo` char(255) DEFAULT 'default.jpg',
  `condition_name` varchar(255) NOT NULL DEFAULT 'Unknown',
  `condition_description` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_item_artist_index` (`artist`)
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `salutation`, `first_name`, `last_name`, `title`, `department`, `do_not_call`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `primary_address_street`, `primary_address_city`, `primary_address_state`, `primary_address_postalcode`, `primary_address_country`, `alt_address_street`, `alt_address_city`, `alt_address_state`, `alt_address_postalcode`, `alt_address_country`, `assistant`, `assistant_phone`, `converted`, `refered_by`, `lead_source`, `lead_source_description`, `status`, `status_description`, `reports_to_id`, `account_name`, `account_description`, `contact_id`, `account_id`, `opportunity_id`, `opportunity_name`, `opportunity_amount`, `campaign_id`, `birthdate`, `portal_name`, `portal_app`, `website`) VALUES
('611d14d9-ad0f-79b7-14d5-5073b64eb6df', '2012-10-09 05:31:51', '2012-10-18 04:54:34', '1', '1', NULL, 1, '1', NULL, 'Алексей', 'Ким', 'Программист', NULL, 0, NULL, '0555810509', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'Converted', NULL, '', NULL, NULL, '95f25806-a654-b8df-5e99-5077f6e2e412', '', '', NULL, NULL, '', NULL, NULL, NULL, 'http://'),
('cf0a2110-4830-b067-4133-507ba45d2d4f', '2012-10-15 05:52:25', '2012-10-18 04:54:34', '1', '1', NULL, 1, '1', NULL, 'Темир', 'Умурзаков', NULL, NULL, 0, NULL, '0555810509', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'Converted', NULL, '', 'ОсОО "Акнет"', NULL, 'b83b2268-2611-fc55-39b2-507bd92bca49', 'ea808b06-86cd-46e4-276b-507bd910620c', '10d829c5-e8dd-5f0e-aa11-507bd929ef20', 'Сделка на 2 мбит', NULL, '', NULL, NULL, NULL, NULL),
('d6f0629b-4d5f-700c-3d89-507bdc8668bc', '2012-10-15 09:50:55', '2012-10-18 04:54:34', '1', '1', NULL, 1, '1', NULL, 'Ильдар', 'Мурсалимов', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'Converted', NULL, '', 'ОсОО "Акнет"', NULL, '14778e91-0f44-8a10-f913-507bddd97f57', 'ea808b06-86cd-46e4-276b-507bd910620c', '577cfbf4-2952-6982-18fc-507bddc97d52', NULL, NULL, '', NULL, NULL, NULL, NULL),
('ec49b777-8ea4-6f88-cc4d-507bf1e09439', '2012-10-15 11:18:55', '2012-10-18 04:54:34', '1', '1', NULL, 1, '1', NULL, 'Чак', 'Норрис', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'Converted', NULL, '', NULL, NULL, '299ff1c9-daf2-4902-14f9-507bf17f8e1a', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL),
('9ee856a3-03da-9698-5dc0-507bf159b3f5', '2012-10-15 11:22:28', '2012-10-18 04:54:34', '1', '1', NULL, 1, '1', NULL, 'Вуппи', 'Голдберг', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'Converted', NULL, '', NULL, NULL, 'efe00d56-224a-4112-510b-507bf2ab17ab', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL),
('466e0186-33d3-a7af-263b-507bf28ead8f', '2012-10-15 11:25:17', '2012-10-18 04:54:34', '1', '1', '', 1, '1', '', 'Арнольд', 'Шварцнегер', '', NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', 'New', '', NULL, '', NULL, '', '', '', NULL, '', '', NULL, NULL, NULL, NULL),
('5f11a21b-b799-e26d-bea5-507bf2d00036', '2012-10-15 11:26:25', '2012-10-18 04:54:34', '1', '1', '', 1, '1', '', 'Жан Клод', 'ван Дам', '', NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', 'New', '', NULL, '', NULL, '', '', '', NULL, '', '', NULL, NULL, NULL, NULL),
('88746f24-6719-3186-2106-507bf38bc6ae', '2012-10-15 11:27:21', '2012-10-18 04:54:34', '1', '1', NULL, 1, '1', NULL, 'Борис', 'Пастернак', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'Converted', NULL, '', NULL, NULL, '89533606-ae36-9786-cf61-507bf36ae5d9', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL),
('e083912a-d153-3ed0-3cf3-507bf4375c54', '2012-10-15 11:31:49', '2012-10-18 04:54:34', '1', '1', NULL, 1, '1', NULL, 'Лев', 'Толстой', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'Converted', NULL, '', NULL, NULL, '166b0520-9b3f-b021-0b82-507bf4d00101', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL),
('5cbbf51a-34f0-97a9-8b1d-507bf57de6ab', '2012-10-15 11:38:21', '2012-10-18 04:54:34', '1', '1', NULL, 1, '1', NULL, 'Леонид', 'Ульянов', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'Converted', NULL, '', NULL, NULL, 'bf2aac70-728c-1541-75f6-507bf5ae0074', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL),
('44e2813c-90f2-d1de-bff2-507bf59afa06', '2012-10-15 11:39:35', '2012-10-18 04:54:34', '1', '1', NULL, 1, '1', NULL, 'Александр', 'Пушкин', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'Converted', NULL, '', NULL, NULL, 'd6511074-76ff-657b-d5fb-507bf67c1964', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL),
('1c068d0a-238b-5f0a-4497-507bf6fc7824', '2012-10-15 11:42:13', '2012-10-18 04:54:34', '1', '1', NULL, 1, '1', NULL, 'Александр', 'Блок', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'Converted', NULL, '', NULL, NULL, '604aa8fc-1901-7f9e-bc96-507bf678ccb3', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL),
('726fd7d8-6d34-1436-55b2-507f8be26eb9', '2012-10-18 04:56:13', '2012-10-19 11:17:02', '1', '1', NULL, 0, '1', NULL, 'Ололош', 'Ололоев', NULL, NULL, 0, NULL, '0555810509', '0312611155', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'Converted', NULL, '', NULL, NULL, '7b7cc131-186f-465f-2f9f-50810b169a16', '', '', NULL, NULL, '', NULL, NULL, NULL, 'http://'),
('67d60327-f647-13b1-0921-50a479f01c0f', '2012-11-15 05:10:42', '2012-11-15 05:13:06', '1', '1', NULL, 0, '1', NULL, 'Alexey', 'Kim', NULL, NULL, 0, NULL, '0555810509', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'Converted', NULL, '', 'Aknet ISP', NULL, '36de02a6-3097-7240-9037-50a479768785', '4336375c-e1a2-1fd2-b3d3-50a479df66a3', '479fd117-795a-3835-a566-50a479d995a5', NULL, NULL, '', NULL, NULL, NULL, 'http://');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leads_audit`
--

INSERT INTO `leads_audit` (`id`, `parent_id`, `date_created`, `created_by`, `field_name`, `data_type`, `before_value_string`, `after_value_string`, `before_value_text`, `after_value_text`) VALUES
('1afa0628-6e5a-495c-9d0d-5077f62e4806', '611d14d9-ad0f-79b7-14d5-5073b64eb6df', '2012-10-12 10:50:55', '1', 'status', 'enum', 'New', 'Converted', NULL, NULL),
('81046ed0-9d11-337a-ffa8-507bd9c95b24', 'cf0a2110-4830-b067-4133-507ba45d2d4f', '2012-10-15 09:37:32', '1', 'status', 'enum', 'New', 'Converted', NULL, NULL),
('b4db0d08-f794-a477-0582-507bddf8fca3', 'd6f0629b-4d5f-700c-3d89-507bdc8668bc', '2012-10-15 09:53:57', '1', 'status', 'enum', 'New', 'Converted', NULL, NULL),
('8061436d-75c3-41bb-1a05-507bf1dddeae', 'ec49b777-8ea4-6f88-cc4d-507bf1e09439', '2012-10-15 11:21:35', '1', 'status', 'enum', 'New', 'Converted', NULL, NULL),
('552cdc6c-a974-52af-d1f5-507bf23b0f93', '9ee856a3-03da-9698-5dc0-507bf159b3f5', '2012-10-15 11:23:35', '1', 'status', 'enum', 'New', 'Converted', NULL, NULL),
('dfb06a23-145e-67d9-c2c1-507bf3ed72b9', '88746f24-6719-3186-2106-507bf38bc6ae', '2012-10-15 11:28:52', '1', 'status', 'enum', 'New', 'Converted', NULL, NULL),
('69ef1ab9-e1c8-d56c-a21e-507bf47a3a36', 'e083912a-d153-3ed0-3cf3-507bf4375c54', '2012-10-15 11:35:03', '1', 'status', 'enum', 'New', 'Converted', NULL, NULL),
('1f41cb18-9772-49e3-84ed-507bf506e4de', '5cbbf51a-34f0-97a9-8b1d-507bf57de6ab', '2012-10-15 11:38:53', '1', 'status', 'enum', 'New', 'Converted', NULL, NULL),
('36e83594-b12d-aba8-3b4b-507bf6db0c09', '44e2813c-90f2-d1de-bff2-507bf59afa06', '2012-10-15 11:40:46', '1', 'status', 'enum', 'New', 'Converted', NULL, NULL),
('b6b6b942-c73d-20d3-b33e-507bf659d3aa', '1c068d0a-238b-5f0a-4497-507bf6fc7824', '2012-10-15 11:43:28', '1', 'status', 'enum', 'New', 'Converted', NULL, NULL),
('4d309afe-0add-c22a-6f2f-507fe6ca8032', '726fd7d8-6d34-1436-55b2-507f8be26eb9', '2012-10-18 11:23:20', '1', 'first_name', 'varchar', 'Алексей', 'Мона', NULL, NULL),
('529ff621-eaa1-ce5e-5334-507fe6eaf275', '726fd7d8-6d34-1436-55b2-507f8be26eb9', '2012-10-18 11:23:20', '1', 'last_name', 'varchar', 'Ким', 'Лиза', NULL, NULL),
('9a675649-5125-4ae1-2be8-507fe9e4d822', '726fd7d8-6d34-1436-55b2-507f8be26eb9', '2012-10-18 11:33:42', '1', 'first_name', 'varchar', 'Мона', 'Инокентий', NULL, NULL),
('9a7a860b-ead5-7cea-7343-507fe92b431e', '726fd7d8-6d34-1436-55b2-507f8be26eb9', '2012-10-18 11:33:42', '1', 'last_name', 'varchar', 'Лиза', 'Гарикович', NULL, NULL),
('1c2cbd32-1ce0-a644-b361-5080d6d200b5', '726fd7d8-6d34-1436-55b2-507f8be26eb9', '2012-10-19 04:27:30', '1', 'first_name', 'varchar', 'Инокентий', 'Ололош', NULL, NULL),
('1c46bbad-a39e-c2b1-80bc-5080d6352aa1', '726fd7d8-6d34-1436-55b2-507f8be26eb9', '2012-10-19 04:27:30', '1', 'last_name', 'varchar', 'Гарикович', 'Ололоев', NULL, NULL),
('d15eaa02-37f6-03af-258b-5080e505f0a2', '726fd7d8-6d34-1436-55b2-507f8be26eb9', '2012-10-19 05:32:27', '1', 'phone_mobile', 'phone', NULL, '0555810509', NULL, NULL),
('a36cbe7e-68e9-78e8-ca80-5080e6ff3239', '726fd7d8-6d34-1436-55b2-507f8be26eb9', '2012-10-19 05:35:48', '1', 'phone_work', 'phone', NULL, '0312611155', NULL, NULL),
('bc99bed3-2aea-b7f5-9677-5080e7c6d3d6', '726fd7d8-6d34-1436-55b2-507f8be26eb9', '2012-10-19 05:37:36', '1', 'phone_home', 'phone', NULL, 'Херь', NULL, NULL),
('843f9bc0-fda3-ea9b-a8fe-5080e75f4607', '726fd7d8-6d34-1436-55b2-507f8be26eb9', '2012-10-19 05:37:46', '1', 'phone_home', 'phone', 'Херь', '', NULL, NULL),
('18850a7e-94bd-8d74-1a0f-5080ea1af200', '726fd7d8-6d34-1436-55b2-507f8be26eb9', '2012-10-19 05:50:18', '1', 'phone_fax', 'phone', NULL, '86', NULL, NULL),
('19a50625-da59-de4c-2d18-5080ead9862b', '726fd7d8-6d34-1436-55b2-507f8be26eb9', '2012-10-19 05:50:18', '1', 'address_street_c', 'street', '', '89762d90-552d-1030-9562-001022fda270', NULL, NULL),
('1ab70ea6-5e70-4e1e-7a01-5080ea0385ba', '726fd7d8-6d34-1436-55b2-507f8be26eb9', '2012-10-19 05:50:18', '1', 'address_building_c', 'varchar', '', '40', NULL, NULL),
('fcc90993-de74-213b-91de-5080ea9a6eac', '726fd7d8-6d34-1436-55b2-507f8be26eb9', '2012-10-19 05:50:46', '1', 'phone_fax', 'phone', '86', '', NULL, NULL),
('fdfe0264-82f8-081c-85a3-5080ea5ca477', '726fd7d8-6d34-1436-55b2-507f8be26eb9', '2012-10-19 05:50:46', '1', 'address_appartment_c', 'varchar', '', '86', NULL, NULL),
('8e0f6fb0-4f6f-8699-ca3a-50810b42d092', '726fd7d8-6d34-1436-55b2-507f8be26eb9', '2012-10-19 08:10:52', '1', 'status', 'enum', 'New', 'Converted', NULL, NULL),
('597d4887-a6dc-4376-c284-50a479403007', '67d60327-f647-13b1-0921-50a479f01c0f', '2012-11-15 05:13:06', '1', 'status', 'enum', 'New', 'Converted', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leads_cstm`
--

CREATE TABLE IF NOT EXISTS `leads_cstm` (
  `id_c` char(36) NOT NULL,
  `address_country_c` varchar(100) DEFAULT 'KYRGYZSTAN',
  `address_state_c` varchar(100) DEFAULT 'chui',
  `address_city_c` varchar(100) DEFAULT 'bishkek',
  `address_building_c` varchar(255) DEFAULT NULL,
  `address_appartment_c` varchar(255) DEFAULT NULL,
  `address_postcode_c` varchar(255) DEFAULT NULL,
  `email_c` varchar(255) DEFAULT NULL,
  `middle_name_c` varchar(255) DEFAULT NULL,
  `address_street_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leads_cstm`
--

INSERT INTO `leads_cstm` (`id_c`, `address_country_c`, `address_state_c`, `address_city_c`, `address_building_c`, `address_appartment_c`, `address_postcode_c`, `email_c`, `middle_name_c`, `address_street_c`) VALUES
('611d14d9-ad0f-79b7-14d5-5073b64eb6df', 'KYRGYZSTAN', 'chui', 'bishkek', '59', '40', '', 'tima@aknet.kg', NULL, NULL),
('cf0a2110-4830-b067-4133-507ba45d2d4f', 'KYRGYZSTAN', 'chui', 'bishkek', '86', '40', '720083', 'temonix@gmail.com', NULL, NULL),
('d6f0629b-4d5f-700c-3d89-507bdc8668bc', 'KYRGYZSTAN', 'chui', 'bishkek', '265', 'а', '720071', '', NULL, NULL),
('ec49b777-8ea4-6f88-cc4d-507bf1e09439', 'KYRGYZSTAN', 'chui', 'bishkek', '', '', '', '', NULL, NULL),
('9ee856a3-03da-9698-5dc0-507bf159b3f5', 'KYRGYZSTAN', 'chui', 'bishkek', '', '', '', '', NULL, NULL),
('466e0186-33d3-a7af-263b-507bf28ead8f', 'KYRGYZSTAN', 'chui', 'bishkek', '', '', '', '', NULL, NULL),
('5f11a21b-b799-e26d-bea5-507bf2d00036', 'KYRGYZSTAN', 'chui', 'bishkek', '', '', '', '', NULL, NULL),
('88746f24-6719-3186-2106-507bf38bc6ae', 'KYRGYZSTAN', 'chui', 'bishkek', '', '', '', '', NULL, NULL),
('e083912a-d153-3ed0-3cf3-507bf4375c54', 'KYRGYZSTAN', 'chui', 'bishkek', '', '', '', '', NULL, NULL),
('5cbbf51a-34f0-97a9-8b1d-507bf57de6ab', 'KYRGYZSTAN', 'chui', 'bishkek', '', '', '', '', NULL, NULL),
('44e2813c-90f2-d1de-bff2-507bf59afa06', 'KYRGYZSTAN', 'chui', 'bishkek', '', '', '', '', NULL, NULL),
('1c068d0a-238b-5f0a-4497-507bf6fc7824', 'KYRGYZSTAN', 'chui', 'bishkek', '', '', '', '', NULL, NULL),
('726fd7d8-6d34-1436-55b2-507f8be26eb9', 'KYRGYZSTAN', 'chui', 'bishkek', '40', '86', '', '', '', '89762d90-552d-1030-9562-001022fda270'),
('67d60327-f647-13b1-0921-50a479f01c0f', 'KYRGYZSTAN', 'chui', 'bishkek', '10', '5', '', '', '', '8975bdc6-552d-1030-9562-001022fda270');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `opportunities`
--

INSERT INTO `opportunities` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `opportunity_type`, `campaign_id`, `lead_source`, `amount`, `amount_usdollar`, `currency_id`, `date_closed`, `next_step`, `sales_stage`, `probability`) VALUES
('10d829c5-e8dd-5f0e-aa11-507bd929ef20', 'Сделка на 2 мбит', '2012-10-15 09:37:34', '2012-10-18 09:15:08', '1', '1', '', 1, '1', NULL, '', '', 3000, 3000, '-99', '2012-10-22', NULL, 'Prospecting', 10),
('577cfbf4-2952-6982-18fc-507bddc97d52', 'Удачный', '2012-10-15 09:53:59', '2012-10-18 09:15:08', '1', '1', '', 1, '1', NULL, '', '', 1000, 1000, '-99', '2012-10-16', NULL, 'Prospecting', 10),
('479fd117-795a-3835-a566-50a479d995a5', 'Удачный', '2012-11-15 05:13:06', '2012-11-15 05:13:06', '1', '1', '', 0, '1', NULL, '', '', 1000, 1000, '-99', '2012-11-15', NULL, 'Prospecting', 10);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `opportunities_contacts`
--

INSERT INTO `opportunities_contacts` (`id`, `contact_id`, `opportunity_id`, `contact_role`, `date_modified`, `deleted`) VALUES
('12f79434-8bf0-8ba4-0a5f-507bd96dd523', 'b83b2268-2611-fc55-39b2-507bd92bca49', '10d829c5-e8dd-5f0e-aa11-507bd929ef20', NULL, '2012-10-18 04:54:57', 1),
('59b894bd-fa80-15cb-a85d-507bddb44adc', '14778e91-0f44-8a10-f913-507bddd97f57', '577cfbf4-2952-6982-18fc-507bddc97d52', NULL, '2012-10-18 04:54:57', 1),
('47ae0031-e4db-a3d9-5a04-50a479cf4eb3', '36de02a6-3097-7240-9037-50a479768785', '479fd117-795a-3835-a566-50a479d995a5', NULL, '2012-11-15 05:13:06', 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `outbound_email`
--

INSERT INTO `outbound_email` (`id`, `name`, `type`, `user_id`, `mail_sendtype`, `mail_smtptype`, `mail_smtpserver`, `mail_smtpport`, `mail_smtpuser`, `mail_smtppass`, `mail_smtpauth_req`, `mail_smtpssl`) VALUES
('8393846e-9ced-209b-0f1d-50724df3e5a5', 'system', 'system', '1', 'SMTP', 'other', 'mail.aknet.kg', 25, 'admin', 'gdGWoPWQKss=', 0, 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `relationships`
--

INSERT INTO `relationships` (`id`, `relationship_name`, `lhs_module`, `lhs_table`, `lhs_key`, `rhs_module`, `rhs_table`, `rhs_key`, `join_table`, `join_key_lhs`, `join_key_rhs`, `relationship_type`, `relationship_role_column`, `relationship_role_column_value`, `reverse`, `deleted`) VALUES
('298a8587-80b2-ad57-801c-50b89a97581f', 'leads_modified_user', 'Users', 'users', 'id', 'Leads', 'leads', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('29d2504a-b059-ab36-fc9a-50b89aba891d', 'leads_created_by', 'Users', 'users', 'id', 'Leads', 'leads', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2a0d8427-8a1a-9e6b-0a77-50b89ab04e86', 'leads_assigned_user', 'Users', 'users', 'id', 'Leads', 'leads', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2a4a20e4-5b90-3e55-5ec0-50b89a1ce2fd', 'leads_email_addresses', 'Leads', 'leads', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Leads', 0, 0),
('2a88b859-7a31-a7f5-552e-50b89aeb81f9', 'leads_email_addresses_primary', 'Leads', 'leads', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('2ac6c5f6-04a6-2131-b22b-50b89ac4356c', 'lead_direct_reports', 'Leads', 'leads', 'id', 'Leads', 'leads', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2b064b72-eff5-6e78-bceb-50b89a87a57d', 'lead_tasks', 'Leads', 'leads', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('2b43f49c-88cc-a263-ba2c-50b89a4b0689', 'lead_notes', 'Leads', 'leads', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('2bcdd2e9-209a-2469-5148-50b89acf6856', 'lead_meetings', 'Leads', 'leads', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('2c5533fa-a925-fba1-de84-50b89a913a35', 'lead_calls', 'Leads', 'leads', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('2cdca0a3-2c24-885b-9383-50b89a78492b', 'lead_emails', 'Leads', 'leads', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('2d6459a4-35d7-6828-d621-50b89a8661e3', 'lead_campaign_log', 'Leads', 'leads', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2f6b6bc9-fc04-0881-c7f4-50b89af9f55d', 'cases_modified_user', 'Users', 'users', 'id', 'Cases', 'cases', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2fd7b31c-1178-1ecc-09f2-50b89a8948ea', 'cases_created_by', 'Users', 'users', 'id', 'Cases', 'cases', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('30139f49-b88c-8468-8774-50b89a0ef222', 'cases_assigned_user', 'Users', 'users', 'id', 'Cases', 'cases', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('304fb730-ee15-08e6-a10b-50b89a5e16c2', 'case_calls', 'Cases', 'cases', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('3087cd9f-6c33-6fc9-c489-50b89a261568', 'case_tasks', 'Cases', 'cases', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('310f1602-af92-5bed-e833-50b89a61f2c0', 'case_notes', 'Cases', 'cases', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('3198fc5a-117b-4127-29fd-50b89a25586d', 'case_meetings', 'Cases', 'cases', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('32252014-f76c-a072-c0f5-50b89a62e4ee', 'case_emails', 'Cases', 'cases', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('336c9233-9f8c-4da9-4a82-50b89a0fa9e3', 'bugs_modified_user', 'Users', 'users', 'id', 'Bugs', 'bugs', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('33a7fd9e-39cb-11a8-4e42-50b89a8ea84d', 'bugs_created_by', 'Users', 'users', 'id', 'Bugs', 'bugs', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('33e63c2d-4bef-7d0d-2246-50b89a5a340c', 'bugs_assigned_user', 'Users', 'users', 'id', 'Bugs', 'bugs', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3425b87c-ae81-d5d2-08cc-50b89a179806', 'bug_tasks', 'Bugs', 'bugs', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('346222b6-becf-bfa2-f7ef-50b89a7ff988', 'bug_meetings', 'Bugs', 'bugs', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('349feaa6-074a-3065-9fae-50b89a8b6656', 'bug_calls', 'Bugs', 'bugs', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('34de43c2-7cbc-ce15-e8a2-50b89ae45ea1', 'bug_emails', 'Bugs', 'bugs', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('35193d7a-0b35-f722-0c85-50b89acb2bb3', 'bug_notes', 'Bugs', 'bugs', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('3553fe8b-7f7f-f94a-41ba-50b89a553bec', 'bugs_release', 'Releases', 'releases', 'id', 'Bugs', 'bugs', 'found_in_release', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('358efead-dc4e-5e98-41ca-50b89a96c0f1', 'bugs_fixed_in_release', 'Releases', 'releases', 'id', 'Bugs', 'bugs', 'fixed_in_release', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('37375c0c-a74d-a739-65ed-50b89a69bbc1', 'user_direct_reports', 'Users', 'users', 'id', 'Users', 'users', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3775eede-004c-bea1-b4df-50b89a4d3da0', 'users_email_addresses', 'Users', 'users', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Users', 0, 0),
('37b16919-899f-1920-33f3-50b89a35387d', 'users_email_addresses_primary', 'Users', 'users', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('38453268-3d15-10a9-bb82-50b89ae46f2d', 'campaignlog_contact', 'CampaignLog', 'campaign_log', 'related_id', 'Contacts', 'contacts', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('387f53e3-e1d7-2678-9e66-50b89a989edf', 'campaignlog_lead', 'CampaignLog', 'campaign_log', 'related_id', 'Leads', 'leads', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('38ba4e72-6fde-fc90-bbda-50b89a0eec62', 'campaignlog_created_opportunities', 'CampaignLog', 'campaign_log', 'related_id', 'Opportunities', 'opportunities', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('38f1f028-cce2-fc54-4490-50b89afbdc29', 'campaignlog_targeted_users', 'CampaignLog', 'campaign_log', 'target_id', 'Users', 'users', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('392bc6a2-b0ba-afaf-2811-50b89a55059e', 'campaignlog_sent_emails', 'CampaignLog', 'campaign_log', 'related_id', 'Emails', 'emails', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('39df00b1-d73d-b002-84cb-50b89ae05005', 'projects_notes', 'Project', 'project', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('3a1c2a0b-d840-9411-eca0-50b89acdef73', 'projects_tasks', 'Project', 'project', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('3a690fa8-77b3-dc0a-fcff-50b89a1d69b4', 'projects_meetings', 'Project', 'project', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('3aa48549-c9a6-3d10-c914-50b89aa990c1', 'projects_calls', 'Project', 'project', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('3adf385a-c91b-f9d7-895c-50b89af7f30f', 'projects_emails', 'Project', 'project', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('3b1a6016-69c7-738e-ee0b-50b89a12ae4c', 'projects_project_tasks', 'Project', 'project', 'id', 'ProjectTask', 'project_task', 'project_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3b557029-8b9b-eb86-87ae-50b89a0cfebf', 'projects_assigned_user', 'Users', 'users', 'id', 'Project', 'project', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3b915cde-050e-ab45-7a5a-50b89a17c80a', 'projects_modified_user', 'Users', 'users', 'id', 'Project', 'project', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3bcee976-9071-32a2-a686-50b89ac83be4', 'projects_created_by', 'Users', 'users', 'id', 'Project', 'project', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3c9a1926-4439-5351-77d1-50b89acb173d', 'project_tasks_notes', 'ProjectTask', 'project_task', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('3cd61374-66da-edc2-e6be-50b89a57d22d', 'project_tasks_tasks', 'ProjectTask', 'project_task', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('3d12f9ea-a627-5a7e-ac67-50b89a3c3e8f', 'project_tasks_meetings', 'ProjectTask', 'project_task', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('3d4f5178-07b6-3563-ebbe-50b89a632972', 'project_tasks_calls', 'ProjectTask', 'project_task', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('3d8bf8fe-dc4d-b302-58b2-50b89a944493', 'project_tasks_emails', 'ProjectTask', 'project_task', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('3dd02c1a-a6f9-a845-ed41-50b89ad50848', 'project_tasks_assigned_user', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3e0c1b91-fdfe-8d72-bed4-50b89a9ae62a', 'project_tasks_modified_user', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3e4c6dd6-928b-d06e-9b53-50b89a048a1c', 'project_tasks_created_by', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3f3e5f63-6bde-fa74-62ae-50b89a727ed1', 'campaigns_modified_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3f7a9345-7bed-91ed-dfe8-50b89a6db9ff', 'campaigns_created_by', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3fb6b698-0d27-ab5c-a510-50b89acc9cae', 'campaigns_assigned_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3ff20b44-c523-1be6-6fe9-50b89a331b7e', 'campaign_accounts', 'Campaigns', 'campaigns', 'id', 'Accounts', 'accounts', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('402c1b79-85c6-8e30-0b53-50b89a44bc61', 'campaign_contacts', 'Campaigns', 'campaigns', 'id', 'Contacts', 'contacts', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('40650d1e-892b-964c-7af6-50b89a322a85', 'campaign_leads', 'Campaigns', 'campaigns', 'id', 'Leads', 'leads', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('409cc6db-c4f1-ed7d-4c49-50b89a53ebac', 'campaign_prospects', 'Campaigns', 'campaigns', 'id', 'Prospects', 'prospects', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('40e150b2-5009-4068-4214-50b89a04783f', 'campaign_opportunities', 'Campaigns', 'campaigns', 'id', 'Opportunities', 'opportunities', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('411b5373-c850-9ae2-8d84-50b89a80dd8a', 'campaign_email_marketing', 'Campaigns', 'campaigns', 'id', 'EmailMarketing', 'email_marketing', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4155e4ae-a0d6-dff2-469c-50b89ab6d9d5', 'campaign_emailman', 'Campaigns', 'campaigns', 'id', 'EmailMan', 'emailman', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('41902174-17c1-8ef3-5226-50b89af607f5', 'campaign_campaignlog', 'Campaigns', 'campaigns', 'id', 'CampaignLog', 'campaign_log', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('41c8b75c-f8d1-06e4-032f-50b89ae675e5', 'campaign_assigned_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4200be49-8b6d-8680-fcb3-50b89a6010f1', 'campaign_modified_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('429d5d3c-9724-9112-f6be-50b89ae3e9f0', 'prospectlists_assigned_user', 'Users', 'users', 'id', 'prospectlists', 'prospect_lists', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('440b1715-ac60-af03-0bbc-50b89a9dcdd3', 'prospects_modified_user', 'Users', 'users', 'id', 'Prospects', 'prospects', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('444934e4-9256-060e-adb2-50b89a39c470', 'prospects_created_by', 'Users', 'users', 'id', 'Prospects', 'prospects', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4483769f-6b74-8d86-4071-50b89aaba47d', 'prospects_assigned_user', 'Users', 'users', 'id', 'Prospects', 'prospects', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('44bf0a98-e41e-ec9c-f685-50b89a587a21', 'prospects_email_addresses', 'Prospects', 'prospects', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Prospects', 0, 0),
('44f9df51-ea90-d830-3003-50b89a15805f', 'prospects_email_addresses_primary', 'Prospects', 'prospects', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('45366259-de80-4897-3c96-50b89a739f73', 'prospect_tasks', 'Prospects', 'prospects', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('456f8153-6fcd-91f4-259c-50b89a346916', 'prospect_notes', 'Prospects', 'prospects', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('45a76576-82c5-61dc-58b5-50b89a7d2563', 'prospect_meetings', 'Prospects', 'prospects', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('45e13c7b-797e-116d-fd56-50b89aa38a59', 'prospect_calls', 'Prospects', 'prospects', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('4619c71a-4062-2b71-ad11-50b89a79f761', 'prospect_emails', 'Prospects', 'prospects', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('46529f02-cd9f-33f9-2660-50b89a2ccf10', 'prospect_campaign_log', 'Prospects', 'prospects', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('46d1d774-9041-388e-5e86-50b89a8f007a', 'email_template_email_marketings', 'EmailTemplates', 'email_templates', 'id', 'EmailMarketing', 'email_marketing', 'template_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('474541af-cb07-ef64-4d2b-50b89a52b171', 'campaign_campaigntrakers', 'Campaigns', 'campaigns', 'id', 'CampaignTrackers', 'campaign_trkrs', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('487a192b-3736-10d4-77c6-50b89a67e164', 'schedulers_created_by_rel', 'Users', 'users', 'id', 'Schedulers', 'schedulers', 'created_by', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('48b7715b-e3a0-0e41-94fd-50b89a91235d', 'schedulers_modified_user_id_rel', 'Users', 'users', 'id', 'Schedulers', 'schedulers', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('48f03054-4175-10c2-de97-50b89abba5b3', 'schedulers_jobs_rel', 'Schedulers', 'schedulers', 'id', 'SchedulersJobs', 'job_queue', 'scheduler_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('49819eae-bc6d-019d-36ec-50b89ad80b67', 'schedulersjobs_assigned_user', 'Users', 'users', 'id', 'SchedulersJobs', 'schedulersjobs', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4b6cfbfa-d722-d708-fd39-50b89a4fc850', 'contacts_modified_user', 'Users', 'users', 'id', 'Contacts', 'contacts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4ba79fd1-8882-597d-5443-50b89accf86b', 'contacts_created_by', 'Users', 'users', 'id', 'Contacts', 'contacts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4be24fd9-065a-3333-7737-50b89abea27e', 'contacts_assigned_user', 'Users', 'users', 'id', 'Contacts', 'contacts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4c1cb4ab-fe1d-2755-7b57-50b89ad0a8d3', 'contacts_email_addresses', 'Contacts', 'contacts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Contacts', 0, 0),
('4c565a3d-40f9-a793-f905-50b89ae8c16c', 'contacts_email_addresses_primary', 'Contacts', 'contacts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('4c909247-f17e-69a4-d3e4-50b89a4c7345', 'contact_direct_reports', 'Contacts', 'contacts', 'id', 'Contacts', 'contacts', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4cc91081-389e-9187-c8ff-50b89a6a2b14', 'contact_leads', 'Contacts', 'contacts', 'id', 'Leads', 'leads', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4d0333c9-ef9d-9d2b-fca8-50b89a83fd68', 'contact_notes', 'Contacts', 'contacts', 'id', 'Notes', 'notes', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4d3c4bb2-4be7-1895-e2b2-50b89af9903c', 'contact_tasks', 'Contacts', 'contacts', 'id', 'Tasks', 'tasks', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4d741409-8330-38c5-32f0-50b89ab5e333', 'contact_tasks_parent', 'Contacts', 'contacts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Contacts', 0, 0),
('4db17bc3-98dd-05e6-90b6-50b89a8a1f95', 'contact_campaign_log', 'Contacts', 'contacts', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4fdf8ebd-8a01-2288-4352-50b89a81d76b', 'accounts_modified_user', 'Users', 'users', 'id', 'Accounts', 'accounts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5050780c-e923-e148-8d95-50b89a64c19d', 'accounts_created_by', 'Users', 'users', 'id', 'Accounts', 'accounts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('50d5f3c4-9d89-1bd3-bd2a-50b89aa1085b', 'accounts_assigned_user', 'Users', 'users', 'id', 'Accounts', 'accounts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('515be4ec-066a-a345-b807-50b89ace245c', 'accounts_email_addresses', 'Accounts', 'accounts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Accounts', 0, 0),
('51e00abb-9296-5d67-732b-50b89a8b0f2c', 'accounts_email_addresses_primary', 'Accounts', 'accounts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('5267abfd-424d-a2d6-0208-50b89adc6998', 'member_accounts', 'Accounts', 'accounts', 'id', 'Accounts', 'accounts', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('52ea0b97-1141-8133-a9f5-50b89aacd9b5', 'account_cases', 'Accounts', 'accounts', 'id', 'Cases', 'cases', 'account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5320da3d-8682-cf9f-ee6e-50b89a08c306', 'account_tasks', 'Accounts', 'accounts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('535d205a-7e23-3ae3-4b04-50b89a1fbecc', 'account_notes', 'Accounts', 'accounts', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('5397cead-5b5e-9166-ea24-50b89ad6086d', 'account_meetings', 'Accounts', 'accounts', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('53d37e66-e97b-91e9-ff13-50b89ab92467', 'account_calls', 'Accounts', 'accounts', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('540ef956-0c0c-ed04-b0b2-50b89af14dda', 'account_emails', 'Accounts', 'accounts', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('544a7746-2259-b167-6d30-50b89a9c2ba0', 'account_leads', 'Accounts', 'accounts', 'id', 'Leads', 'leads', 'account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5486f500-2b39-e9d3-0bf6-50b89ae9bf13', 'account_campaign_log', 'Accounts', 'accounts', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('558498ad-af02-1aec-0bc9-50b89af6e8c7', 'opportunities_modified_user', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('55c13aa7-1d3f-2294-43b2-50b89a7988b7', 'opportunities_created_by', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5607b32d-30df-582e-8a63-50b89a745ac9', 'opportunities_assigned_user', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5646032b-7f79-fcae-28a5-50b89a7fc4b4', 'opportunity_calls', 'Opportunities', 'opportunities', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('567fb5c8-a460-4ed7-68df-50b89afa3e08', 'opportunity_meetings', 'Opportunities', 'opportunities', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('56b8faf8-3fdb-c9e7-eedc-50b89aacaa6f', 'opportunity_tasks', 'Opportunities', 'opportunities', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('572f5e30-6ab6-72eb-fe6f-50b89aac9855', 'opportunity_notes', 'Opportunities', 'opportunities', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('57bf03c6-e9ee-3c7a-afd1-50b89a2b98aa', 'opportunity_emails', 'Opportunities', 'opportunities', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('584fb3c8-7e89-c530-8a59-50b89a43f9ac', 'opportunity_leads', 'Opportunities', 'opportunities', 'id', 'Leads', 'leads', 'opportunity_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('58cffee8-de5c-f2d1-4e6d-50b89ac7257b', 'opportunity_currencies', 'Opportunities', 'opportunities', 'currency_id', 'Currencies', 'currencies', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5906eba5-61cf-d9dc-66fa-50b89a453283', 'opportunities_campaign', 'Campaigns', 'campaigns', 'id', 'Opportunities', 'opportunities', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('598b8d6e-9e4e-3d22-c12f-50b89a337275', 'emailtemplates_assigned_user', 'Users', 'users', 'id', 'EmailTemplates', 'email_templates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5a4d80b4-4cb2-ad61-128b-50b89a92a599', 'notes_assigned_user', 'Users', 'users', 'id', 'Notes', 'notes', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5a89ad7f-ee7e-f0e7-7759-50b89ae023a7', 'notes_modified_user', 'Users', 'users', 'id', 'Notes', 'notes', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5ac3b364-2c7b-0d05-1bf8-50b89a65fd7a', 'notes_created_by', 'Users', 'users', 'id', 'Notes', 'notes', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5baf17ca-cb06-724e-b5ac-50b89a630bcf', 'calls_modified_user', 'Users', 'users', 'id', 'Calls', 'calls', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5becc5d6-05b1-3358-eb84-50b89a9e77c2', 'calls_created_by', 'Users', 'users', 'id', 'Calls', 'calls', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5c26e03b-ed9b-e554-1be8-50b89a9ef1ba', 'calls_assigned_user', 'Users', 'users', 'id', 'Calls', 'calls', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5c607252-132a-6abb-d88b-50b89a42f51f', 'calls_notes', 'Calls', 'calls', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Calls', 0, 0),
('5d5adbe9-751f-30d4-961b-50b89ae3bb87', 'emails_assigned_user', 'Users', 'users', 'id', 'Emails', 'emails', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5d969b99-81cb-e0be-204a-50b89a573b88', 'emails_modified_user', 'Users', 'users', 'id', 'Emails', 'emails', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5dd00e48-4116-ed2f-571a-50b89a2e5553', 'emails_created_by', 'Users', 'users', 'id', 'Emails', 'emails', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5e0a8dfb-5005-e028-5a62-50b89a45ef84', 'emails_notes_rel', 'Emails', 'emails', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5e47a9f2-63b8-006b-c307-50b89ad7658a', 'emails_meetings_rel', 'Emails', 'emails', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5f487d92-66c9-a825-477a-50b89a44ec61', 'meetings_modified_user', 'Users', 'users', 'id', 'Meetings', 'meetings', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5f87930c-b45b-5ccd-0368-50b89aa11b6d', 'meetings_created_by', 'Users', 'users', 'id', 'Meetings', 'meetings', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5fc5aa4e-eb54-bd33-3625-50b89a2df5bd', 'meetings_assigned_user', 'Users', 'users', 'id', 'Meetings', 'meetings', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('600262e4-34ca-4157-c889-50b89a4a5a4d', 'meetings_notes', 'Meetings', 'meetings', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Meetings', 0, 0),
('60e45003-4521-7ba0-9ed1-50b89aa86b8c', 'tasks_modified_user', 'Users', 'users', 'id', 'Tasks', 'tasks', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('612413b1-aa62-d396-2c97-50b89a0e7278', 'tasks_created_by', 'Users', 'users', 'id', 'Tasks', 'tasks', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6160513d-90ef-d0eb-6534-50b89a85d087', 'tasks_assigned_user', 'Users', 'users', 'id', 'Tasks', 'tasks', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('619d4a74-a17f-ca44-fcd2-50b89aa49253', 'tasks_notes', 'Tasks', 'tasks', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('66f4c5a0-171a-9164-a363-50b89afe3134', 'documents_modified_user', 'Users', 'users', 'id', 'Documents', 'documents', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('67358e0a-3941-d015-65c9-50b89a5f94b4', 'documents_created_by', 'Users', 'users', 'id', 'Documents', 'documents', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('67731ac0-fa3f-b7f4-aa0d-50b89a7e80fe', 'documents_assigned_user', 'Users', 'users', 'id', 'Documents', 'documents', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('67af58d4-eb22-0dec-a860-50b89ad4a701', 'document_revisions', 'Documents', 'documents', 'id', 'DocumentRevisions', 'document_revisions', 'document_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6831e078-e0d4-59b6-631e-50b89a83d4e5', 'revisions_created_by', 'Users', 'users', 'id', 'DocumentRevisions', 'document_revisions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('691f7849-6c3f-705a-a9e0-50b89a6e60f0', 'inbound_email_created_by', 'Users', 'users', 'id', 'InboundEmail', 'inbound_email', 'created_by', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('695c86f2-f56a-58ff-7ebf-50b89a8998aa', 'inbound_email_modified_user_id', 'Users', 'users', 'id', 'InboundEmail', 'inbound_email', 'modified_user_id', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('6b0a2b67-f045-a522-8949-50b89a9fc1e1', 'saved_search_assigned_user', 'Users', 'users', 'id', 'SavedSearch', 'saved_search', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6c8fb725-8ca9-b4bb-8919-50b89acac236', 'sugarfeed_modified_user', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6cd1744c-5b8c-d566-4727-50b89a6ffb22', 'sugarfeed_created_by', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6d0db22a-f3ce-7395-f2c4-50b89a2a0949', 'sugarfeed_assigned_user', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6dcd5a34-6bea-c7cc-b8ee-50b89add4686', 'eapm_modified_user', 'Users', 'users', 'id', 'EAPM', 'eapm', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6e0baf8c-4b79-1933-12a1-50b89a0a3d79', 'eapm_created_by', 'Users', 'users', 'id', 'EAPM', 'eapm', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6e482d69-0241-9d1e-0757-50b89a791742', 'eapm_assigned_user', 'Users', 'users', 'id', 'EAPM', 'eapm', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6eee8423-de80-7338-8f1e-50b89ac1567e', 'oauthkeys_modified_user', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6f2ec2a5-c520-7d83-9227-50b89af87380', 'oauthkeys_created_by', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6f6ee0c0-aa28-41c4-4470-50b89aee9210', 'oauthkeys_assigned_user', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6fed86d1-5e8c-62df-fa02-50b89a3b1284', 'consumer_tokens', 'OAuthKeys', 'oauth_consumer', 'id', 'OAuthTokens', 'oauth_tokens', 'consumer', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('702d25b6-7d3d-a4f2-1342-50b89a8b7c60', 'oauthtokens_assigned_user', 'Users', 'users', 'id', 'OAuthTokens', 'oauth_tokens', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('70d2829b-43fc-0cc0-5cc5-50b89ad64c58', 'jjwa_tools_modified_user', 'Users', 'users', 'id', 'jjwa_Tools', 'jjwa_tools', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7116f8d7-8b87-8d68-8c7d-50b89a41b5c8', 'jjwa_tools_created_by', 'Users', 'users', 'id', 'jjwa_Tools', 'jjwa_tools', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('715631cd-07e0-c68f-cb99-50b89a13cb60', 'jjwa_tools_assigned_user', 'Users', 'users', 'id', 'jjwa_Tools', 'jjwa_tools', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('71f94399-0aab-9c80-fab6-50b89a821306', 'jjwa_reports_modified_user', 'Users', 'users', 'id', 'jjwa_Reports', 'jjwa_reports', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('723b8e71-7f4e-f5df-bcf6-50b89a655de0', 'jjwa_reports_created_by', 'Users', 'users', 'id', 'jjwa_Reports', 'jjwa_reports', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('72830454-08e3-2931-87fd-50b89a30aa72', 'jjwa_reports_assigned_user', 'Users', 'users', 'id', 'jjwa_Reports', 'jjwa_reports', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('73456f3d-7eb1-701e-62a7-50b89a802af3', 'aknet_internettariff_modified_user', 'Users', 'users', 'id', 'Aknet_InternetTariff', 'aknet_internettariff', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7392b136-ee8e-52a8-0578-50b89ab494fd', 'aknet_internettariff_created_by', 'Users', 'users', 'id', 'Aknet_InternetTariff', 'aknet_internettariff', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('73d5a713-8eea-6353-f639-50b89aa7ff1e', 'aknet_internettariff_assigned_user', 'Users', 'users', 'id', 'Aknet_InternetTariff', 'aknet_internettariff', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('75091b36-7826-225f-9a34-50b89af860a3', 'aknet_serviceinternet_modified_user', 'Users', 'users', 'id', 'Aknet_ServiceInternet', 'aknet_serviceinternet', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('754e984b-4787-1fdd-fc18-50b89addd6fe', 'aknet_serviceinternet_created_by', 'Users', 'users', 'id', 'Aknet_ServiceInternet', 'aknet_serviceinternet', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('75969cbb-e5bd-05f7-95fb-50b89a32d2c2', 'aknet_serviceinternet_assigned_user', 'Users', 'users', 'id', 'Aknet_ServiceInternet', 'aknet_serviceinternet', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7693f2dc-f229-700d-2bb3-50b89ab81ce2', 'aknet_servicetv_modified_user', 'Users', 'users', 'id', 'Aknet_ServiceTV', 'aknet_servicetv', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('76da5590-261a-a3ee-4f55-50b89aeef17a', 'aknet_servicetv_created_by', 'Users', 'users', 'id', 'Aknet_ServiceTV', 'aknet_servicetv', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('771b173f-c7a7-fcf0-7bae-50b89af4fe9c', 'aknet_servicetv_assigned_user', 'Users', 'users', 'id', 'Aknet_ServiceTV', 'aknet_servicetv', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('781cac2c-7931-fa28-5fbc-50b89a258f5d', 'aknet_servicevpnl2_modified_user', 'Users', 'users', 'id', 'Aknet_ServiceVPNL2', 'aknet_servicevpnl2', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('78639a3e-9320-e90a-a0d7-50b89a942132', 'aknet_servicevpnl2_created_by', 'Users', 'users', 'id', 'Aknet_ServiceVPNL2', 'aknet_servicevpnl2', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('78a5bf67-1de2-f4a7-6991-50b89a39e7b3', 'aknet_servicevpnl2_assigned_user', 'Users', 'users', 'id', 'Aknet_ServiceVPNL2', 'aknet_servicevpnl2', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('796efe11-4173-3043-972f-50b89a942705', 'aknet_street_modified_user', 'Users', 'users', 'id', 'Aknet_Street', 'aknet_street', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('79aa24c1-84b6-9228-a471-50b89ae2b04b', 'aknet_street_created_by', 'Users', 'users', 'id', 'Aknet_Street', 'aknet_street', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('79e37d71-ea02-9fca-43e0-50b89a1c25cd', 'aknet_street_assigned_user', 'Users', 'users', 'id', 'Aknet_Street', 'aknet_street', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7a832b93-3a55-d788-67ab-50b89abf93a1', 'aknet_tvtariff_modified_user', 'Users', 'users', 'id', 'Aknet_TVTariff', 'aknet_tvtariff', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7ac0f6ce-ea7a-fc9e-0d7b-50b89af58c80', 'aknet_tvtariff_created_by', 'Users', 'users', 'id', 'Aknet_TVTariff', 'aknet_tvtariff', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7afb7b6c-81a4-0e31-c0a3-50b89aebdbc4', 'aknet_tvtariff_assigned_user', 'Users', 'users', 'id', 'Aknet_TVTariff', 'aknet_tvtariff', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1dd09644-f542-ed6b-0858-50b89ade302d', 'accounts_bugs', 'Accounts', 'accounts', 'id', 'Bugs', 'bugs', 'id', 'accounts_bugs', 'account_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('25d70737-90aa-e802-5dee-50b89ad023b4', 'accounts_contacts', 'Accounts', 'accounts', 'id', 'Contacts', 'contacts', 'id', 'accounts_contacts', 'account_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('27e01fe7-95f2-dbaa-dcf6-50b89afa2a6d', 'accounts_opportunities', 'Accounts', 'accounts', 'id', 'Opportunities', 'opportunities', 'id', 'accounts_opportunities', 'account_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('2877c265-b35e-4d1a-452c-50b89aaea7a1', 'calls_contacts', 'Calls', 'calls', 'id', 'Contacts', 'contacts', 'id', 'calls_contacts', 'call_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('2e788b41-12dd-21e7-7440-50b89ac4c698', 'calls_users', 'Calls', 'calls', 'id', 'Users', 'users', 'id', 'calls_users', 'call_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('32bfd2f5-7a2e-d696-c536-50b89a14016d', 'calls_leads', 'Calls', 'calls', 'id', 'Leads', 'leads', 'id', 'calls_leads', 'call_id', 'lead_id', 'many-to-many', NULL, NULL, 0, 0),
('354629eb-577b-0ed6-a233-50b89ae5945b', 'cases_bugs', 'Cases', 'cases', 'id', 'Bugs', 'bugs', 'id', 'cases_bugs', 'case_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('35e0ab62-51dc-4b8d-d537-50b89ababb85', 'contacts_bugs', 'Contacts', 'contacts', 'id', 'Bugs', 'bugs', 'id', 'contacts_bugs', 'contact_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('3e2a423a-3968-7a69-4f0d-50b89a8bb59e', 'contacts_cases', 'Contacts', 'contacts', 'id', 'Cases', 'cases', 'id', 'contacts_cases', 'contact_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('417d11f1-a983-eb78-3d9a-50b89ad863e8', 'contacts_users', 'Contacts', 'contacts', 'id', 'Users', 'users', 'id', 'contacts_users', 'contact_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('4380ee06-4c6a-8052-eb08-50b89abf986f', 'emails_accounts_rel', 'Emails', 'emails', 'id', 'Accounts', 'accounts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Accounts', 0, 0),
('440ea3a9-f429-ae7f-65b7-50b89ac36e87', 'emails_bugs_rel', 'Emails', 'emails', 'id', 'Bugs', 'bugs', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Bugs', 0, 0),
('49ab926a-81b4-0135-4fe7-50b89a69e3cd', 'emails_cases_rel', 'Emails', 'emails', 'id', 'Cases', 'cases', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Cases', 0, 0),
('4d58ef69-338d-d575-e958-50b89abc47ae', 'emails_contacts_rel', 'Emails', 'emails', 'id', 'Contacts', 'contacts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Contacts', 0, 0),
('4f6b3719-a66f-d7d2-1eac-50b89ac797ec', 'emails_leads_rel', 'Emails', 'emails', 'id', 'Leads', 'leads', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Leads', 0, 0),
('501a62b2-0e11-535a-da9c-50b89ae01d16', 'emails_opportunities_rel', 'Emails', 'emails', 'id', 'Opportunities', 'opportunities', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Opportunities', 0, 0),
('53f98fad-4e8b-1462-04fd-50b89a5b7f87', 'emails_tasks_rel', 'Emails', 'emails', 'id', 'Tasks', 'tasks', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Tasks', 0, 0),
('54a0cc44-89bf-60bf-7f24-50b89a469779', 'emails_users_rel', 'Emails', 'emails', 'id', 'Users', 'users', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Users', 0, 0),
('56817d5e-3a5c-f992-c393-50b89a13fc61', 'emails_project_task_rel', 'Emails', 'emails', 'id', 'ProjectTask', 'project_task', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'ProjectTask', 0, 0),
('5709cd39-ec3c-11fa-b334-50b89a41d83c', 'emails_projects_rel', 'Emails', 'emails', 'id', 'Project', 'project', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Project', 0, 0),
('5d9bb86c-bfff-75a5-59e8-50b89ad64c8c', 'emails_prospects_rel', 'Emails', 'emails', 'id', 'Prospects', 'prospects', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Prospects', 0, 0),
('610e0543-f036-782b-ff8c-50b89a07eb2d', 'meetings_contacts', 'Meetings', 'meetings', 'id', 'Contacts', 'contacts', 'id', 'meetings_contacts', 'meeting_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('632e27d7-ca1c-4e92-9a33-50b89adadc50', 'meetings_users', 'Meetings', 'meetings', 'id', 'Users', 'users', 'id', 'meetings_users', 'meeting_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('63c242e0-8e2f-a4e4-14a9-50b89a0d83b5', 'meetings_leads', 'Meetings', 'meetings', 'id', 'Leads', 'leads', 'id', 'meetings_leads', 'meeting_id', 'lead_id', 'many-to-many', NULL, NULL, 0, 0),
('6bef89e6-578b-6d56-7060-50b89ab1b400', 'opportunities_contacts', 'Opportunities', 'opportunities', 'id', 'Contacts', 'contacts', 'id', 'opportunities_contacts', 'opportunity_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('6fc44214-aa44-113f-4d61-50b89ad26622', 'prospect_list_campaigns', 'ProspectLists', 'prospect_lists', 'id', 'Campaigns', 'campaigns', 'id', 'prospect_list_campaigns', 'prospect_list_id', 'campaign_id', 'many-to-many', NULL, NULL, 0, 0),
('71da193a-5643-f0b9-5b3b-50b89a53031f', 'prospect_list_contacts', 'ProspectLists', 'prospect_lists', 'id', 'Contacts', 'contacts', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Contacts', 0, 0),
('7273398a-37b2-0b0f-fb10-50b89aedb61c', 'prospect_list_prospects', 'ProspectLists', 'prospect_lists', 'id', 'Prospects', 'prospects', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Prospects', 0, 0),
('786d2848-02cc-8034-d3e8-50b89a509119', 'prospect_list_leads', 'ProspectLists', 'prospect_lists', 'id', 'Leads', 'leads', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Leads', 0, 0),
('7c407d2d-31df-0c3a-1c6a-50b89a27a3dd', 'prospect_list_users', 'ProspectLists', 'prospect_lists', 'id', 'Users', 'users', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Users', 0, 0),
('7e51ad94-162b-ae20-6885-50b89a20d542', 'prospect_list_accounts', 'ProspectLists', 'prospect_lists', 'id', 'Accounts', 'accounts', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Accounts', 0, 0),
('7ef7aea3-2228-28bc-feaf-50b89aa7e786', 'roles_users', 'Roles', 'roles', 'id', 'Users', 'users', 'id', 'roles_users', 'role_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('7f96956e-7df9-68a1-2132-50b89a444c84', 'projects_bugs', 'Project', 'project', 'id', 'Bugs', 'bugs', 'id', 'projects_bugs', 'project_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('8f9ef0c5-ec36-a177-6377-50b89a2537ed', 'projects_cases', 'Project', 'project', 'id', 'Cases', 'cases', 'id', 'projects_cases', 'project_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('95043035-603f-39fa-fe6f-50b89a2fe2d2', 'projects_accounts', 'Project', 'project', 'id', 'Accounts', 'accounts', 'id', 'projects_accounts', 'project_id', 'account_id', 'many-to-many', NULL, NULL, 0, 0),
('ad81ccf8-798f-55a1-e3fe-50b89a2fc477', 'projects_contacts', 'Project', 'project', 'id', 'Contacts', 'contacts', 'id', 'projects_contacts', 'project_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('b784c54e-03ca-2525-f2e0-50b89a5f7c75', 'projects_opportunities', 'Project', 'project', 'id', 'Opportunities', 'opportunities', 'id', 'projects_opportunities', 'project_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('c7e6279d-7c0d-5195-6897-50b89a12b079', 'acl_roles_actions', 'ACLRoles', 'acl_roles', 'id', 'ACLActions', 'acl_actions', 'id', 'acl_roles_actions', 'role_id', 'action_id', 'many-to-many', NULL, NULL, 0, 0),
('ccdca416-82fa-9a49-a8f0-50b89a744b05', 'acl_roles_users', 'ACLRoles', 'acl_roles', 'id', 'Users', 'users', 'id', 'acl_roles_users', 'role_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('cf014872-0fe0-07ad-42bf-50b89a80ebd5', 'email_marketing_prospect_lists', 'EmailMarketing', 'email_marketing', 'id', 'ProspectLists', 'prospect_lists', 'id', 'email_marketing_prospect_lists', 'email_marketing_id', 'prospect_list_id', 'many-to-many', NULL, NULL, 0, 0),
('cf9d5c3f-37bc-1019-b16e-50b89a53058e', 'leads_documents', 'Leads', 'leads', 'id', 'Documents', 'documents', 'id', 'linked_documents', 'parent_id', 'document_id', 'many-to-many', 'parent_type', 'Leads', 0, 0),
('d5b40db3-5882-dc4c-cf1a-50b89af4b3b2', 'documents_accounts', 'Documents', 'documents', 'id', 'Accounts', 'accounts', 'id', 'documents_accounts', 'document_id', 'account_id', 'many-to-many', NULL, NULL, 0, 0),
('d9657edc-554f-36fb-ec1a-50b89a84757a', 'documents_contacts', 'Documents', 'documents', 'id', 'Contacts', 'contacts', 'id', 'documents_contacts', 'document_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('daf43cc3-3fe7-41a7-b1a4-50b89ac2be96', 'documents_opportunities', 'Documents', 'documents', 'id', 'Opportunities', 'opportunities', 'id', 'documents_opportunities', 'document_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('db8e4ead-b276-abf6-258b-50b89afd7372', 'documents_cases', 'Documents', 'documents', 'id', 'Cases', 'cases', 'id', 'documents_cases', 'document_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('e380335c-2985-f00d-8964-50b89a40c3cf', 'documents_bugs', 'Documents', 'documents', 'id', 'Bugs', 'bugs', 'id', 'documents_bugs', 'document_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('e86ab194-a1f7-6b9d-6211-50b89a5cfc53', 'aknet_servicevpnl2_contacts', 'Aknet_ServiceVPNL2', 'aknet_servicevpnl2', 'id', 'Contacts', 'contacts', 'id', 'aknet_servicevpnl2_contacts_c', 'aknet_servicevpnl2_contactsaknet_servicevpnl2_ida', 'aknet_servicevpnl2_contactscontacts_idb', 'many-to-many', NULL, NULL, 0, 0),
('eae059c8-4ce9-51d3-c48d-50b89aa39f1b', 'aknet_serviceinternet_contacts', 'Aknet_ServiceInternet', 'aknet_serviceinternet', 'id', 'Contacts', 'contacts', 'id', 'aknet_serviceinternet_contacts_c', 'aknet_serviceinternet_contactsaknet_serviceinternet_ida', 'aknet_serviceinternet_contactscontacts_idb', 'many-to-many', NULL, NULL, 0, 0),
('eb770204-1fde-bd08-13d8-50b89aa7ea9b', 'aknet_servicevpnl2_leads', 'Aknet_ServiceVPNL2', 'aknet_servicevpnl2', 'id', 'Leads', 'leads', 'id', 'aknet_servicevpnl2_leads_c', 'aknet_servicevpnl2_leadsaknet_servicevpnl2_ida', 'aknet_servicevpnl2_leadsleads_idb', 'many-to-many', NULL, NULL, 0, 0),
('f32cdb10-98cc-0c8a-afd0-50b89a469c0a', 'aknet_serviceinternet_accounts', 'Aknet_ServiceInternet', 'aknet_serviceinternet', 'id', 'Accounts', 'accounts', 'id', 'aknet_serviceinternet_accounts_c', 'aknet_serviceinternet_accountsaknet_serviceinternet_ida', 'aknet_serviceinternet_accountsaccounts_idb', 'many-to-many', NULL, NULL, 0, 0),
('1fc60a9d-858e-1e13-74e4-50b89a2f4fa0', 'aknet_serviceinternet_opportunities', 'Aknet_ServiceInternet', 'aknet_serviceinternet', 'id', 'Opportunities', 'opportunities', 'id', 'aknet_serviceinternet_opportunities_c', 'aknet_serviceinternet_opportunitiesaknet_serviceinternet_ida', 'aknet_serviceinternet_opportunitiesopportunities_idb', 'many-to-many', NULL, NULL, 0, 0),
('40c4028e-92e4-4f6c-e35a-50b89aecb46e', 'aknet_servicevpnl2_accounts', 'Aknet_ServiceVPNL2', 'aknet_servicevpnl2', 'id', 'Accounts', 'accounts', 'id', 'aknet_servicevpnl2_accounts_c', 'aknet_servicevpnl2_accountsaknet_servicevpnl2_ida', 'aknet_servicevpnl2_accountsaccounts_idb', 'many-to-many', NULL, NULL, 0, 0),
('4a4909dc-b92d-250a-4f71-50b89ae26b66', 'aknet_servicevpnl2_opportunities', 'Aknet_ServiceVPNL2', 'aknet_servicevpnl2', 'id', 'Opportunities', 'opportunities', 'id', 'aknet_servicevpnl2_opportunities_c', 'aknet_servicevpnl2_opportunitiesaknet_servicevpnl2_ida', 'aknet_servicevpnl2_opportunitiesopportunities_idb', 'many-to-many', NULL, NULL, 0, 0),
('e5140374-d0bd-b810-43c4-50b89af58a93', 'aknet_servicetv_contacts', 'Aknet_ServiceTV', 'aknet_servicetv', 'id', 'Contacts', 'contacts', 'id', 'aknet_servicetv_contacts_c', 'aknet_servicetv_contactsaknet_servicetv_ida', 'aknet_servicetv_contactscontacts_idb', 'many-to-many', NULL, NULL, 0, 0),
('136a46e1-eb99-4927-9e03-50b89aedff7c', 'aknet_servicetv_opportunities', 'Aknet_ServiceTV', 'aknet_servicetv', 'id', 'Opportunities', 'opportunities', 'id', 'aknet_servicetv_opportunities_c', 'aknet_servicetv_opportunitiesaknet_servicetv_ida', 'aknet_servicetv_opportunitiesopportunities_idb', 'many-to-many', NULL, NULL, 0, 0),
('199ab5c8-1b59-2943-127b-50b89a084041', 'aknet_serviceinternet_leads', 'Aknet_ServiceInternet', 'aknet_serviceinternet', 'id', 'Leads', 'leads', 'id', 'aknet_serviceinternet_leads_c', 'aknet_serviceinternet_leadsaknet_serviceinternet_ida', 'aknet_serviceinternet_leadsleads_idb', 'many-to-many', NULL, NULL, 0, 0),
('1a2ccfb3-b0b8-8ec8-2daa-50b89a2f9230', 'aknet_servicetv_accounts', 'Aknet_ServiceTV', 'aknet_servicetv', 'id', 'Accounts', 'accounts', 'id', 'aknet_servicetv_accounts_c', 'aknet_servicetv_accountsaknet_servicetv_ida', 'aknet_servicetv_accountsaccounts_idb', 'many-to-many', NULL, NULL, 0, 0),
('24aac5f2-1caa-6fa0-3f4e-50b89a58383e', 'aknet_servicetv_leads', 'Aknet_ServiceTV', 'aknet_servicetv', 'id', 'Leads', 'leads', 'id', 'aknet_servicetv_leads_c', 'aknet_servicetv_leadsaknet_servicetv_ida', 'aknet_servicetv_leadsleads_idb', 'many-to-many', NULL, NULL, 0, 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedulers`
--

INSERT INTO `schedulers` (`id`, `deleted`, `date_entered`, `date_modified`, `created_by`, `modified_user_id`, `name`, `job`, `date_time_start`, `date_time_end`, `job_interval`, `time_from`, `time_to`, `last_run`, `status`, `catch_up`) VALUES
('6cbc82a1-1e6f-c87b-de6f-50724df7fd2a', 0, '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '1', 'Prune Tracker Tables', 'function::trimTracker', '2005-01-01 19:00:01', '2020-12-31 23:59:59', '0::2::1::*::*', NULL, NULL, NULL, 'Active', 1),
('770adc1f-873b-18e9-1add-50724d22359b', 0, '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '1', 'Check Inbound Mailboxes', 'function::pollMonitoredInboxes', '2005-01-01 14:15:01', '2020-12-31 23:59:59', '*::*::*::*::*', NULL, NULL, NULL, 'Active', 0),
('7be71a6c-8485-dcf2-2636-50724d316033', 0, '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '1', 'Run Nightly Process Bounced Campaign Emails', 'function::pollMonitoredInboxesForBouncedCampaignEmails', '2005-01-01 16:30:01', '2020-12-31 23:59:59', '0::2-6::*::*::*', NULL, NULL, NULL, 'Active', 1),
('80c740c2-0572-0e3f-bc72-50724dccdbb5', 0, '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '1', 'Run Nightly Mass Email Campaigns', 'function::runMassEmailCampaign', '2005-01-01 10:00:01', '2020-12-31 23:59:59', '0::2-6::*::*::*', NULL, NULL, NULL, 'Active', 1),
('85a5d0bd-8b33-5139-d1c7-50724ded886c', 0, '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '1', 'Prune Database on 1st of Month', 'function::pruneDatabase', '2005-01-01 08:45:01', '2020-12-31 23:59:59', '0::4::1::*::*', NULL, NULL, NULL, 'Inactive', 0),
('8a8c123a-f8c6-8e20-02d0-50724ddc6f3b', 0, '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '1', 'Run Email Reminder Notifications', 'function::sendEmailReminders', '2008-01-01 11:45:01', '2020-12-31 23:59:59', '*::*::*::*::*', NULL, NULL, NULL, 'Active', 0),
('8f64b31b-8e11-b8de-c33d-50724d939483', 0, '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '1', 'Clean Jobs Queue', 'function::cleanJobQueue', '2012-01-01 17:00:01', '2030-12-31 23:59:59', '0::5::*::*::*', NULL, NULL, NULL, 'Active', 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tm_testmodule`
--

CREATE TABLE IF NOT EXISTS `tm_testmodule` (
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
-- Table structure for table `tm_testmodule_audit`
--

CREATE TABLE IF NOT EXISTS `tm_testmodule_audit` (
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
  KEY `idx_tm_testmodule_parent_id` (`parent_id`)
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=400 ;

--
-- Dumping data for table `tracker`
--

INSERT INTO `tracker` (`id`, `monitor_id`, `user_id`, `module_name`, `item_id`, `item_summary`, `date_modified`, `action`, `session_id`, `visible`, `deleted`) VALUES
(223, '1e833311-bd7b-c5ab-f7d7-507f96b07075', '1', 'InboundEmail', '2cd2c821-997e-8de7-9d55-507f968c43ee', 'Умурзаков Темир', '2012-10-18 05:41:38', 'save', '2ei58qsdnlgjlg9ks3881348n6', 1, 0),
(193, 'e1bb23ed-91ef-f372-b6b1-507bf290e30a', '1', 'Leads', '9ee856a3-03da-9698-5dc0-507bf159b3f5', 'Вуппи Голдберг', '2012-10-15 11:22:57', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(182, 'f1ee9c0e-a841-044a-11f5-507bddecfc30', '1', 'Leads', 'd6f0629b-4d5f-700c-3d89-507bdc8668bc', 'Ильдар Мурсалимов', '2012-10-15 09:53:57', 'save', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(181, '98312d13-1a7b-8f39-6068-507bdc9f6683', '1', 'Leads', 'd6f0629b-4d5f-700c-3d89-507bdc8668bc', 'Ильдар Мурсалимов', '2012-10-15 09:51:27', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(170, '3c2a1039-a62a-34b6-c95b-507bd96d1e5c', '1', 'Leads', 'cf0a2110-4830-b067-4133-507ba45d2d4f', 'Темир Умурзаков', '2012-10-15 09:38:58', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(179, 'e446bdeb-e052-353d-6048-507bdc288238', '1', 'Opportunities', '10d829c5-e8dd-5f0e-aa11-507bd929ef20', 'Сделка на 2 мбит', '2012-10-15 09:49:12', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(121, '2e004a63-6c9e-2dc1-d272-50769b0a343c', '1', 'Aknet_ServiceInternet', '26b539c5-373f-77e9-50e6-5075360b56d3', NULL, '2012-10-11 10:11:33', 'editview', 'n01lopt7kibec62lbt879m6fk7', 0, 0),
(210, '41b69df5-4c5a-92ed-ea99-507bf88b58f9', '1', 'Leads', '1c068d0a-238b-5f0a-4497-507bf6fc7824', 'Александр Блок', '2012-10-15 11:48:33', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(172, 'dabb4909-2064-d339-a125-507bda1eacce', '1', 'Leads', 'cf0a2110-4830-b067-4133-507ba45d2d4f', 'Темир Умурзаков', '2012-10-15 09:41:55', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(168, 'ed222cb1-13c0-7d6d-d5ae-507bd94932e3', '1', 'Leads', 'cf0a2110-4830-b067-4133-507ba45d2d4f', 'Темир Умурзаков', '2012-10-15 09:38:30', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(169, '84a140fe-f184-2bd0-d569-507bd988f148', '1', 'Contacts', 'b83b2268-2611-fc55-39b2-507bd92bca49', 'Темир Умурзаков', '2012-10-15 09:38:39', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(159, 'd99439e5-f5b0-deea-5898-507ba322dda3', '1', 'Leads', '611d14d9-ad0f-79b7-14d5-5073b64eb6df', 'Алексей Ким', '2012-10-15 05:49:00', 'detailview', 'n01lopt7kibec62lbt879m6fk7', 0, 0),
(160, 'd593d8fc-61a8-d0c0-5d1e-507ba32eef26', '1', 'Contacts', '95f25806-a654-b8df-5e99-5077f6e2e412', 'Алексей Ким', '2012-10-15 05:49:20', 'detailview', 'n01lopt7kibec62lbt879m6fk7', 0, 0),
(184, '412b43c3-1a1b-c94d-40ec-507bddf07ca1', '1', 'Opportunities', '577cfbf4-2952-6982-18fc-507bddc97d52', 'Удачный', '2012-10-15 09:54:25', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(186, '5a810421-4059-8cdc-16e9-507be843a23a', '1', 'Accounts', 'ea808b06-86cd-46e4-276b-507bd910620c', 'ОсОО "Акнет"', '2012-10-15 10:42:16', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(187, 'd86ba734-6c2f-2e42-a0cf-507be8e30897', '1', 'Contacts', '14778e91-0f44-8a10-f913-507bddd97f57', 'Ильдар Мурсалимов', '2012-10-15 10:42:47', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(192, '4e1ce6e7-53e9-2235-d789-507bf136e6fb', '1', 'Leads', 'ec49b777-8ea4-6f88-cc4d-507bf1e09439', 'Чак Норрис', '2012-10-15 11:21:48', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(194, '5f8950ad-72e7-4ab9-2646-507bf25ec103', '1', 'Contacts', 'efe00d56-224a-4112-510b-507bf2ab17ab', 'Вуппи Голдберг', '2012-10-15 11:23:54', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(199, '1b4e87bf-6456-28a8-8230-507bf50f352b', '1', 'Leads', '5cbbf51a-34f0-97a9-8b1d-507bf57de6ab', 'Леонид Ульянов', '2012-10-15 11:38:23', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(196, '77905052-2ac0-53bc-a31c-507bf3f3b43c', '1', 'Leads', '88746f24-6719-3186-2106-507bf38bc6ae', 'Борис Пастернак', '2012-10-15 11:27:57', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(198, '401e7d4e-e212-c23c-5419-507bf4395d45', '1', 'Leads', 'e083912a-d153-3ed0-3cf3-507bf4375c54', 'Лев Толстой', '2012-10-15 11:32:24', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(200, 'ddfc5fb7-5c40-b5f7-269d-507bf59aba1a', '1', 'Leads', '5cbbf51a-34f0-97a9-8b1d-507bf57de6ab', 'Леонид Ульянов', '2012-10-15 11:39:13', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(203, '792a0de9-0efc-155b-654c-507bf6f90985', '1', 'Contacts', 'd6511074-76ff-657b-d5fb-507bf67c1964', 'Александр Пушкин', '2012-10-15 11:41:05', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(202, 'ee9b9dde-c3bc-87ae-da30-507bf643ba80', '1', 'Leads', '44e2813c-90f2-d1de-bff2-507bf59afa06', 'Александр Пушкин', '2012-10-15 11:40:07', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(206, '4f845f24-4959-a085-a98a-507bf648284a', '1', 'Leads', '1c068d0a-238b-5f0a-4497-507bf6fc7824', 'Александр Блок', '2012-10-15 11:43:28', 'save', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(209, '6d204499-96cf-81b1-5775-507bf8fc6fa8', '1', 'Leads', 'cf0a2110-4830-b067-4133-507ba45d2d4f', 'Темир Умурзаков', '2012-10-15 11:48:15', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(214, '56b20a43-4881-4919-abcb-507bf89d0a72', '1', 'Leads', '1c068d0a-238b-5f0a-4497-507bf6fc7824', 'Александр Блок', '2012-10-15 11:49:38', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(216, 'cc60f6ea-24a9-ccad-54f9-507bfa429e0b', '1', 'Contacts', '604aa8fc-1901-7f9e-bc96-507bf678ccb3', 'Александр Блок', '2012-10-15 11:57:40', 'detailview', 'dfbv8qo6clmi4me31q4pd7k2o0', 0, 0),
(224, '6a52645f-6ccd-1473-3d33-507fc885ea82', '1', 'Currencies', '870dffe7-bd67-c942-03ec-507bd6ca368f', 'Base Implementation.  Should be overridden.', '2012-10-18 09:14:55', 'detailview', 'ir9ohku449vluid0qii3c5f2o5', 1, 0),
(387, '79e8b507-adf5-6ec5-e40c-50b826751cd7', '1', 'Aknet_ServiceInternet', 'ee0c999d-5320-ea0a-a7fe-50a4795877d9', NULL, '2012-11-30 03:21:38', 'editview', 'dd1e1ov1aslk9h4r3qjgccs7s4', 1, 0),
(399, '171cb48f-6b6a-c990-995c-50b866b63104', '1', 'Users', '1', 'Temir Umurzakov', '2012-11-30 07:54:14', 'editview', 'vprs3275om387lhbklr9dgaqi0', 1, 0),
(382, '82924e86-1af9-cd85-40b3-50b58f969121', '1', 'Accounts', '4336375c-e1a2-1fd2-b3d3-50a479df66a3', 'Aknet ISP', '2012-11-28 04:15:16', 'detailview', 'f79bqj6ulb2lonl2tfr9itc294', 1, 0),
(345, '45f60099-6cb2-023a-5eb4-508138197121', '1', 'Aknet_ServiceInternet', '8714f02f-bf07-4802-8bcf-507febaa33b4', NULL, '2012-10-19 11:23:32', 'editview', 'so20olnuu1ttn47hdnpli8h6q4', 1, 0),
(367, '8d0a6b0f-757e-d83b-f287-50a479bfc16e', '1', 'Contacts', '36de02a6-3097-7240-9037-50a479768785', 'Alexey Kim', '2012-11-15 05:13:30', 'detailview', 'g4mcmhib4o33262jr53u808473', 1, 0),
(339, '34afe4c7-ad03-6fe8-3cb4-508137916ee5', '1', 'Aknet_InternetTariff', 'e699de1c-bc25-58ac-6dbf-508137076a3b', 'Удачный', '2012-10-19 11:21:50', 'detailview', 'so20olnuu1ttn47hdnpli8h6q4', 1, 0),
(398, '6dfdde76-68e1-8a56-8eb8-50b82eadf161', '1', 'Leads', '726fd7d8-6d34-1436-55b2-507f8be26eb9', 'Ололош Ололоев', '2012-11-30 03:58:26', 'detailview', 'dbnntesd5t6cea321t34hba1o3', 1, 0),
(396, '772a79fa-5e0d-1dae-c9b4-50b82c3238cf', '1', 'Contacts', '7b7cc131-186f-465f-2f9f-50810b169a16', 'Ололош Ололоев', '2012-11-30 03:49:08', 'detailview', 'dbnntesd5t6cea321t34hba1o3', 1, 0),
(386, 'e27edb8d-bdaf-10b6-f44c-50b82613924b', '1', 'Leads', '67d60327-f647-13b1-0921-50a479f01c0f', 'Alexey Kim', '2012-11-30 03:21:30', 'detailview', 'dd1e1ov1aslk9h4r3qjgccs7s4', 1, 0),
(351, 'b4ee1f3f-5807-ae66-2f5e-50813b3c1a91', '1', 'Aknet_TVTariff', '671673e6-062e-91b8-a9a4-50813b9443ce', 'Family', '2012-10-19 11:37:57', 'detailview', 'so20olnuu1ttn47hdnpli8h6q4', 1, 0),
(369, '96596ab0-d2d5-48d3-b79f-50a47a9d97cd', '1', 'Opportunities', '479fd117-795a-3835-a566-50a479d995a5', 'Удачный', '2012-11-15 05:14:10', 'detailview', 'g4mcmhib4o33262jr53u808473', 1, 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upgrade_history`
--

INSERT INTO `upgrade_history` (`id`, `filename`, `md5sum`, `type`, `status`, `version`, `name`, `description`, `id_name`, `manifest`, `date_entered`, `enabled`) VALUES
('a972dfc6-7a58-9975-61fe-507fc754f392', 'upload/upgrades/module/Tools_and_Reports_v0.3.0.zip', 'f496347774b45eef962fd6ddf5a39b00', 'module', 'installed', '0.3.0-6.0+', 'JJWDesign_Tools_and_Reports', 'JJWDesign Tools and Reports for SugarCRM v6+', 'Admin', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEyOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e3M6MTM6InJlZ2V4X21hdGNoZXMiO2E6MTp7aTowO3M6NToiNlwuLioiO319czoyNDoiYWNjZXB0YWJsZV9zdWdhcl9mbGF2b3JzIjthOjE6e2k6MDtzOjI6IkNFIjt9czozOiJrZXkiO3M6NDoiamp3YSI7czo2OiJhdXRob3IiO3M6MTI6IkplZmYgV2FsdGVycyI7czoxMToiZGVzY3JpcHRpb24iO3M6NDQ6IkpKV0Rlc2lnbiBUb29scyBhbmQgUmVwb3J0cyBmb3IgU3VnYXJDUk0gdjYrIjtzOjQ6Imljb24iO3M6MzU6Imljb25zL2RlZmF1bHQvaWNvbl9KandhX1JlcG9ydHMuZ2lmIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtiOjE7czo0OiJuYW1lIjtzOjI3OiJKSldEZXNpZ25fVG9vbHNfYW5kX1JlcG9ydHMiO3M6MTQ6InB1Ymxpc2hlZF9kYXRlIjtzOjE5OiIyMDEyLTAyLTI4IDAwOjI4OjU5IjtzOjQ6InR5cGUiO3M6NjoibW9kdWxlIjtzOjc6InZlcnNpb24iO3M6MTA6IjAuMy4wLTYuMCsiO3M6MTM6InJlbW92ZV90YWJsZXMiO3M6NjoicHJvbXB0Ijt9czoxMToiaW5zdGFsbGRlZnMiO2E6Nzp7czoyOiJpZCI7czo1OiJBZG1pbiI7czo1OiJiZWFucyI7YToyOntpOjA7YTo0OntzOjY6Im1vZHVsZSI7czoxMDoiamp3YV9Ub29scyI7czo1OiJjbGFzcyI7czoxMDoiamp3YV9Ub29scyI7czo0OiJwYXRoIjtzOjMzOiJtb2R1bGVzL2pqd2FfVG9vbHMvamp3YV9Ub29scy5waHAiO3M6MzoidGFiIjtiOjE7fWk6MTthOjQ6e3M6NjoibW9kdWxlIjtzOjEyOiJqandhX1JlcG9ydHMiO3M6NToiY2xhc3MiO3M6MTI6Impqd2FfUmVwb3J0cyI7czo0OiJwYXRoIjtzOjM3OiJtb2R1bGVzL2pqd2FfUmVwb3J0cy9qandhX1JlcG9ydHMucGhwIjtzOjM6InRhYiI7YjoxO319czoxMDoibGF5b3V0ZGVmcyI7YTowOnt9czoxMzoicmVsYXRpb25zaGlwcyI7YTowOnt9czo5OiJpbWFnZV9kaXIiO3M6MTY6IjxiYXNlcGF0aD4vaWNvbnMiO3M6NDoiY29weSI7YToyOntpOjA7YToyOntzOjQ6ImZyb20iO3M6NDI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvamp3YV9Ub29scyI7czoyOiJ0byI7czoxODoibW9kdWxlcy9qandhX1Rvb2xzIjt9aToxO2E6Mjp7czo0OiJmcm9tIjtzOjQ0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL2pqd2FfUmVwb3J0cyI7czoyOiJ0byI7czoyMDoibW9kdWxlcy9qandhX1JlcG9ydHMiO319czo4OiJsYW5ndWFnZSI7YToxOntpOjA7YTozOntzOjQ6ImZyb20iO3M6NTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL2FwcGxpY2F0aW9uL2VuX3VzLmxhbmcucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMToiYXBwbGljYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO319fXM6MTY6InVwZ3JhZGVfbWFuaWZlc3QiO3M6MDoiIjt9', '2012-10-18 09:12:04', 1),
('24ac49fa-794c-0f1c-ed35-50813be8e2cd', 'upload/upgrades/module/Aknet2012_10_19_173721.zip', '894400104a0214c6fdf3574758b1b29c', 'module', 'installed', '1350646640', 'Aknet', '', 'Aknet', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6NToiQWtuZXQiO3M6NjoiYXV0aG9yIjtzOjA6IiI7czoxMToiZGVzY3JpcHRpb24iO3M6MDoiIjtzOjQ6Imljb24iO3M6MDoiIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtiOjE7czo0OiJuYW1lIjtzOjU6IkFrbmV0IjtzOjE0OiJwdWJsaXNoZWRfZGF0ZSI7czoxOToiMjAxMi0xMC0xOSAxMTozNzoyMCI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo3OiJ2ZXJzaW9uIjtpOjEzNTA2NDY2NDA7czoxMzoicmVtb3ZlX3RhYmxlcyI7czo2OiJwcm9tcHQiO31zOjExOiJpbnN0YWxsZGVmcyI7YTo4OntzOjI6ImlkIjtzOjU6IkFrbmV0IjtzOjU6ImJlYW5zIjthOjY6e2k6MDthOjQ6e3M6NjoibW9kdWxlIjtzOjIwOiJBa25ldF9JbnRlcm5ldFRhcmlmZiI7czo1OiJjbGFzcyI7czoyMDoiQWtuZXRfSW50ZXJuZXRUYXJpZmYiO3M6NDoicGF0aCI7czo1MzoibW9kdWxlcy9Ba25ldF9JbnRlcm5ldFRhcmlmZi9Ba25ldF9JbnRlcm5ldFRhcmlmZi5waHAiO3M6MzoidGFiIjtiOjE7fWk6MTthOjQ6e3M6NjoibW9kdWxlIjtzOjIxOiJBa25ldF9TZXJ2aWNlSW50ZXJuZXQiO3M6NToiY2xhc3MiO3M6MjE6IkFrbmV0X1NlcnZpY2VJbnRlcm5ldCI7czo0OiJwYXRoIjtzOjU1OiJtb2R1bGVzL0FrbmV0X1NlcnZpY2VJbnRlcm5ldC9Ba25ldF9TZXJ2aWNlSW50ZXJuZXQucGhwIjtzOjM6InRhYiI7YjoxO31pOjI7YTo0OntzOjY6Im1vZHVsZSI7czoxNToiQWtuZXRfU2VydmljZVRWIjtzOjU6ImNsYXNzIjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO3M6NDoicGF0aCI7czo0MzoibW9kdWxlcy9Ba25ldF9TZXJ2aWNlVFYvQWtuZXRfU2VydmljZVRWLnBocCI7czozOiJ0YWIiO2I6MTt9aTozO2E6NDp7czo2OiJtb2R1bGUiO3M6MTg6IkFrbmV0X1NlcnZpY2VWUE5MMiI7czo1OiJjbGFzcyI7czoxODoiQWtuZXRfU2VydmljZVZQTkwyIjtzOjQ6InBhdGgiO3M6NDk6Im1vZHVsZXMvQWtuZXRfU2VydmljZVZQTkwyL0FrbmV0X1NlcnZpY2VWUE5MMi5waHAiO3M6MzoidGFiIjtiOjE7fWk6NDthOjQ6e3M6NjoibW9kdWxlIjtzOjEyOiJBa25ldF9TdHJlZXQiO3M6NToiY2xhc3MiO3M6MTI6IkFrbmV0X1N0cmVldCI7czo0OiJwYXRoIjtzOjM3OiJtb2R1bGVzL0FrbmV0X1N0cmVldC9Ba25ldF9TdHJlZXQucGhwIjtzOjM6InRhYiI7YjoxO31pOjU7YTo0OntzOjY6Im1vZHVsZSI7czoxNDoiQWtuZXRfVFZUYXJpZmYiO3M6NToiY2xhc3MiO3M6MTQ6IkFrbmV0X1RWVGFyaWZmIjtzOjQ6InBhdGgiO3M6NDE6Im1vZHVsZXMvQWtuZXRfVFZUYXJpZmYvQWtuZXRfVFZUYXJpZmYucGhwIjtzOjM6InRhYiI7YjoxO319czoxMDoibGF5b3V0ZGVmcyI7YToyNDp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjg2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMvYWtuZXRfc2VydmljZWludGVybmV0X2xlYWRzX0xlYWRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO31pOjE7YToyOntzOjQ6ImZyb20iO3M6MTAyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMvYWtuZXRfc2VydmljZWludGVybmV0X2xlYWRzX0FrbmV0X1NlcnZpY2VJbnRlcm5ldC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjIxOiJBa25ldF9TZXJ2aWNlSW50ZXJuZXQiO31pOjI7YToyOntzOjQ6ImZyb20iO3M6OTI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNlaW50ZXJuZXRfY29udGFjdHNfQ29udGFjdHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDb250YWN0cyI7fWk6MzthOjI6e3M6NDoiZnJvbSI7czoxMDU6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNlaW50ZXJuZXRfY29udGFjdHNfQWtuZXRfU2VydmljZUludGVybmV0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MjE6IkFrbmV0X1NlcnZpY2VJbnRlcm5ldCI7fWk6NDthOjI6e3M6NDoiZnJvbSI7czoxMDI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNlaW50ZXJuZXRfb3Bwb3J0dW5pdGllc19PcHBvcnR1bml0aWVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO31pOjU7YToyOntzOjQ6ImZyb20iO3M6MTEwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMvYWtuZXRfc2VydmljZWludGVybmV0X29wcG9ydHVuaXRpZXNfQWtuZXRfU2VydmljZUludGVybmV0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MjE6IkFrbmV0X1NlcnZpY2VJbnRlcm5ldCI7fWk6NjthOjI6e3M6NDoiZnJvbSI7czo5MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYXlvdXRkZWZzL2FrbmV0X3NlcnZpY2VpbnRlcm5ldF9hY2NvdW50c19BY2NvdW50cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjt9aTo3O2E6Mjp7czo0OiJmcm9tIjtzOjEwNToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYXlvdXRkZWZzL2FrbmV0X3NlcnZpY2VpbnRlcm5ldF9hY2NvdW50c19Ba25ldF9TZXJ2aWNlSW50ZXJuZXQucGhwIjtzOjk6InRvX21vZHVsZSI7czoyMToiQWtuZXRfU2VydmljZUludGVybmV0Ijt9aTo4O2E6Mjp7czo0OiJmcm9tIjtzOjgwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMvYWtuZXRfc2VydmljZXR2X2xlYWRzX0xlYWRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO31pOjk7YToyOntzOjQ6ImZyb20iO3M6OTA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldHZfbGVhZHNfQWtuZXRfU2VydmljZVRWLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTU6IkFrbmV0X1NlcnZpY2VUViI7fWk6MTA7YToyOntzOjQ6ImZyb20iO3M6ODY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldHZfYWNjb3VudHNfQWNjb3VudHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJBY2NvdW50cyI7fWk6MTE7YToyOntzOjQ6ImZyb20iO3M6OTM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldHZfYWNjb3VudHNfQWtuZXRfU2VydmljZVRWLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTU6IkFrbmV0X1NlcnZpY2VUViI7fWk6MTI7YToyOntzOjQ6ImZyb20iO3M6ODY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldHZfY29udGFjdHNfQ29udGFjdHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDb250YWN0cyI7fWk6MTM7YToyOntzOjQ6ImZyb20iO3M6OTM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldHZfY29udGFjdHNfQWtuZXRfU2VydmljZVRWLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTU6IkFrbmV0X1NlcnZpY2VUViI7fWk6MTQ7YToyOntzOjQ6ImZyb20iO3M6OTY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldHZfb3Bwb3J0dW5pdGllc19PcHBvcnR1bml0aWVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO31pOjE1O2E6Mjp7czo0OiJmcm9tIjtzOjk4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMvYWtuZXRfc2VydmljZXR2X29wcG9ydHVuaXRpZXNfQWtuZXRfU2VydmljZVRWLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTU6IkFrbmV0X1NlcnZpY2VUViI7fWk6MTY7YToyOntzOjQ6ImZyb20iO3M6ODM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldnBubDJfbGVhZHNfTGVhZHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJMZWFkcyI7fWk6MTc7YToyOntzOjQ6ImZyb20iO3M6OTY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldnBubDJfbGVhZHNfQWtuZXRfU2VydmljZVZQTkwyLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTg6IkFrbmV0X1NlcnZpY2VWUE5MMiI7fWk6MTg7YToyOntzOjQ6ImZyb20iO3M6ODk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldnBubDJfYWNjb3VudHNfQWNjb3VudHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJBY2NvdW50cyI7fWk6MTk7YToyOntzOjQ6ImZyb20iO3M6OTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldnBubDJfYWNjb3VudHNfQWtuZXRfU2VydmljZVZQTkwyLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTg6IkFrbmV0X1NlcnZpY2VWUE5MMiI7fWk6MjA7YToyOntzOjQ6ImZyb20iO3M6ODk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldnBubDJfY29udGFjdHNfQ29udGFjdHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDb250YWN0cyI7fWk6MjE7YToyOntzOjQ6ImZyb20iO3M6OTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldnBubDJfY29udGFjdHNfQWtuZXRfU2VydmljZVZQTkwyLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTg6IkFrbmV0X1NlcnZpY2VWUE5MMiI7fWk6MjI7YToyOntzOjQ6ImZyb20iO3M6OTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ha25ldF9zZXJ2aWNldnBubDJfb3Bwb3J0dW5pdGllc19PcHBvcnR1bml0aWVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO31pOjIzO2E6Mjp7czo0OiJmcm9tIjtzOjEwNDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYXlvdXRkZWZzL2FrbmV0X3NlcnZpY2V2cG5sMl9vcHBvcnR1bml0aWVzX0FrbmV0X1NlcnZpY2VWUE5MMi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE4OiJBa25ldF9TZXJ2aWNlVlBOTDIiO319czoxMzoicmVsYXRpb25zaGlwcyI7YToxMjp7aTowO2E6MTp7czo5OiJtZXRhX2RhdGEiO3M6OTE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvcmVsYXRpb25zaGlwcy9ha25ldF9zZXJ2aWNlaW50ZXJuZXRfbGVhZHNNZXRhRGF0YS5waHAiO31pOjE7YToxOntzOjk6Im1ldGFfZGF0YSI7czo5NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL2FrbmV0X3NlcnZpY2VpbnRlcm5ldF9jb250YWN0c01ldGFEYXRhLnBocCI7fWk6MjthOjE6e3M6OToibWV0YV9kYXRhIjtzOjk5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMvYWtuZXRfc2VydmljZWludGVybmV0X29wcG9ydHVuaXRpZXNNZXRhRGF0YS5waHAiO31pOjM7YToxOntzOjk6Im1ldGFfZGF0YSI7czo5NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL2FrbmV0X3NlcnZpY2VpbnRlcm5ldF9hY2NvdW50c01ldGFEYXRhLnBocCI7fWk6NDthOjE6e3M6OToibWV0YV9kYXRhIjtzOjg1OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMvYWtuZXRfc2VydmljZXR2X2xlYWRzTWV0YURhdGEucGhwIjt9aTo1O2E6MTp7czo5OiJtZXRhX2RhdGEiO3M6ODg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvcmVsYXRpb25zaGlwcy9ha25ldF9zZXJ2aWNldHZfYWNjb3VudHNNZXRhRGF0YS5waHAiO31pOjY7YToxOntzOjk6Im1ldGFfZGF0YSI7czo4ODoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL2FrbmV0X3NlcnZpY2V0dl9jb250YWN0c01ldGFEYXRhLnBocCI7fWk6NzthOjE6e3M6OToibWV0YV9kYXRhIjtzOjkzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMvYWtuZXRfc2VydmljZXR2X29wcG9ydHVuaXRpZXNNZXRhRGF0YS5waHAiO31pOjg7YToxOntzOjk6Im1ldGFfZGF0YSI7czo4ODoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL2FrbmV0X3NlcnZpY2V2cG5sMl9sZWFkc01ldGFEYXRhLnBocCI7fWk6OTthOjE6e3M6OToibWV0YV9kYXRhIjtzOjkxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMvYWtuZXRfc2VydmljZXZwbmwyX2FjY291bnRzTWV0YURhdGEucGhwIjt9aToxMDthOjE6e3M6OToibWV0YV9kYXRhIjtzOjkxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMvYWtuZXRfc2VydmljZXZwbmwyX2NvbnRhY3RzTWV0YURhdGEucGhwIjt9aToxMTthOjE6e3M6OToibWV0YV9kYXRhIjtzOjk2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMvYWtuZXRfc2VydmljZXZwbmwyX29wcG9ydHVuaXRpZXNNZXRhRGF0YS5waHAiO319czo5OiJpbWFnZV9kaXIiO3M6MTY6IjxiYXNlcGF0aD4vaWNvbnMiO3M6NDoiY29weSI7YTo2OntpOjA7YToyOntzOjQ6ImZyb20iO3M6NTI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvQWtuZXRfSW50ZXJuZXRUYXJpZmYiO3M6MjoidG8iO3M6Mjg6Im1vZHVsZXMvQWtuZXRfSW50ZXJuZXRUYXJpZmYiO31pOjE7YToyOntzOjQ6ImZyb20iO3M6NTM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvQWtuZXRfU2VydmljZUludGVybmV0IjtzOjI6InRvIjtzOjI5OiJtb2R1bGVzL0FrbmV0X1NlcnZpY2VJbnRlcm5ldCI7fWk6MjthOjI6e3M6NDoiZnJvbSI7czo0NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9Ba25ldF9TZXJ2aWNlVFYiO3M6MjoidG8iO3M6MjM6Im1vZHVsZXMvQWtuZXRfU2VydmljZVRWIjt9aTozO2E6Mjp7czo0OiJmcm9tIjtzOjUwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL0FrbmV0X1NlcnZpY2VWUE5MMiI7czoyOiJ0byI7czoyNjoibW9kdWxlcy9Ba25ldF9TZXJ2aWNlVlBOTDIiO31pOjQ7YToyOntzOjQ6ImZyb20iO3M6NDQ6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvQWtuZXRfU3RyZWV0IjtzOjI6InRvIjtzOjIwOiJtb2R1bGVzL0FrbmV0X1N0cmVldCI7fWk6NTthOjI6e3M6NDoiZnJvbSI7czo0NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9Ba25ldF9UVlRhcmlmZiI7czoyOiJ0byI7czoyMjoibW9kdWxlcy9Ba25ldF9UVlRhcmlmZiI7fX1zOjg6Imxhbmd1YWdlIjthOjI2OntpOjA7YTozOntzOjQ6ImZyb20iO3M6NTY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvTGVhZHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJMZWFkcyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6MTthOjM6e3M6NDoiZnJvbSI7czo3MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Ba25ldF9TZXJ2aWNlSW50ZXJuZXQucGhwIjtzOjk6InRvX21vZHVsZSI7czoyMToiQWtuZXRfU2VydmljZUludGVybmV0IjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToyO2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0NvbnRhY3RzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjM7YTozOntzOjQ6ImZyb20iO3M6NzI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvQWtuZXRfU2VydmljZUludGVybmV0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MjE6IkFrbmV0X1NlcnZpY2VJbnRlcm5ldCI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6NDthOjM6e3M6NDoiZnJvbSI7czo2NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9PcHBvcnR1bml0aWVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjU7YTozOntzOjQ6ImZyb20iO3M6NzI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvQWtuZXRfU2VydmljZUludGVybmV0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MjE6IkFrbmV0X1NlcnZpY2VJbnRlcm5ldCI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6NjthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9BY2NvdW50cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTo3O2E6Mzp7czo0OiJmcm9tIjtzOjcyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FrbmV0X1NlcnZpY2VJbnRlcm5ldC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjIxOiJBa25ldF9TZXJ2aWNlSW50ZXJuZXQiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjg7YTozOntzOjQ6ImZyb20iO3M6NTY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvTGVhZHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJMZWFkcyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6OTthOjM6e3M6NDoiZnJvbSI7czo2NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Ba25ldF9TZXJ2aWNlVFYucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNToiQWtuZXRfU2VydmljZVRWIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToxMDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9BY2NvdW50cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToxMTthOjM6e3M6NDoiZnJvbSI7czo2NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Ba25ldF9TZXJ2aWNlVFYucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNToiQWtuZXRfU2VydmljZVRWIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToxMjthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Db250YWN0cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkNvbnRhY3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToxMzthOjM6e3M6NDoiZnJvbSI7czo2NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Ba25ldF9TZXJ2aWNlVFYucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNToiQWtuZXRfU2VydmljZVRWIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToxNDthOjM6e3M6NDoiZnJvbSI7czo2NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9PcHBvcnR1bml0aWVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjE1O2E6Mzp7czo0OiJmcm9tIjtzOjY2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FrbmV0X1NlcnZpY2VUVi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjE2O2E6Mzp7czo0OiJmcm9tIjtzOjU2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0xlYWRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjE3O2E6Mzp7czo0OiJmcm9tIjtzOjY5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FrbmV0X1NlcnZpY2VWUE5MMi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE4OiJBa25ldF9TZXJ2aWNlVlBOTDIiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjE4O2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FjY291bnRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjE5O2E6Mzp7czo0OiJmcm9tIjtzOjY5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FrbmV0X1NlcnZpY2VWUE5MMi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE4OiJBa25ldF9TZXJ2aWNlVlBOTDIiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjIwO2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0NvbnRhY3RzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjIxO2E6Mzp7czo0OiJmcm9tIjtzOjY5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FrbmV0X1NlcnZpY2VWUE5MMi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE4OiJBa25ldF9TZXJ2aWNlVlBOTDIiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjIyO2E6Mzp7czo0OiJmcm9tIjtzOjY0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL09wcG9ydHVuaXRpZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMzoiT3Bwb3J0dW5pdGllcyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6MjM7YTozOntzOjQ6ImZyb20iO3M6Njk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvQWtuZXRfU2VydmljZVZQTkwyLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTg6IkFrbmV0X1NlcnZpY2VWUE5MMiI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6MjQ7YTozOntzOjQ6ImZyb20iO3M6NTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL2FwcGxpY2F0aW9uL3J1X3J1LmxhbmcucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMToiYXBwbGljYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjI1O2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9hcHBsaWNhdGlvbi9lbl91cy5sYW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTE6ImFwcGxpY2F0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9fXM6NzoidmFyZGVmcyI7YToyNDp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjgzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZWludGVybmV0X2xlYWRzX0xlYWRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO31pOjE7YToyOntzOjQ6ImZyb20iO3M6OTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy9ha25ldF9zZXJ2aWNlaW50ZXJuZXRfbGVhZHNfQWtuZXRfU2VydmljZUludGVybmV0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MjE6IkFrbmV0X1NlcnZpY2VJbnRlcm5ldCI7fWk6MjthOjI6e3M6NDoiZnJvbSI7czo4OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL2FrbmV0X3NlcnZpY2VpbnRlcm5ldF9jb250YWN0c19Db250YWN0cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkNvbnRhY3RzIjt9aTozO2E6Mjp7czo0OiJmcm9tIjtzOjEwMjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL2FrbmV0X3NlcnZpY2VpbnRlcm5ldF9jb250YWN0c19Ba25ldF9TZXJ2aWNlSW50ZXJuZXQucGhwIjtzOjk6InRvX21vZHVsZSI7czoyMToiQWtuZXRfU2VydmljZUludGVybmV0Ijt9aTo0O2E6Mjp7czo0OiJmcm9tIjtzOjk5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZWludGVybmV0X29wcG9ydHVuaXRpZXNfT3Bwb3J0dW5pdGllcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjt9aTo1O2E6Mjp7czo0OiJmcm9tIjtzOjEwNzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL2FrbmV0X3NlcnZpY2VpbnRlcm5ldF9vcHBvcnR1bml0aWVzX0FrbmV0X1NlcnZpY2VJbnRlcm5ldC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjIxOiJBa25ldF9TZXJ2aWNlSW50ZXJuZXQiO31pOjY7YToyOntzOjQ6ImZyb20iO3M6ODk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy9ha25ldF9zZXJ2aWNlaW50ZXJuZXRfYWNjb3VudHNfQWNjb3VudHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJBY2NvdW50cyI7fWk6NzthOjI6e3M6NDoiZnJvbSI7czoxMDI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy9ha25ldF9zZXJ2aWNlaW50ZXJuZXRfYWNjb3VudHNfQWtuZXRfU2VydmljZUludGVybmV0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MjE6IkFrbmV0X1NlcnZpY2VJbnRlcm5ldCI7fWk6ODthOjI6e3M6NDoiZnJvbSI7czo3NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL2FrbmV0X3NlcnZpY2V0dl9sZWFkc19MZWFkcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkxlYWRzIjt9aTo5O2E6Mjp7czo0OiJmcm9tIjtzOjg3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXR2X2xlYWRzX0FrbmV0X1NlcnZpY2VUVi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO31pOjEwO2E6Mjp7czo0OiJmcm9tIjtzOjgzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXR2X2FjY291bnRzX0FjY291bnRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO31pOjExO2E6Mjp7czo0OiJmcm9tIjtzOjkwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXR2X2FjY291bnRzX0FrbmV0X1NlcnZpY2VUVi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO31pOjEyO2E6Mjp7czo0OiJmcm9tIjtzOjgzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXR2X2NvbnRhY3RzX0NvbnRhY3RzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO31pOjEzO2E6Mjp7czo0OiJmcm9tIjtzOjkwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXR2X2NvbnRhY3RzX0FrbmV0X1NlcnZpY2VUVi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO31pOjE0O2E6Mjp7czo0OiJmcm9tIjtzOjkzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXR2X29wcG9ydHVuaXRpZXNfT3Bwb3J0dW5pdGllcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjt9aToxNTthOjI6e3M6NDoiZnJvbSI7czo5NToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL2FrbmV0X3NlcnZpY2V0dl9vcHBvcnR1bml0aWVzX0FrbmV0X1NlcnZpY2VUVi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJBa25ldF9TZXJ2aWNlVFYiO31pOjE2O2E6Mjp7czo0OiJmcm9tIjtzOjgwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXZwbmwyX2xlYWRzX0xlYWRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO31pOjE3O2E6Mjp7czo0OiJmcm9tIjtzOjkzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXZwbmwyX2xlYWRzX0FrbmV0X1NlcnZpY2VWUE5MMi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE4OiJBa25ldF9TZXJ2aWNlVlBOTDIiO31pOjE4O2E6Mjp7czo0OiJmcm9tIjtzOjg2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXZwbmwyX2FjY291bnRzX0FjY291bnRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO31pOjE5O2E6Mjp7czo0OiJmcm9tIjtzOjk2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXZwbmwyX2FjY291bnRzX0FrbmV0X1NlcnZpY2VWUE5MMi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE4OiJBa25ldF9TZXJ2aWNlVlBOTDIiO31pOjIwO2E6Mjp7czo0OiJmcm9tIjtzOjg2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXZwbmwyX2NvbnRhY3RzX0NvbnRhY3RzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO31pOjIxO2E6Mjp7czo0OiJmcm9tIjtzOjk2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXZwbmwyX2NvbnRhY3RzX0FrbmV0X1NlcnZpY2VWUE5MMi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE4OiJBa25ldF9TZXJ2aWNlVlBOTDIiO31pOjIyO2E6Mjp7czo0OiJmcm9tIjtzOjk2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvYWtuZXRfc2VydmljZXZwbmwyX29wcG9ydHVuaXRpZXNfT3Bwb3J0dW5pdGllcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjt9aToyMzthOjI6e3M6NDoiZnJvbSI7czoxMDE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy9ha25ldF9zZXJ2aWNldnBubDJfb3Bwb3J0dW5pdGllc19Ba25ldF9TZXJ2aWNlVlBOTDIucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoiQWtuZXRfU2VydmljZVZQTkwyIjt9fX1zOjE2OiJ1cGdyYWRlX21hbmlmZXN0IjtzOjA6IiI7fQ==', '2012-10-19 11:37:20', 1),
('5b2b0e1f-6b6a-4b07-630c-50b87eb8e5f4', 'upload/upgrades/module/inventory_items.zip', 'cd5b0e2c109739dfb5dc9222d043e2b0', 'module', 'installed', '.12', 'Inventory Item Module', 'inventory module for keeping track of many unique items (art, jewelry, furniture, etc)', 'inventory_items', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjg6e3M6MjU6ImFjY2VwdGFibGVfc3VnYXJfdmVyc2lvbnMiO2E6MDp7fXM6NDoibmFtZSI7czoyMToiSW52ZW50b3J5IEl0ZW0gTW9kdWxlIjtzOjExOiJkZXNjcmlwdGlvbiI7czo4NjoiaW52ZW50b3J5IG1vZHVsZSBmb3Iga2VlcGluZyB0cmFjayBvZiBtYW55IHVuaXF1ZSBpdGVtcyAoYXJ0LCBqZXdlbHJ5LCBmdXJuaXR1cmUsIGV0YykiO3M6NjoiYXV0aG9yIjtzOjg6IkZyZXNob3V0IjtzOjE0OiJwdWJsaXNoZWRfZGF0ZSI7czoxMDoiMjAwNy0xMC0xMCI7czo3OiJ2ZXJzaW9uIjtzOjM6Ii4xMiI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo0OiJpY29uIjtzOjA6IiI7fXM6MTE6Imluc3RhbGxkZWZzIjthOjY6e3M6MjoiaWQiO3M6MTU6ImludmVudG9yeV9pdGVtcyI7czo0OiJjb3B5IjthOjQ6e2k6MDthOjI6e3M6NDoiZnJvbSI7czozMzoiPGJhc2VwYXRoPi9tb2R1bGUvSW52ZW50b3J5X2l0ZW1zIjtzOjI6InRvIjtzOjIzOiJtb2R1bGVzL0ludmVudG9yeV9pdGVtcyI7fWk6MTthOjI6e3M6NDoiZnJvbSI7czozMToiPGJhc2VwYXRoPi9BY2NvdW50cy9BY2NvdW50LnBocCI7czoyOiJ0byI7czoyODoibW9kdWxlcy9BY2NvdW50cy9BY2NvdW50LnBocCI7fWk6MjthOjI6e3M6NDoiZnJvbSI7czozNDoiPGJhc2VwYXRoPi9BY2NvdW50cy9EZXRhaWxWaWV3LnBocCI7czoyOiJ0byI7czozMToibW9kdWxlcy9BY2NvdW50cy9EZXRhaWxWaWV3LnBocCI7fWk6MzthOjI6e3M6NDoiZnJvbSI7czozNToiPGJhc2VwYXRoPi9BY2NvdW50cy9EZXRhaWxWaWV3Lmh0bWwiO3M6MjoidG8iO3M6MzI6Im1vZHVsZXMvQWNjb3VudHMvRGV0YWlsVmlldy5odG1sIjt9fXM6ODoibGFuZ3VhZ2UiO2E6Mjp7aTowO2E6Mzp7czo0OiJmcm9tIjtzOjM4OiI8YmFzZXBhdGg+L2FwcGxpY2F0aW9uL2FwcF9zdHJpbmdzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTE6ImFwcGxpY2F0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToxO2E6Mzp7czo0OiJmcm9tIjtzOjQwOiI8YmFzZXBhdGg+L2xhbmd1YWdlL2FjY291bnRzX3N0cmluZ3MucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJBY2NvdW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fX1zOjEwOiJsYXlvdXRkZWZzIjthOjE6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo0NjoiPGJhc2VwYXRoPi9sYXlvdXRkZWZzL2FjY291bnRzX2xheW91dF9kZWZzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO319czo1OiJiZWFucyI7YToyOntpOjA7YTo0OntzOjY6Im1vZHVsZSI7czoxNToiSW52ZW50b3J5X2l0ZW1zIjtzOjU6ImNsYXNzIjtzOjE0OiJJbnZlbnRvcnlfaXRlbSI7czo0OiJwYXRoIjtzOjQyOiJtb2R1bGVzL0ludmVudG9yeV9pdGVtcy9JbnZlbnRvcnlfaXRlbS5waHAiO3M6MzoidGFiIjtiOjE7fWk6MTthOjQ6e3M6NjoibW9kdWxlIjtzOjE2OiJJbnZlbnRvcnlfY2hhbmdlIjtzOjU6ImNsYXNzIjtzOjE2OiJJbnZlbnRvcnlfY2hhbmdlIjtzOjQ6InBhdGgiO3M6NDQ6Im1vZHVsZXMvSW52ZW50b3J5X2l0ZW1zL0ludmVudG9yeV9jaGFuZ2UucGhwIjtzOjM6InRhYiI7YjowO319czoxMzoicmVsYXRpb25zaGlwcyI7YToxOntpOjA7YTozOntzOjY6Im1vZHVsZSI7czo4OiJBY2NvdW50cyI7czo5OiJtZXRhX2RhdGEiO3M6NjE6IjxiYXNlcGF0aD4vcmVsYXRpb25zaGlwcy9hY2NvdW50c19pbnZlbnRvcnlfaXRlbXNNZXRhRGF0YS5waHAiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjM5OiI8YmFzZXBhdGg+L3ZhcmRlZnMvYWNjb3VudHNfdmFyZGVmcy5waHAiO319fXM6MTY6InVwZ3JhZGVfbWFuaWZlc3QiO3M6MDoiIjt9', '2012-11-30 09:40:08', 1);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_hash`, `system_generated_password`, `pwd_last_changed`, `authenticate_id`, `sugar_login`, `first_name`, `last_name`, `is_admin`, `external_auth_only`, `receive_notifications`, `description`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `title`, `department`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `status`, `address_street`, `address_city`, `address_state`, `address_country`, `address_postalcode`, `deleted`, `portal_only`, `show_on_employees`, `employee_status`, `messenger_id`, `messenger_type`, `reports_to_id`, `is_group`) VALUES
('1', 'admin', '$1$CtmJmwcE$xslYln4dFCAnZVDhYE9PD.', 0, NULL, NULL, 1, 'Temir', 'Umurzakov', 1, 0, 1, NULL, '2012-10-08 03:50:32', '2012-10-18 11:16:20', '1', '', 'Administrator', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'Active', NULL, NULL, '', 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `category`, `deleted`, `date_entered`, `date_modified`, `assigned_user_id`, `contents`) VALUES
('6666c83a-77a8-0a0a-d12d-50724d1ae3fb', 'global', 0, '2012-10-08 03:51:17', '2012-12-03 02:58:59', '1', 'YTozOTp7czoxMDoidXNlcl90aGVtZSI7czo1OiJBa25ldCI7czoxMzoicmVtaW5kZXJfdGltZSI7czo0OiIxODAwIjtzOjEyOiJtYWlsbWVyZ2Vfb24iO3M6Mjoib24iO3M6ODoidGltZXpvbmUiO3M6MTI6IkFzaWEvQmlzaGtlayI7czoxNjoic3dhcF9sYXN0X3ZpZXdlZCI7czowOiIiO3M6MTQ6InN3YXBfc2hvcnRjdXRzIjtzOjA6IiI7czoxOToibmF2aWdhdGlvbl9wYXJhZGlnbSI7czoyOiJnbSI7czoxMzoic3VicGFuZWxfdGFicyI7czowOiIiO3M6MTQ6Im1vZHVsZV9mYXZpY29uIjtzOjA6IiI7czo5OiJoaWRlX3RhYnMiO2E6MDp7fXM6MTE6InJlbW92ZV90YWJzIjthOjA6e31zOjc6Im5vX29wcHMiO3M6Mzoib2ZmIjtzOjE5OiJlbWFpbF9yZW1pbmRlcl90aW1lIjtpOi0xO3M6MjoidXQiO3M6MToiMSI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjU6ImRhdGVmIjtzOjU6ImQubS5ZIjtzOjU6InRpbWVmIjtzOjM6IkguaSI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6MzoiZiBsIjtzOjE0OiJ1c2VfcmVhbF9uYW1lcyI7czoyOiJvbiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MDoiIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MDtzOjE3OiJlbWFpbF9zaG93X2NvdW50cyI7aTowO3M6MTk6InRoZW1lX2N1cnJlbnRfZ3JvdXAiO3M6Njoi0JLRgdC1IjtzOjQ6ImZkb3ciO3M6MToiMCI7czoxNToibWFpbF9zbXRwc2VydmVyIjtzOjEzOiJtYWlsLmFrbmV0LmtnIjtzOjEzOiJtYWlsX3NtdHB1c2VyIjtzOjA6IiI7czoxMzoibWFpbF9zbXRwcGFzcyI7czowOiIiO3M6MTY6ImV4cG9ydF9kZWxpbWl0ZXIiO3M6MToiLCI7czoyMjoiZGVmYXVsdF9leHBvcnRfY2hhcnNldCI7czo1OiJVVEYtOCI7czoxNToiZW1haWxfbGlua190eXBlIjtzOjU6InN1Z2FyIjtzOjIwOiJjYWxlbmRhcl9wdWJsaXNoX2tleSI7czowOiIiO3M6MTc6InNpZ25hdHVyZV9kZWZhdWx0IjtzOjA6IiI7czoxNzoic2lnbmF0dXJlX3ByZXBlbmQiO2I6MDtzOjY6IkxlYWRzUSI7YTo4OntzOjY6Im1vZHVsZSI7czo1OiJMZWFkcyI7czo2OiJhY3Rpb24iO3M6NToiaW5kZXgiO3M6MTM6InNlYXJjaEZvcm1UYWIiO3M6MTI6ImJhc2ljX3NlYXJjaCI7czo1OiJxdWVyeSI7czo0OiJ0cnVlIjtzOjE3OiJzZWFyY2hfbmFtZV9iYXNpYyI7czowOiIiO3M6MjM6ImN1cnJlbnRfdXNlcl9vbmx5X2Jhc2ljIjtzOjE6IjAiO3M6MTU6Im9wZW5fb25seV9iYXNpYyI7czoxOiIwIjtzOjY6ImJ1dHRvbiI7czoxMDoi0J/QvtC40YHQuiI7fXM6MTI6Imdsb2JhbFNlYXJjaCI7YTo5OntzOjg6IkFjY291bnRzIjtzOjc6IkFjY291bnQiO3M6NToiQ2FsbHMiO3M6NDoiQ2FsbCI7czo1OiJDYXNlcyI7czo1OiJhQ2FzZSI7czo4OiJDb250YWN0cyI7czo3OiJDb250YWN0IjtzOjk6IkRvY3VtZW50cyI7czo4OiJEb2N1bWVudCI7czo1OiJMZWFkcyI7czo0OiJMZWFkIjtzOjg6Ik1lZXRpbmdzIjtzOjc6Ik1lZXRpbmciO3M6NToiTm90ZXMiO3M6NDoiTm90ZSI7czoxMzoiT3Bwb3J0dW5pdGllcyI7czoxMToiT3Bwb3J0dW5pdHkiO31zOjI1OiJSZWxlYXNlc19SRUxFQVNFX09SREVSX0JZIjtzOjEwOiJsaXN0X29yZGVyIjt9'),
('e7907b61-8b76-d6de-0237-50724ea19c46', 'ETag', 0, '2012-10-08 03:53:09', '2012-10-19 11:37:20', '1', 'YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6NDM7fQ=='),
('785afd9d-c8f6-1a7a-06d1-50724e004ebf', 'Home', 0, '2012-10-08 03:53:11', '2012-11-15 05:14:42', '1', 'YToyOntzOjg6ImRhc2hsZXRzIjthOjc6e3M6MzY6IjgzMzQxOTM5LWY3NGMtZWFiNS0yY2FhLTUwNzI0ZTVjNzc0NCI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6Ijg4ZWJhYTA0LWYwOWQtY2M5NC0wYzVjLTUwNzI0ZTg3YWEwZCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjhmMmE5MTlmLTI2ZmEtOTM2MC0xNjVlLTUwNzI0ZTRhYTM2YSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjkzYjY1MDE4LTBhNDItNmE2MS0zNTYwLTUwNzI0ZWM0YWNlNCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiOTk5NjAxNGYtNDkwYy01NDViLTEyNzktNTA3MjRlMzg1MmM2IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiYTBiNzYyMWUtZTEwOC01Y2I5LTZiZGUtNTA3MjRlODI5YmQ3IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiYzM2MTA2ZGUtMTllMy1lMGI1LTE2YjMtNTBhNDdhOWFiNjI2IjthOjQ6e3M6OToiY2xhc3NOYW1lIjtzOjI3OiJQaXBlbGluZUJ5U2FsZXNTdGFnZURhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjtzOjc6Im9wdGlvbnMiO2E6NTp7czoxNToicGJzc19kYXRlX3N0YXJ0IjtzOjEwOiIyMDEyLTExLTE1IjtzOjEzOiJwYnNzX2RhdGVfZW5kIjtzOjEwOiIyMDEzLTA1LTE1IjtzOjE3OiJwYnNzX3NhbGVzX3N0YWdlcyI7YToxMDp7aTowO3M6MTE6IlByb3NwZWN0aW5nIjtpOjE7czoxMzoiUXVhbGlmaWNhdGlvbiI7aToyO3M6MTQ6Ik5lZWRzIEFuYWx5c2lzIjtpOjM7czoxNzoiVmFsdWUgUHJvcG9zaXRpb24iO2k6NDtzOjE5OiJJZC4gRGVjaXNpb24gTWFrZXJzIjtpOjU7czoxOToiUGVyY2VwdGlvbiBBbmFseXNpcyI7aTo2O3M6MjA6IlByb3Bvc2FsL1ByaWNlIFF1b3RlIjtpOjc7czoxODoiTmVnb3RpYXRpb24vUmV2aWV3IjtpOjg7czoxMDoiQ2xvc2VkIFdvbiI7aTo5O3M6MTE6IkNsb3NlZCBMb3N0Ijt9czo1OiJ0aXRsZSI7czo0NDoi0JTQuNCw0LPRgNCw0LzQvNCwINGB0YLQsNC00LjQuSDQv9GA0L7QtNCw0LYiO3M6MTE6ImF1dG9SZWZyZXNoIjtzOjI6Ii0xIjt9czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgzOiJtb2R1bGVzL0NoYXJ0cy9EYXNobGV0cy9QaXBlbGluZUJ5U2FsZXNTdGFnZURhc2hsZXQvUGlwZWxpbmVCeVNhbGVzU3RhZ2VEYXNobGV0LnBocCI7fX1zOjU6InBhZ2VzIjthOjE6e2k6MDthOjM6e3M6NzoiY29sdW1ucyI7YToyOntpOjA7YToyOntzOjU6IndpZHRoIjtzOjM6IjYwJSI7czo4OiJkYXNobGV0cyI7YTo0OntpOjA7czozNjoiYzM2MTA2ZGUtMTllMy1lMGI1LTE2YjMtNTBhNDdhOWFiNjI2IjtpOjE7czozNjoiODhlYmFhMDQtZjA5ZC1jYzk0LTBjNWMtNTA3MjRlODdhYTBkIjtpOjI7czozNjoiOGYyYTkxOWYtMjZmYS05MzYwLTE2NWUtNTA3MjRlNGFhMzZhIjtpOjM7czozNjoiOTk5NjAxNGYtNDkwYy01NDViLTEyNzktNTA3MjRlMzg1MmM2Ijt9fWk6MTthOjI6e3M6NToid2lkdGgiO3M6MzoiNDAlIjtzOjg6ImRhc2hsZXRzIjthOjM6e2k6MDtzOjM2OiI4MzM0MTkzOS1mNzRjLWVhYjUtMmNhYS01MDcyNGU1Yzc3NDQiO2k6MTtzOjM2OiJhMGI3NjIxZS1lMTA4LTVjYjktNmJkZS01MDcyNGU4MjliZDciO2k6MjtzOjM2OiI5M2I2NTAxOC0wYTQyLTZhNjEtMzU2MC01MDcyNGVjNGFjZTQiO319fXM6MTA6Im51bUNvbHVtbnMiO3M6MToiMiI7czoxNDoicGFnZVRpdGxlTGFiZWwiO3M6MjA6IkxCTF9IT01FX1BBR0VfMV9OQU1FIjt9fX0='),
('4bc77026-3c98-c6a1-c7e3-507f94154964', 'Prospects2_PROSPECT', 0, '2012-10-18 05:33:44', '2012-10-18 05:33:44', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('d064be04-5591-bd98-2954-507f9424d280', 'ProspectLists2_PROSPECTLIST', 0, '2012-10-18 05:33:45', '2012-10-18 05:33:45', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('161d7dc7-1924-75f3-76ee-507f94af81bd', 'Cases2_CASE', 0, '2012-10-18 05:34:41', '2012-10-18 05:34:41', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('43062ed6-9408-4d78-9514-507f94c3c68f', 'Emails', 0, '2012-10-18 05:34:46', '2012-10-18 05:42:11', '1', 'YTo1OntzOjE1OiJlbWFpbDJQcmVmbGlnaHQiO2I6MTtzOjExOiJmb2N1c0ZvbGRlciI7czo4NjoiYToyOntzOjQ6ImllSWQiO3M6MzY6IjJjZDJjODIxLTk5N2UtOGRlNy05ZDU1LTUwN2Y5NjhjNDNlZSI7czo2OiJmb2xkZXIiO3M6NToiSU5CT1giO30iO3M6MTY6ImRlZmF1bHRJRUFjY291bnQiO3M6MzY6IjJjZDJjODIxLTk5N2UtOGRlNy05ZDU1LTUwN2Y5NjhjNDNlZSI7czoxMToic2hvd0ZvbGRlcnMiO3M6NzI6IllUb3hPbnRwT2pBN2N6b3pOam9pTW1Oa01tTTRNakV0T1RrM1pTMDRaR1UzTFRsa05UVXROVEEzWmprMk9HTTBNMlZsSWp0OSI7czoxMzoiZW1haWxTZXR0aW5ncyI7YTo1OntzOjE4OiJlbWFpbENoZWNrSW50ZXJ2YWwiO3M6MjoiLTEiO3M6MTg6ImFsd2F5c1NhdmVPdXRib3VuZCI7czoxOiIxIjtzOjEzOiJzZW5kUGxhaW5UZXh0IjtzOjE6IjAiO3M6MTM6InNob3dOdW1Jbkxpc3QiO3M6MjoiMjAiO3M6MjI6ImRlZmF1bHRPdXRib3VuZENoYXJzZXQiO3M6NToiVVRGLTgiO319'),
('7cd136af-a2a4-625e-c79c-50724e444fda', 'Home2_CALL', 0, '2012-10-08 03:53:11', '2012-10-08 03:53:11', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('80239cce-784a-8221-bc78-50724ed151b5', 'Home2_MEETING', 0, '2012-10-08 03:53:11', '2012-10-08 03:53:11', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('837503bc-2201-17ca-ece9-50724e5c80e5', 'Home2_OPPORTUNITY', 0, '2012-10-08 03:53:11', '2012-10-08 03:53:11', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('86c18408-0268-141f-32e3-50724e4d4a32', 'Home2_ACCOUNT', 0, '2012-10-08 03:53:11', '2012-10-08 03:53:11', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('8a1124dd-95e5-b50e-b48a-50724e217b9a', 'Home2_LEAD', 0, '2012-10-08 03:53:11', '2012-10-08 03:53:11', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('8d68229d-82c9-48d7-08be-50724ed2051f', 'Home2_SUGARFEED', 0, '2012-10-08 03:53:11', '2012-10-08 03:53:11', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('d2d862f6-4479-21ed-0f9c-5073abe815a7', 'Employees2_EMPLOYEE', 0, '2012-10-09 04:41:52', '2012-10-09 04:41:52', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('386e586c-8245-a2b7-6aed-5073ad1c7977', 'Leads2_LEAD', 0, '2012-10-09 04:51:26', '2012-10-22 04:12:29', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('3a399bcc-4531-1a5b-9ddb-5074031367d5', 'Leads', 0, '2012-10-09 10:58:36', '2012-10-19 05:52:33', '1', 'YToyOntzOjE0OiJzdWJwYW5lbExheW91dCI7YTo2OntpOjA7czoyNzoiYWtuZXRfc2VydmljZWludGVybmV0X2xlYWRzIjtpOjE7czoyMToiYWtuZXRfc2VydmljZXR2X2xlYWRzIjtpOjI7czoyNDoiYWtuZXRfc2VydmljZXZwbmwyX2xlYWRzIjtpOjM7czoxMDoiYWN0aXZpdGllcyI7aTo0O3M6NzoiaGlzdG9yeSI7aTo1O3M6OToiY2FtcGFpZ25zIjt9czoyMjoiTGlzdFZpZXdEaXNwbGF5Q29sdW1ucyI7YTowOnt9fQ=='),
('8591472c-ec80-5920-f77e-5074fbfd73ee', 'Aknet_Street2_AKNET_STREET', 0, '2012-10-10 04:36:59', '2012-10-10 04:36:59', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('401911f6-1fe7-2ebd-3aee-5074fb284ba5', 'import', 0, '2012-10-10 04:37:58', '2012-10-10 04:37:58', '1', 'YToxOntzOjEyOiJmaWVsZF92YWx1ZXMiO3M6NDM3OiJ7ImN1c3RvbV9kZWxpbWl0ZXIiOiI7IiwiY3VzdG9tX2VuY2xvc3VyZSI6IiZxdW90OyIsImltcG9ydF90eXBlIjoiaW1wb3J0Iiwic291cmNlIjoiY3N2Iiwic291cmNlX2lkIjoiIiwiaW1wb3J0X21vZHVsZSI6IkFrbmV0X1N0cmVldCIsImhhc19oZWFkZXIiOiJvbiIsImltcG9ydGxvY2FsZV9jaGFyc2V0IjoiVVRGLTgiLCJpbXBvcnRsb2NhbGVfZGF0ZWZvcm1hdCI6Im1cL2RcL1kiLCJpbXBvcnRsb2NhbGVfdGltZWZvcm1hdCI6Img6aWEiLCJpbXBvcnRsb2NhbGVfdGltZXpvbmUiOiJBc2lhXC9CaXNoa2VrIiwiaW1wb3J0bG9jYWxlX2N1cnJlbmN5IjoiLTk5IiwiaW1wb3J0bG9jYWxlX2RlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjoiMiIsImltcG9ydGxvY2FsZV9udW1fZ3JwX3NlcCI6IiwiLCJpbXBvcnRsb2NhbGVfZGVjX3NlcCI6Ii4ifSI7fQ=='),
('e79a1ae5-db33-8f03-b382-507657e7eb67', 'Aknet_ServiceInternet2_AKNET_SERVICEINTERNET', 0, '2012-10-11 05:23:44', '2012-10-11 05:23:44', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('940cb5e6-117b-8569-c063-50779f445a58', 'Contacts2_CONTACT', 0, '2012-10-12 04:41:33', '2012-10-12 04:41:33', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('bdb00fc2-1d60-8362-ce2a-5077f6e0c734', 'Contacts', 0, '2012-10-12 10:51:35', '2012-10-15 10:43:03', '1', 'YToxOntzOjE0OiJzdWJwYW5lbExheW91dCI7YToxMzp7aTowO3M6MzA6ImFrbmV0X3NlcnZpY2VpbnRlcm5ldF9jb250YWN0cyI7aToxO3M6MjQ6ImFrbmV0X3NlcnZpY2V0dl9jb250YWN0cyI7aToyO3M6Mjc6ImFrbmV0X3NlcnZpY2V2cG5sMl9jb250YWN0cyI7aTozO3M6MTA6ImFjdGl2aXRpZXMiO2k6NDtzOjc6Imhpc3RvcnkiO2k6NTtzOjk6ImRvY3VtZW50cyI7aTo2O3M6MTM6Im9wcG9ydHVuaXRpZXMiO2k6NztzOjU6ImxlYWRzIjtpOjg7czo5OiJjYW1wYWlnbnMiO2k6OTtzOjU6ImNhc2VzIjtpOjEwO3M6NDoiYnVncyI7aToxMTtzOjg6ImNvbnRhY3RzIjtpOjEyO3M6NzoicHJvamVjdCI7fX0='),
('320493ab-258a-adfb-15de-507b9db1c0d4', 'Accounts2_ACCOUNT', 0, '2012-10-15 05:21:18', '2012-10-15 05:21:18', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('94012e56-4bc7-ae4f-119e-507bd25f2cc6', 'Campaigns2_CAMPAIGN', 0, '2012-10-15 09:09:31', '2012-10-15 09:09:31', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('81db5437-50f8-6f7f-5595-507bd274ecb5', 'Opportunities2_OPPORTUNITY', 0, '2012-10-15 09:10:08', '2012-10-15 09:10:08', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('7c4bc37a-d281-3551-f22d-507bdb7bc06d', 'Accounts', 0, '2012-10-15 09:46:00', '2012-10-15 10:42:37', '1', 'YToxOntzOjE0OiJzdWJwYW5lbExheW91dCI7YToxNDp7aTowO3M6MzA6ImFrbmV0X3NlcnZpY2VpbnRlcm5ldF9hY2NvdW50cyI7aToxO3M6MjQ6ImFrbmV0X3NlcnZpY2V0dl9hY2NvdW50cyI7aToyO3M6Mjc6ImFrbmV0X3NlcnZpY2V2cG5sMl9hY2NvdW50cyI7aTozO3M6MTM6Im9wcG9ydHVuaXRpZXMiO2k6NDtzOjg6ImNvbnRhY3RzIjtpOjU7czo1OiJsZWFkcyI7aTo2O3M6MTA6ImFjdGl2aXRpZXMiO2k6NztzOjc6Imhpc3RvcnkiO2k6ODtzOjk6ImRvY3VtZW50cyI7aTo5O3M6OToiY2FtcGFpZ25zIjtpOjEwO3M6ODoiYWNjb3VudHMiO2k6MTE7czo1OiJjYXNlcyI7aToxMjtzOjQ6ImJ1Z3MiO2k6MTM7czo3OiJwcm9qZWN0Ijt9fQ=='),
('13f052c6-fdd1-7e34-f904-507bdc681bfd', 'Opportunities', 0, '2012-10-15 09:49:26', '2012-10-15 09:49:26', '1', 'YToxOntzOjE0OiJzdWJwYW5lbExheW91dCI7YTo3OntpOjA7czozNToiYWtuZXRfc2VydmljZWludGVybmV0X29wcG9ydHVuaXRpZXMiO2k6MTtzOjEwOiJhY3Rpdml0aWVzIjtpOjI7czo3OiJoaXN0b3J5IjtpOjM7czo5OiJkb2N1bWVudHMiO2k6NDtzOjg6ImNvbnRhY3RzIjtpOjU7czo1OiJsZWFkcyI7aTo2O3M6NzoicHJvamVjdCI7fX0='),
('ddbaefde-9a8c-ea57-e9ac-507fe660369f', 'ModuleBuilder', 0, '2012-10-18 11:22:48', '2012-10-18 11:22:48', '1', 'YToxOntzOjE3OiJmaWVsZHNUYWJsZUNvbHVtbiI7czozMjoieyJrZXkiOiJuYW1lIiwiZGlyZWN0aW9uIjoiQVNDIn0iO30='),
('d05eb459-1f39-0937-897c-5081378cb64c', 'Aknet_InternetTariff2_AKNET_INTERNETTARIFF', 0, '2012-10-19 11:21:39', '2012-10-19 11:21:39', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('b966e92d-09e2-9476-9e48-50813b7183a4', 'Aknet_TVTariff2_AKNET_TVTARIFF', 0, '2012-10-19 11:37:46', '2012-10-19 11:37:46', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('13e8f626-a81c-2dbb-a7e1-50b59077fdb3', 'Tasks2_TASK', 0, '2012-11-28 04:16:25', '2012-11-28 04:16:25', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('ce096053-1ff8-c1af-8dc9-50b5d790bdac', 'search', 0, '2012-11-28 09:21:39', '2012-11-28 09:21:39', '1', 'YToxOntzOjEyOiJnbG9iYWxTZWFyY2giO2E6OTp7czo4OiJBY2NvdW50cyI7czo3OiJBY2NvdW50IjtzOjU6IkNhbGxzIjtzOjQ6IkNhbGwiO3M6NToiQ2FzZXMiO3M6NToiYUNhc2UiO3M6ODoiQ29udGFjdHMiO3M6NzoiQ29udGFjdCI7czo5OiJEb2N1bWVudHMiO3M6ODoiRG9jdW1lbnQiO3M6NToiTGVhZHMiO3M6NDoiTGVhZCI7czo4OiJNZWV0aW5ncyI7czo3OiJNZWV0aW5nIjtzOjU6Ik5vdGVzIjtzOjQ6Ik5vdGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6Ik9wcG9ydHVuaXR5Ijt9fQ=='),
('ce2e5e33-12aa-e28b-afbc-50b5d7df401e', 'Home2_CASE', 0, '2012-11-28 09:21:39', '2012-11-28 09:21:39', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('ce511169-b2c2-6b24-9d18-50b5d7085c18', 'Home2_CONTACT', 0, '2012-11-28 09:21:39', '2012-11-28 09:21:39', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('ce764b66-5c67-814a-aec1-50b5d740e869', 'Home2_DOCUMENT', 0, '2012-11-28 09:21:39', '2012-11-28 09:21:39', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('ce99a07f-2283-df83-7415-50b5d78b5cd4', 'Home2_NOTE', 0, '2012-11-28 09:21:39', '2012-11-28 09:21:39', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('70475f52-829b-0a99-2c3c-50b6db5a7716', 'Meetings2_MEETING', 0, '2012-11-29 03:51:22', '2012-11-29 03:51:22', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('a2b1a3e5-8a44-78b4-8fde-50b6db74f1a8', 'Calls2_CALL', 0, '2012-11-29 03:51:36', '2012-11-29 03:51:36', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('23d3373d-3458-66db-354b-50b87f7928c6', 'Inventory_items2_INVENTORY_ITEM', 0, '2012-11-30 09:40:23', '2012-11-30 09:40:23', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `versions`
--

INSERT INTO `versions` (`id`, `deleted`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `file_version`, `db_version`) VALUES
('c5ff737e-879b-6ff5-c08e-50724dbb8a07', 0, '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '1', 'Chart Data Cache', '3.5.1', '3.5.1'),
('c924cbcc-cd24-db74-dc77-50724d3e435a', 0, '2012-10-08 03:50:32', '2012-10-08 03:50:32', '1', '1', 'htaccess', '3.5.1', '3.5.1'),
('24f0d6d5-4669-a4d3-cae9-50b89aa3be8f', 0, '2012-11-30 11:36:53', '2012-11-30 11:36:53', '1', '1', 'Rebuild Relationships', '4.0.0', '4.0.0'),
('2e0d1f01-4481-478c-20ad-50b89a6fcb4a', 0, '2012-11-30 11:36:53', '2012-11-30 11:36:53', '1', '1', 'Rebuild Extensions', '4.0.0', '4.0.0');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
