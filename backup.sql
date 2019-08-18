-- MariaDB dump 10.17  Distrib 10.4.5-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ctfd
-- ------------------------------------------------------
-- Server version	10.4.5-MariaDB-1:10.4.5+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('b295b033364d');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `category` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`requirements`)),
  `type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT 'standard',
  PRIMARY KEY (`id`),
  KEY `awards_ibfk_1` (`team_id`),
  KEY `awards_ibfk_2` (`user_id`),
  CONSTRAINT `awards_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `awards_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenges`
--

DROP TABLE IF EXISTS `challenges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `challenges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_attempts` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `category` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`requirements`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
INSERT INTO `challenges` VALUES (1,'Welcome gift','We are glad that you made it here. <br>\r\nHere is a gift, open it. <br>\r\n***ZmxhZ3t3ZWxjb21lX3RvX2NyeXB0aXhDVEZfYmFzZTY0aXRpc30K***',0,10,'Make yourself comfortable','standard','visible',NULL),(2,'Secret Code','Here is a program which gives you flag only after giving the secret code. <br>\r\nCan you get the flag? ',0,25,'Make yourself comfortable','standard','visible',NULL),(3,'Mixed Up','Here is a text file containing some information. Try to gain this information, hopefully you will find your flag.',0,50,'Moving On','standard','visible',NULL),(4,'RSA','You have been eavesdropping a conversation between two suspects who may know something about the flag. The conversation goes like this:<br>\r\n\r\n***HackCrypt1337:*** Do you know, primes are great way to hide secrets!<br>\r\n\r\n***n00b1001:*** Whatt..? primes? I don\'t believe you<br>\r\n\r\n***HackCrypt1337:*** You are being too loud!, remember this number,    3073416132828889709313918053975078361304902307, it will be useful to understand the flag. and one more is......<br>\r\nOh no! Someone is here, you can guess other one yourself. It is trivial anyways.<br>\r\nHere, keep this number safe with you!<br>\r\n1217323181436745647195685030986548015017805440<br>\r\n\r\nAnd they leave....<br>\r\n\r\nGet the flag!',0,100,'TBD','standard','visible',NULL),(5,'XOR','Recently, H4c3R1337 came across a weird machine, which keeps spitting 0 or 1. He wrote down the complete sequence as follows:<br>\r\n\r\n000010010101110100011000010100110011110101100010011000000001111100110101011000110101010100110100010010110101101001010101001101100110110000111100011000010001111000001011000011010000100000000001010101100011100000100101<br>\r\n\r\nHe decided to find out what it means, but could barely manage to recover an incomplete python script from the machine.<br>\r\nHelp him to find out \r\n',0,150,'TBD','standard','visible',NULL),(6,'Mycipher','Recently, n00b learned about **Hashing**.<br>\r\nBut, he finds nothing special in it. So he decides to make a Hashing algorithm himself.<br>\r\nNow he is boasting about it. He is so confident that he even provided the algorithm and challenges everyone to crack it.<br>\r\nPut him back onto the ground\r\n',0,150,'TBD','standard','visible',NULL),(7,'Stego','\"This is just noise... There is nothing....\"<br>\r\n\r\nIs it?',0,150,'TBD','standard','visible',NULL),(8,'rev1','Here is an executable. You know what to do.<br>\r\n\r\n**Note**: The flag format is as usual flag{XXXX...}',0,200,'TBD','standard','visible',NULL),(9,'app','Here is a zip file.<br>\r\nWe were wandering what it does....but colorful tiles are awesome! <br>\r\n\r\nCan you find the secret?<br>\r\n\r\n**Note:** The flag is in usual format i.e. flag{XXXX...}',0,50,'TBD','standard','visible',NULL),(10,'rev2','Some weird kind of key checking is going on for the flag.<br>\r\nSee if you can get the right key!\r\n',0,250,'TBD','standard','visible',NULL),(11,'web1','Remember, you have to get the flag.',0,10,'TBD','standard','visible',NULL);
/*!40000 ALTER TABLE `challenges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'ctf_version','2.1.3'),(2,'ctf_theme','dark-theme'),(3,'ctf_name','CryptixCTF'),(4,'start',NULL),(5,'user_mode','teams'),(6,'challenge_visibility','private'),(7,'registration_visibility','public'),(8,'score_visibility','public'),(9,'account_visibility','public'),(10,'end',NULL),(11,'freeze',NULL),(12,'verify_emails',NULL),(13,'mail_server',NULL),(14,'mail_port',NULL),(15,'mail_tls',NULL),(16,'mail_ssl',NULL),(17,'mail_username',NULL),(18,'mail_password',NULL),(19,'mail_useauth',NULL),(20,'setup','1'),(21,'ctf_logo','d1b73029614694c29e13b8b0cc311256/CryptixDark.png'),(22,'css','');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamic_challenge`
--

DROP TABLE IF EXISTS `dynamic_challenge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamic_challenge` (
  `id` int(11) NOT NULL,
  `initial` int(11) DEFAULT NULL,
  `minimum` int(11) DEFAULT NULL,
  `decay` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `dynamic_challenge_ibfk_1` FOREIGN KEY (`id`) REFERENCES `challenges` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_challenge`
