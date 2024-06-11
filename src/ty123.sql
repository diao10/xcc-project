-- MySQL dump 10.13  Distrib 5.5.15, for Win32 (x86)
--
-- Host: localhost    Database: tyyy
-- ------------------------------------------------------
-- Server version	5.5.15

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
-- Table structure for table `ty_building`
--

DROP TABLE IF EXISTS `ty_building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ty_building` (
  `delete_flag` bigint(2) DEFAULT '0',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `building_f` int(11) DEFAULT NULL COMMENT '楼层号',
  `building_v` varchar(20000) DEFAULT NULL COMMENT '楼层内容',
  `theme_id` bigint(20) DEFAULT NULL,
  `sender` varchar(20) DEFAULT NULL COMMENT '发送者',
  `sender_id` bigint(20) DEFAULT NULL,
  `sender_type` bigint(1) DEFAULT '0',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `flag` bigint(20) DEFAULT '0',
  `delete_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ty_building`
--

LOCK TABLES `ty_building` WRITE;
/*!40000 ALTER TABLE `ty_building` DISABLE KEYS */;
INSERT INTO `ty_building` VALUES (0,19,1,'<p>神经病啊<br/></p>',16,'司咏',65,0,'2017-03-07 06:28:47',0,NULL),(0,20,1,'<p>呵呵哒<img src=\"../dist/uploadImg/14888682167231.png\" title=\"\" alt=\"\"/></p>',17,'司咏',65,0,'2017-03-07 06:30:29',0,NULL),(0,21,1,'<p>西奈西奈西奈</p>',18,'司咏',65,0,'2017-03-07 06:31:40',0,NULL),(0,22,1,'<p>神经病</p>',19,'司咏',65,0,'2017-03-07 06:33:30',0,NULL),(0,23,1,'<p>你是神经病吧<br/></p>',20,'司咏',65,0,'2017-03-07 06:36:13',0,NULL),(0,24,1,'<p>编辑文本内容ffffffffffffffffff</p>',21,'司咏',65,0,'2017-03-07 06:40:48',0,NULL),(0,25,1,'<p>编辑文本内容休息休息</p><p><img src=\"../dist/uploadImg/14888739677681.png\" title=\"\" alt=\"\"/></p>',22,'司咏',65,0,'2017-03-07 08:06:23',0,NULL),(0,26,2,'<p>编辑文本内容阿达的</p><p><img src=\"../dist/uploadImg/1488874043686dhk.png\" title=\"\" alt=\"\"/></p>',22,'郭云春晓',36,1,'2017-03-07 08:07:37',0,NULL),(0,27,3,'<p>编辑文本内容啊啊啊</p><p><img src=\"../dist/uploadImg/14888741642241.png\" title=\"\" alt=\"\"/></p>',22,'郭云春晓',36,1,'2017-03-07 08:09:37',0,NULL),(0,28,4,'<p>编辑文本内容</p>',22,'郭云春晓',36,1,'2017-03-07 08:17:40',0,NULL),(0,29,5,'<p>编辑文本内容阿萨德撒所大惺惺惜惺惺想奥奥</p><p><img src=\"../dist/uploadImg/1488874666872dhk.png\" title=\"\" alt=\"\"/></p>',22,'郭云春晓',36,1,'2017-03-07 08:18:05',0,NULL),(0,30,6,'<p>编辑文本内容xxx<br/></p>',22,'郭云春晓',36,1,'2017-03-07 08:18:33',0,NULL),(0,31,1,'<p>啊实打实的</p><p><img src=\"../dist/uploadImg/14889569021461.png\" title=\"\" alt=\"\"/></p>',27,'司咏',65,0,'2017-03-08 07:08:30',0,NULL),(0,32,2,'<p>阿达</p><p><img src=\"../dist/uploadImg/14889569210961.png\" title=\"\" alt=\"\"/></p>',27,'司咏',65,0,'2017-03-08 07:08:45',0,NULL),(0,33,1,'<p>啊实打实大所所多</p><p><img src=\"../dist/uploadImg/14889575440931.png\" title=\"\" alt=\"\"/></p>',28,'司咏',65,0,'2017-03-08 07:19:09',0,NULL),(0,34,2,'<p>啊实打实的下水道</p><p><br/></p><p><img src=\"../dist/uploadImg/14889575572481.png\" title=\"\" alt=\"\"/></p>',28,'司咏',65,0,'2017-03-08 07:19:20',0,NULL),(0,35,3,'<p>啊实打实的<img src=\"../dist/uploadImg/14889577061401.png\" title=\"\" alt=\"\"/></p>',28,'司咏',65,0,'2017-03-08 07:21:49',0,NULL),(0,36,4,'<p>阿达四大<img src=\"../dist/uploadImg/14889577156531.png\" title=\"\" alt=\"\"/></p>',28,'司咏',65,0,'2017-03-08 07:21:58',0,NULL),(0,37,5,'<p>阿达四大<img src=\"../dist/uploadImg/14889577294411.png\" title=\"\" alt=\"\"/></p>',28,'司咏',65,0,'2017-03-08 07:22:13',0,NULL),(0,38,1,'<p>啊实打实的<img src=\"../dist/uploadImg/14889577518241.png\" title=\"\" alt=\"\"/></p>',29,'司咏',65,0,'2017-03-08 07:22:35',0,NULL),(0,39,1,'<p>阿萨斯 <img src=\"../dist/uploadImg/14889577700071.png\" title=\"\" alt=\"\"/></p>',30,'司咏',65,0,'2017-03-08 07:22:53',0,NULL),(0,40,2,'<p>阿达四大QQ<img src=\"../dist/uploadImg/14889577778591.png\" title=\"\" alt=\"\"/></p>',30,'司咏',65,0,'2017-03-08 07:23:01',0,NULL),(0,41,1,'<p>大大撒多</p><p><img src=\"../dist/uploadImg/14889621870011.png\" title=\"\" alt=\"\"/></p>',31,'司咏',65,0,'2017-03-08 08:36:32',0,NULL),(0,42,1,'<p>111111<br/></p>',32,'司咏',65,0,'2017-03-08 08:37:38',0,NULL),(0,43,1,'<p>sadsad</p>',33,'司咏',65,0,'2017-03-08 08:53:25',0,NULL);
/*!40000 ALTER TABLE `ty_building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ty_char_to_power`
--

DROP TABLE IF EXISTS `ty_char_to_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ty_char_to_power` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `char_name` varchar(10) NOT NULL,
  `cid` bigint(20) NOT NULL,
  `power_name` varchar(30) NOT NULL,
  `pid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1658 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ty_char_to_power`
--

LOCK TABLES `ty_char_to_power` WRITE;
/*!40000 ALTER TABLE `ty_char_to_power` DISABLE KEYS */;
INSERT INTO `ty_char_to_power` VALUES (1493,'超级管理员',1,'会员*',1),(1494,'超级管理员',1,'会员：增加',11),(1495,'超级管理员',1,'会员：删除',12),(1496,'超级管理员',1,'会员：全查',13),(1497,'超级管理员',1,'会员：修改',14),(1498,'超级管理员',1,'会员：积分变更',15),(1499,'超级管理员',1,'会员：等级-增加',111),(1500,'超级管理员',1,'会员：等级-删除',112),(1501,'超级管理员',1,'会员：等级-修改',113),(1502,'超级管理员',1,'会员：等级-全查',114),(1503,'超级管理员',1,'会员：职阶-增加',121),(1504,'超级管理员',1,'会员：职阶-删除',122),(1505,'超级管理员',1,'会员：职阶-修改',123),(1506,'超级管理员',1,'会员：职阶-全查',124),(1507,'超级管理员',1,'会员：签到-全查',131),(1508,'超级管理员',1,'会员：签到-删除',133),(1509,'超级管理员',1,'会员：签到-补签',134),(1510,'超级管理员',1,'员工*',2),(1511,'超级管理员',1,'员工：增加',21),(1512,'超级管理员',1,'员工：删除',22),(1513,'超级管理员',1,'员工：修改',23),(1514,'超级管理员',1,'员工：全查',24),(1515,'超级管理员',1,'员工：角色-增加',25),(1516,'超级管理员',1,'员工：角色-编辑',26),(1517,'超级管理员',1,'员工：角色-删除',27),(1518,'超级管理员',1,'员工：角色-查看',28),(1519,'超级管理员',1,'员工：权限-增加',211),(1520,'超级管理员',1,'员工：权限-删除',212),(1521,'超级管理员',1,'员工：权限-查看',213),(1522,'超级管理员',1,'消息管理*',3),(1523,'超级管理员',1,'消息：留言主题-查看',31),(1524,'超级管理员',1,'消息：留言主题-删除',32),(1525,'超级管理员',1,'消息：留言主题-修改',33),(1526,'超级管理员',1,'消息：站内消息-查看',34),(1527,'超级管理员',1,'消息：站内消息-修改',35),(1528,'超级管理员',1,'消息：站内消息-添加',36),(1529,'超级管理员',1,'消息：站内消息-删除',37),(1530,'超级管理员',1,'消息：留言楼-修改',311),(1531,'超级管理员',1,'消息：留言楼-回复',312),(1532,'超级管理员',1,'健康管理*',4),(1533,'超级管理员',1,'健康：会员信息-查询',41),(1534,'超级管理员',1,'健康：会员信息-添加会员健康',42),(1535,'超级管理员',1,'健康：会员信息-添加家属',43),(1536,'超级管理员',1,'健康：家属信息-查询',44),(1537,'超级管理员',1,'健康：家属信息-添加健康信息',45),(1538,'超级管理员',1,'健康：健康信息-查看',46),(1539,'超级管理员',1,'健康：健康信息-修改',48),(1540,'超级管理员',1,'健康：健康信息-删除',49),(1541,'超级管理员',1,'健康：健康信息-修改诊断书',411),(1542,'超级管理员',1,'健康：健康信息-查看诊断书',412),(1543,'超级管理员',1,'信息管理*',5),(1544,'超级管理员',1,'信息管理：医师-查找',51),(1545,'超级管理员',1,'消息管理：医师-删除',52),(1546,'超级管理员',1,'消息管理：医师-增加',53),(1547,'超级管理员',1,'消息管理：医师-修改',54),(1548,'超级管理员',1,'信息管理：医师-修改图片',55),(1549,'超级管理员',1,'信息：贴士-增加',56),(1550,'超级管理员',1,'信息：贴士-删除',57),(1551,'超级管理员',1,'信息：贴士-修改',58),(1552,'超级管理员',1,'信息：贴士-查找',59),(1553,'超级管理员',1,'信息：图片管理',511),(1554,'超级管理员',1,'信息：访问-查找',512),(1555,'超级管理员',1,'信息：访问-修改',513),(1585,'普通员工',4,'会员*',1),(1586,'普通员工',4,'会员：全查',13),(1587,'普通员工',4,'会员：修改',14),(1588,'普通员工',4,'会员：积分变更',15),(1589,'普通员工',4,'会员：等级-全查',114),(1590,'普通员工',4,'会员：职阶-全查',124),(1591,'普通员工',4,'会员：签到-全查',131),(1592,'普通员工',4,'会员：签到-删除',133),(1593,'普通员工',4,'会员：签到-补签',134),(1594,'普通员工',4,'消息管理*',3),(1595,'普通员工',4,'消息：站内消息-查看',34),(1596,'专家',3,'消息管理*',3),(1597,'专家',3,'消息：留言主题-查看',31),(1598,'专家',3,'消息：留言楼-回复',312),(1599,'专家',3,'健康管理*',4),(1600,'专家',3,'健康：会员信息-查询',41),(1601,'专家',3,'健康：健康信息-查看诊断书',412),(1602,'管理员',2,'会员*',1),(1603,'管理员',2,'会员：增加',11),(1604,'管理员',2,'会员：删除',12),(1605,'管理员',2,'会员：全查',13),(1606,'管理员',2,'会员：修改',14),(1607,'管理员',2,'会员：积分变更',15),(1608,'管理员',2,'会员：等级-增加',111),(1609,'管理员',2,'会员：等级-删除',112),(1610,'管理员',2,'会员：等级-修改',113),(1611,'管理员',2,'会员：等级-全查',114),(1612,'管理员',2,'会员：职阶-增加',121),(1613,'管理员',2,'会员：职阶-删除',122),(1614,'管理员',2,'会员：职阶-修改',123),(1615,'管理员',2,'会员：职阶-全查',124),(1616,'管理员',2,'会员：签到-全查',131),(1617,'管理员',2,'会员：签到-删除',133),(1618,'管理员',2,'会员：签到-补签',134),(1619,'管理员',2,'员工*',2),(1620,'管理员',2,'员工：增加',21),(1621,'管理员',2,'员工：删除',22),(1622,'管理员',2,'员工：修改',23),(1623,'管理员',2,'员工：全查',24),(1624,'管理员',2,'消息管理*',3),(1625,'管理员',2,'消息：留言主题-查看',31),(1626,'管理员',2,'消息：留言主题-删除',32),(1627,'管理员',2,'消息：留言主题-修改',33),(1628,'管理员',2,'消息：站内消息-查看',34),(1629,'管理员',2,'消息：站内消息-修改',35),(1630,'管理员',2,'消息：站内消息-添加',36),(1631,'管理员',2,'消息：站内消息-删除',37),(1632,'管理员',2,'消息：留言楼-修改',311),(1633,'管理员',2,'消息：留言楼-回复',312),(1634,'管理员',2,'健康管理*',4),(1635,'管理员',2,'健康：会员信息-查询',41),(1636,'管理员',2,'健康：会员信息-添加会员健康',42),(1637,'管理员',2,'健康：会员信息-添加家属',43),(1638,'管理员',2,'健康：家属信息-查询',44),(1639,'管理员',2,'健康：家属信息-添加健康信息',45),(1640,'管理员',2,'健康：健康信息-查看',46),(1641,'管理员',2,'健康：健康信息-修改',48),(1642,'管理员',2,'健康：健康信息-删除',49),(1643,'管理员',2,'健康：健康信息-修改诊断书',411),(1644,'管理员',2,'健康：健康信息-查看诊断书',412),(1645,'管理员',2,'信息管理*',5),(1646,'管理员',2,'信息管理：医师-查找',51),(1647,'管理员',2,'消息管理：医师-删除',52),(1648,'管理员',2,'消息管理：医师-增加',53),(1649,'管理员',2,'消息管理：医师-修改',54),(1650,'管理员',2,'信息管理：医师-修改图片',55),(1651,'管理员',2,'信息：贴士-增加',56),(1652,'管理员',2,'信息：贴士-删除',57),(1653,'管理员',2,'信息：贴士-修改',58),(1654,'管理员',2,'信息：贴士-查找',59),(1655,'管理员',2,'信息：图片管理',511),(1656,'管理员',2,'信息：访问-查找',512),(1657,'管理员',2,'信息：访问-修改',513);
/*!40000 ALTER TABLE `ty_char_to_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ty_doctor`
--

DROP TABLE IF EXISTS `ty_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ty_doctor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doctor_name` varchar(10) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `flag` bigint(2) DEFAULT '0',
  `img_id` varchar(255) DEFAULT NULL,
  `jobs` varchar(50) DEFAULT NULL,
  `shortd` varchar(50) DEFAULT NULL,
  `emp_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ty_doctor`
--

LOCK TABLES `ty_doctor` WRITE;
/*!40000 ALTER TABLE `ty_doctor` DISABLE KEYS */;
INSERT INTO `ty_doctor` VALUES (3,'围魏救赵','是个神经病','小赵',0,'dist\\uploadImg\\1488867985526_21.jpg','神经科 ','神经病',46),(4,'夜神月','333','111',0,'dist\\uploadImg\\1488962163034_1.png','123','123',43);
/*!40000 ALTER TABLE `ty_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ty_emp_char`
--

DROP TABLE IF EXISTS `ty_emp_char`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ty_emp_char` (
  `cid` bigint(11) NOT NULL AUTO_INCREMENT,
  `char_name` varchar(10) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ty_emp_char`
--

LOCK TABLES `ty_emp_char` WRITE;
/*!40000 ALTER TABLE `ty_emp_char` DISABLE KEYS */;
INSERT INTO `ty_emp_char` VALUES (1,'超级管理员'),(2,'管理员'),(3,'专家'),(4,'普通员工');
/*!40000 ALTER TABLE `ty_emp_char` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ty_employee`
--

DROP TABLE IF EXISTS `ty_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ty_employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_Id` varchar(20) NOT NULL,
  `emp_Name` varchar(20) NOT NULL,
  `emp_Char` bigint(20) NOT NULL,
  `emp_Password` varchar(20) NOT NULL COMMENT '密码',
  `emp_Admin` varchar(50) NOT NULL,
  `emp_Gender` varchar(3) NOT NULL,
  `emp_Tel` varchar(15) NOT NULL,
  `emp_Email` varchar(50) NOT NULL,
  `emp_Address` varchar(100) DEFAULT NULL,
  `filed1` varchar(50) DEFAULT NULL,
  `filed2` varchar(50) DEFAULT NULL,
  `filed3` varchar(50) DEFAULT NULL,
  `delete_flag` int(1) DEFAULT '0',
  `create_Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `delete_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ty_employee`
--

LOCK TABLES `ty_employee` WRITE;
/*!40000 ALTER TABLE `ty_employee` DISABLE KEYS */;
INSERT INTO `ty_employee` VALUES (2,'v93862659','张鑫磊q',2,'123','ssqqq','男','12312312312312','ss@sina.com','asdasdasdaqw',NULL,NULL,NULL,0,'2017-02-22 11:36:56',NULL),(36,'V91Q2a7','郭云春晓',1,'123','gycx','男','13888888888','213456342@qq.com','撒旦法规和',NULL,NULL,NULL,0,'2017-02-20 10:48:06',NULL),(43,'v659O94k','夜神月',3,'123','yyy','男','13099900099','','',NULL,NULL,NULL,0,'2017-03-07 05:55:01',NULL),(44,'V65993MJ','赵华琛',2,'123123','辰辰','男','12312313212','1123@qq.com','ajflkajfk',NULL,NULL,NULL,0,'2017-03-07 05:57:17',NULL),(45,'v6608Ys','瞒天过海',4,'111','admin','男','111','111@qq.com','111',NULL,NULL,NULL,1,'2017-03-07 06:07:33','2017-03-07'),(46,'V660DVF','围魏救赵',2,'123456','admin1','男','111','111@qq.com','111',NULL,NULL,NULL,1,'2017-03-07 06:17:53','2017-03-07'),(47,'V661xof','张三',3,'zhangsan123','zhang','男','1394120789','968574123@qq.com','刷开发版考生报考的说法根本可是过不了十五',NULL,NULL,NULL,0,'2017-03-07 06:29:37',NULL),(48,'V77Arm','普通员工',4,'1234','pptt','男','13999900099','','',NULL,NULL,NULL,0,'2017-03-08 08:32:33',NULL);
/*!40000 ALTER TABLE `ty_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ty_fz`
--

DROP TABLE IF EXISTS `ty_fz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ty_fz` (
  `id` bigint(20) NOT NULL,
  `cd` varchar(255) DEFAULT NULL,
  `delete_flag` int(1) DEFAULT '0',
  `filed1` varchar(255) DEFAULT NULL,
  `filed2` varchar(255) DEFAULT NULL,
  `filed3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ty_fz`
--

LOCK TABLES `ty_fz` WRITE;
/*!40000 ALTER TABLE `ty_fz` DISABLE KEYS */;
INSERT INTO `ty_fz` VALUES (1,'12346',0,NULL,NULL,NULL),(2,'红红火火恍恍惚惚',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ty_fz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ty_mem_class`
--

DROP TABLE IF EXISTS `ty_mem_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ty_mem_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_max` int(11) NOT NULL,
  `class_min` int(11) NOT NULL,
  `class_name` varchar(10) NOT NULL,
  `delete_flag` int(3) NOT NULL DEFAULT '0',
  `delete_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ty_mem_class`
--

LOCK TABLES `ty_mem_class` WRITE;
/*!40000 ALTER TABLE `ty_mem_class` DISABLE KEYS */;
INSERT INTO `ty_mem_class` VALUES (1,1999,0,'见习',0,NULL),(2,3999,2000,'助教',0,NULL),(3,7999,4000,'讲师',0,NULL),(4,15999,8000,'导师',0,NULL),(5,31999,16000,'专家',0,NULL),(6,63999,32000,'教授',0,NULL),(7,117999,64000,'首席',0,NULL),(8,999999999,128000,'元老',0,NULL);
/*!40000 ALTER TABLE `ty_mem_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ty_mem_family`
--

DROP TABLE IF EXISTS `ty_mem_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ty_mem_family` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mem_Id` bigint(20) NOT NULL,
  `fam_Name` varchar(20) NOT NULL,
  `fam_Gender` varchar(3) NOT NULL,
  `delete_Flag` int(1) DEFAULT '0',
  `delete_date` date DEFAULT NULL,
  `fam_Birth` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ty_mem_family`
--

LOCK TABLES `ty_mem_family` WRITE;
/*!40000 ALTER TABLE `ty_mem_family` DISABLE KEYS */;
INSERT INTO `ty_mem_family` VALUES (5,65,'多多','男',1,NULL,'2017-03-15'),(6,65,'秋月爱丽','女',0,NULL,'2017-03-02'),(7,65,'王二','男',0,NULL,'2017-03-03');
/*!40000 ALTER TABLE `ty_mem_family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ty_mem_health`
--

DROP TABLE IF EXISTS `ty_mem_health`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ty_mem_health` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mem_Id` bigint(20) NOT NULL,
  `mem_Name` varchar(20) NOT NULL,
  `mem_Type` varchar(10) DEFAULT NULL,
  `diag_Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `diag_Ill` varchar(50) DEFAULT NULL,
  `diag_Hos` varchar(100) DEFAULT NULL,
  `medication` varchar(255) DEFAULT NULL,
  `diag_opinion` varchar(1000) DEFAULT NULL,
  `upload_Date` date DEFAULT NULL,
  `aegrotat_url` varchar(255) DEFAULT NULL,
  `filed1` varchar(255) DEFAULT NULL,
  `filed2` varchar(255) DEFAULT NULL,
  `filed3` varchar(255) DEFAULT NULL,
  `delete_Flag` int(1) DEFAULT '0',
  `fam_Name` varchar(10) DEFAULT NULL,
  `fam_Id` bigint(20) DEFAULT NULL,
  `delete_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ty_mem_health`
--

LOCK TABLES `ty_mem_health` WRITE;
/*!40000 ALTER TABLE `ty_mem_health` DISABLE KEYS */;
INSERT INTO `ty_mem_health` VALUES (115,65,'司咏','会员','2017-03-10 16:00:00','痛疼','神经病医院','神经用药','是个神经病 a','2017-03-16',NULL,NULL,NULL,NULL,0,NULL,0,NULL),(116,65,'司咏','会员','2017-03-10 16:00:00','呜呜呜呜呜呜','呜呜呜呜','呜呜呜呜','呜呜呜呜呜呜','2017-03-07','/dist/uploadImg/1488867520062tianyun.png',NULL,NULL,NULL,1,NULL,0,NULL),(117,66,'张启山','会员','2017-03-08 16:00:00','rtwe ','erte ','ewtwe ','ewr','2017-03-07','/dist/uploadImg/1488867846672999.jpg',NULL,NULL,NULL,0,NULL,0,NULL),(118,65,'司咏','会员','2017-03-01 16:00:00','ssss','ssss','ssssss','ssssssss','2017-03-07','dist\\uploadImg\\1488869007054_tianyun.png',NULL,NULL,NULL,0,NULL,0,NULL),(119,65,'司咏','会员','2017-03-09 16:00:00','大幅度发顺丰的地方F ','SDFSADFadadada ds ad asd 非要和他而恒大二哈安而后 安徽  啊然后啊','Sdsasdadq阿达四大所多','啊实打实大所大所多',NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL),(120,65,'司咏','家属','2017-03-08 16:00:00','让前台','热提问','儿童','二','2017-03-07','/dist/uploadImg/1488869517861999.jpg',NULL,NULL,NULL,1,NULL,0,NULL),(121,65,'司咏','会员','2017-03-01 16:00:00','12313','12313','12313','12313',NULL,'',NULL,NULL,NULL,0,NULL,0,NULL),(122,65,'司咏','家属','2017-03-09 16:00:00','1','231231','123123','123123','2017-03-08','/dist/uploadImg/14889607434211.png',NULL,NULL,NULL,1,'王二',7,NULL),(123,65,'司咏','家属','2017-03-02 16:00:00','啊啊啊啊','啊啊啊啊','阿萨大声道','啊实打实大','2017-03-08','/dist/uploadImg/14889607763821.png',NULL,NULL,NULL,1,'王二',7,NULL),(124,65,'司咏','家属','2017-03-10 16:00:00','adfafadf','发达','阿发','阿发撒','2017-03-08','/dist/uploadImg/1488962169395999.jpg',NULL,NULL,NULL,1,NULL,0,NULL),(125,66,'张启山','会员','2017-03-02 16:00:00','且风格','十大歌手','发给是','施工队','2017-03-08','/dist/uploadImg/1488962242450999.jpg',NULL,NULL,NULL,0,NULL,0,NULL),(126,65,'司咏','家属','2017-03-08 16:00:00','爱的发放','放','地方','打啊','2017-03-08','/dist/uploadImg/1488962421958999.jpg',NULL,NULL,NULL,1,NULL,0,NULL),(127,65,'秋月爱丽','家属','2017-03-02 16:00:00','看看','看看','看看','看看',NULL,'',NULL,NULL,NULL,0,NULL,6,NULL),(128,65,'司咏','会员','2017-03-01 16:00:00','大大大滴滴答答','对对对','的','顶顶顶顶',NULL,'',NULL,NULL,NULL,0,NULL,0,NULL),(129,65,'司咏','家属','2017-03-09 16:00:00','师傅告诉','是否会','的双方各','单身狗','2017-03-08','/dist/uploadImg/1488962988416999.jpg',NULL,NULL,NULL,1,'多多',5,NULL),(130,65,'多多','家属','2017-03-10 16:00:00','阿古斯','发给','发给','分数了污染天王热帖',NULL,NULL,NULL,NULL,NULL,1,NULL,5,NULL),(131,65,'秋月爱丽','家属','2017-03-16 16:00:00','发给','大','爱迪生','阿萨德','2017-03-08','/dist/uploadImg/1488963775819999.jpg',NULL,NULL,NULL,0,NULL,6,NULL),(132,65,'司咏','会员','2017-03-02 16:00:00','休息休息','信息','信息','信息',NULL,'',NULL,NULL,NULL,0,NULL,0,NULL),(133,65,'多多','家属','2017-03-08 16:00:00','信息','    顶顶顶顶','发发发','  反反复复凤飞飞',NULL,'',NULL,NULL,NULL,1,NULL,5,NULL);
/*!40000 ALTER TABLE `ty_mem_health` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ty_mem_level`
--

DROP TABLE IF EXISTS `ty_mem_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ty_mem_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_min` int(11) NOT NULL,
  `level_max` int(11) NOT NULL,
  `level_name` varchar(10) NOT NULL,
  `delete_flag` int(11) DEFAULT '0',
  `delete_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ty_mem_level`
--

LOCK TABLES `ty_mem_level` WRITE;
/*!40000 ALTER TABLE `ty_mem_level` DISABLE KEYS */;
INSERT INTO `ty_mem_level` VALUES (1,0,999,'普通会员',0,NULL),(2,1000,4999,'银卡会员',0,NULL),(3,5000,24999,'金卡会员',0,NULL),(4,25000,124999,'钻石会员',0,NULL),(5,125000,999999999,'皇冠会员',0,NULL);
/*!40000 ALTER TABLE `ty_mem_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ty_member`
--

DROP TABLE IF EXISTS `ty_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ty_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mem_Id` varchar(20) NOT NULL,
  `referrer_Id` varchar(20) NOT NULL,
  `mem_Name` varchar(20) NOT NULL,
  `mem_pwd` varchar(20) NOT NULL,
  `mem_gender` varchar(3) DEFAULT NULL,
  `mem_email` varchar(20) NOT NULL,
  `mem_tel` varchar(15) NOT NULL,
  `mem_birth` date DEFAULT NULL,
  `mem_address` varchar(255) DEFAULT NULL,
  `last_Login_Time` date DEFAULT NULL,
  `the_Login_Time` date DEFAULT NULL,
  `mem_integral` int(11) DEFAULT '500',
  `mem_class` int(11) DEFAULT '1',
  `mem_class_name` varchar(20) DEFAULT '见习',
  `mem_point` int(11) DEFAULT '0',
  `mem_level` int(11) DEFAULT '5',
  `mem_level_name` varchar(20) DEFAULT '无会员',
  `sign_count` int(5) DEFAULT '0',
  `delete_flag` int(1) DEFAULT '0',
  `filed1` varchar(255) DEFAULT NULL,
  `filed2` varchar(255) DEFAULT NULL,
  `filed3` varchar(255) DEFAULT NULL,
  `create_Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `delete_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ty_member`
--

LOCK TABLES `ty_member` WRITE;
/*!40000 ALTER TABLE `ty_member` DISABLE KEYS */;
INSERT INTO `ty_member` VALUES (65,'1','v936kt97','司咏','123123','女','372944573@qq.com','12312312312','1970-01-02','123','2017-03-08','2017-03-08',1010000,8,'元老',125,1,'普通会员',2,0,'1266666','129999',NULL,'2017-02-27 02:11:25',NULL),(66,'v594622i','V91Q2a7','张启山','333','男','zqs333@163.com','19011304040','2005-12-07','老九门hhh','2017-03-07','2017-03-07',500,1,'见习',0,5,'无会员',1,0,'1','11',NULL,'2017-03-07 01:50:26',NULL),(67,'v595IZc','V91Q2a7','二月红123','222','男','222@222.com','12222222222','2017-03-01','噗噗个噗啊啊啊啊','2017-03-07','2017-03-07',9500,4,'导师',9000,2,'金卡会员',1,0,'1212121','33333111',NULL,'2017-03-07 02:00:35',NULL),(68,'V659491h','1','赵华琛','123','男','666@qq.com','12312312312','2017-03-26','暗访哈地方发发的发的说法都是','2017-03-08','2017-03-08',10500,4,'导师',1,1,'普通会员',1,0,'12345','6666',NULL,'2017-03-07 05:56:34',NULL),(69,'V660c9197','1','唉呀妈呀','123','男','111@qq.com','12312312312','2017-03-02','为啥人工费换个方式111',NULL,NULL,500,1,'见习',0,5,'无会员',0,0,'12331','1122331',NULL,'2017-03-07 06:15:44',NULL),(70,'v661GYQ','1','阿西吧','123','女','446@qq.com','32131232145','2017-03-03','东方红立刻恢复',NULL,NULL,500,1,'见习',0,5,'无会员',0,0,'777','777',NULL,'2017-03-07 06:24:44',NULL),(71,'V6b9498F','1','as','123','男','2131232@qq.com','12312312312','2017-03-15','123123123',NULL,NULL,500,1,'见习',NULL,NULL,'无会员',0,0,'123','123',NULL,'2017-03-07 07:54:09',NULL),(72,'V6b59c98','1','qwe','123','女','1234562789@qq.com','12312312312','2017-03-21','123123',NULL,NULL,500,1,'见习',NULL,NULL,'无会员',0,0,'123','123123',NULL,'2017-03-07 07:56:36',NULL),(73,'v6BjW96','1','123123','123123123','男','123123@qq.hgfd','12312312311','2017-03-28','123123123',NULL,NULL,500,1,'见习',NULL,NULL,'无会员',0,0,'123123','123123',NULL,'2017-03-07 07:59:03',NULL),(74,'v6bXZ95','1','123123','123123','男','123123@qq.hgf','12312312312','2017-03-21','12312313',NULL,NULL,500,1,'见习',NULL,5,'无会员',0,0,'123','123123',NULL,'2017-03-07 08:01:23',NULL),(75,'V6c602e','1','213123','12313','女','1231@qq.com','12312312312','2017-03-30','123',NULL,NULL,500,1,'见习',NULL,5,'无会员',0,0,'123123','123',NULL,'2017-03-07 08:05:04',NULL),(76,'V6CtD7','1','123123','12312','女','1213@qq.com','12313112312','2017-03-30','123123',NULL,NULL,500,1,'见习',0,5,'无会员',0,0,'1213','123123',NULL,'2017-03-07 08:09:06',NULL),(78,'V6e91Uj','1','123123','123123','男','1223456789@qq.com','12312312312','2017-03-21','123',NULL,NULL,500,1,'见习',0,5,'无会员',0,0,'123123','123123',NULL,'2017-03-07 08:43:38',NULL),(79,'V6HfH93','1','赵华琛','910331',NULL,'664860722@qq.com','15542287851',NULL,NULL,NULL,NULL,500,1,'见习',0,5,'无会员',0,0,NULL,NULL,NULL,'2017-03-07 09:29:02',NULL),(80,'v749497','1','qw','qwe','男','wqe@q.com','12312312312','2017-03-15','123',NULL,NULL,500,1,'见习',0,5,'无会员',0,0,'21','12',NULL,'2017-03-08 07:55:35',NULL),(81,'v74997D','1','234','23','男','12223456789@qq.com','21212312312','2017-03-28','2',NULL,NULL,500,1,'见习',0,5,'无会员',0,0,'12','2',NULL,'2017-03-08 07:56:20',NULL),(82,'v7562kF','1','213123','3212','男','1234567829@qq.com','12312312312','2017-03-23','123',NULL,NULL,500,1,'见习',0,5,'无会员',0,0,'','',NULL,'2017-03-08 07:58:37',NULL),(83,'v75Bs3','1','123123','123123','男','12322456789@qq.com','21312313333','2017-03-28','',NULL,NULL,500,1,'见习',0,5,'无会员',0,0,'123','',NULL,'2017-03-08 07:59:18',NULL),(84,'V75j91i','1','22','22','男','222@q.cn','12312312312',NULL,'',NULL,NULL,500,1,'见习',0,5,'无会员',0,0,'123123','21',NULL,'2017-03-08 08:00:33',NULL),(85,'v75L97Y','1','12312','12312','男','12345226789@qq.com','12312312312',NULL,'',NULL,NULL,500,1,'见习',0,5,'无会员',0,0,'','',NULL,'2017-03-08 08:00:59',NULL),(86,'V75Vqu','1','21312','123','男','12345627289@qq.com','12212312322',NULL,'',NULL,NULL,500,1,'见习',0,5,'无会员',0,0,'','',NULL,'2017-03-08 08:02:32',NULL);
/*!40000 ALTER TABLE `ty_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ty_message`
--

DROP TABLE IF EXISTS `ty_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ty_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) DEFAULT NULL,
  `mess_accp_id` bigint(20) DEFAULT NULL,
  `delete_flag` bigint(2) DEFAULT '0',
  `mess_mem_id` bigint(20) DEFAULT NULL,
  `mess_mem_name` varchar(20) DEFAULT NULL,
  `create_Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flag` bigint(4) DEFAULT '0',
  `mess_accp_name` varchar(20) DEFAULT NULL,
  `mess_theme` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ty_message`
--

LOCK TABLES `ty_message` WRITE;
/*!40000 ALTER TABLE `ty_message` DISABLE KEYS */;
INSERT INTO `ty_message` VALUES (48,'1234567',67,1,36,'郭云春晓','2017-03-07 05:56:47',0,'二月红','abc'),(49,'tttttt头疼',67,0,36,'郭云春晓','2017-03-07 05:57:09',1,'二月红','4444'),(50,'1111111111111111111111111111112222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222',65,0,36,'郭云春晓','2017-03-07 05:57:42',1,'司咏','你被选中了'),(51,'啊啊啊啊',66,0,36,'郭云春晓','2017-03-07 06:09:48',1,'张启山','1111'),(52,'qwedqweq',68,0,65,'司咏','2017-03-07 06:14:58',0,'赵华琛','司咏祝你生日快乐'),(53,'啊实打实的',78,0,65,'司咏','2017-03-08 07:09:36',0,'123123','司咏祝你生日快乐');
/*!40000 ALTER TABLE `ty_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ty_power`
--

DROP TABLE IF EXISTS `ty_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ty_power` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `power_Name` varchar(20) DEFAULT NULL,
  `power_Type` int(1) DEFAULT NULL,
  `super_Id` bigint(20) DEFAULT NULL COMMENT '上级编号',
  `url` varchar(255) DEFAULT NULL COMMENT '权限字符串',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=514 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ty_power`
--

LOCK TABLES `ty_power` WRITE;
/*!40000 ALTER TABLE `ty_power` DISABLE KEYS */;
INSERT INTO `ty_power` VALUES (1,'会员*',1,0,''),(2,'员工*',1,0,''),(3,'消息管理*',1,0,''),(4,'健康管理*',1,0,''),(5,'信息管理*',1,0,''),(11,'会员：增加',2,1,'/Member/addMember.emp'),(12,'会员：删除',2,1,'/Member/delMember.emp'),(13,'会员：全查',2,1,'/Member/selMemberAll.emp'),(14,'会员：修改',2,1,'/Member/updateMember.emp'),(15,'会员：积分变更',2,1,'/Member/saveIntegral.emp'),(21,'员工：增加',2,2,'/Employee/addEmployee.emp'),(22,'员工：删除',2,2,'/Employee/delEmployee.emp'),(23,'员工：修改',2,2,'/Employee/updateEmployee.emp'),(24,'员工：全查',2,2,'/Employee/selEmployeeAll.emp'),(25,'员工：角色-增加',2,2,'/empChar/addEmpChar.emp'),(26,'员工：角色-编辑',2,2,'/view/empCharToPower.html'),(27,'员工：角色-删除',2,2,'/empChar/delEmpChar.emp'),(28,'员工：角色-查看',2,2,'/empChar/selEmpCharAll.emp'),(31,'消息：留言主题-查看',2,3,'/theme/selThemeAll.emp'),(32,'消息：留言主题-删除',2,3,'/theme/delThemes.emp'),(33,'消息：留言主题-修改',2,3,'/building/selBuilding1.emp'),(34,'消息：站内消息-查看',2,3,'/message/selMessage.emp'),(35,'消息：站内消息-修改',2,3,'/message/update.emp'),(36,'消息：站内消息-添加',2,3,'/message/add.emp'),(37,'消息：站内消息-删除',2,3,'/message/delete.emp'),(41,'健康：会员信息-查询',2,4,'/Member/selMem.emp'),(42,'健康：会员信息-添加会员健康',2,4,'/MemHealth/addMemhealth.emp'),(43,'健康：会员信息-添加家属',2,4,'/MemFamily/addMemFamily.emp'),(44,'健康：家属信息-查询',2,4,'/MemFamily/selMemFamilyAll.emp'),(45,'健康：家属信息-添加健康信息',2,4,'/MemHealth/addMemHealth.emp'),(46,'健康：健康信息-查看',2,4,'/MemHealth/selMemHealthAll.emp'),(48,'健康：健康信息-修改',2,4,'/MemHealth/updateMemHealth.emp'),(49,'健康：健康信息-删除',2,4,'/MemHealth/delMemHealth.emp'),(51,'信息管理：医师-查找',2,5,'/doctor/selDoctor.emp'),(52,'消息管理：医师-删除',2,5,'/doctor/delDoctor.emp'),(53,'消息管理：医师-增加',2,5,'/doctor/addDoctor.emp'),(54,'消息管理：医师-修改',2,5,'/doctor/updateDoctor.emp'),(55,'信息管理：医师-修改图片',2,5,'/message/save.emp'),(56,'信息：贴士-增加',2,5,'/Tis/addTis.emp'),(57,'信息：贴士-删除',2,5,'/Tis/delTis.emp'),(58,'信息：贴士-修改',2,5,'/Tis/updateTis.emp'),(59,'信息：贴士-查找',2,5,'/Tis/selTisAll.emp'),(111,'会员：等级-增加',2,1,'/MemLevel/addMemLevel.emp'),(112,'会员：等级-删除',2,1,'/MemLevel/delMemLevel.emp'),(113,'会员：等级-修改',2,1,'/MemLevel/updateMemLevel.emp'),(114,'会员：等级-全查',2,1,'/MemLevel/selMemLevelAll.emp'),(121,'会员：职阶-增加',2,1,'/MemClass/addMemClass.emp'),(122,'会员：职阶-删除',2,1,'/MemClass/delMemClass.emp'),(123,'会员：职阶-修改',2,1,'/MemClass/updateMemClass.emp'),(124,'会员：职阶-全查',2,1,'/MemClass/selMemClassAll.emp'),(131,'会员：签到-全查',2,1,'/Sign/selSignAll.emp'),(133,'会员：签到-删除',2,1,'/Sign/scSign.emp'),(134,'会员：签到-补签',2,1,'/Sign/upSign.emp'),(211,'员工：权限-增加',2,2,'/Power/addPower.emp'),(212,'员工：权限-删除',2,2,'/Power/delPower.emp'),(213,'员工：权限-查看',2,2,'/view/empPower.html'),(311,'消息：留言楼-修改',2,3,'/building/updateBuilding.emp'),(312,'消息：留言楼-回复',2,3,'/building/selBuilding.emp'),(411,'健康：健康信息-修改诊断书',2,4,'/MemHealth/save.emp'),(412,'健康：健康信息-查看诊断书',2,4,'/MemHealth/selMemHealthById.emp'),(511,'信息：图片管理',2,5,'/view/empImg.html'),(512,'信息：访问-查找',2,5,'Fz/selFzAll.emp'),(513,'信息：访问-修改',2,5,'Fz/updateFz.emp');
/*!40000 ALTER TABLE `ty_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ty_sign`
--

DROP TABLE IF EXISTS `ty_sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ty_sign` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mem_id` bigint(20) NOT NULL,
  `sign_time` date DEFAULT NULL,
  `delete_flag` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ty_sign`
--

LOCK TABLES `ty_sign` WRITE;
/*!40000 ALTER TABLE `ty_sign` DISABLE KEYS */;
INSERT INTO `ty_sign` VALUES (113,65,'2017-03-07',0),(114,65,'2017-03-06',0),(117,65,'2017-03-08',0);
/*!40000 ALTER TABLE `ty_sign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ty_theme`
--

DROP TABLE IF EXISTS `ty_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ty_theme` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `delete_flag` bigint(2) DEFAULT '0',
  `theme` varchar(255) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  `member_name` varchar(20) NOT NULL,
  `create_Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `flag` int(10) DEFAULT '0',
  `rid` int(10) DEFAULT NULL,
  `rname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ty_theme`
--

LOCK TABLES `ty_theme` WRITE;
/*!40000 ALTER TABLE `ty_theme` DISABLE KEYS */;
INSERT INTO `ty_theme` VALUES (16,0,'我是神经病 ',65,'司咏','2017-03-07 06:28:47',2,3,'围魏救赵'),(17,0,'gggggg~!',65,'司咏','2017-03-07 06:30:29',2,3,'围魏救赵'),(18,0,'流进开挖雅酷烈！！！！！！！',65,'司咏','2017-03-07 06:31:40',2,3,'围魏救赵'),(19,0,'我是神经病啊',65,'司咏','2017-03-07 06:33:30',2,3,'围魏救赵'),(20,0,'wocnm',65,'司咏','2017-03-07 06:36:13',2,3,'围魏救赵'),(21,0,'ffffff',65,'司咏','2017-03-07 06:40:48',2,3,'围魏救赵'),(22,0,'啊啊啊啊啊资讯',65,'司咏','2017-03-07 08:06:23',2,3,'围魏救赵'),(23,0,'用户条例',65,'司咏','2017-03-08 01:16:31',2,3,'围魏救赵'),(24,0,'用户条例',65,'司咏','2017-03-08 01:18:40',2,3,'围魏救赵'),(25,0,'用户条例',65,'司咏','2017-03-08 01:20:47',2,3,'围魏救赵'),(26,0,'呵呵呵哒',65,'司咏','2017-03-08 01:23:15',2,3,'围魏救赵'),(27,0,'内科',65,'司咏','2017-03-08 07:08:30',2,3,'围魏救赵'),(28,0,'asdasdadsad驱蚊器翁',65,'司咏','2017-03-08 07:19:09',2,3,'围魏救赵'),(29,0,'啊实打实的   阿萨德',65,'司咏','2017-03-08 07:22:34',2,3,'围魏救赵'),(30,0,'阿达xxx',65,'司咏','2017-03-08 07:22:52',2,3,'围魏救赵'),(31,0,'12312额啊啊啊',65,'司咏','2017-03-08 08:36:31',2,4,'夜神月'),(32,0,'啊实打实大',65,'司咏','2017-03-08 08:37:38',2,4,'夜神月'),(33,0,'是大大大',65,'司咏','2017-03-08 08:53:25',2,43,'夜神月');
/*!40000 ALTER TABLE `ty_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ty_tis`
--

DROP TABLE IF EXISTS `ty_tis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ty_tis` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tis_name` varchar(50) DEFAULT NULL,
  `tis_content` varchar(20000) DEFAULT NULL,
  `create_by` varchar(10) DEFAULT NULL COMMENT '创建人',
  `delete_flag` int(1) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ty_tis`
--

LOCK TABLES `ty_tis` WRITE;
/*!40000 ALTER TABLE `ty_tis` DISABLE KEYS */;
INSERT INTO `ty_tis` VALUES (40,'123123','<p>xxxx</p><p><img src=\"../dist/uploadImg/14888659213951.png\" title=\"\" alt=\"\"/></p><p>aaaaccc</p><p><img src=\"../dist/uploadImg/14888660741051.png\" title=\"\" alt=\"\"/></p>','郭云春晓',0,'2017-03-07 05:52:17'),(41,'哇哈','<p>有吃成长快乐啦<br/></p>','郭云春晓',1,'2017-03-07 05:54:31');
/*!40000 ALTER TABLE `ty_tis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_test`
--

DROP TABLE IF EXISTS `user_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `delete_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_test`
--

LOCK TABLES `user_test` WRITE;
/*!40000 ALTER TABLE `user_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-09 14:05:43
