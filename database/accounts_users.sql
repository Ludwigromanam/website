CREATE DATABASE  IF NOT EXISTS `accounts` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `accounts`;
-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: accounts
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
  `failed_password_answer_window_count` int(11) NOT NULL DEFAULT '0' COMMENT 'How many answers have been answered incorrectly to the security question',
  `failed_password_answer_window_start` datetime DEFAULT NULL COMMENT 'When was the last security question answered incorrectly',
  `comment` varchar(512) DEFAULT NULL COMMENT 'General comment string',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'John Q Public','john q public','$1$zeFcIKZg$CsB2RTUiEE0.DW26wCkqn1','','2014-09-15 23:29:13','none@here.org','none@here.org','','','','N','Y','N','N','N','2014-09-15 23:29:13','2014-09-15 23:29:13','2014-09-15 23:29:13','2014-09-15 23:29:13',0,'2014-09-15 23:29:13',0,'2014-09-15 23:29:13',NULL);
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

-- Dump completed on 2014-09-16  7:10:21
