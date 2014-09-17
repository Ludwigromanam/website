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
  CONSTRAINT `fk_members_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_members_2` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
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