--

LOCK TABLES `dynamic_challenge` WRITE;
/*!40000 ALTER TABLE `dynamic_challenge` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamic_challenge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `challenge_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `files_ibfk_1` (`challenge_id`),
  CONSTRAINT `files_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'challenge','86f2fdef0988e4d3b7546439dac6eacc/rev_easy',2,NULL),(2,'challenge','fc4c5b3788f54427d665a1df9e4ad9d5/info.txt',3,NULL),(3,'challenge','56bb522678d60e8b4289d8d325d0e995/encrypt.py',5,NULL),(4,'challenge','96fdd11a9dbc2c3e84532d48dce80df5/hash.py',6,NULL),(5,'challenge','e4d12636fa1edf4a2ddaba54020fa781/hashed.txt',6,NULL),(6,'challenge','861fd020273b59506ce9e86fef10c1ac/useless.png',7,NULL),(7,'challenge','9eef6afd31fc78759ce1ebc3a534d4fc/passphrase',8,NULL),(8,'challenge','18eb5359c898f2e039c6392eef66e318/app-debug',9,NULL),(9,'standard','d1b73029614694c29e13b8b0cc311256/CryptixDark.png',NULL,NULL),(11,'challenge','82281510f0102060d320d019574ee9f2/keygen',10,NULL);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flags`
--

DROP TABLE IF EXISTS `flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge_id` int(11) DEFAULT NULL,
  `type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flags_ibfk_1` (`challenge_id`),
  CONSTRAINT `flags_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flags`
--

LOCK TABLES `flags` WRITE;
/*!40000 ALTER TABLE `flags` DISABLE KEYS */;
INSERT INTO `flags` VALUES (1,1,'static','flag{welcome_to_cryptixCTF_base64itis}',NULL),(2,2,'static','flag{sTring5_To_tH3_R35cU3}',NULL),(3,3,'static','flag{freqanalysisworkxzz}',NULL),(4,4,'static','flag{w3ak_R5A_bad}',NULL),(5,5,'static','flag{R4nd0m_s33d_s4v3d_y0u}',NULL),(6,6,'static','flag{Pr1m35_4r3_4W3s0m3}',NULL),(7,7,'static','flag{st3g4n0gr4phy_i5_34sy}',NULL),(8,8,'static','flag{r34ding_4553mbly_d4mn}',NULL),(9,9,'static','flag{To6i4s_&_Tri5}',NULL),(10,10,'static','flag{w34k_s3cur1ty_l0l}',NULL),(11,11,'static','flag{Pr3tty_b4s1c_5tuff}',NULL);
/*!40000 ALTER TABLE `flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hints`
--

DROP TABLE IF EXISTS `hints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `challenge_id` int(11) DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`requirements`)),
  PRIMARY KEY (`id`),
  KEY `hints_ibfk_1` (`challenge_id`),
  CONSTRAINT `hints_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hints`
--

LOCK TABLES `hints` WRITE;
/*!40000 ALTER TABLE `hints` DISABLE KEYS */;
/*!40000 ALTER TABLE `hints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `draft` tinyint(1) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `auth_required` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `route` (`route`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`draft` in (0,1)),
  CONSTRAINT `CONSTRAINT_2` CHECK (`hidden` in (0,1)),
  CONSTRAINT `CONSTRAINT_3` CHECK (`auth_required` in (0,1))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'None','index','<div class=\"row\">\r\n    <div class=\"col-md-6 offset-md-3\">\r\n        <img class=\"w-100 mx-auto d-block\" style=\"max-width: 500px;padding: 50px;padding-top: 14vh;\" src=\"themes/dark-theme/static/img/CryptixLight.png\" />\r\n        <h3 class=\"text-center\">\r\n            <p>Welcome to CryptixCTF, a jeopardy-style Capture The Flag event by <a href=\"https://amalthea.iitgn.ac.in\">Amalthea</a>!</p>\r\n            <!-- <p>Follow us on social media:</p>\r\n            <a href=\"https://twitter.com/ctfdio\"><i class=\"fab fa-twitter fa-2x\" aria-hidden=\"true\"></i></a>&nbsp;\r\n            <a href=\"https://facebook.com/ctfdio\"><i class=\"fab fa-facebook fa-2x\" aria-hidden=\"true\"></i></a>&nbsp;\r\n            <a href=\"https://github.com/ctfd\"><i class=\"fab fa-github fa-2x\" aria-hidden=\"true\"></i></a> -->\r\n        </h3>\r\n        <br>\r\n        <h4 class=\"text-center\">\r\n            <a href=\"/register/\">Click here</a> to register yourself. login with the credentials after registration.<br> After logging in, you must form a team of 1,2 or 3 members.\r\n        </h4>\r\n    </div>\r\n</div>',0,0,0);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solves`
--

DROP TABLE IF EXISTS `solves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solves` (
  `id` int(11) NOT NULL,
  `challenge_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `challenge_id` (`challenge_id`,`team_id`),
  UNIQUE KEY `challenge_id_2` (`challenge_id`,`user_id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `solves_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `solves_ibfk_2` FOREIGN KEY (`id`) REFERENCES `submissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `solves_ibfk_3` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `solves_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solves`
--

LOCK TABLES `solves` WRITE;
/*!40000 ALTER TABLE `solves` DISABLE KEYS */;
/*!40000 ALTER TABLE `solves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `ip` varchar(46) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provided` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `challenge_id` (`challenge_id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `submissions_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge_id` int(11) DEFAULT NULL,
  `value` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_ibfk_1` (`challenge_id`),
  CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oauth_id` int(11) DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affiliation` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bracket` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `captain_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `id` (`id`,`oauth_id`),
  UNIQUE KEY `oauth_id` (`oauth_id`),
  KEY `team_captain_id` (`captain_id`),
  CONSTRAINT `team_captain_id` FOREIGN KEY (`captain_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CONSTRAINT_1` CHECK (`hidden` in (0,1)),
  CONSTRAINT `CONSTRAINT_2` CHECK (`banned` in (0,1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking`
--

DROP TABLE IF EXISTS `tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(46) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tracking_ibfk_1` (`user_id`),
  CONSTRAINT `tracking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking`
--

LOCK TABLES `tracking` WRITE;
/*!40000 ALTER TABLE `tracking` DISABLE KEYS */;
INSERT INTO `tracking` VALUES (1,NULL,'172.19.0.1',1,'2019-08-14 11:20:20'),(2,NULL,'172.22.0.1',1,'2019-08-17 10:36:01');
/*!40000 ALTER TABLE `tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unlocks`
--

DROP TABLE IF EXISTS `unlocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unlocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unlocks_ibfk_1` (`team_id`),
  KEY `unlocks_ibfk_2` (`user_id`),
  CONSTRAINT `unlocks_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `unlocks_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unlocks`
--

LOCK TABLES `unlocks` WRITE;
/*!40000 ALTER TABLE `unlocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `unlocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oauth_id` int(11) DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affiliation` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bracket` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `id` (`id`,`oauth_id`),
  UNIQUE KEY `oauth_id` (`oauth_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`hidden` in (0,1)),
  CONSTRAINT `CONSTRAINT_2` CHECK (`banned` in (0,1)),
  CONSTRAINT `CONSTRAINT_3` CHECK (`verified` in (0,1))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'alphasupreme77','$bcrypt-sha256$2b,12$DE13TNnLY/sMyNEwD5uBqe$JvW38ZUfg.mxv69krDitwK99by6MH8G','dishankgoel1729@gmail.com','admin',NULL,NULL,NULL,NULL,NULL,1,0,0,NULL,'2019-06-23 07:57:45');
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

-- Dump completed on 2019-08-18 12:38:30
