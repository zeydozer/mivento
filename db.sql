CREATE DATABASE  IF NOT EXISTS `mivento` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mivento`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: mivento
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (32,'Test','2022-10-01');
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (359,'Rina','Sweeney',161711075760,'urna.Nunc@Integertincidunt.com',5306300252,566,32),(360,'Vivien','Hall',161905234439,'faucibus.id@aliquetmetus.edu',5304886681,2829,32),(361,'Clark','Waters',168206271762,'at@loremvitaeodio.net',5321711590,3637,32),(362,'Kalia','Berg',160605173277,'a@vehicula.net',5308408752,4179,32),(363,'Aladdin','Hayden',162809279629,'Maecenas.mi@egetmollis.org',5324387843,3739,32),(364,'Kylynn','Macdonald',165804230224,'hendrerit.consectetuer@utlacusNulla.org',5305287615,2262,32),(365,'Prescott','Castro',168101093386,'leo.elementum@utnullaCras.com',5301544982,4017,32),(366,'Linus','Stein',165112155022,'sit.amet@Donec.net',5304285436,2081,32),(367,'Daphne','Giles',161709208662,'egestas.ligula@necenimNunc.ca',5307662108,533,32),(368,'Donovan','Hodge',168002252180,'Mauris.vestibulum.neque@CurabiturmassaVestibulum.com',5328904203,4354,32),(369,'Malik','Harrington',161004024541,'non@Quisqueornare.edu',5302242891,2580,32),(370,'Blair','Hicks',1628030484261,'ornare.Fusce@diamatpretium.com',5323146931,91,32),(371,'Scarlet','Pate',162106086701,'orci.quis@sagittisplaceratCras.co.uk',5328123221,291,32),(372,'Hannah','Mcdowell',164207062391,'rutrum@tristiqueneque.org',5324795456,3170,32),(373,'Murphy','Kennedy',168311281888,'a.neque.Nullam@Incondimentum.co.uk',5309437949,3155,32),(374,'Felix','Newman',161101204517,'egestas@diam.edu',5328005365,2585,32),(375,'Caesar','Rojas',167207091815,'Praesent.interdum@acorci.co.uk',5327325529,2447,32),(376,'Octavius','Shaffer',169305110687,'ipsum@et.ca',5323037164,2446,32),(377,'Roanna','Kramer',164603183205,'ac.metus@arcuVestibulum.co.uk',5305699006,1862,32),(378,'Nathaniel','Wooten',165304233082,'lacus.vestibulum@vitaerisusDuis.ca',5325625352,80,32),(379,'Karen','Hill',164104042413,'facilisis@urna.edu',5309634135,4629,32),(380,'Marny','Warner',166910092086,'Donec.sollicitudin@blanditcongueIn.co.uk',5309211317,2619,32),(381,'Upton','Lynch',167705054141,'pede.Cum.sociis@nequeSedeget.edu',5306292542,3069,32),(382,'Callie','Bishop',162803048426,'ipsum.Suspendisse@sitametrisus.com',5324928898,2943,32),(383,'Xaviera','Barton',165810181346,'ultrices.Duis@tristique.org',5323366890,985,32),(384,'Hedwig','Benton',160601300767,'Vivamus@imperdiet.co.uk',5327677142,2434,32),(385,'Nolan','Bass',160005274485,'Aliquam@ipsumPhasellusvitae.com',5324682430,292,32),(386,'Armand','Hess',165905090972,'Proin@enim.org',5325917179,215,32),(387,'Leroy','George',169612164278,'sit.amet@Donec.nett',5329835280,3249,32),(388,'Catherine','Hammond',166204119661,'ut.lacus.Nulla@lorem.org',5325716200,4912,32),(389,'Thane','Stanley',169102266120,'arcu.et@aliquamadipiscing.edu',5324588610,1282,32),(390,'Yetta','Watson',166803090411,'neque.Sed@arcu.ca',5309544240,933,32),(391,'Oprah','Jacobs',165505294909,'odio@Donec.ca',5301124051,4828,32),(392,'Zia','Kirk',164612196545,'et.lacinia.vitae@leo.net',5303972214,2213,32),(393,'Giselle','Harvey',169012223401,'at.pede@orci.edu',5324682431,4467,32),(394,'Hedy','Murray',160503214843,'quis.arcu.vel@acarcu.org',5304112469,4648,32),(395,'Kendall','Dudley',163612209910,'ipsum@et.caa',5301224849,4666,32),(396,'Christopher','Warren',164603260383,'mus@acmetus.co-uk',5327551478,3909,32),(397,'Belle','Knowles',166204119660,'ut.mi@pede.co-uk',5326641437,25,32);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mivento'
--

--
-- Dumping routines for database 'mivento'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-28  0:27:21
