-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (i386)
--
-- Host: localhost    Database: duxcmst
-- ------------------------------------------------------
-- Server version	5.1.73-log

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
-- Table structure for table `duxcmst_admin_menu`
--

DROP TABLE IF EXISTS `duxcmst_admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duxcmst_admin_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `module` varchar(250) DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `module` (`module`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duxcmst_admin_menu`
--

LOCK TABLES `duxcmst_admin_menu` WRITE;
/*!40000 ALTER TABLE `duxcmst_admin_menu` DISABLE KEYS */;
INSERT INTO `duxcmst_admin_menu` VALUES (1,0,'首页',NULL,1),(3,1,'系统设置','setting',1),(4,1,'模型管理','model_manage',1),(10,0,'扩展',NULL,1),(11,10,'扩展模型','expand_model',1),(12,10,'自定义变量','fragment',1),(13,10,'内容替换','replace',1),(14,10,'TAG管理','tags',1),(15,10,'推荐位管理','position',1),(16,10,'附件管理','upload_file',1),(20,0,'系统用户',NULL,1),(21,20,'管理组管理','user_group',1),(22,20,'管理员管理','user',1),(23,20,'后台登录记录','log',1),(24,1,'插件管理','plugin',1),(25,1,'程序升级','upgrade',1),(26,1,'语言管理','lang',1),(30,0,'栏目',NULL,1),(31,30,'栏目管理','category',1),(40,0,'内容','',1),(41,40,'内容管理','content',1),(50,0,'表单','',1),(51,50,'表单设置','form',1),(60,0,'统计系统',NULL,1),(61,60,'用户统计','statistics_user',1),(62,60,'流量统计','statistics_ip',1),(63,60,'账单统计','statistics_pay',1),(70,0,'审核系统',NULL,1),(71,70,'用户发布审核','check_user',1),(72,70,'教师发布审核','check_teacher',1),(73,70,'机构发布审核','check_org',1),(80,0,'平台用户',NULL,1),(81,80,'会员用户','ptuser_member',1),(82,80,'教师用户','ptuser_teacher',1),(83,80,'机构用户','ptuser_org',1);
/*!40000 ALTER TABLE `duxcmst_admin_menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-03 16:31:07
