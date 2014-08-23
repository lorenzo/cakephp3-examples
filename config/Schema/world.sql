# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.17)
# Database: cakefest
# Generation Time: 2014-08-23 09:37:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table answers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `answers`;

CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_type_option_id` int(11) NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;

INSERT INTO `answers` (`id`, `question_id`, `user_id`, `question_type_option_id`, `comment`)
VALUES
	(1,1,1,2,'We never nuke our planets'),
	(2,1,2,1,'Never surrender!'),
	(3,2,1,1,'This is on answer'),
	(4,9,1,1,'Another answer');

/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table organizations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `organizations`;

CREATE TABLE `organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;

INSERT INTO `organizations` (`id`, `name`, `url`)
VALUES
	(1,'Spartan Federation','http://sidmeiersalphacentauri.wikia.com/wiki/Spartan_Federation'),
	(2,'Morgan Industries','http://sidmeiersalphacentauri.wikia.com/wiki/Morgan_Industries');

/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table question_type_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `question_type_options`;

CREATE TABLE `question_type_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_type_id` int(11) NOT NULL,
  `label` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `question_type_options` WRITE;
/*!40000 ALTER TABLE `question_type_options` DISABLE KEYS */;

INSERT INTO `question_type_options` (`id`, `question_type_id`, `label`)
VALUES
	(1,1,'Yes'),
	(2,1,'No'),
	(3,2,'1'),
	(4,2,'2'),
	(5,2,'3'),
	(6,2,'4'),
	(7,2,'5'),
	(8,3,'For'),
	(9,3,'We don\'t know yet'),
	(10,3,'Against');

/*!40000 ALTER TABLE `question_type_options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table question_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `question_types`;

CREATE TABLE `question_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `question_types` WRITE;
/*!40000 ALTER TABLE `question_types` DISABLE KEYS */;

INSERT INTO `question_types` (`id`, `name`, `description`)
VALUES
	(1,'Boolean','Please answer yes or no'),
	(2,'Range','Please answer 1 (lowest) to 5 (highest)'),
	(3,'Opinion','Please answer what\'s your default vote for this item');

/*!40000 ALTER TABLE `question_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table questions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `question_type_id` int(11) NOT NULL,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;

INSERT INTO `questions` (`id`, `user_id`, `text`, `question_type_id`, `preferences`)
VALUES
	(1,3,'In case of alien invasion, would you nuke the entire planet?',1,'{\"foo\":\"bar\",\"something\":\"crazy\"}'),
	(2,1,'What\'s your expected expenses for the planetary defenses?',1,NULL),
	(3,1,'Would you vote for a trade embargo if a colony is conquered?',3,NULL),
	(4,1,'Hello world',2,NULL),
	(5,1,'Hello world',2,NULL),
	(6,1,'Hello world 2',2,NULL),
	(7,1,'Hello world 3',2,NULL),
	(8,1,'Hello world 4',2,NULL),
	(9,1,'Hello world 5',2,NULL),
	(10,1,'Hello world 6',2,NULL);

/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table questions_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `questions_tags`;

CREATE TABLE `questions_tags` (
  `question_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`question_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `questions_tags` WRITE;
/*!40000 ALTER TABLE `questions_tags` DISABLE KEYS */;

INSERT INTO `questions_tags` (`question_id`, `tag_id`)
VALUES
	(1,1),
	(1,3),
	(2,2),
	(2,4),
	(3,2),
	(3,3),
	(3,4);

/*!40000 ALTER TABLE `questions_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;

INSERT INTO `tags` (`id`, `name`)
VALUES
	(1,'Fun'),
	(2,'Boring'),
	(3,'Interesting'),
	(4,'Arousing');

/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `password`, `role`, `active`, `first_name`, `last_name`, `created`, `modified`, `organization_id`)
VALUES
	(1,'morgan@org.com','password','admin',1,'Morgan','','2014-08-10 13:36:19','2014-08-11 23:09:11',2),
	(2,'spartan@org.com','password','admin',1,'Spartan','','2014-08-10 13:36:38','2014-08-11 23:09:19',1),
	(3,'user@planet.com','password','user',1,'User','','2014-08-10 13:39:24','2014-08-10 13:39:24',0);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
