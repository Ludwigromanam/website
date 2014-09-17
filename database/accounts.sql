-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: accounts
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `application` varchar(45) NOT NULL COMMENT 'String for the application',
  `description` varchar(256) DEFAULT NULL COMMENT 'General description for the applicaiton.',
  `application_lowered` varchar(45) NOT NULL COMMENT 'Lower case application. Used in searching for the application name.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `application_lowered_UNIQUE` (`application_lowered`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,'/','Primary application','/');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `role_name_lowered` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name_lowered_UNIQUE` (`role_name_lowered`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key to the table',
  `name` varchar(45) NOT NULL COMMENT 'Descriptive name of the region',
  `is_default` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'All','Y'),(2,'Roseville','N'),(3,'Colfax','N'),(4,'Grass Valley','N'),(5,'Auburn','N');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key to the table',
  `application_id` int(11) NOT NULL COMMENT 'Pointer to the Applications table entry for this user',
  `user_name` varchar(256) DEFAULT NULL COMMENT 'Name associated with the account',
  `user_name_lowered` varchar(256) DEFAULT NULL COMMENT 'UserName in lower case. Use for searching by user name which is not case sensitive.',
  `password` varchar(256) DEFAULT NULL COMMENT 'Hashed password',
  `security_stamp` varchar(256) DEFAULT NULL COMMENT 'ID for the account validation',
  `last_activity_date` datetime DEFAULT NULL COMMENT 'Date when the last login to the account',
  `email` varchar(256) DEFAULT NULL COMMENT 'Email address for the account questions',
  `email_lowered` varchar(256) DEFAULT NULL COMMENT 'Email address in lower case. Used in searching for Email address which is not case sensitive.',
  `mobile_pin` varchar(16) DEFAULT NULL COMMENT 'PIN for a mobile telephone answer',
  `password_question` varchar(256) DEFAULT NULL COMMENT 'Question for the security concerns',
  `password_answer` varchar(256) DEFAULT NULL COMMENT 'Hashed answer to the security question',
  `must_change_password` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'on the next logon does the account need a new passsword?',
  `is_anonymous` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'Is the account anonymous?',
  `is_admin` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'Does the account have administrator privileges?',
  `is_approved` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'Has the account been approved?',
  `is_locked_out` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'Is the user an administrator for the web site?',
  `create_date` datetime DEFAULT NULL COMMENT 'Date when the account was created',
  `last_login_date` datetime DEFAULT NULL COMMENT 'Last date when the account was logged into the system',
  `last_password_change_date` datetime DEFAULT NULL COMMENT 'Date when the password was last changed',
  `last_lockout_date` datetime DEFAULT NULL COMMENT 'Date when the account was locked out',
  `failed_password_attempt_window_count` int(11) NOT NULL DEFAULT '0' COMMENT 'How many attempts at the password have been answered incorrectly',
  `failed_password_attempt_window_start` datetime DEFAULT NULL COMMENT 'When was the last password answered incorrectly',
  `failed_password_answer_count` int(11) NOT NULL DEFAULT '0' COMMENT 'How many answers have been answered incorrectly to the security question',
  `failed_password_answer_window_start` datetime DEFAULT NULL COMMENT 'When was the last security question answered incorrectly',
  `comment` varchar(512) DEFAULT NULL COMMENT 'General comment string',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key to the table',
  `user_id` int(11) DEFAULT NULL COMMENT 'Pointer to the users table',
  `region_id` int(11) DEFAULT NULL COMMENT 'Pointer to the regions table for the member',
  `first_name` varchar(128) DEFAULT NULL COMMENT 'First and middle name',
  `last_name` varchar(128) DEFAULT NULL COMMENT 'last name',
  `suffix` varchar(15) DEFAULT NULL COMMENT 'suffix to the name, i.e. "Jr."',
  `gender` varchar(1) NOT NULL DEFAULT 'F' COMMENT 'Gender. ''F'' or ''M''',
  `daytime_phone` varchar(45) DEFAULT NULL COMMENT 'Daytime telephone number',
  `evening_phone` varchar(45) DEFAULT NULL COMMENT 'Evening telephone number',
  `cell_phone` varchar(45) DEFAULT NULL COMMENT 'Cell telephone number',
  `address` varchar(128) DEFAULT NULL COMMENT 'Address line',
  `city` varchar(45) DEFAULT NULL COMMENT 'City line',
  `state` varchar(10) DEFAULT NULL COMMENT 'State line. Usually "CA"',
  `zipcode` varchar(10) DEFAULT NULL COMMENT 'ZIP Code',
  `note` text COMMENT 'Note information text',
  `is_active` varchar(1) NOT NULL DEFAULT 'Y' COMMENT 'Is the member active with the organization?',
  `is_homeless` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'Is the member homeless?',
  `date_created` datetime DEFAULT NULL COMMENT 'Date/Time when the record was created. Expressed in UTC.',
  `photo` blob COMMENT 'Photo of the member',
  PRIMARY KEY (`id`),
  KEY `fk_members_1_idx` (`user_id`),
  KEY `fk_members_2_idx` (`region_id`),
  CONSTRAINT `fk_members_2` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_members_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key to the table',
  `region` int(11) NOT NULL DEFAULT '1' COMMENT 'The pointer to the specific region for he news article.',
  `title` varchar(128) DEFAULT NULL COMMENT 'Title of the article',
  `slug` varchar(128) DEFAULT NULL COMMENT 'Slug for the article',
  `text` text COMMENT 'Text for the article',
  `date_created` datetime NOT NULL COMMENT 'Date/Time when the article was created',
  `byline` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_news_1_idx` (`region`),
  CONSTRAINT `fk_news_1` FOREIGN KEY (`region`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paths`
