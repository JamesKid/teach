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
-- Table structure for table `duxcmst_ptuser`
--

DROP TABLE IF EXISTS `duxcmst_ptuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duxcmst_ptuser` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `gid` int(10) NOT NULL DEFAULT '1',
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '用户密码',
  `nicename` varchar(20) DEFAULT NULL COMMENT '昵称',
  `regtime` int(10) DEFAULT NULL COMMENT '注册时间',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `ip` varchar(15) DEFAULT '未知' COMMENT 'ip地址',
  `status` int(1) unsigned DEFAULT '1' COMMENT '使用状态 0删除 1:允许 2：未审核',
  `loginnum` int(10) DEFAULT '1' COMMENT '登录次数',
  `keep` int(1) NOT NULL DEFAULT '0',
  `type` varchar(255) DEFAULT NULL COMMENT '类型 0: 未定义 1: 会员  2: 教师 3: 机构',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duxcmst_ptuser`
--

LOCK TABLES `duxcmst_ptuser` WRITE;
/*!40000 ALTER TABLE `duxcmst_ptuser` DISABLE KEYS */;
INSERT INTO `duxcmst_ptuser` VALUES (1,1,'天杰1','21232f297a57a5a743894a0e4a801fc3','天杰1',1350138971,1443851956,'192.168.1.30',1,91,1,'1'),(2,1,'天杰2','21232f297a57a5a743894a0e4a801fc3','天杰2',1350138971,1443851956,'192.168.1.30',1,1,1,'1');
/*!40000 ALTER TABLE `duxcmst_ptuser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-03 18:23:43
