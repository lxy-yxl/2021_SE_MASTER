-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 121.37.172.109    Database: pigplatform
-- ------------------------------------------------------
-- Server version	8.0.27
use pigplatform;
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
-- Table structure for table `annoucement`
--

DROP TABLE IF EXISTS `annoucement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `annoucement` (
  `announcement_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `content` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `time` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`announcement_id`),
  UNIQUE KEY `announcement_id_UNIQUE` (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='通知表\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annoucement`
--

LOCK TABLES `annoucement` WRITE;
/*!40000 ALTER TABLE `annoucement` DISABLE KEYS */;
/*!40000 ALTER TABLE `annoucement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `type` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_id` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `time` time DEFAULT NULL,
  `content` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  UNIQUE KEY `comment_id_UNIQUE` (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='评论表\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,'0','1',NULL,'很不错'),(2,2,'1','1',NULL,'真不戳');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fav`
--

DROP TABLE IF EXISTS `fav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fav` (
  `fav_id` int NOT NULL,
  `object_id` int DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fav`
--

LOCK TABLES `fav` WRITE;
/*!40000 ALTER TABLE `fav` DISABLE KEYS */;
INSERT INTO `fav` VALUES (1,3,'2021-12-29 18:26:50'),(1,3,'2021-12-31 08:36:42'),(1,1,'2021-12-31 08:36:51'),(1,3,'2021-12-31 08:38:41'),(1,2,'2021-12-31 08:38:48'),(1,13,'2021-12-31 08:41:19'),(1,8,'2021-12-31 08:42:11'),(1,11,'2021-12-31 08:55:56'),(1,13,'2021-12-31 09:38:37');
/*!40000 ALTER TABLE `fav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourite_cart`
--

DROP TABLE IF EXISTS `favourite_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourite_cart` (
  `fav_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `coverimg` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`fav_id`),
  UNIQUE KEY `fav_id_UNIQUE` (`fav_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourite_cart`
--

LOCK TABLES `favourite_cart` WRITE;
/*!40000 ALTER TABLE `favourite_cart` DISABLE KEYS */;
INSERT INTO `favourite_cart` VALUES (1,1,'收藏夹','我的收藏夹','2021-12-29 18:26:00',NULL);
/*!40000 ALTER TABLE `favourite_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lease_extension`
--

DROP TABLE IF EXISTS `lease_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lease_extension` (
  `lease_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `day_number` int DEFAULT NULL,
  `rent_added` int DEFAULT NULL,
  PRIMARY KEY (`lease_id`),
  UNIQUE KEY `lease_id_UNIQUE` (`lease_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='延长租赁周期表\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lease_extension`
--

LOCK TABLES `lease_extension` WRITE;
/*!40000 ALTER TABLE `lease_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `lease_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `senderID` int NOT NULL,
  `receiverID` int NOT NULL,
  `time` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `content` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`senderID`,`receiverID`,`time`),
  UNIQUE KEY `senderID_UNIQUE` (`senderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object`
--

DROP TABLE IF EXISTS `object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object` (
  `object_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `description` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deposit` int DEFAULT NULL,
  `tag` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rent_daliy` int DEFAULT NULL,
  `new_level` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`object_id`) USING BTREE,
  UNIQUE KEY `product_id_UNIQUE` (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object`
--

LOCK TABLES `object` WRITE;
/*!40000 ALTER TABLE `object` DISABLE KEYS */;
INSERT INTO `object` VALUES (1,'照相机',1,'A6400','审核通过',400,'电子产品',50,'七成新'),(2,'男士西装',2,'180/L码，穿过1次','审核通过',100,'服饰',20,' 八成新'),(3,'电脑',3,'16g/512g','审核通过',500,'电子产品',60,'六成新'),(4,'手机',6,'荣耀20','审核通过',230,'电子产品',20,'五成新'),(5,'充电宝',3,'2000毫安时','审核通过',10,'电子产品',5,'四成新'),(6,'女士西装',4,'170/M码，未穿过','审核通过',150,'服饰',20,'八成新'),(7,'戏服',5,'话剧使用的戏服','审核通过',200,'服饰',39,'六成新'),(8,'帽子',7,'渔夫帽','审核通过',10,'服饰',5,'四成新'),(9,'手表',6,'卡西欧手表','审核通过',300,'配饰',10,'六成新'),(10,'游戏机',5,'闲置的switch','审核通过',200,'电子产品',20,'全新'),(11,'蓝牙耳机',3,'airpods3','审核通过',300,'电子产品',40,'九成新'),(12,'有线耳机',5,'sony有线耳机','审核通过',100,'电子产品',30,'九成新'),(13,'ipad air',4,'附带一支笔，容量64g','审核通过',300,'电子产品',30,'八成新'),(14,'ipad pro',4,'容量128g，闲置已久','审核通过',500,'电子产品',100,'四成新'),(15,'游戏手柄',6,'xbox手柄','审核通过',50,'电子产品',30,'六成新'),(16,'墨镜',4,'雷朋眼镜，有少许划痕','审核通过',40,'配饰',10,'九成新'),(17,'尼康相机',3,'zfc','审核通过',500,'电子产品',100,'八成新'),(18,'三脚架',4,'适配各种相机','审核通过',50,'电子产品',20,'五成新'),(19,'z卡口镜头',1,'z24-80','审核通过',200,'电子产品',50,'六成新'),(20,'雅马哈吉他',3,'f600，没时间用了','审核通过',200,'生活好物',20,'全新'),(21,'6级耳机',4,'考完6级用不到了','审核通过',10,'生活好物',5,'九成新'),(22,'鼠标',3,'罗技鼠标','待审核',10,'生活好物',5,'8成新'),(23,'鼠标',3,'罗技鼠标','待审核',10,'生活好物',5,'8成新'),(24,'1',1,'1','待审核',1,'服饰',NULL,'1'),(25,'1',1,'1','待审核',10,'电子产品',NULL,'1'),(26,'1',1,'1','审核通过',10,'电子产品',NULL,'1'),(27,'1',1,'1','审核通过',10,'电子产品',NULL,'1'),(28,'1',1,'1','审核通过',0,'电子产品',NULL,'1'),(29,'1',1,'1','审核通过',10,'电子产品',NULL,'1'),(30,'1',1,'1','审核通过',0,'电子产品',NULL,'1'),(31,'1',1,'1','审核通过',10,'电子产品',NULL,'1'),(32,'1',1,'1','审核通过',10,'电子产品',NULL,'1'),(33,'1',1,'1','审核通过',10,'电子产品',NULL,'1'),(34,'1',1,'1','审核通过',10,'电子产品',NULL,'1'),(35,'计网实验项目要求',1,'计网实验项目要求','审核通过',10,'电子产品',NULL,'10成新'),(36,'testtesttest',1,'tesettesttestsetsetsetsetsetsetsetsetset','审核通过',0,'服饰',NULL,'八成新');
/*!40000 ALTER TABLE `object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `object_id` int NOT NULL,
  `borrower_id` int DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rent_total` int DEFAULT NULL,
  `lentout_time` datetime DEFAULT NULL,
  `return_time` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `finished_time` datetime DEFAULT NULL,
  `campus` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  KEY `object_id_idx` (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (3,1,1,'已评价',1550,'2020-01-17 11:52:04','2020-02-17 11:52:04','2021-12-28 19:39:47',NULL,NULL),(4,1,2,'已支付',3400,'2020-02-17 11:52:04','2020-04-17 11:52:04','2021-12-30 23:13:32',NULL,'嘉定'),(5,1,1,'待评价',1200,'2021-12-30 23:11:50','2022-01-15 00:00:00','2021-12-30 23:14:27',NULL,'嘉定'),(6,2,1,'待评价',420,'2021-12-30 23:11:50','2022-01-15 00:00:00','2021-12-31 07:14:03',NULL,'嘉定'),(7,3,1,'待评价',2300,'2021-12-01 00:00:00','2021-12-31 00:00:00','2021-12-31 07:29:51',NULL,'嘉定'),(9,6,1,'已取消',730,'2021-12-01 00:00:00','2021-12-30 00:00:00','2021-12-31 07:45:14',NULL,'四平'),(10,14,1,'已支付',3300,'2021-12-01 00:00:00','2021-12-29 00:00:00','2021-12-31 08:27:38',NULL,'嘉定'),(11,13,1,'已取消',1170,'2021-12-01 00:00:00','2021-12-30 00:00:00','2021-12-31 09:39:45',NULL,'嘉定'),(12,7,1,'已评价',1331,'2021-12-01 00:00:00','2021-12-30 00:00:00','2021-12-31 09:41:13',NULL,'嘉定');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `picture` (
  `picture_id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `object_id` int DEFAULT NULL,
  `picture_url` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`picture_id`),
  UNIQUE KEY `picture_id_UNIQUE` (`picture_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
INSERT INTO `picture` VALUES (1,1,1,'https://m2.im5i.com/2021/12/29/UTfUS7.jpg'),(2,1,2,'https://m2.im5i.com/2021/12/29/UTfFHs.jpg'),(3,1,3,'https://m2.im5i.com/2021/12/29/UTfkNS.jpg'),(4,1,4,'https://m2.im5i.com/2021/12/29/UTfZpT.jpg'),(5,1,5,'https://m2.im5i.com/2021/12/29/UTeHmM.jpg'),(6,1,6,'https://m2.im5i.com/2021/12/29/UTfDj3.jpg'),(7,1,7,'https://m2.im5i.com/2021/12/29/UTemyf.jpg'),(8,1,8,'https://m2.im5i.com/2021/12/29/UTfdup.jpg'),(9,1,9,'https://m2.im5i.com/2021/12/29/UTf86z.jpg'),(10,1,10,'https://m2.im5i.com/2021/12/29/UTfxnv.jpg'),(11,1,11,'https://m2.im5i.com/2021/12/29/UTfLGG.jpg'),(12,1,12,'https://m2.im5i.com/2021/12/29/UTfYNY.jpg'),(13,1,13,'https://m2.im5i.com/2021/12/29/UTfsiw.jpg'),(14,1,14,'https://m2.im5i.com/2021/12/29/UTfnqF.jpg'),(15,1,15,'https://m2.im5i.com/2021/12/29/UTfp6d.jpg'),(16,1,16,'https://m2.im5i.com/2021/12/29/UTfqqB.jpg'),(17,1,17,'https://m2.im5i.com/2021/12/29/UT2mEq.jpg'),(18,1,18,'https://m2.im5i.com/2021/12/29/UTfrmK.jpg'),(19,1,19,'https://m2.im5i.com/2021/12/29/UTfETC.jpg'),(20,1,20,'https://m2.im5i.com/2021/12/29/UTfMSH.jpg'),(21,1,21,'https://m2.im5i.com/2021/12/29/UTfjua.jpg'),(61,1,30,'http://121.37.172.109:9090/upload/2021/12/30/202112302203423352epochs=2000.png'),(62,1,34,'http://121.37.172.109:9090/upload/2021/12/30/2021123022174466602000loss.png'),(63,1,35,'http://121.37.172.109:9090/upload/2021/12/31/202112310011154132计网实验期末项目.jpg'),(64,1,36,'http://121.37.172.109:9090/upload/2021/12/31/202112310943394342123456.png');
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `title` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `expected_price` int DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='发帖的表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,4,'急需mac电脑','需要1台mac电脑10天左右',NULL,100),(2,2,'学代会开会','需要一件西装，M码',NULL,50),(3,1,'需要一个三角架','最近有外拍的需求，需要一个最大高度约1米5的三脚架，品色无所谓','2021-12-29 23:42:44',200);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remarks`
--

DROP TABLE IF EXISTS `remarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remarks` (
  `remark_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `content` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `grade` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `object_id` int DEFAULT NULL,
  PRIMARY KEY (`remark_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='评价表\r\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remarks`
--

LOCK TABLES `remarks` WRITE;
/*!40000 ALTER TABLE `remarks` DISABLE KEYS */;
INSERT INTO `remarks` VALUES (1,8,'2021-12-28 20:40:10','fsgsf',4,1,1),(2,7,'2021-12-28 20:52:52','ytjtyjty',3,1,1),(3,4,'2021-12-13 20:53:08','umym',2,0,1),(4,7,'2021-12-29 13:18:34','good',5,1,1),(5,3,'2021-12-13 20:53:08','3123',3,1,2),(6,3,'2021-12-13 20:53:08','1',5,1,13),(26,4,'2021-12-13 20:53:08','3',3,1,3),(27,1,'2021-12-13 20:53:08','3',3,1,4),(28,2,'2021-12-13 20:53:08','good',4,1,5),(29,3,'2021-12-13 20:53:08','dfad',4,1,6),(30,4,'2021-12-13 20:53:08','good',5,1,7),(31,5,'2021-12-13 20:53:08','good',4,1,8),(32,6,'2021-12-13 20:53:08','good',3,1,9),(33,7,'2021-12-13 20:53:08','fad',4,1,10),(34,8,'2021-12-13 20:53:08','qg',3,1,11),(35,9,'2021-12-13 20:53:08','good',4,1,12),(36,10,'2021-12-13 20:53:08','good',5,1,13),(37,11,'2021-12-13 20:53:08','good',3,1,14),(38,12,'2021-12-13 20:53:08','good',4,1,15),(39,13,'2021-12-13 20:53:08','good',3,1,16),(40,14,'2021-12-13 20:53:08','good',3,1,17),(41,15,'2021-12-13 20:53:08','good',4,1,18),(42,16,'2021-12-13 20:53:08','good',5,1,19),(43,17,'2021-12-13 20:53:08','good',4,1,20),(44,18,'2021-12-13 20:53:08','good',3,1,21),(45,1,'2021-12-31 07:44:59','frg',4,NULL,2),(46,1,'2021-12-31 08:18:33','not bad',4,1,2),(47,1,'2021-12-31 08:22:25','not bad',4,1,3),(48,1,'2021-12-31 09:41:46','so bad',2,1,7);
/*!40000 ALTER TABLE `remarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `type` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `reason` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `adimin_id` int DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='报告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gender` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telephone` int DEFAULT NULL,
  `email` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `zone` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_time` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reputation` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `userID_UNIQUE` (`user_id`),
  UNIQUE KEY `nick_name_UNIQUE` (`nick_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'zqf','123456','http://121.37.172.109:9090/upload/2021/12/31/2021123109155464561afcdb25fa1848c1a38a7d6c2d033df5.jpg','男',114514,'zqf@qq.com','null',NULL,'0','100'),(2,'mjy','12345','https://m2.im5i.com/2021/12/29/UT9dBA.jpg','男',114514,'mjy@outlook.com',NULL,NULL,'1','100'),(3,'zldl','12345','https://m2.im5i.com/2021/12/29/UT9dBA.jpg','男',114514,'zldl@outlook.com',NULL,NULL,'0','100'),(4,'lj','12345','https://m2.im5i.com/2021/12/29/UT9dBA.jpg','女',114514,'lj@outlook.com',NULL,NULL,'0','150'),(5,'lzb','12345','https://m2.im5i.com/2021/12/29/UT9dBA.jpg','男',114514,'lzb@outlook.com',NULL,NULL,'0','150'),(6,'cj','12345','https://m2.im5i.com/2021/12/29/UT9dBA.jpg','男',114514,'cj@outlook.com',NULL,NULL,'0','75'),(7,'xdx','12345','https://m2.im5i.com/2021/12/29/UT9dBA.jpg','男',114514,'xdx@outlook.com',NULL,NULL,'0','100'),(8,'asds','123456','https://m2.im5i.com/2021/12/29/UT9dBA.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'tttttttt','666666666',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'hahaha','114514',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'aiysosis','114514',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pigplatform'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-01 11:28:46