--

DROP TABLE IF EXISTS `paths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application` int(11) NOT NULL,
  `path_name` varchar(256) NOT NULL,
  `path_name_lowered` varchar(256) NOT NULL COMMENT 'lower case of the path_name. Used in searching for the path_name without case.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `path_name_lowered_UNIQUE` (`path_name_lowered`),
  KEY `fk_paths_1_idx` (`application`),
  CONSTRAINT `fk_paths_1` FOREIGN KEY (`application`) REFERENCES `applications` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paths`
--

LOCK TABLES `paths` WRITE;
/*!40000 ALTER TABLE `paths` DISABLE KEYS */;
/*!40000 ALTER TABLE `paths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalization_all_users`
--

DROP TABLE IF EXISTS `personalization_all_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personalization_all_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key to the table',
  `page_settings` blob COMMENT 'Values for the personalization settings',
  `last_update_date` datetime DEFAULT NULL COMMENT 'Date/Time when the row was last updated',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalization_all_users`
--

LOCK TABLES `personalization_all_users` WRITE;
/*!40000 ALTER TABLE `personalization_all_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `personalization_all_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalization_per_user`
--

DROP TABLE IF EXISTS `personalization_per_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personalization_per_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key to the table',
  `user_id` int(11) NOT NULL COMMENT 'Pointer to the users table',
  `path_id` int(11) NOT NULL COMMENT 'Pointer to the paths table',
  `page_settings` blob COMMENT 'Settings for this user on this path',
  `last_updated_date` datetime DEFAULT NULL COMMENT 'Date when the row was last updated',
  PRIMARY KEY (`id`),
  KEY `fk_personalizationPerUser_1_idx` (`path_id`),
  KEY `fk_personalizationPerUser_2_idx` (`user_id`),
  CONSTRAINT `fk_personalizationPerUser_1` FOREIGN KEY (`path_id`) REFERENCES `paths` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_personalizationPerUser_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalization_per_user`
--

LOCK TABLES `personalization_per_user` WRITE;
/*!40000 ALTER TABLE `personalization_per_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `personalization_per_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key to the table',
  `user_id` int(11) NOT NULL COMMENT 'Pointer to the user row',
  `property_name` varchar(45) NOT NULL COMMENT 'Property name',
  `string_value` varchar(256) DEFAULT NULL COMMENT 'String value for the property',
  `binary_value` blob COMMENT 'Binary value for the property',
  PRIMARY KEY (`id`),
  KEY `fk_profiles_1_idx` (`user_id`),
  CONSTRAINT `fk_profiles_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_versions`
--

DROP TABLE IF EXISTS `schema_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key to the table',
  `feature` varchar(256) DEFAULT NULL COMMENT 'Feature ID',
  `compatible_version` varchar(256) DEFAULT NULL COMMENT 'Version of the schema where it is compatible',
  `current_version` varchar(1) NOT NULL DEFAULT 'Y' COMMENT 'TRUE if this is the current version',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_versions`
--

LOCK TABLES `schema_versions` WRITE;
/*!40000 ALTER TABLE `schema_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `schema_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key to the table',
  `user_id` int(11) DEFAULT NULL COMMENT 'Reference to the users table',
  `role_id` int(11) DEFAULT NULL COMMENT 'Reference to the roles table',
  PRIMARY KEY (`id`),
  KEY `fk_user_roles_1_idx` (`user_id`),
  KEY `fk_user_roles_2_idx` (`role_id`),
  CONSTRAINT `fk_user_roles_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_roles_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

