-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: zheng
-- ------------------------------------------------------
-- Server version	5.7.23

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
-- Table structure for table `cms_article`
--

DROP TABLE IF EXISTS `cms_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `topic_id` int(11) DEFAULT NULL COMMENT '所属专题',
  `title` varchar(200) NOT NULL COMMENT '文章标题',
  `author` varchar(50) DEFAULT NULL COMMENT '文章原作者',
  `fromurl` varchar(300) DEFAULT NULL COMMENT '转载来源网址',
  `image` varchar(300) DEFAULT NULL COMMENT '封面图',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` varchar(500) DEFAULT NULL COMMENT '简介',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型(1:普通,2:热门...)',
  `allowcomments` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否允许评论(0:不允许,1:允许)',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(-1:不通过,0未审核,1:通过)',
  `content` mediumtext COMMENT '内容',
  `user_id` int(10) unsigned NOT NULL COMMENT '发布人id',
  `readnumber` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读数量',
  `top` int(11) NOT NULL DEFAULT '0' COMMENT '置顶等级',
  `system_id` int(11) DEFAULT NULL COMMENT '所属系统',
  `ctime` bigint(20) unsigned NOT NULL COMMENT '创建时间',
  `orders` bigint(20) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`article_id`),
  KEY `cms_article_orders` (`orders`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article`
--

LOCK TABLES `cms_article` WRITE;
/*!40000 ALTER TABLE `cms_article` DISABLE KEYS */;
INSERT INTO `cms_article` VALUES (3,0,'中国经济标题1','1','1','1','1','1',1,1,0,'资讯内容',1,0,0,1,1489827019528,1489827019528),(4,0,'中国经济标题2','2','2','2','2','2',1,1,-1,'资讯内容',1,0,0,1,1489827340870,1489827340870),(5,0,'中国经济标题3','3','3','3','3','3',1,1,1,'资讯内容',1,0,0,1,1489827581414,1489827581414),(8,1,'日本从地球消失，我们倍(喜)感(大)心(普)痛(奔)','shuzheng','网络','','日本消失,日本地震','日本从地震中消失',1,1,1,'好悲(gao)伤(xing)啊',1,12,0,1,1489845594355,1489845594355),(9,0,'中国经济标题4','4','4','4','4','4',1,1,1,'资讯内容',1,0,0,1,1490460546198,1490460546198),(10,0,'中国经济标题5','5','5','5','5','5',1,1,1,'资讯内容',1,0,0,1,1490460567137,1490460567137),(11,0,'中国经济标题6','6','6','6','6','6',1,1,1,'资讯内容',1,0,0,1,1490460575304,1490460575304),(12,0,'中国经济标题7','7','7','7','7','7',1,1,1,'资讯内容',1,0,0,1,1490460582004,1490460582004),(13,0,'中国经济标题8','8','8','8','8','8',1,1,1,'资讯内容',1,0,0,1,1490460588840,1490460588840),(14,0,'中国经济标题9','9','9','9','9','9',1,1,1,'资讯内容',1,0,0,1,1490460596394,1490460596394),(15,0,'中国经济标题10','10','10','10','10','10',1,1,1,'资讯内容',1,0,0,1,1490460612370,1490460612370),(16,0,'中国经济标题11','11','11','11','11','11',1,1,1,'资讯内容',1,0,0,1,1490460782767,1490460782767),(17,0,'中国经济标题12','12','12','12','12','12',1,1,1,'资讯内容',1,0,0,1,1490460792501,1490460792501),(18,0,'中国经济标题13','13','13','13','13','13',1,1,1,'资讯内容',1,0,0,1,1490460800634,1490460800634),(19,0,'人为什么谈恋爱？','test','test','test','test','test',1,1,1,'人为什么谈恋爱？',1,0,0,2,1490460800635,1490460800635),(20,0,'java开发笔记','test','test','test','test','test',1,1,1,'好记性不如烂笔头',1,0,0,3,1490460800636,1490460800636);
/*!40000 ALTER TABLE `cms_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_article_category`
--

DROP TABLE IF EXISTS `cms_article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article_category` (
  `article_category_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `article_id` int(10) unsigned NOT NULL COMMENT '文章编号',
  `category_id` int(10) unsigned NOT NULL COMMENT '类目编号',
  PRIMARY KEY (`article_category_id`),
  KEY `cms_article_category_article_id` (`article_id`),
  KEY `cms_article_category_category_id` (`category_id`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`article_id`) REFERENCES `cms_article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='文章类目关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article_category`
--

LOCK TABLES `cms_article_category` WRITE;
/*!40000 ALTER TABLE `cms_article_category` DISABLE KEYS */;
INSERT INTO `cms_article_category` VALUES (1,3,6),(2,4,6),(3,5,6),(4,9,6),(5,10,6),(6,11,6),(7,12,6),(8,12,6),(9,13,6),(10,14,6),(11,15,6),(12,16,6),(13,17,6),(14,18,6),(15,8,7),(16,19,8),(17,20,9);
/*!40000 ALTER TABLE `cms_article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_article_tag`
--

DROP TABLE IF EXISTS `cms_article_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article_tag` (
  `article_tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `article_id` int(10) unsigned NOT NULL COMMENT '文章编号',
  `tag_id` int(10) unsigned NOT NULL COMMENT '标签编号',
  PRIMARY KEY (`article_tag_id`),
  KEY `cms_article_tag_article_id` (`article_id`),
  KEY `cms_article_tag_tag_id` (`tag_id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`article_id`) REFERENCES `cms_article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`tag_id`) REFERENCES `cms_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='文章标签关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article_tag`
--

LOCK TABLES `cms_article_tag` WRITE;
/*!40000 ALTER TABLE `cms_article_tag` DISABLE KEYS */;
INSERT INTO `cms_article_tag` VALUES (1,19,4),(2,20,5);
/*!40000 ALTER TABLE `cms_article_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_category`
--

DROP TABLE IF EXISTS `cms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类目编号',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '上级编号',
  `level` tinyint(4) NOT NULL COMMENT '层级',
  `name` varchar(20) NOT NULL COMMENT '名称',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '类型(1:普通,2:热门...)',
  `alias` varchar(20) DEFAULT NULL COMMENT '别名',
  `system_id` int(11) DEFAULT NULL COMMENT '所属系统',
  `ctime` bigint(20) unsigned NOT NULL COMMENT '创建时间',
  `orders` bigint(255) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`category_id`),
  KEY `cms_category_orders` (`orders`),
  KEY `cms_category_pid` (`pid`),
  KEY `cms_category_alias` (`alias`),
  KEY `cms_category_level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='类目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category`
--

LOCK TABLES `cms_category` WRITE;
/*!40000 ALTER TABLE `cms_category` DISABLE KEYS */;
INSERT INTO `cms_category` VALUES (5,NULL,1,'经济','经济类目','',1,'economic',1,1489590733919,1489590733919),(6,5,2,'中国经济','中国经济类目','',1,'chinaeconomic',1,1489590768989,1489590768989),(7,5,2,'日本经济','日本经济类目','',1,'japaneconomic',1,1491636586316,1491636586316),(8,NULL,1,'人类','人类问题','',1,'people',2,1491636586317,1491636586317),(9,NULL,1,'技术','技术博文',NULL,1,'technic',3,1491636586318,1491636586318);
/*!40000 ALTER TABLE `cms_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_category_tag`
--

DROP TABLE IF EXISTS `cms_category_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_category_tag` (
  `category_tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `category_id` int(10) unsigned NOT NULL COMMENT '类目编号',
  `tag_id` int(10) unsigned NOT NULL COMMENT '标签编号',
  PRIMARY KEY (`category_tag_id`),
  KEY `cms_category_tag_tag_id` (`tag_id`),
  KEY `cms_category_tag_category_id` (`category_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`tag_id`) REFERENCES `cms_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='类目标签关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category_tag`
--

LOCK TABLES `cms_category_tag` WRITE;
/*!40000 ALTER TABLE `cms_category_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_category_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_comment`
--

DROP TABLE IF EXISTS `cms_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '回复楼中楼编号回复楼中楼编号',
  `article_id` int(10) unsigned NOT NULL COMMENT '文章编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `content` text NOT NULL COMMENT '评论内容',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(-1:不通过,0:未审核,1:通过)',
  `ip` varchar(30) DEFAULT NULL COMMENT '评论人ip地址',
  `agent` varchar(200) DEFAULT NULL COMMENT '评论人终端信息',
  `system_id` int(11) DEFAULT NULL COMMENT '所属系统',
  `ctime` bigint(20) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`comment_id`),
  KEY `cms_comment_article_id` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_comment`
--

LOCK TABLES `cms_comment` WRITE;
/*!40000 ALTER TABLE `cms_comment` DISABLE KEYS */;
INSERT INTO `cms_comment` VALUES (1,NULL,8,1,'1',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36',1,1490535749413),(2,NULL,8,1,'2',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36',1,1490536186447),(3,NULL,8,1,'3',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36',1,1490536192205),(4,NULL,8,1,'4',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36',1,1490536460544),(5,NULL,8,1,'5',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36',1,1490536462182),(6,NULL,8,1,'6',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36',1,1490536463614),(7,NULL,8,1,'7',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36',1,1490536464870),(8,NULL,8,1,'8',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36',1,1490536465926),(9,NULL,8,1,'9',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36',1,1490536466853),(10,NULL,8,1,'10',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36',1,1490536467821),(11,NULL,19,1,'1',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36',2,1491737900448),(12,NULL,19,1,'3',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36',2,1491737902517),(13,NULL,19,1,'4',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36',2,1491737903420),(14,NULL,19,1,'5',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36',2,1491737904428),(15,NULL,19,1,'6',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36',2,1491737905236),(16,NULL,19,1,'7',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36',2,1491737905980);
/*!40000 ALTER TABLE `cms_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_menu`
--

DROP TABLE IF EXISTS `cms_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_menu` (
  `menu_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pid` int(11) DEFAULT NULL COMMENT '父菜单',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `url` varchar(100) DEFAULT NULL COMMENT '链接',
  `target` varchar(10) DEFAULT NULL COMMENT '打开方式',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_menu`
--

LOCK TABLES `cms_menu` WRITE;
/*!40000 ALTER TABLE `cms_menu` DISABLE KEYS */;
INSERT INTO `cms_menu` VALUES (1,NULL,'首页','/','_self',1489847080380),(2,NULL,'问答','/qa','_self',1489847186644),(3,NULL,'博客','/blog','_self',1489847186645),(4,NULL,'资讯','/news','_self',1489847080381),(5,NULL,'专题','/topic/list','_self',1489847186646),(6,NULL,'关于','/page/about','_self',1489847186647);
/*!40000 ALTER TABLE `cms_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编码',
  `pid` int(10) DEFAULT NULL COMMENT '父页面',
  `title` varchar(20) DEFAULT NULL COMMENT '标题',
  `alias` varchar(20) DEFAULT NULL COMMENT '别名',
  `content` mediumtext COMMENT '页面内容',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='页面';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page`
--

LOCK TABLES `cms_page` WRITE;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
INSERT INTO `cms_page` VALUES (1,NULL,'关于','about','作者：张恕征','单页关键字','单页描述',1489839705049,1489839705049);
/*!40000 ALTER TABLE `cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_setting`
--

DROP TABLE IF EXISTS `cms_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_setting` (
  `setting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(10) DEFAULT NULL,
  `setting_value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='网站配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_setting`
--

LOCK TABLES `cms_setting` WRITE;
/*!40000 ALTER TABLE `cms_setting` DISABLE KEYS */;
INSERT INTO `cms_setting` VALUES (1,'copyright','© 2017 Zhang Shuzheng');
/*!40000 ALTER TABLE `cms_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_system`
--

DROP TABLE IF EXISTS `cms_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_system` (
  `system_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) NOT NULL COMMENT '系统名称',
  `code` varchar(20) DEFAULT NULL COMMENT '别名',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='系统管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_system`
--

LOCK TABLES `cms_system` WRITE;
/*!40000 ALTER TABLE `cms_system` DISABLE KEYS */;
INSERT INTO `cms_system` VALUES (1,'资讯','news','资讯',1,1),(2,'问答','qa','问答',2,2),(3,'博客','blog','博客',3,3);
/*!40000 ALTER TABLE `cms_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_tag`
--

DROP TABLE IF EXISTS `cms_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_tag` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签编号',
  `name` varchar(20) NOT NULL COMMENT '名称',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型(1:普通,2:热门...)',
  `alias` varchar(20) DEFAULT NULL COMMENT '别名',
  `system_id` int(11) DEFAULT NULL COMMENT '所属系统',
  `ctime` bigint(20) unsigned NOT NULL COMMENT '创建时间',
  `orders` bigint(20) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`tag_id`),
  KEY `cms_tag_orders` (`orders`),
  KEY `cms_tag_alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_tag`
--

LOCK TABLES `cms_tag` WRITE;
/*!40000 ALTER TABLE `cms_tag` DISABLE KEYS */;
INSERT INTO `cms_tag` VALUES (1,'JAVA','java标签','',1,'java',1,1489585694864,1489585694864),(2,'Android','android标签','',1,'android',1,1489585720382,1489585720382),(3,'zheng','zheng标签','',2,'zheng',1,1489585815042,1489585815042),(4,'谈恋爱','谈恋爱标签','',1,'love',2,1489585815043,1489585815043),(5,'java','java标签','',1,'java',3,1489585815044,1489585815044);
/*!40000 ALTER TABLE `cms_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_topic`
--

DROP TABLE IF EXISTS `cms_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `url` varchar(100) DEFAULT NULL COMMENT '链接',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='专题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_topic`
--

LOCK TABLES `cms_topic` WRITE;
/*!40000 ALTER TABLE `cms_topic` DISABLE KEYS */;
INSERT INTO `cms_topic` VALUES (1,'日本地震专题','日本经历灭国性地震，彻底沉入海底','/topic/1',1489843484448);
/*!40000 ALTER TABLE `cms_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_in_order`
--

DROP TABLE IF EXISTS `pay_in_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_in_order` (
  `pay_in_order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_vendor_id` int(10) DEFAULT NULL,
  `pay_mch_id` int(10) DEFAULT NULL,
  `amount` decimal(10,0) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `ctime` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`pay_in_order_id`),
  KEY `FK_Reference_32` (`pay_vendor_id`),
  KEY `FK_Reference_38` (`pay_mch_id`),
  CONSTRAINT `FK_Reference_32` FOREIGN KEY (`pay_vendor_id`) REFERENCES `pay_vendor` (`pay_vendor_id`),
  CONSTRAINT `FK_Reference_38` FOREIGN KEY (`pay_mch_id`) REFERENCES `pay_mch` (`pay_mch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收入订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_in_order`
--

LOCK TABLES `pay_in_order` WRITE;
/*!40000 ALTER TABLE `pay_in_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_in_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_in_order_detail`
--

DROP TABLE IF EXISTS `pay_in_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_in_order_detail` (
  `pay_in_order_detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_in_order_id` int(10) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_price` decimal(10,0) DEFAULT NULL,
  `product_count` int(10) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`pay_in_order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收入订单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_in_order_detail`
--

LOCK TABLES `pay_in_order_detail` WRITE;
/*!40000 ALTER TABLE `pay_in_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_in_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_mch`
--

DROP TABLE IF EXISTS `pay_mch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_mch` (
  `pay_mch_id` int(10) NOT NULL AUTO_INCREMENT,
  `mch_id` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `reqKey` varchar(50) DEFAULT NULL,
  `resKey` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pay_mch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付中心商户管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_mch`
--

LOCK TABLES `pay_mch` WRITE;
/*!40000 ALTER TABLE `pay_mch` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_mch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_out_order`
--

DROP TABLE IF EXISTS `pay_out_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_out_order` (
  `pay_out_order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_mch_id` int(10) DEFAULT NULL,
  `pay_vendor_id` int(10) DEFAULT NULL,
  `amount` decimal(10,0) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `ctime` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`pay_out_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支出订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_out_order`
--

LOCK TABLES `pay_out_order` WRITE;
/*!40000 ALTER TABLE `pay_out_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_out_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_out_order_detail`
--

DROP TABLE IF EXISTS `pay_out_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_out_order_detail` (
  `pay_out_order_detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_out_order_id` int(10) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`pay_out_order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支出订单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_out_order_detail`
--

LOCK TABLES `pay_out_order_detail` WRITE;
/*!40000 ALTER TABLE `pay_out_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_out_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_pay`
--

DROP TABLE IF EXISTS `pay_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_pay` (
  `pay_pay_id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_type_id` int(10) DEFAULT NULL,
  `param` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`pay_pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_pay`
--

LOCK TABLES `pay_pay` WRITE;
/*!40000 ALTER TABLE `pay_pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_type`
--

DROP TABLE IF EXISTS `pay_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_type` (
  `pay_type_id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_vendor_id` int(10) DEFAULT NULL,
  `pay_mch_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`pay_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商户支持支付类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_type`
--

LOCK TABLES `pay_type` WRITE;
/*!40000 ALTER TABLE `pay_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_vendor`
--

DROP TABLE IF EXISTS `pay_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_vendor` (
  `pay_vendor_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `appsecret` varchar(150) DEFAULT NULL,
  `config` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`pay_vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方支付标识表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_vendor`
--

LOCK TABLES `pay_vendor` WRITE;
/*!40000 ALTER TABLE `pay_vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_vest`
--

DROP TABLE IF EXISTS `pay_vest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_vest` (
  `pay_vest_id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_type_id` int(10) DEFAULT NULL,
  `prefix` varchar(20) DEFAULT NULL,
  `param` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`pay_vest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='马甲支付参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_vest`
--

LOCK TABLES `pay_vest` WRITE;
/*!40000 ALTER TABLE `pay_vest` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_vest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ucenter_oauth`
--

DROP TABLE IF EXISTS `ucenter_oauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ucenter_oauth` (
  `oauth_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) DEFAULT NULL COMMENT '认证方式名称',
  PRIMARY KEY (`oauth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='认证方式表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ucenter_oauth`
--

LOCK TABLES `ucenter_oauth` WRITE;
/*!40000 ALTER TABLE `ucenter_oauth` DISABLE KEYS */;
INSERT INTO `ucenter_oauth` VALUES (1,'手机'),(2,'微信'),(3,'QQ'),(4,'微博');
/*!40000 ALTER TABLE `ucenter_oauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ucenter_user`
--

DROP TABLE IF EXISTS `ucenter_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ucenter_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `password` varchar(32) DEFAULT NULL COMMENT '密码(MD5(密码+盐))',
  `salt` varchar(32) DEFAULT NULL COMMENT '盐',
  `nickname` varchar(20) DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(4) DEFAULT '0' COMMENT '性别(0:未知,1:男,2:女)',
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `create_ip` varchar(50) DEFAULT NULL COMMENT '注册IP地址',
  `last_login_time` timestamp NOT NULL DEFAULT '1970-01-01 04:00:00' COMMENT '最后登录时间',
  `last_login_ip` varchar(50) DEFAULT NULL COMMENT '最后登录IP地址',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ucenter_user`
--

LOCK TABLES `ucenter_user` WRITE;
/*!40000 ALTER TABLE `ucenter_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ucenter_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ucenter_user_details`
--

DROP TABLE IF EXISTS `ucenter_user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ucenter_user_details` (
  `user_id` int(10) unsigned NOT NULL COMMENT '编号',
  `signature` varchar(300) DEFAULT NULL COMMENT '个性签名',
  `real_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `birthday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '出生日期',
  `question` varchar(100) DEFAULT NULL COMMENT '帐号安全问题',
  `answer` varchar(100) DEFAULT NULL COMMENT '帐号安全答案',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `FK_Reference_41` FOREIGN KEY (`user_id`) REFERENCES `ucenter_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ucenter_user_details`
--

LOCK TABLES `ucenter_user_details` WRITE;
/*!40000 ALTER TABLE `ucenter_user_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `ucenter_user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ucenter_user_log`
--

DROP TABLE IF EXISTS `ucenter_user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ucenter_user_log` (
  `user_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户编号',
  `content` varbinary(100) DEFAULT NULL COMMENT '内容',
  `ip` varchar(20) DEFAULT NULL COMMENT '操作IP地址',
  `agent` varbinary(200) DEFAULT NULL COMMENT '操作环境',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`user_log_id`),
  KEY `FK_Reference_44` (`user_id`),
  CONSTRAINT `FK_Reference_44` FOREIGN KEY (`user_id`) REFERENCES `ucenter_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ucenter_user_log`
--

LOCK TABLES `ucenter_user_log` WRITE;
/*!40000 ALTER TABLE `ucenter_user_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ucenter_user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ucenter_user_oauth`
--

DROP TABLE IF EXISTS `ucenter_user_oauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ucenter_user_oauth` (
  `user_oauth_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '帐号编号',
  `oauth_id` int(10) unsigned NOT NULL COMMENT '认证方式编号',
  `open_id` varbinary(50) NOT NULL COMMENT '第三方ID',
  `status` tinyint(4) unsigned DEFAULT NULL COMMENT '绑定状态(0:解绑,1:绑定)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`user_oauth_id`),
  KEY `FK_Reference_42` (`user_id`),
  KEY `FK_Reference_43` (`oauth_id`),
  CONSTRAINT `FK_Reference_42` FOREIGN KEY (`user_id`) REFERENCES `ucenter_user` (`user_id`),
  CONSTRAINT `FK_Reference_43` FOREIGN KEY (`oauth_id`) REFERENCES `ucenter_oauth` (`oauth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户认证方式表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ucenter_user_oauth`
--

LOCK TABLES `ucenter_user_oauth` WRITE;
/*!40000 ALTER TABLE `ucenter_user_oauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `ucenter_user_oauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upms_log`
--

DROP TABLE IF EXISTS `upms_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upms_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `description` varchar(100) DEFAULT NULL COMMENT '操作描述',
  `username` varchar(20) DEFAULT NULL COMMENT '操作用户',
  `start_time` bigint(20) DEFAULT NULL COMMENT '操作时间',
  `spend_time` int(11) DEFAULT NULL COMMENT '消耗时间',
  `base_path` varchar(500) DEFAULT NULL COMMENT '根路径',
  `uri` varchar(500) DEFAULT NULL COMMENT 'URI',
  `url` varchar(500) DEFAULT NULL COMMENT 'URL',
  `method` varchar(10) DEFAULT NULL COMMENT '请求类型',
  `parameter` mediumtext,
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户标识',
  `ip` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `result` mediumtext,
  `permissions` varchar(100) DEFAULT NULL COMMENT '权限值',
  PRIMARY KEY (`log_id`),
  KEY `log_id` (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=893 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upms_log`
--

LOCK TABLES `upms_log` WRITE;
/*!40000 ALTER TABLE `upms_log` DISABLE KEYS */;
INSERT INTO `upms_log` VALUES (780,'系统首页','admin',1534503516634,12,'http://127.0.0.1:1111','/manage/system/index','http://127.0.0.1:1111/manage/system/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/system/index.jsp\"','upms:system:read'),(781,'系统列表','admin',1534503517213,18,'http://127.0.0.1:1111','/manage/system/list','http://127.0.0.1:1111/manage/system/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":5,\"rows\":[{\"banner\":\"/resources/zheng-admin/images/zheng-upms.png\",\"basepath\":\"http://127.0.0.1:1111\",\"ctime\":1,\"description\":\"用户权限管理系统（RBAC细粒度用户权限、统一后台、单点登录、会话管理）\",\"icon\":\"zmdi zmdi-shield-security\",\"name\":\"zheng-upms-server\",\"orders\":1,\"status\":1,\"systemId\":1,\"theme\":\"#29A176\",\"title\":\"权限管理系统\"},{\"banner\":\"/resources/zheng-admin/images/zheng-cms.png\",\"basepath\":\"http://127.0.0.1:2222\",\"ctime\":2,\"description\":\"内容管理系统（门户、博客、论坛、问答等）\",\"icon\":\"zmdi zmdi-wikipedia\",\"name\":\"zheng-cms-admin\",\"orders\":2,\"status\":1,\"systemId\":2,\"theme\":\"#455EC5\",\"title\":\"内容管理系统\"},{\"banner\":\"/resources/zheng-admin/images/zheng-pay.png\",\"basepath\":\"http://127.0.0.1:3331\",\"ctime\":3,\"description\":\"支付管理系统\",\"icon\":\"zmdi zmdi-paypal-alt\",\"name\":\"zheng-pay-admin\",\"orders\":3,\"status\":1,\"systemId\":3,\"theme\":\"#F06292\",\"title\":\"支付管理系统\"},{\"banner\":\"/resources/zheng-admin/images/zheng-ucenter.png\",\"basepath\":\"http://127.0.0.1:4441\",\"ctime\":4,\"description\":\"用户管理系统\",\"icon\":\"zmdi zmdi-account\",\"name\":\"zheng-ucenter-home\",\"orders\":4,\"status\":1,\"systemId\":4,\"theme\":\"#6539B4\",\"title\":\"用户管理系统\"},{\"banner\":\"/resources/zheng-admin/images/zheng-oss.png\",\"basepath\":\"http://127.0.0.1:7771\",\"ctime\":5,\"description\":\"存储管理系统\",\"icon\":\"zmdi zmdi-cloud\",\"name\":\"zheng-oss-web\",\"orders\":5,\"status\":1,\"systemId\":5,\"theme\":\"#0B8DE5\",\"title\":\"存储管理系统\"}]}','upms:system:read'),(782,'组织首页','admin',1534503517563,11,'http://127.0.0.1:1111','/manage/organization/index','http://127.0.0.1:1111/manage/organization/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/organization/index.jsp\"','upms:organization:read'),(783,'组织列表','admin',1534503517869,18,'http://127.0.0.1:1111','/manage/organization/list','http://127.0.0.1:1111/manage/organization/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":5,\"rows\":[{\"ctime\":1,\"description\":\"北京总部\",\"name\":\"总部\",\"organizationId\":1},{\"ctime\":1488122466236,\"description\":\"河北石家庄\",\"name\":\"河北分部\",\"organizationId\":4},{\"ctime\":1488122480265,\"description\":\"河南郑州\",\"name\":\"河南分部\",\"organizationId\":5},{\"ctime\":1488122493265,\"description\":\"湖北武汉\",\"name\":\"湖北分部\",\"organizationId\":6},{\"ctime\":1488122502752,\"description\":\"湖南长沙\",\"name\":\"湖南分部\",\"organizationId\":7}]}','upms:organization:read'),(784,'用户首页','admin',1534503521946,14,'http://127.0.0.1:1111','/manage/user/index','http://127.0.0.1:1111/manage/user/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/user/index.jsp\"','upms:user:read'),(785,'用户列表','admin',1534503522333,27,'http://127.0.0.1:1111','/manage/user/list','http://127.0.0.1:1111/manage/user/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":2,\"rows\":[{\"avatar\":\"/resources/zheng-admin/images/avatar.jpg\",\"ctime\":1,\"email\":\"469741414@qq.com\",\"locked\":0,\"password\":\"3038D9CB63B3152A79B8153FB06C02F7\",\"phone\":\"\",\"realname\":\"张恕征\",\"salt\":\"66f1b370c660445a8657bf8bf1794486\",\"sex\":1,\"userId\":1,\"username\":\"admin\"},{\"avatar\":\"/resources/zheng-admin/images/avatar.jpg\",\"ctime\":1493394720495,\"email\":\"469741414@qq.com\",\"locked\":0,\"password\":\"285C9762F5F9046F5893F752DFAF3476\",\"phone\":\"\",\"realname\":\"张恕征\",\"salt\":\"d2d0d03310444ad388a8b290b0fe8564\",\"sex\":1,\"userId\":2,\"username\":\"test\"}]}','upms:user:read'),(786,'角色首页','admin',1534503523021,12,'http://127.0.0.1:1111','/manage/role/index','http://127.0.0.1:1111/manage/role/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/role/index.jsp\"','upms:role:read'),(787,'角色列表','admin',1534503523331,23,'http://127.0.0.1:1111','/manage/role/list','http://127.0.0.1:1111/manage/role/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":2,\"rows\":[{\"ctime\":1,\"description\":\"拥有所有权限\",\"name\":\"super\",\"orders\":1,\"roleId\":1,\"title\":\"超级管理员\"},{\"ctime\":1487471013117,\"description\":\"拥有除权限管理系统外的所有权限\",\"name\":\"admin\",\"orders\":1487471013117,\"roleId\":2,\"title\":\"管理员\"}]}','upms:role:read'),(788,'权限首页','admin',1534503527915,9,'http://127.0.0.1:1111','/manage/permission/index','http://127.0.0.1:1111/manage/permission/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/permission/index.jsp\"','upms:permission:read'),(789,'权限列表','admin',1534503528252,25,'http://127.0.0.1:1111','/manage/permission/list','http://127.0.0.1:1111/manage/permission/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":69,\"rows\":[{\"ctime\":1,\"icon\":\"zmdi zmdi-accounts-list\",\"name\":\"系统组织管理\",\"orders\":1,\"permissionId\":1,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":2,\"icon\":\"\",\"name\":\"系统管理\",\"orders\":2,\"permissionId\":2,\"permissionValue\":\"upms:system:read\",\"pid\":1,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/system/index\"},{\"ctime\":3,\"icon\":\"\",\"name\":\"组织管理\",\"orders\":3,\"permissionId\":3,\"permissionValue\":\"upms:organization:read\",\"pid\":1,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/organization/index\"},{\"ctime\":4,\"icon\":\"zmdi zmdi-accounts\",\"name\":\"角色用户管理\",\"orders\":4,\"permissionId\":4,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":6,\"icon\":\"\",\"name\":\"角色管理\",\"orders\":6,\"permissionId\":5,\"permissionValue\":\"upms:role:read\",\"pid\":4,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/role/index\"},{\"ctime\":5,\"icon\":\"\",\"name\":\"用户管理\",\"orders\":5,\"permissionId\":6,\"permissionValue\":\"upms:user:read\",\"pid\":4,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/user/index\"},{\"ctime\":7,\"icon\":\"zmdi zmdi-lock-outline\",\"name\":\"权限资源管理\",\"orders\":7,\"permissionId\":7,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":12,\"icon\":\"zmdi zmdi-more\",\"name\":\"其他数据管理\",\"orders\":12,\"permissionId\":12,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":14,\"icon\":\"\",\"name\":\"会话管理\",\"orders\":14,\"permissionId\":14,\"permissionValue\":\"upms:session:read\",\"pid\":12,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/session/index\"},{\"ctime\":15,\"icon\":\"\",\"name\":\"日志记录\",\"orders\":15,\"permissionId\":15,\"permissionValue\":\"upms:log:read\",\"pid\":12,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/log/index\"}]}','upms:permission:read'),(790,'会话首页','admin',1534503539871,7,'http://127.0.0.1:1111','/manage/session/index','http://127.0.0.1:1111/manage/session/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/session/index.jsp\"','upms:session:read'),(791,'会话列表','admin',1534503540205,8,'http://127.0.0.1:1111','/manage/session/list','http://127.0.0.1:1111/manage/session/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":1,\"rows\":[{\"attributeKeys\":[\"org.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEY\",\"zheng.upms.type\",\"org.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEY\"],\"status\":\"on_line\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"valid\":true}]}','upms:session:read'),(792,'日志首页','admin',1534503543246,8,'http://127.0.0.1:1111','/manage/log/index','http://127.0.0.1:1111/manage/log/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/log/index.jsp\"','upms:log:read'),(793,'日志列表','admin',1534503543478,28,'http://127.0.0.1:1111','/manage/log/list','http://127.0.0.1:1111/manage/log/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":14,\"rows\":[{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"后台首页\",\"ip\":\"127.0.0.1\",\"logId\":779,\"method\":\"GET\",\"spendTime\":95,\"startTime\":1534503505315,\"uri\":\"/manage/index\",\"url\":\"http://127.0.0.1:1111/manage/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"系统首页\",\"ip\":\"127.0.0.1\",\"logId\":780,\"method\":\"GET\",\"permissions\":\"upms:system:read\",\"spendTime\":12,\"startTime\":1534503516634,\"uri\":\"/manage/system/index\",\"url\":\"http://127.0.0.1:1111/manage/system/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"系统列表\",\"ip\":\"127.0.0.1\",\"logId\":781,\"method\":\"GET\",\"permissions\":\"upms:system:read\",\"spendTime\":18,\"startTime\":1534503517213,\"uri\":\"/manage/system/list\",\"url\":\"http://127.0.0.1:1111/manage/system/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"组织首页\",\"ip\":\"127.0.0.1\",\"logId\":782,\"method\":\"GET\",\"permissions\":\"upms:organization:read\",\"spendTime\":11,\"startTime\":1534503517563,\"uri\":\"/manage/organization/index\",\"url\":\"http://127.0.0.1:1111/manage/organization/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"组织列表\",\"ip\":\"127.0.0.1\",\"logId\":783,\"method\":\"GET\",\"permissions\":\"upms:organization:read\",\"spendTime\":18,\"startTime\":1534503517869,\"uri\":\"/manage/organization/list\",\"url\":\"http://127.0.0.1:1111/manage/organization/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"用户首页\",\"ip\":\"127.0.0.1\",\"logId\":784,\"method\":\"GET\",\"permissions\":\"upms:user:read\",\"spendTime\":14,\"startTime\":1534503521946,\"uri\":\"/manage/user/index\",\"url\":\"http://127.0.0.1:1111/manage/user/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"用户列表\",\"ip\":\"127.0.0.1\",\"logId\":785,\"method\":\"GET\",\"permissions\":\"upms:user:read\",\"spendTime\":27,\"startTime\":1534503522333,\"uri\":\"/manage/user/list\",\"url\":\"http://127.0.0.1:1111/manage/user/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"角色首页\",\"ip\":\"127.0.0.1\",\"logId\":786,\"method\":\"GET\",\"permissions\":\"upms:role:read\",\"spendTime\":12,\"startTime\":1534503523021,\"uri\":\"/manage/role/index\",\"url\":\"http://127.0.0.1:1111/manage/role/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"角色列表\",\"ip\":\"127.0.0.1\",\"logId\":787,\"method\":\"GET\",\"permissions\":\"upms:role:read\",\"spendTime\":23,\"startTime\":1534503523331,\"uri\":\"/manage/role/list\",\"url\":\"http://127.0.0.1:1111/manage/role/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"权限首页\",\"ip\":\"127.0.0.1\",\"logId\":788,\"method\":\"GET\",\"permissions\":\"upms:permission:read\",\"spendTime\":9,\"startTime\":1534503527915,\"uri\":\"/manage/permission/index\",\"url\":\"http://127.0.0.1:1111/manage/permission/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"}]}','upms:log:read'),(794,'系统首页','admin',1534503718455,0,'http://127.0.0.1:1111','/manage/system/index','http://127.0.0.1:1111/manage/system/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/system/index.jsp\"','upms:system:read'),(795,'系统列表','admin',1534503718722,8,'http://127.0.0.1:1111','/manage/system/list','http://127.0.0.1:1111/manage/system/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":5,\"rows\":[{\"banner\":\"/resources/zheng-admin/images/zheng-upms.png\",\"basepath\":\"http://127.0.0.1:1111\",\"ctime\":1,\"description\":\"用户权限管理系统（RBAC细粒度用户权限、统一后台、单点登录、会话管理）\",\"icon\":\"zmdi zmdi-shield-security\",\"name\":\"zheng-upms-server\",\"orders\":1,\"status\":1,\"systemId\":1,\"theme\":\"#29A176\",\"title\":\"权限管理系统\"},{\"banner\":\"/resources/zheng-admin/images/zheng-cms.png\",\"basepath\":\"http://127.0.0.1:2222\",\"ctime\":2,\"description\":\"内容管理系统（门户、博客、论坛、问答等）\",\"icon\":\"zmdi zmdi-wikipedia\",\"name\":\"zheng-cms-admin\",\"orders\":2,\"status\":1,\"systemId\":2,\"theme\":\"#455EC5\",\"title\":\"内容管理系统\"},{\"banner\":\"/resources/zheng-admin/images/zheng-pay.png\",\"basepath\":\"http://127.0.0.1:3331\",\"ctime\":3,\"description\":\"支付管理系统\",\"icon\":\"zmdi zmdi-paypal-alt\",\"name\":\"zheng-pay-admin\",\"orders\":3,\"status\":1,\"systemId\":3,\"theme\":\"#F06292\",\"title\":\"支付管理系统\"},{\"banner\":\"/resources/zheng-admin/images/zheng-ucenter.png\",\"basepath\":\"http://127.0.0.1:4441\",\"ctime\":4,\"description\":\"用户管理系统\",\"icon\":\"zmdi zmdi-account\",\"name\":\"zheng-ucenter-home\",\"orders\":4,\"status\":1,\"systemId\":4,\"theme\":\"#6539B4\",\"title\":\"用户管理系统\"},{\"banner\":\"/resources/zheng-admin/images/zheng-oss.png\",\"basepath\":\"http://127.0.0.1:7771\",\"ctime\":5,\"description\":\"存储管理系统\",\"icon\":\"zmdi zmdi-cloud\",\"name\":\"zheng-oss-web\",\"orders\":5,\"status\":1,\"systemId\":5,\"theme\":\"#0B8DE5\",\"title\":\"存储管理系统\"}]}','upms:system:read'),(796,'组织首页','admin',1534503719789,0,'http://127.0.0.1:1111','/manage/organization/index','http://127.0.0.1:1111/manage/organization/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/organization/index.jsp\"','upms:organization:read'),(797,'组织列表','admin',1534503719970,7,'http://127.0.0.1:1111','/manage/organization/list','http://127.0.0.1:1111/manage/organization/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":5,\"rows\":[{\"ctime\":1,\"description\":\"北京总部\",\"name\":\"总部\",\"organizationId\":1},{\"ctime\":1488122466236,\"description\":\"河北石家庄\",\"name\":\"河北分部\",\"organizationId\":4},{\"ctime\":1488122480265,\"description\":\"河南郑州\",\"name\":\"河南分部\",\"organizationId\":5},{\"ctime\":1488122493265,\"description\":\"湖北武汉\",\"name\":\"湖北分部\",\"organizationId\":6},{\"ctime\":1488122502752,\"description\":\"湖南长沙\",\"name\":\"湖南分部\",\"organizationId\":7}]}','upms:organization:read'),(798,'用户首页','admin',1534503722460,0,'http://127.0.0.1:1111','/manage/user/index','http://127.0.0.1:1111/manage/user/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/user/index.jsp\"','upms:user:read'),(799,'用户列表','admin',1534503722690,8,'http://127.0.0.1:1111','/manage/user/list','http://127.0.0.1:1111/manage/user/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":2,\"rows\":[{\"avatar\":\"/resources/zheng-admin/images/avatar.jpg\",\"ctime\":1,\"email\":\"469741414@qq.com\",\"locked\":0,\"password\":\"3038D9CB63B3152A79B8153FB06C02F7\",\"phone\":\"\",\"realname\":\"张恕征\",\"salt\":\"66f1b370c660445a8657bf8bf1794486\",\"sex\":1,\"userId\":1,\"username\":\"admin\"},{\"avatar\":\"/resources/zheng-admin/images/avatar.jpg\",\"ctime\":1493394720495,\"email\":\"469741414@qq.com\",\"locked\":0,\"password\":\"285C9762F5F9046F5893F752DFAF3476\",\"phone\":\"\",\"realname\":\"张恕征\",\"salt\":\"d2d0d03310444ad388a8b290b0fe8564\",\"sex\":1,\"userId\":2,\"username\":\"test\"}]}','upms:user:read'),(800,'角色首页','admin',1534503724952,0,'http://127.0.0.1:1111','/manage/role/index','http://127.0.0.1:1111/manage/role/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/role/index.jsp\"','upms:role:read'),(801,'角色列表','admin',1534503725118,6,'http://127.0.0.1:1111','/manage/role/list','http://127.0.0.1:1111/manage/role/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":2,\"rows\":[{\"ctime\":1,\"description\":\"拥有所有权限\",\"name\":\"super\",\"orders\":1,\"roleId\":1,\"title\":\"超级管理员\"},{\"ctime\":1487471013117,\"description\":\"拥有除权限管理系统外的所有权限\",\"name\":\"admin\",\"orders\":1487471013117,\"roleId\":2,\"title\":\"管理员\"}]}','upms:role:read'),(802,'修改用户','admin',1534503741022,3,'http://127.0.0.1:1111','/manage/user/update/2','http://127.0.0.1:1111/manage/user/update/2','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/user/update.jsp\"','upms:user:update'),(803,'修改用户','admin',1534503744607,3,'http://127.0.0.1:1111','/manage/user/update/2','http://127.0.0.1:1111/manage/user/update/2','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/user/update.jsp\"','upms:user:update'),(804,'退出登录','',1534503861094,14,'http://127.0.0.1:1111','/sso/logout','http://127.0.0.1:1111/sso/logout','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"redirect:http://127.0.0.1:1111/manage/index\"',NULL),(805,'登录','',1534503861144,0,'http://127.0.0.1:1111','/sso/login','http://127.0.0.1:1111/sso/login','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/sso/login.jsp\"',NULL),(806,'登录','admin',1534503862889,24,'http://127.0.0.1:1111','/sso/login','http://127.0.0.1:1111/sso/login','POST','{password=[123456],rememberMe=[false],backurl=[],username=[admin]}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"code\":1,\"data\":\"http://127.0.0.1:1111\",\"message\":\"success\"}',NULL),(807,'后台首页','admin',1534503862959,17,'http://127.0.0.1:1111','/manage/index','http://127.0.0.1:1111/manage/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/index.jsp\"',NULL),(808,'登录','',1534511591559,0,'http://127.0.0.1:1111','/sso/login','http://127.0.0.1:1111/sso/login','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/sso/login.jsp\"',NULL),(809,'登录','',1534511591704,1,'http://127.0.0.1:1111','/sso/login','http://127.0.0.1:1111/sso/login','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/sso/login.jsp\"',NULL),(810,'登录','admin',1534511593585,13,'http://127.0.0.1:1111','/sso/login','http://127.0.0.1:1111/sso/login','POST','{password=[123456],rememberMe=[false],backurl=[],username=[admin]}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"code\":1,\"data\":\"http://127.0.0.1:1111\",\"message\":\"success\"}',NULL),(811,'后台首页','admin',1534511593636,15,'http://127.0.0.1:1111','/manage/index','http://127.0.0.1:1111/manage/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/index.jsp\"',NULL),(812,'系统首页','admin',1534511597696,0,'http://127.0.0.1:1111','/manage/system/index','http://127.0.0.1:1111/manage/system/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/system/index.jsp\"','upms:system:read'),(813,'系统列表','admin',1534511597897,7,'http://127.0.0.1:1111','/manage/system/list','http://127.0.0.1:1111/manage/system/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":5,\"rows\":[{\"banner\":\"/resources/zheng-admin/images/zheng-upms.png\",\"basepath\":\"http://127.0.0.1:1111\",\"ctime\":1,\"description\":\"用户权限管理系统（RBAC细粒度用户权限、统一后台、单点登录、会话管理）\",\"icon\":\"zmdi zmdi-shield-security\",\"name\":\"zheng-upms-server\",\"orders\":1,\"status\":1,\"systemId\":1,\"theme\":\"#29A176\",\"title\":\"权限管理系统\"},{\"banner\":\"/resources/zheng-admin/images/zheng-cms.png\",\"basepath\":\"http://127.0.0.1:2222\",\"ctime\":2,\"description\":\"内容管理系统（门户、博客、论坛、问答等）\",\"icon\":\"zmdi zmdi-wikipedia\",\"name\":\"zheng-cms-admin\",\"orders\":2,\"status\":1,\"systemId\":2,\"theme\":\"#455EC5\",\"title\":\"内容管理系统\"},{\"banner\":\"/resources/zheng-admin/images/zheng-pay.png\",\"basepath\":\"http://127.0.0.1:3331\",\"ctime\":3,\"description\":\"支付管理系统\",\"icon\":\"zmdi zmdi-paypal-alt\",\"name\":\"zheng-pay-admin\",\"orders\":3,\"status\":1,\"systemId\":3,\"theme\":\"#F06292\",\"title\":\"支付管理系统\"},{\"banner\":\"/resources/zheng-admin/images/zheng-ucenter.png\",\"basepath\":\"http://127.0.0.1:4441\",\"ctime\":4,\"description\":\"用户管理系统\",\"icon\":\"zmdi zmdi-account\",\"name\":\"zheng-ucenter-home\",\"orders\":4,\"status\":1,\"systemId\":4,\"theme\":\"#6539B4\",\"title\":\"用户管理系统\"},{\"banner\":\"/resources/zheng-admin/images/zheng-oss.png\",\"basepath\":\"http://127.0.0.1:7771\",\"ctime\":5,\"description\":\"存储管理系统\",\"icon\":\"zmdi zmdi-cloud\",\"name\":\"zheng-oss-web\",\"orders\":5,\"status\":1,\"systemId\":5,\"theme\":\"#0B8DE5\",\"title\":\"存储管理系统\"}]}','upms:system:read'),(814,'系统列表','admin',1534511618215,6,'http://127.0.0.1:1111','/manage/system/list','http://127.0.0.1:1111/manage/system/list','GET','search=oss&order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":0,\"rows\":[]}','upms:system:read'),(815,'系统列表','admin',1534511621289,5,'http://127.0.0.1:1111','/manage/system/list','http://127.0.0.1:1111/manage/system/list','GET','search=&order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":5,\"rows\":[{\"banner\":\"/resources/zheng-admin/images/zheng-upms.png\",\"basepath\":\"http://127.0.0.1:1111\",\"ctime\":1,\"description\":\"用户权限管理系统（RBAC细粒度用户权限、统一后台、单点登录、会话管理）\",\"icon\":\"zmdi zmdi-shield-security\",\"name\":\"zheng-upms-server\",\"orders\":1,\"status\":1,\"systemId\":1,\"theme\":\"#29A176\",\"title\":\"权限管理系统\"},{\"banner\":\"/resources/zheng-admin/images/zheng-cms.png\",\"basepath\":\"http://127.0.0.1:2222\",\"ctime\":2,\"description\":\"内容管理系统（门户、博客、论坛、问答等）\",\"icon\":\"zmdi zmdi-wikipedia\",\"name\":\"zheng-cms-admin\",\"orders\":2,\"status\":1,\"systemId\":2,\"theme\":\"#455EC5\",\"title\":\"内容管理系统\"},{\"banner\":\"/resources/zheng-admin/images/zheng-pay.png\",\"basepath\":\"http://127.0.0.1:3331\",\"ctime\":3,\"description\":\"支付管理系统\",\"icon\":\"zmdi zmdi-paypal-alt\",\"name\":\"zheng-pay-admin\",\"orders\":3,\"status\":1,\"systemId\":3,\"theme\":\"#F06292\",\"title\":\"支付管理系统\"},{\"banner\":\"/resources/zheng-admin/images/zheng-ucenter.png\",\"basepath\":\"http://127.0.0.1:4441\",\"ctime\":4,\"description\":\"用户管理系统\",\"icon\":\"zmdi zmdi-account\",\"name\":\"zheng-ucenter-home\",\"orders\":4,\"status\":1,\"systemId\":4,\"theme\":\"#6539B4\",\"title\":\"用户管理系统\"},{\"banner\":\"/resources/zheng-admin/images/zheng-oss.png\",\"basepath\":\"http://127.0.0.1:7771\",\"ctime\":5,\"description\":\"存储管理系统\",\"icon\":\"zmdi zmdi-cloud\",\"name\":\"zheng-oss-web\",\"orders\":5,\"status\":1,\"systemId\":5,\"theme\":\"#0B8DE5\",\"title\":\"存储管理系统\"}]}','upms:system:read'),(816,'修改系统','admin',1534511636572,3,'http://127.0.0.1:1111','/manage/system/update/3','http://127.0.0.1:1111/manage/system/update/3','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/system/update.jsp\"','upms:system:update'),(817,'新增系统','admin',1534511705793,0,'http://127.0.0.1:1111','/manage/system/create','http://127.0.0.1:1111/manage/system/create','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/system/create.jsp\"','upms:system:create'),(818,'组织首页','admin',1534511712220,0,'http://127.0.0.1:1111','/manage/organization/index','http://127.0.0.1:1111/manage/organization/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/organization/index.jsp\"','upms:organization:read'),(819,'组织列表','admin',1534511712424,6,'http://127.0.0.1:1111','/manage/organization/list','http://127.0.0.1:1111/manage/organization/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":5,\"rows\":[{\"ctime\":1,\"description\":\"北京总部\",\"name\":\"总部\",\"organizationId\":1},{\"ctime\":1488122466236,\"description\":\"河北石家庄\",\"name\":\"河北分部\",\"organizationId\":4},{\"ctime\":1488122480265,\"description\":\"河南郑州\",\"name\":\"河南分部\",\"organizationId\":5},{\"ctime\":1488122493265,\"description\":\"湖北武汉\",\"name\":\"湖北分部\",\"organizationId\":6},{\"ctime\":1488122502752,\"description\":\"湖南长沙\",\"name\":\"湖南分部\",\"organizationId\":7}]}','upms:organization:read'),(820,'用户首页','admin',1534512040433,0,'http://127.0.0.1:1111','/manage/user/index','http://127.0.0.1:1111/manage/user/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/user/index.jsp\"','upms:user:read'),(821,'用户列表','admin',1534512040687,6,'http://127.0.0.1:1111','/manage/user/list','http://127.0.0.1:1111/manage/user/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":2,\"rows\":[{\"avatar\":\"/resources/zheng-admin/images/avatar.jpg\",\"ctime\":1,\"email\":\"469741414@qq.com\",\"locked\":0,\"password\":\"3038D9CB63B3152A79B8153FB06C02F7\",\"phone\":\"\",\"realname\":\"张恕征\",\"salt\":\"66f1b370c660445a8657bf8bf1794486\",\"sex\":1,\"userId\":1,\"username\":\"admin\"},{\"avatar\":\"/resources/zheng-admin/images/avatar.jpg\",\"ctime\":1493394720495,\"email\":\"469741414@qq.com\",\"locked\":0,\"password\":\"285C9762F5F9046F5893F752DFAF3476\",\"phone\":\"\",\"realname\":\"张恕征\",\"salt\":\"d2d0d03310444ad388a8b290b0fe8564\",\"sex\":1,\"userId\":2,\"username\":\"test\"}]}','upms:user:read'),(822,'角色首页','admin',1534512042543,0,'http://127.0.0.1:1111','/manage/role/index','http://127.0.0.1:1111/manage/role/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/role/index.jsp\"','upms:role:read'),(823,'角色列表','admin',1534512042701,5,'http://127.0.0.1:1111','/manage/role/list','http://127.0.0.1:1111/manage/role/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":2,\"rows\":[{\"ctime\":1,\"description\":\"拥有所有权限\",\"name\":\"super\",\"orders\":1,\"roleId\":1,\"title\":\"超级管理员\"},{\"ctime\":1487471013117,\"description\":\"拥有除权限管理系统外的所有权限\",\"name\":\"admin\",\"orders\":1487471013117,\"roleId\":2,\"title\":\"管理员\"}]}','upms:role:read'),(824,'用户组织','admin',1534512221425,15,'http://127.0.0.1:1111','/manage/user/organization/1','http://127.0.0.1:1111/manage/user/organization/1','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/user/organization.jsp\"','upms:user:organization'),(825,'角色权限','admin',1534512297464,2,'http://127.0.0.1:1111','/manage/role/permission/1','http://127.0.0.1:1111/manage/role/permission/1','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/role/permission.jsp\"','upms:role:permission'),(826,'角色权限列表','admin',1534512297825,34,'http://127.0.0.1:1111','/manage/permission/role/1','http://127.0.0.1:1111/manage/permission/role/1','POST','{}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"新增系统\",\"checked\":true,\"id\":24,\"open\":true},{\"name\":\"编辑系统\",\"checked\":true,\"id\":25,\"open\":true},{\"name\":\"删除系统\",\"checked\":true,\"id\":26,\"open\":true}],\"name\":\"系统管理\",\"checked\":true,\"id\":2,\"open\":true},{\"children\":[{\"name\":\"新增组织\",\"checked\":true,\"id\":27,\"open\":true},{\"name\":\"编辑组织\",\"checked\":true,\"id\":28,\"open\":true},{\"name\":\"删除组织\",\"checked\":true,\"id\":29,\"open\":true}],\"name\":\"组织管理\",\"checked\":true,\"id\":3,\"open\":true}],\"name\":\"系统组织管理\",\"checked\":true,\"id\":1,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增用户\",\"checked\":true,\"id\":30,\"open\":true},{\"name\":\"编辑用户\",\"checked\":true,\"id\":31,\"open\":true},{\"name\":\"删除用户\",\"checked\":true,\"id\":32,\"open\":true},{\"name\":\"用户权限\",\"checked\":true,\"id\":51,\"open\":true},{\"name\":\"用户组织\",\"checked\":true,\"id\":48,\"open\":true},{\"name\":\"用户角色\",\"checked\":true,\"id\":50,\"open\":true}],\"name\":\"用户管理\",\"checked\":true,\"id\":6,\"open\":true},{\"children\":[{\"name\":\"新增角色\",\"checked\":true,\"id\":33,\"open\":true},{\"name\":\"编辑角色\",\"checked\":true,\"id\":34,\"open\":true},{\"name\":\"删除角色\",\"checked\":true,\"id\":35,\"open\":true},{\"name\":\"角色权限\",\"checked\":true,\"id\":46,\"open\":true}],\"name\":\"角色管理\",\"checked\":true,\"id\":5,\"open\":true}],\"name\":\"角色用户管理\",\"checked\":true,\"id\":4,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增权限\",\"checked\":true,\"id\":36,\"open\":true},{\"name\":\"编辑权限\",\"checked\":true,\"id\":37,\"open\":true},{\"name\":\"删除权限\",\"checked\":true,\"id\":38,\"open\":true}],\"name\":\"权限管理\",\"checked\":true,\"id\":39,\"open\":true}],\"name\":\"权限资源管理\",\"checked\":true,\"id\":7,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"强制退出\",\"checked\":true,\"id\":53,\"open\":true}],\"name\":\"会话管理\",\"checked\":true,\"id\":14,\"open\":true},{\"children\":[{\"name\":\"删除权限\",\"checked\":true,\"id\":57,\"open\":true}],\"name\":\"日志记录\",\"checked\":true,\"id\":15,\"open\":true}],\"name\":\"其他数据管理\",\"checked\":true,\"id\":12,\"open\":true}],\"name\":\"权限管理系统\",\"id\":1,\"nocheck\":true,\"open\":true},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"新增标签\",\"checked\":true,\"id\":54,\"open\":true},{\"name\":\"编辑标签\",\"checked\":true,\"id\":55,\"open\":true},{\"name\":\"删除标签\",\"checked\":true,\"id\":56,\"open\":true}],\"name\":\"标签管理\",\"checked\":true,\"id\":18,\"open\":true},{\"children\":[{\"name\":\"编辑类目\",\"checked\":true,\"id\":58,\"open\":true},{\"name\":\"删除类目\",\"checked\":true,\"id\":59,\"open\":true},{\"name\":\"新增类目\",\"checked\":true,\"id\":60,\"open\":true}],\"name\":\"类目管理\",\"checked\":true,\"id\":19,\"open\":true}],\"name\":\"标签类目管理\",\"checked\":true,\"id\":17,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增文章\",\"checked\":true,\"id\":76,\"open\":true},{\"name\":\"编辑文章\",\"checked\":true,\"id\":77,\"open\":true},{\"name\":\"删除文章\",\"checked\":true,\"id\":78,\"open\":true}],\"name\":\"文章管理\",\"checked\":true,\"id\":21,\"open\":true},{\"name\":\"回收管理\",\"id\":22,\"open\":true},{\"children\":[{\"name\":\"删除评论\",\"checked\":true,\"id\":63,\"open\":true}],\"name\":\"评论管理\",\"checked\":true,\"id\":62,\"open\":true}],\"name\":\"文章评论管理\",\"checked\":true,\"id\":20,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增单页\",\"checked\":true,\"id\":65,\"open\":true},{\"name\":\"编辑单页\",\"checked\":true,\"id\":66,\"open\":true},{\"name\":\"删除单页\",\"checked\":true,\"id\":67,\"open\":true}],\"name\":\"单页管理\",\"checked\":true,\"id\":64,\"open\":true},{\"children\":[{\"name\":\"新增专题\",\"checked\":true,\"id\":81,\"open\":true},{\"name\":\"编辑专题\",\"checked\":true,\"id\":82,\"open\":true},{\"name\":\"删除专题\",\"checked\":true,\"id\":83,\"open\":true}],\"name\":\"专题管理\",\"checked\":true,\"id\":80,\"open\":true}],\"name\":\"单页专题管理\",\"checked\":true,\"id\":79,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增菜单\",\"checked\":true,\"id\":69,\"open\":true},{\"name\":\"编辑菜单\",\"checked\":true,\"id\":70,\"open\":true},{\"name\":\"删除菜单\",\"checked\":true,\"id\":71,\"open\":true},{\"name\":\"上移菜单\",\"checked\":true,\"id\":84,\"open\":true},{\"name\":\"下移菜单\",\"checked\":true,\"id\":85,\"open\":true}],\"name\":\"菜单管理\",\"checked\":true,\"id\":68,\"open\":true},{\"children\":[{\"name\":\"新增设置\",\"checked\":true,\"id\":73,\"open\":true},{\"name\":\"编辑设置\",\"checked\":true,\"id\":74,\"open\":true},{\"name\":\"删除设置\",\"checked\":true,\"id\":75,\"open\":true}],\"name\":\"系统设置\",\"checked\":true,\"id\":72,\"open\":true}],\"name\":\"其他数据管理\",\"checked\":true,\"id\":61,\"open\":true}],\"name\":\"内容管理系统\",\"id\":2,\"nocheck\":true,\"open\":true},{\"name\":\"支付管理系统\",\"id\":3,\"nocheck\":true,\"open\":true},{\"name\":\"用户管理系统\",\"id\":4,\"nocheck\":true,\"open\":true},{\"name\":\"存储管理系统\",\"id\":5,\"nocheck\":true,\"open\":true}]','upms:permission:read'),(827,'权限首页','admin',1534512351866,0,'http://127.0.0.1:1111','/manage/permission/index','http://127.0.0.1:1111/manage/permission/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/permission/index.jsp\"','upms:permission:read'),(828,'权限列表','admin',1534512352061,6,'http://127.0.0.1:1111','/manage/permission/list','http://127.0.0.1:1111/manage/permission/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":69,\"rows\":[{\"ctime\":1,\"icon\":\"zmdi zmdi-accounts-list\",\"name\":\"系统组织管理\",\"orders\":1,\"permissionId\":1,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":2,\"icon\":\"\",\"name\":\"系统管理\",\"orders\":2,\"permissionId\":2,\"permissionValue\":\"upms:system:read\",\"pid\":1,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/system/index\"},{\"ctime\":3,\"icon\":\"\",\"name\":\"组织管理\",\"orders\":3,\"permissionId\":3,\"permissionValue\":\"upms:organization:read\",\"pid\":1,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/organization/index\"},{\"ctime\":4,\"icon\":\"zmdi zmdi-accounts\",\"name\":\"角色用户管理\",\"orders\":4,\"permissionId\":4,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":6,\"icon\":\"\",\"name\":\"角色管理\",\"orders\":6,\"permissionId\":5,\"permissionValue\":\"upms:role:read\",\"pid\":4,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/role/index\"},{\"ctime\":5,\"icon\":\"\",\"name\":\"用户管理\",\"orders\":5,\"permissionId\":6,\"permissionValue\":\"upms:user:read\",\"pid\":4,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/user/index\"},{\"ctime\":7,\"icon\":\"zmdi zmdi-lock-outline\",\"name\":\"权限资源管理\",\"orders\":7,\"permissionId\":7,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":12,\"icon\":\"zmdi zmdi-more\",\"name\":\"其他数据管理\",\"orders\":12,\"permissionId\":12,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":14,\"icon\":\"\",\"name\":\"会话管理\",\"orders\":14,\"permissionId\":14,\"permissionValue\":\"upms:session:read\",\"pid\":12,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/session/index\"},{\"ctime\":15,\"icon\":\"\",\"name\":\"日志记录\",\"orders\":15,\"permissionId\":15,\"permissionValue\":\"upms:log:read\",\"pid\":12,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/log/index\"}]}','upms:permission:read'),(829,'权限列表','admin',1534512374975,5,'http://127.0.0.1:1111','/manage/permission/list','http://127.0.0.1:1111/manage/permission/list','GET','order=asc&offset=10&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":69,\"rows\":[{\"ctime\":17,\"icon\":\"zmdi zmdi-menu\",\"name\":\"标签类目管理\",\"orders\":17,\"permissionId\":17,\"pid\":0,\"status\":1,\"systemId\":2,\"type\":1},{\"ctime\":18,\"name\":\"标签管理\",\"orders\":18,\"permissionId\":18,\"permissionValue\":\"cms:tag:read\",\"pid\":17,\"status\":1,\"systemId\":2,\"type\":2,\"uri\":\"/manage/tag/index\"},{\"ctime\":19,\"name\":\"类目管理\",\"orders\":19,\"permissionId\":19,\"permissionValue\":\"cms:category:read\",\"pid\":17,\"status\":1,\"systemId\":2,\"type\":2,\"uri\":\"/manage/category/index\"},{\"ctime\":20,\"icon\":\"zmdi zmdi-collection-text\",\"name\":\"文章评论管理\",\"orders\":20,\"permissionId\":20,\"pid\":0,\"status\":1,\"systemId\":2,\"type\":1},{\"ctime\":21,\"name\":\"文章管理\",\"orders\":21,\"permissionId\":21,\"permissionValue\":\"cms:article:read\",\"pid\":20,\"status\":1,\"systemId\":2,\"type\":2,\"uri\":\"/manage/article/index\"},{\"ctime\":22,\"name\":\"回收管理\",\"orders\":22,\"permissionId\":22,\"permissionValue\":\"cms:article:read\",\"pid\":20,\"status\":1,\"systemId\":2,\"type\":2,\"uri\":\"/manage/article/recycle\"},{\"ctime\":24,\"icon\":\"zmdi zmdi-plus\",\"name\":\"新增系统\",\"orders\":24,\"permissionId\":24,\"permissionValue\":\"upms:system:create\",\"pid\":2,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/system/create\"},{\"ctime\":25,\"icon\":\"zmdi zmdi-edit\",\"name\":\"编辑系统\",\"orders\":25,\"permissionId\":25,\"permissionValue\":\"upms:system:update\",\"pid\":2,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/system/update\"},{\"ctime\":26,\"icon\":\"zmdi zmdi-close\",\"name\":\"删除系统\",\"orders\":26,\"permissionId\":26,\"permissionValue\":\"upms:system:delete\",\"pid\":2,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/system/delete\"},{\"ctime\":27,\"icon\":\"zmdi zmdi-plus\",\"name\":\"新增组织\",\"orders\":27,\"permissionId\":27,\"permissionValue\":\"upms:organization:create\",\"pid\":3,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/organization/create\"}]}','upms:permission:read'),(830,'权限列表','admin',1534512375955,5,'http://127.0.0.1:1111','/manage/permission/list','http://127.0.0.1:1111/manage/permission/list','GET','order=asc&offset=20&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":69,\"rows\":[{\"ctime\":28,\"icon\":\"zmdi zmdi-edit\",\"name\":\"编辑组织\",\"orders\":28,\"permissionId\":28,\"permissionValue\":\"upms:organization:update\",\"pid\":3,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/organization/update\"},{\"ctime\":29,\"icon\":\"zmdi zmdi-close\",\"name\":\"删除组织\",\"orders\":29,\"permissionId\":29,\"permissionValue\":\"upms:organization:delete\",\"pid\":3,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/organization/delete\"},{\"ctime\":30,\"icon\":\"zmdi zmdi-plus\",\"name\":\"新增用户\",\"orders\":30,\"permissionId\":30,\"permissionValue\":\"upms:user:create\",\"pid\":6,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/user/create\"},{\"ctime\":31,\"icon\":\"zmdi zmdi-edit\",\"name\":\"编辑用户\",\"orders\":31,\"permissionId\":31,\"permissionValue\":\"upms:user:update\",\"pid\":6,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/user/update\"},{\"ctime\":32,\"icon\":\"zmdi zmdi-close\",\"name\":\"删除用户\",\"orders\":32,\"permissionId\":32,\"permissionValue\":\"upms:user:delete\",\"pid\":6,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/user/delete\"},{\"ctime\":33,\"icon\":\"zmdi zmdi-plus\",\"name\":\"新增角色\",\"orders\":33,\"permissionId\":33,\"permissionValue\":\"upms:role:create\",\"pid\":5,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/role/create\"},{\"ctime\":34,\"icon\":\"zmdi zmdi-edit\",\"name\":\"编辑角色\",\"orders\":34,\"permissionId\":34,\"permissionValue\":\"upms:role:update\",\"pid\":5,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/role/update\"},{\"ctime\":35,\"icon\":\"zmdi zmdi-close\",\"name\":\"删除角色\",\"orders\":35,\"permissionId\":35,\"permissionValue\":\"upms:role:delete\",\"pid\":5,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/role/delete\"},{\"ctime\":36,\"icon\":\"zmdi zmdi-plus\",\"name\":\"新增权限\",\"orders\":36,\"permissionId\":36,\"permissionValue\":\"upms:permission:create\",\"pid\":39,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/permission/create\"},{\"ctime\":37,\"icon\":\"zmdi zmdi-edit\",\"name\":\"编辑权限\",\"orders\":37,\"permissionId\":37,\"permissionValue\":\"upms:permission:update\",\"pid\":39,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/permission/update\"}]}','upms:permission:read'),(831,'权限列表','admin',1534512376910,5,'http://127.0.0.1:1111','/manage/permission/list','http://127.0.0.1:1111/manage/permission/list','GET','order=asc&offset=30&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":69,\"rows\":[{\"ctime\":38,\"icon\":\"zmdi zmdi-close\",\"name\":\"删除权限\",\"orders\":38,\"permissionId\":38,\"permissionValue\":\"upms:permission:delete\",\"pid\":39,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/permission/delete\"},{\"ctime\":39,\"name\":\"权限管理\",\"orders\":39,\"permissionId\":39,\"permissionValue\":\"upms:permission:read\",\"pid\":7,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/permission/index\"},{\"ctime\":1488091928257,\"icon\":\"zmdi zmdi-key\",\"name\":\"角色权限\",\"orders\":1488091928257,\"permissionId\":46,\"permissionValue\":\"upms:role:permission\",\"pid\":5,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/role/permission\"},{\"ctime\":1488120011165,\"icon\":\"zmdi zmdi-accounts-list\",\"name\":\"用户组织\",\"orders\":1488120011165,\"permissionId\":48,\"permissionValue\":\"upms:user:organization\",\"pid\":6,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/user/organization\"},{\"ctime\":1488120554175,\"icon\":\"zmdi zmdi-accounts\",\"name\":\"用户角色\",\"orders\":1488120554175,\"permissionId\":50,\"permissionValue\":\"upms:user:role\",\"pid\":6,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/user/role\"},{\"ctime\":1488092013302,\"icon\":\"zmdi zmdi-key\",\"name\":\"用户权限\",\"orders\":1488092013302,\"permissionId\":51,\"permissionValue\":\"upms:user:permission\",\"pid\":6,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/user/permission\"},{\"ctime\":1488379514715,\"icon\":\"zmdi zmdi-run\",\"name\":\"强制退出\",\"orders\":1488379514715,\"permissionId\":53,\"permissionValue\":\"upms:session:forceout\",\"pid\":14,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/session/forceout\"},{\"ctime\":1489417315159,\"icon\":\"zmdi zmdi-plus\",\"name\":\"新增标签\",\"orders\":1489417315159,\"permissionId\":54,\"permissionValue\":\"cms:tag:create\",\"pid\":18,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/tag/create\"},{\"ctime\":1489417344931,\"icon\":\"zmdi zmdi-widgets\",\"name\":\"编辑标签\",\"orders\":1489417344931,\"permissionId\":55,\"permissionValue\":\"cms:tag:update\",\"pid\":18,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"zmdi zmdi-edit\"},{\"ctime\":1489417372114,\"icon\":\"zmdi zmdi-close\",\"name\":\"删除标签\",\"orders\":1489417372114,\"permissionId\":56,\"permissionValue\":\"cms:tag:delete\",\"pid\":18,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/tag/delete\"}]}','upms:permission:read'),(832,'权限列表','admin',1534512377634,6,'http://127.0.0.1:1111','/manage/permission/list','http://127.0.0.1:1111/manage/permission/list','GET','order=asc&offset=40&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":69,\"rows\":[{\"ctime\":1489503867909,\"icon\":\"zmdi zmdi-close\",\"name\":\"删除权限\",\"orders\":1489503867909,\"permissionId\":57,\"permissionValue\":\"upms:log:delete\",\"pid\":15,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/log/delete\"},{\"ctime\":1489586600462,\"icon\":\"zmdi zmdi-edit\",\"name\":\"编辑类目\",\"orders\":1489586600462,\"permissionId\":58,\"permissionValue\":\"cms:category:update\",\"pid\":19,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/category/update\"},{\"ctime\":1489586633059,\"icon\":\"zmdi zmdi-close\",\"name\":\"删除类目\",\"orders\":1489586633059,\"permissionId\":59,\"permissionValue\":\"cms:category:delete\",\"pid\":19,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/category/delete\"},{\"ctime\":1489590342089,\"icon\":\"zmdi zmdi-plus\",\"name\":\"新增类目\",\"orders\":1489590342089,\"permissionId\":60,\"permissionValue\":\"cms:category:create\",\"pid\":19,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/category/create\"},{\"ctime\":1489835455359,\"icon\":\"zmdi zmdi-more\",\"name\":\"其他数据管理\",\"orders\":1489835455359,\"permissionId\":61,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":2,\"type\":1,\"uri\":\"\"},{\"ctime\":1489591408224,\"icon\":\"\",\"name\":\"评论管理\",\"orders\":1489591408224,\"permissionId\":62,\"permissionValue\":\"cms:comment:read\",\"pid\":20,\"status\":1,\"systemId\":2,\"type\":2,\"uri\":\"/manage/comment/index\"},{\"ctime\":1489591449614,\"icon\":\"zmdi zmdi-close\",\"name\":\"删除评论\",\"orders\":1489591449614,\"permissionId\":63,\"permissionValue\":\"cms:comment:delete\",\"pid\":62,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/comment/delete\"},{\"ctime\":1489591332779,\"icon\":\"\",\"name\":\"单页管理\",\"orders\":1489591332779,\"permissionId\":64,\"permissionValue\":\"cms:page:read\",\"pid\":79,\"status\":1,\"systemId\":2,\"type\":2,\"uri\":\"/manage/page/index\"},{\"ctime\":1489591614473,\"icon\":\"zmdi zmdi-plus\",\"name\":\"新增单页\",\"orders\":1489591614473,\"permissionId\":65,\"permissionValue\":\"cms:page:create\",\"pid\":64,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/page/create\"},{\"ctime\":1489591653000,\"icon\":\"zmdi zmdi-edit\",\"name\":\"编辑单页\",\"orders\":1489591653000,\"permissionId\":66,\"permissionValue\":\"cms:page:update\",\"pid\":64,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/page/update\"}]}','upms:permission:read'),(833,'权限列表','admin',1534512385491,5,'http://127.0.0.1:1111','/manage/permission/list','http://127.0.0.1:1111/manage/permission/list','GET','order=asc&offset=50&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":69,\"rows\":[{\"ctime\":1489591683552,\"icon\":\"zmdi zmdi-close\",\"name\":\"删除单页\",\"orders\":1489591683552,\"permissionId\":67,\"permissionValue\":\"cms:page:delete\",\"pid\":64,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/page/delete\"},{\"ctime\":1489591746846,\"icon\":\"zmdi zmdi-widgets\",\"name\":\"菜单管理\",\"orders\":1489591746846,\"permissionId\":68,\"permissionValue\":\"cms:menu:read\",\"pid\":61,\"status\":1,\"systemId\":2,\"type\":2,\"uri\":\"/manage/menu/index\"},{\"ctime\":1489591791747,\"icon\":\"zmdi zmdi-plus\",\"name\":\"新增菜单\",\"orders\":1489591791747,\"permissionId\":69,\"permissionValue\":\"cms:menu:create\",\"pid\":68,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/menu/create\"},{\"ctime\":1489591831878,\"icon\":\"zmdi zmdi-edit\",\"name\":\"编辑菜单\",\"orders\":1489591831878,\"permissionId\":70,\"permissionValue\":\"cms:menu:update\",\"pid\":68,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/menu/update\"},{\"ctime\":1489591865454,\"icon\":\"zmdi zmdi-close\",\"name\":\"删除菜单\",\"orders\":1489591865454,\"permissionId\":71,\"permissionValue\":\"cms:menu:delete\",\"pid\":68,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/menu/delete\"},{\"ctime\":1489591981165,\"icon\":\"zmdi zmdi-widgets\",\"name\":\"系统设置\",\"orders\":1489591981165,\"permissionId\":72,\"permissionValue\":\"cms:setting:read\",\"pid\":61,\"status\":1,\"systemId\":2,\"type\":2,\"uri\":\"/manage/setting/index\"},{\"ctime\":1489592024762,\"icon\":\"zmdi zmdi-plus\",\"name\":\"新增设置\",\"orders\":1489592024762,\"permissionId\":73,\"permissionValue\":\"cms:setting:create\",\"pid\":72,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/setting/create\"},{\"ctime\":1489592052582,\"icon\":\"zmdi zmdi-edit\",\"name\":\"编辑设置\",\"orders\":1489592052582,\"permissionId\":74,\"permissionValue\":\"cms:setting:update\",\"pid\":72,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/setting/update\"},{\"ctime\":1489592081426,\"icon\":\"zmdi zmdi-close\",\"name\":\"删除设置\",\"orders\":1489592081426,\"permissionId\":75,\"permissionValue\":\"cms:setting:delete\",\"pid\":72,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/setting/delete\"},{\"ctime\":1489820150404,\"icon\":\"zmdi zmdi-plus\",\"name\":\"新增文章\",\"orders\":1489820150404,\"permissionId\":76,\"permissionValue\":\"cms:article:create\",\"pid\":21,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/article/create\"}]}','upms:permission:read'),(834,'权限列表','admin',1534512386164,6,'http://127.0.0.1:1111','/manage/permission/list','http://127.0.0.1:1111/manage/permission/list','GET','order=asc&offset=60&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":69,\"rows\":[{\"ctime\":1489820178269,\"icon\":\"zmdi zmdi-edit\",\"name\":\"编辑文章\",\"orders\":1489820178269,\"permissionId\":77,\"permissionValue\":\"cms:article:update\",\"pid\":21,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/article/update\"},{\"ctime\":1489820207607,\"icon\":\"zmdi zmdi-close\",\"name\":\"删除文章\",\"orders\":1489820207607,\"permissionId\":78,\"permissionValue\":\"cms:article:delete\",\"pid\":21,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/article/delete\"},{\"ctime\":1489835320327,\"icon\":\"zmdi zmdi-view-web\",\"name\":\"单页专题管理\",\"orders\":1489835320327,\"permissionId\":79,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":2,\"type\":1,\"uri\":\"\"},{\"ctime\":1489591507566,\"icon\":\"zmdi zmdi-widgets\",\"name\":\"专题管理\",\"orders\":1489591507566,\"permissionId\":80,\"permissionValue\":\"cms:topic:read\",\"pid\":79,\"status\":1,\"systemId\":2,\"type\":2,\"uri\":\"/manage/topic/index\"},{\"ctime\":1489843327028,\"icon\":\"zmdi zmdi-plus\",\"name\":\"新增专题\",\"orders\":1489843327028,\"permissionId\":81,\"permissionValue\":\"cms:topic:create\",\"pid\":80,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/topic/create\"},{\"ctime\":1489843351513,\"icon\":\"zmdi zmdi-edit\",\"name\":\"编辑专题\",\"orders\":1489843351513,\"permissionId\":82,\"permissionValue\":\"cms:topic:update\",\"pid\":80,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/topic/update\"},{\"ctime\":1489843379953,\"icon\":\"zmdi zmdi-close\",\"name\":\"删除专题\",\"orders\":1489843379953,\"permissionId\":83,\"permissionValue\":\"cms:topic:delete\",\"pid\":80,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/topic/delete\"},{\"ctime\":1489846486548,\"icon\":\"zmdi zmdi-long-arrow-up\",\"name\":\"上移菜单\",\"orders\":1489846486548,\"permissionId\":84,\"permissionValue\":\"cms:menu:up\",\"pid\":68,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/menu/up\"},{\"ctime\":1489846578051,\"icon\":\"zmdi zmdi-long-arrow-down\",\"name\":\"下移菜单\",\"orders\":1489846578051,\"permissionId\":85,\"permissionValue\":\"cms:menu:down\",\"pid\":68,\"status\":1,\"systemId\":2,\"type\":3,\"uri\":\"/manage/menu/down\"}]}','upms:permission:read'),(835,'权限列表','admin',1534512387297,5,'http://127.0.0.1:1111','/manage/permission/list','http://127.0.0.1:1111/manage/permission/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":69,\"rows\":[{\"ctime\":1,\"icon\":\"zmdi zmdi-accounts-list\",\"name\":\"系统组织管理\",\"orders\":1,\"permissionId\":1,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":2,\"icon\":\"\",\"name\":\"系统管理\",\"orders\":2,\"permissionId\":2,\"permissionValue\":\"upms:system:read\",\"pid\":1,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/system/index\"},{\"ctime\":3,\"icon\":\"\",\"name\":\"组织管理\",\"orders\":3,\"permissionId\":3,\"permissionValue\":\"upms:organization:read\",\"pid\":1,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/organization/index\"},{\"ctime\":4,\"icon\":\"zmdi zmdi-accounts\",\"name\":\"角色用户管理\",\"orders\":4,\"permissionId\":4,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":6,\"icon\":\"\",\"name\":\"角色管理\",\"orders\":6,\"permissionId\":5,\"permissionValue\":\"upms:role:read\",\"pid\":4,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/role/index\"},{\"ctime\":5,\"icon\":\"\",\"name\":\"用户管理\",\"orders\":5,\"permissionId\":6,\"permissionValue\":\"upms:user:read\",\"pid\":4,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/user/index\"},{\"ctime\":7,\"icon\":\"zmdi zmdi-lock-outline\",\"name\":\"权限资源管理\",\"orders\":7,\"permissionId\":7,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":12,\"icon\":\"zmdi zmdi-more\",\"name\":\"其他数据管理\",\"orders\":12,\"permissionId\":12,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":14,\"icon\":\"\",\"name\":\"会话管理\",\"orders\":14,\"permissionId\":14,\"permissionValue\":\"upms:session:read\",\"pid\":12,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/session/index\"},{\"ctime\":15,\"icon\":\"\",\"name\":\"日志记录\",\"orders\":15,\"permissionId\":15,\"permissionValue\":\"upms:log:read\",\"pid\":12,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/log/index\"}]}','upms:permission:read'),(836,'权限列表','admin',1534512390069,5,'http://127.0.0.1:1111','/manage/permission/list','http://127.0.0.1:1111/manage/permission/list','GET','order=asc&offset=10&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":69,\"rows\":[{\"ctime\":17,\"icon\":\"zmdi zmdi-menu\",\"name\":\"标签类目管理\",\"orders\":17,\"permissionId\":17,\"pid\":0,\"status\":1,\"systemId\":2,\"type\":1},{\"ctime\":18,\"name\":\"标签管理\",\"orders\":18,\"permissionId\":18,\"permissionValue\":\"cms:tag:read\",\"pid\":17,\"status\":1,\"systemId\":2,\"type\":2,\"uri\":\"/manage/tag/index\"},{\"ctime\":19,\"name\":\"类目管理\",\"orders\":19,\"permissionId\":19,\"permissionValue\":\"cms:category:read\",\"pid\":17,\"status\":1,\"systemId\":2,\"type\":2,\"uri\":\"/manage/category/index\"},{\"ctime\":20,\"icon\":\"zmdi zmdi-collection-text\",\"name\":\"文章评论管理\",\"orders\":20,\"permissionId\":20,\"pid\":0,\"status\":1,\"systemId\":2,\"type\":1},{\"ctime\":21,\"name\":\"文章管理\",\"orders\":21,\"permissionId\":21,\"permissionValue\":\"cms:article:read\",\"pid\":20,\"status\":1,\"systemId\":2,\"type\":2,\"uri\":\"/manage/article/index\"},{\"ctime\":22,\"name\":\"回收管理\",\"orders\":22,\"permissionId\":22,\"permissionValue\":\"cms:article:read\",\"pid\":20,\"status\":1,\"systemId\":2,\"type\":2,\"uri\":\"/manage/article/recycle\"},{\"ctime\":24,\"icon\":\"zmdi zmdi-plus\",\"name\":\"新增系统\",\"orders\":24,\"permissionId\":24,\"permissionValue\":\"upms:system:create\",\"pid\":2,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/system/create\"},{\"ctime\":25,\"icon\":\"zmdi zmdi-edit\",\"name\":\"编辑系统\",\"orders\":25,\"permissionId\":25,\"permissionValue\":\"upms:system:update\",\"pid\":2,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/system/update\"},{\"ctime\":26,\"icon\":\"zmdi zmdi-close\",\"name\":\"删除系统\",\"orders\":26,\"permissionId\":26,\"permissionValue\":\"upms:system:delete\",\"pid\":2,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/system/delete\"},{\"ctime\":27,\"icon\":\"zmdi zmdi-plus\",\"name\":\"新增组织\",\"orders\":27,\"permissionId\":27,\"permissionValue\":\"upms:organization:create\",\"pid\":3,\"status\":1,\"systemId\":1,\"type\":3,\"uri\":\"/manage/organization/create\"}]}','upms:permission:read'),(837,'权限列表','admin',1534512391735,6,'http://127.0.0.1:1111','/manage/permission/list','http://127.0.0.1:1111/manage/permission/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":69,\"rows\":[{\"ctime\":1,\"icon\":\"zmdi zmdi-accounts-list\",\"name\":\"系统组织管理\",\"orders\":1,\"permissionId\":1,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":2,\"icon\":\"\",\"name\":\"系统管理\",\"orders\":2,\"permissionId\":2,\"permissionValue\":\"upms:system:read\",\"pid\":1,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/system/index\"},{\"ctime\":3,\"icon\":\"\",\"name\":\"组织管理\",\"orders\":3,\"permissionId\":3,\"permissionValue\":\"upms:organization:read\",\"pid\":1,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/organization/index\"},{\"ctime\":4,\"icon\":\"zmdi zmdi-accounts\",\"name\":\"角色用户管理\",\"orders\":4,\"permissionId\":4,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":6,\"icon\":\"\",\"name\":\"角色管理\",\"orders\":6,\"permissionId\":5,\"permissionValue\":\"upms:role:read\",\"pid\":4,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/role/index\"},{\"ctime\":5,\"icon\":\"\",\"name\":\"用户管理\",\"orders\":5,\"permissionId\":6,\"permissionValue\":\"upms:user:read\",\"pid\":4,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/user/index\"},{\"ctime\":7,\"icon\":\"zmdi zmdi-lock-outline\",\"name\":\"权限资源管理\",\"orders\":7,\"permissionId\":7,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":12,\"icon\":\"zmdi zmdi-more\",\"name\":\"其他数据管理\",\"orders\":12,\"permissionId\":12,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":14,\"icon\":\"\",\"name\":\"会话管理\",\"orders\":14,\"permissionId\":14,\"permissionValue\":\"upms:session:read\",\"pid\":12,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/session/index\"},{\"ctime\":15,\"icon\":\"\",\"name\":\"日志记录\",\"orders\":15,\"permissionId\":15,\"permissionValue\":\"upms:log:read\",\"pid\":12,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/log/index\"}]}','upms:permission:read'),(838,'新增权限','admin',1534512397717,3,'http://127.0.0.1:1111','/manage/permission/create','http://127.0.0.1:1111/manage/permission/create','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/permission/create.jsp\"','upms:permission:create'),(839,'权限列表','admin',1534512413645,8,'http://127.0.0.1:1111','/manage/permission/list','http://127.0.0.1:1111/manage/permission/list','GET','systemId=1&type=1&limit=10000','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":4,\"rows\":[{\"ctime\":1,\"icon\":\"zmdi zmdi-accounts-list\",\"name\":\"系统组织管理\",\"orders\":1,\"permissionId\":1,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":4,\"icon\":\"zmdi zmdi-accounts\",\"name\":\"角色用户管理\",\"orders\":4,\"permissionId\":4,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":7,\"icon\":\"zmdi zmdi-lock-outline\",\"name\":\"权限资源管理\",\"orders\":7,\"permissionId\":7,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":12,\"icon\":\"zmdi zmdi-more\",\"name\":\"其他数据管理\",\"orders\":12,\"permissionId\":12,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"}]}','upms:permission:read'),(840,'登录','',1534515379061,0,'http://127.0.0.1:1111','/sso/login','http://127.0.0.1:1111/sso/login','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/sso/login.jsp\"',NULL),(841,'登录','',1534515379184,0,'http://127.0.0.1:1111','/sso/login','http://127.0.0.1:1111/sso/login','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/sso/login.jsp\"',NULL),(842,'登录','admin',1534515380870,11,'http://127.0.0.1:1111','/sso/login','http://127.0.0.1:1111/sso/login','POST','{password=[123456],rememberMe=[false],backurl=[],username=[admin]}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"code\":1,\"data\":\"http://127.0.0.1:1111\",\"message\":\"success\"}',NULL),(843,'后台首页','admin',1534515380922,13,'http://127.0.0.1:1111','/manage/index','http://127.0.0.1:1111/manage/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/index.jsp\"',NULL),(844,'会话首页','admin',1534515383977,0,'http://127.0.0.1:1111','/manage/session/index','http://127.0.0.1:1111/manage/session/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/session/index.jsp\"','upms:session:read'),(845,'会话列表','admin',1534515384135,2,'http://127.0.0.1:1111','/manage/session/list','http://127.0.0.1:1111/manage/session/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":1,\"rows\":[{\"attributeKeys\":[\"org.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEY\",\"zheng.upms.type\",\"org.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEY\"],\"status\":\"on_line\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"valid\":true}]}','upms:session:read'),(846,'日志首页','admin',1534515405805,0,'http://127.0.0.1:1111','/manage/log/index','http://127.0.0.1:1111/manage/log/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/log/index.jsp\"','upms:log:read'),(847,'日志列表','admin',1534515405981,9,'http://127.0.0.1:1111','/manage/log/list','http://127.0.0.1:1111/manage/log/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":68,\"rows\":[{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"后台首页\",\"ip\":\"127.0.0.1\",\"logId\":779,\"method\":\"GET\",\"spendTime\":95,\"startTime\":1534503505315,\"uri\":\"/manage/index\",\"url\":\"http://127.0.0.1:1111/manage/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"系统首页\",\"ip\":\"127.0.0.1\",\"logId\":780,\"method\":\"GET\",\"permissions\":\"upms:system:read\",\"spendTime\":12,\"startTime\":1534503516634,\"uri\":\"/manage/system/index\",\"url\":\"http://127.0.0.1:1111/manage/system/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"系统列表\",\"ip\":\"127.0.0.1\",\"logId\":781,\"method\":\"GET\",\"permissions\":\"upms:system:read\",\"spendTime\":18,\"startTime\":1534503517213,\"uri\":\"/manage/system/list\",\"url\":\"http://127.0.0.1:1111/manage/system/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"组织首页\",\"ip\":\"127.0.0.1\",\"logId\":782,\"method\":\"GET\",\"permissions\":\"upms:organization:read\",\"spendTime\":11,\"startTime\":1534503517563,\"uri\":\"/manage/organization/index\",\"url\":\"http://127.0.0.1:1111/manage/organization/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"组织列表\",\"ip\":\"127.0.0.1\",\"logId\":783,\"method\":\"GET\",\"permissions\":\"upms:organization:read\",\"spendTime\":18,\"startTime\":1534503517869,\"uri\":\"/manage/organization/list\",\"url\":\"http://127.0.0.1:1111/manage/organization/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"用户首页\",\"ip\":\"127.0.0.1\",\"logId\":784,\"method\":\"GET\",\"permissions\":\"upms:user:read\",\"spendTime\":14,\"startTime\":1534503521946,\"uri\":\"/manage/user/index\",\"url\":\"http://127.0.0.1:1111/manage/user/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"用户列表\",\"ip\":\"127.0.0.1\",\"logId\":785,\"method\":\"GET\",\"permissions\":\"upms:user:read\",\"spendTime\":27,\"startTime\":1534503522333,\"uri\":\"/manage/user/list\",\"url\":\"http://127.0.0.1:1111/manage/user/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"角色首页\",\"ip\":\"127.0.0.1\",\"logId\":786,\"method\":\"GET\",\"permissions\":\"upms:role:read\",\"spendTime\":12,\"startTime\":1534503523021,\"uri\":\"/manage/role/index\",\"url\":\"http://127.0.0.1:1111/manage/role/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"角色列表\",\"ip\":\"127.0.0.1\",\"logId\":787,\"method\":\"GET\",\"permissions\":\"upms:role:read\",\"spendTime\":23,\"startTime\":1534503523331,\"uri\":\"/manage/role/list\",\"url\":\"http://127.0.0.1:1111/manage/role/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"权限首页\",\"ip\":\"127.0.0.1\",\"logId\":788,\"method\":\"GET\",\"permissions\":\"upms:permission:read\",\"spendTime\":9,\"startTime\":1534503527915,\"uri\":\"/manage/permission/index\",\"url\":\"http://127.0.0.1:1111/manage/permission/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"}]}','upms:log:read'),(848,'日志列表','admin',1534515417298,5,'http://127.0.0.1:1111','/manage/log/list','http://127.0.0.1:1111/manage/log/list','GET','order=asc&offset=10&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":69,\"rows\":[{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"权限列表\",\"ip\":\"127.0.0.1\",\"logId\":789,\"method\":\"GET\",\"permissions\":\"upms:permission:read\",\"spendTime\":25,\"startTime\":1534503528252,\"uri\":\"/manage/permission/list\",\"url\":\"http://127.0.0.1:1111/manage/permission/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"会话首页\",\"ip\":\"127.0.0.1\",\"logId\":790,\"method\":\"GET\",\"permissions\":\"upms:session:read\",\"spendTime\":7,\"startTime\":1534503539871,\"uri\":\"/manage/session/index\",\"url\":\"http://127.0.0.1:1111/manage/session/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"会话列表\",\"ip\":\"127.0.0.1\",\"logId\":791,\"method\":\"GET\",\"permissions\":\"upms:session:read\",\"spendTime\":8,\"startTime\":1534503540205,\"uri\":\"/manage/session/list\",\"url\":\"http://127.0.0.1:1111/manage/session/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"日志首页\",\"ip\":\"127.0.0.1\",\"logId\":792,\"method\":\"GET\",\"permissions\":\"upms:log:read\",\"spendTime\":8,\"startTime\":1534503543246,\"uri\":\"/manage/log/index\",\"url\":\"http://127.0.0.1:1111/manage/log/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"日志列表\",\"ip\":\"127.0.0.1\",\"logId\":793,\"method\":\"GET\",\"permissions\":\"upms:log:read\",\"spendTime\":28,\"startTime\":1534503543478,\"uri\":\"/manage/log/list\",\"url\":\"http://127.0.0.1:1111/manage/log/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"系统首页\",\"ip\":\"127.0.0.1\",\"logId\":794,\"method\":\"GET\",\"permissions\":\"upms:system:read\",\"spendTime\":0,\"startTime\":1534503718455,\"uri\":\"/manage/system/index\",\"url\":\"http://127.0.0.1:1111/manage/system/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"系统列表\",\"ip\":\"127.0.0.1\",\"logId\":795,\"method\":\"GET\",\"permissions\":\"upms:system:read\",\"spendTime\":8,\"startTime\":1534503718722,\"uri\":\"/manage/system/list\",\"url\":\"http://127.0.0.1:1111/manage/system/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"组织首页\",\"ip\":\"127.0.0.1\",\"logId\":796,\"method\":\"GET\",\"permissions\":\"upms:organization:read\",\"spendTime\":0,\"startTime\":1534503719789,\"uri\":\"/manage/organization/index\",\"url\":\"http://127.0.0.1:1111/manage/organization/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"组织列表\",\"ip\":\"127.0.0.1\",\"logId\":797,\"method\":\"GET\",\"permissions\":\"upms:organization:read\",\"spendTime\":7,\"startTime\":1534503719970,\"uri\":\"/manage/organization/list\",\"url\":\"http://127.0.0.1:1111/manage/organization/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"用户首页\",\"ip\":\"127.0.0.1\",\"logId\":798,\"method\":\"GET\",\"permissions\":\"upms:user:read\",\"spendTime\":0,\"startTime\":1534503722460,\"uri\":\"/manage/user/index\",\"url\":\"http://127.0.0.1:1111/manage/user/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"}]}','upms:log:read'),(849,'日志列表','admin',1534515418459,6,'http://127.0.0.1:1111','/manage/log/list','http://127.0.0.1:1111/manage/log/list','GET','order=asc&offset=20&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":70,\"rows\":[{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"用户列表\",\"ip\":\"127.0.0.1\",\"logId\":799,\"method\":\"GET\",\"permissions\":\"upms:user:read\",\"spendTime\":8,\"startTime\":1534503722690,\"uri\":\"/manage/user/list\",\"url\":\"http://127.0.0.1:1111/manage/user/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"角色首页\",\"ip\":\"127.0.0.1\",\"logId\":800,\"method\":\"GET\",\"permissions\":\"upms:role:read\",\"spendTime\":0,\"startTime\":1534503724952,\"uri\":\"/manage/role/index\",\"url\":\"http://127.0.0.1:1111/manage/role/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"角色列表\",\"ip\":\"127.0.0.1\",\"logId\":801,\"method\":\"GET\",\"permissions\":\"upms:role:read\",\"spendTime\":6,\"startTime\":1534503725118,\"uri\":\"/manage/role/list\",\"url\":\"http://127.0.0.1:1111/manage/role/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"修改用户\",\"ip\":\"127.0.0.1\",\"logId\":802,\"method\":\"GET\",\"permissions\":\"upms:user:update\",\"spendTime\":3,\"startTime\":1534503741022,\"uri\":\"/manage/user/update/2\",\"url\":\"http://127.0.0.1:1111/manage/user/update/2\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"修改用户\",\"ip\":\"127.0.0.1\",\"logId\":803,\"method\":\"GET\",\"permissions\":\"upms:user:update\",\"spendTime\":3,\"startTime\":1534503744607,\"uri\":\"/manage/user/update/2\",\"url\":\"http://127.0.0.1:1111/manage/user/update/2\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"退出登录\",\"ip\":\"127.0.0.1\",\"logId\":804,\"method\":\"GET\",\"spendTime\":14,\"startTime\":1534503861094,\"uri\":\"/sso/logout\",\"url\":\"http://127.0.0.1:1111/sso/logout\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"登录\",\"ip\":\"127.0.0.1\",\"logId\":805,\"method\":\"GET\",\"spendTime\":0,\"startTime\":1534503861144,\"uri\":\"/sso/login\",\"url\":\"http://127.0.0.1:1111/sso/login\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"登录\",\"ip\":\"127.0.0.1\",\"logId\":806,\"method\":\"POST\",\"spendTime\":24,\"startTime\":1534503862889,\"uri\":\"/sso/login\",\"url\":\"http://127.0.0.1:1111/sso/login\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"后台首页\",\"ip\":\"127.0.0.1\",\"logId\":807,\"method\":\"GET\",\"spendTime\":17,\"startTime\":1534503862959,\"uri\":\"/manage/index\",\"url\":\"http://127.0.0.1:1111/manage/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"登录\",\"ip\":\"127.0.0.1\",\"logId\":808,\"method\":\"GET\",\"spendTime\":0,\"startTime\":1534511591559,\"uri\":\"/sso/login\",\"url\":\"http://127.0.0.1:1111/sso/login\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"\"}]}','upms:log:read'),(850,'日志列表','admin',1534515419333,5,'http://127.0.0.1:1111','/manage/log/list','http://127.0.0.1:1111/manage/log/list','GET','order=asc&offset=30&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":71,\"rows\":[{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"登录\",\"ip\":\"127.0.0.1\",\"logId\":809,\"method\":\"GET\",\"spendTime\":1,\"startTime\":1534511591704,\"uri\":\"/sso/login\",\"url\":\"http://127.0.0.1:1111/sso/login\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"登录\",\"ip\":\"127.0.0.1\",\"logId\":810,\"method\":\"POST\",\"spendTime\":13,\"startTime\":1534511593585,\"uri\":\"/sso/login\",\"url\":\"http://127.0.0.1:1111/sso/login\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"后台首页\",\"ip\":\"127.0.0.1\",\"logId\":811,\"method\":\"GET\",\"spendTime\":15,\"startTime\":1534511593636,\"uri\":\"/manage/index\",\"url\":\"http://127.0.0.1:1111/manage/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"系统首页\",\"ip\":\"127.0.0.1\",\"logId\":812,\"method\":\"GET\",\"permissions\":\"upms:system:read\",\"spendTime\":0,\"startTime\":1534511597696,\"uri\":\"/manage/system/index\",\"url\":\"http://127.0.0.1:1111/manage/system/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"系统列表\",\"ip\":\"127.0.0.1\",\"logId\":813,\"method\":\"GET\",\"permissions\":\"upms:system:read\",\"spendTime\":7,\"startTime\":1534511597897,\"uri\":\"/manage/system/list\",\"url\":\"http://127.0.0.1:1111/manage/system/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"系统列表\",\"ip\":\"127.0.0.1\",\"logId\":814,\"method\":\"GET\",\"permissions\":\"upms:system:read\",\"spendTime\":6,\"startTime\":1534511618215,\"uri\":\"/manage/system/list\",\"url\":\"http://127.0.0.1:1111/manage/system/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"系统列表\",\"ip\":\"127.0.0.1\",\"logId\":815,\"method\":\"GET\",\"permissions\":\"upms:system:read\",\"spendTime\":5,\"startTime\":1534511621289,\"uri\":\"/manage/system/list\",\"url\":\"http://127.0.0.1:1111/manage/system/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"修改系统\",\"ip\":\"127.0.0.1\",\"logId\":816,\"method\":\"GET\",\"permissions\":\"upms:system:update\",\"spendTime\":3,\"startTime\":1534511636572,\"uri\":\"/manage/system/update/3\",\"url\":\"http://127.0.0.1:1111/manage/system/update/3\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"新增系统\",\"ip\":\"127.0.0.1\",\"logId\":817,\"method\":\"GET\",\"permissions\":\"upms:system:create\",\"spendTime\":0,\"startTime\":1534511705793,\"uri\":\"/manage/system/create\",\"url\":\"http://127.0.0.1:1111/manage/system/create\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"组织首页\",\"ip\":\"127.0.0.1\",\"logId\":818,\"method\":\"GET\",\"permissions\":\"upms:organization:read\",\"spendTime\":0,\"startTime\":1534511712220,\"uri\":\"/manage/organization/index\",\"url\":\"http://127.0.0.1:1111/manage/organization/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"}]}','upms:log:read'),(851,'日志列表','admin',1534515420013,5,'http://127.0.0.1:1111','/manage/log/list','http://127.0.0.1:1111/manage/log/list','GET','order=asc&offset=40&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":72,\"rows\":[{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"组织列表\",\"ip\":\"127.0.0.1\",\"logId\":819,\"method\":\"GET\",\"permissions\":\"upms:organization:read\",\"spendTime\":6,\"startTime\":1534511712424,\"uri\":\"/manage/organization/list\",\"url\":\"http://127.0.0.1:1111/manage/organization/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"用户首页\",\"ip\":\"127.0.0.1\",\"logId\":820,\"method\":\"GET\",\"permissions\":\"upms:user:read\",\"spendTime\":0,\"startTime\":1534512040433,\"uri\":\"/manage/user/index\",\"url\":\"http://127.0.0.1:1111/manage/user/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"用户列表\",\"ip\":\"127.0.0.1\",\"logId\":821,\"method\":\"GET\",\"permissions\":\"upms:user:read\",\"spendTime\":6,\"startTime\":1534512040687,\"uri\":\"/manage/user/list\",\"url\":\"http://127.0.0.1:1111/manage/user/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"角色首页\",\"ip\":\"127.0.0.1\",\"logId\":822,\"method\":\"GET\",\"permissions\":\"upms:role:read\",\"spendTime\":0,\"startTime\":1534512042543,\"uri\":\"/manage/role/index\",\"url\":\"http://127.0.0.1:1111/manage/role/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"角色列表\",\"ip\":\"127.0.0.1\",\"logId\":823,\"method\":\"GET\",\"permissions\":\"upms:role:read\",\"spendTime\":5,\"startTime\":1534512042701,\"uri\":\"/manage/role/list\",\"url\":\"http://127.0.0.1:1111/manage/role/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"用户组织\",\"ip\":\"127.0.0.1\",\"logId\":824,\"method\":\"GET\",\"permissions\":\"upms:user:organization\",\"spendTime\":15,\"startTime\":1534512221425,\"uri\":\"/manage/user/organization/1\",\"url\":\"http://127.0.0.1:1111/manage/user/organization/1\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"角色权限\",\"ip\":\"127.0.0.1\",\"logId\":825,\"method\":\"GET\",\"permissions\":\"upms:role:permission\",\"spendTime\":2,\"startTime\":1534512297464,\"uri\":\"/manage/role/permission/1\",\"url\":\"http://127.0.0.1:1111/manage/role/permission/1\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"角色权限列表\",\"ip\":\"127.0.0.1\",\"logId\":826,\"method\":\"POST\",\"permissions\":\"upms:permission:read\",\"spendTime\":34,\"startTime\":1534512297825,\"uri\":\"/manage/permission/role/1\",\"url\":\"http://127.0.0.1:1111/manage/permission/role/1\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"权限首页\",\"ip\":\"127.0.0.1\",\"logId\":827,\"method\":\"GET\",\"permissions\":\"upms:permission:read\",\"spendTime\":0,\"startTime\":1534512351866,\"uri\":\"/manage/permission/index\",\"url\":\"http://127.0.0.1:1111/manage/permission/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"权限列表\",\"ip\":\"127.0.0.1\",\"logId\":828,\"method\":\"GET\",\"permissions\":\"upms:permission:read\",\"spendTime\":6,\"startTime\":1534512352061,\"uri\":\"/manage/permission/list\",\"url\":\"http://127.0.0.1:1111/manage/permission/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"}]}','upms:log:read'),(852,'日志列表','admin',1534515420953,4,'http://127.0.0.1:1111','/manage/log/list','http://127.0.0.1:1111/manage/log/list','GET','order=asc&offset=60&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":73,\"rows\":[{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"权限列表\",\"ip\":\"127.0.0.1\",\"logId\":839,\"method\":\"GET\",\"permissions\":\"upms:permission:read\",\"spendTime\":8,\"startTime\":1534512413645,\"uri\":\"/manage/permission/list\",\"url\":\"http://127.0.0.1:1111/manage/permission/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"登录\",\"ip\":\"127.0.0.1\",\"logId\":840,\"method\":\"GET\",\"spendTime\":0,\"startTime\":1534515379061,\"uri\":\"/sso/login\",\"url\":\"http://127.0.0.1:1111/sso/login\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"登录\",\"ip\":\"127.0.0.1\",\"logId\":841,\"method\":\"GET\",\"spendTime\":0,\"startTime\":1534515379184,\"uri\":\"/sso/login\",\"url\":\"http://127.0.0.1:1111/sso/login\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"登录\",\"ip\":\"127.0.0.1\",\"logId\":842,\"method\":\"POST\",\"spendTime\":11,\"startTime\":1534515380870,\"uri\":\"/sso/login\",\"url\":\"http://127.0.0.1:1111/sso/login\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"后台首页\",\"ip\":\"127.0.0.1\",\"logId\":843,\"method\":\"GET\",\"spendTime\":13,\"startTime\":1534515380922,\"uri\":\"/manage/index\",\"url\":\"http://127.0.0.1:1111/manage/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"会话首页\",\"ip\":\"127.0.0.1\",\"logId\":844,\"method\":\"GET\",\"permissions\":\"upms:session:read\",\"spendTime\":0,\"startTime\":1534515383977,\"uri\":\"/manage/session/index\",\"url\":\"http://127.0.0.1:1111/manage/session/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"会话列表\",\"ip\":\"127.0.0.1\",\"logId\":845,\"method\":\"GET\",\"permissions\":\"upms:session:read\",\"spendTime\":2,\"startTime\":1534515384135,\"uri\":\"/manage/session/list\",\"url\":\"http://127.0.0.1:1111/manage/session/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"日志首页\",\"ip\":\"127.0.0.1\",\"logId\":846,\"method\":\"GET\",\"permissions\":\"upms:log:read\",\"spendTime\":0,\"startTime\":1534515405805,\"uri\":\"/manage/log/index\",\"url\":\"http://127.0.0.1:1111/manage/log/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"日志列表\",\"ip\":\"127.0.0.1\",\"logId\":847,\"method\":\"GET\",\"permissions\":\"upms:log:read\",\"spendTime\":9,\"startTime\":1534515405981,\"uri\":\"/manage/log/list\",\"url\":\"http://127.0.0.1:1111/manage/log/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"日志列表\",\"ip\":\"127.0.0.1\",\"logId\":848,\"method\":\"GET\",\"permissions\":\"upms:log:read\",\"spendTime\":5,\"startTime\":1534515417298,\"uri\":\"/manage/log/list\",\"url\":\"http://127.0.0.1:1111/manage/log/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"}]}','upms:log:read'),(853,'日志列表','admin',1534515424101,4,'http://127.0.0.1:1111','/manage/log/list','http://127.0.0.1:1111/manage/log/list','GET','order=asc&offset=70&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":74,\"rows\":[{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"日志列表\",\"ip\":\"127.0.0.1\",\"logId\":849,\"method\":\"GET\",\"permissions\":\"upms:log:read\",\"spendTime\":6,\"startTime\":1534515418459,\"uri\":\"/manage/log/list\",\"url\":\"http://127.0.0.1:1111/manage/log/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"日志列表\",\"ip\":\"127.0.0.1\",\"logId\":850,\"method\":\"GET\",\"permissions\":\"upms:log:read\",\"spendTime\":5,\"startTime\":1534515419333,\"uri\":\"/manage/log/list\",\"url\":\"http://127.0.0.1:1111/manage/log/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"日志列表\",\"ip\":\"127.0.0.1\",\"logId\":851,\"method\":\"GET\",\"permissions\":\"upms:log:read\",\"spendTime\":5,\"startTime\":1534515420013,\"uri\":\"/manage/log/list\",\"url\":\"http://127.0.0.1:1111/manage/log/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"日志列表\",\"ip\":\"127.0.0.1\",\"logId\":852,\"method\":\"GET\",\"permissions\":\"upms:log:read\",\"spendTime\":4,\"startTime\":1534515420953,\"uri\":\"/manage/log/list\",\"url\":\"http://127.0.0.1:1111/manage/log/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"}]}','upms:log:read'),(854,'日志列表','admin',1534515425671,6,'http://127.0.0.1:1111','/manage/log/list','http://127.0.0.1:1111/manage/log/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":75,\"rows\":[{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"后台首页\",\"ip\":\"127.0.0.1\",\"logId\":779,\"method\":\"GET\",\"spendTime\":95,\"startTime\":1534503505315,\"uri\":\"/manage/index\",\"url\":\"http://127.0.0.1:1111/manage/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"系统首页\",\"ip\":\"127.0.0.1\",\"logId\":780,\"method\":\"GET\",\"permissions\":\"upms:system:read\",\"spendTime\":12,\"startTime\":1534503516634,\"uri\":\"/manage/system/index\",\"url\":\"http://127.0.0.1:1111/manage/system/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"系统列表\",\"ip\":\"127.0.0.1\",\"logId\":781,\"method\":\"GET\",\"permissions\":\"upms:system:read\",\"spendTime\":18,\"startTime\":1534503517213,\"uri\":\"/manage/system/list\",\"url\":\"http://127.0.0.1:1111/manage/system/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"组织首页\",\"ip\":\"127.0.0.1\",\"logId\":782,\"method\":\"GET\",\"permissions\":\"upms:organization:read\",\"spendTime\":11,\"startTime\":1534503517563,\"uri\":\"/manage/organization/index\",\"url\":\"http://127.0.0.1:1111/manage/organization/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"组织列表\",\"ip\":\"127.0.0.1\",\"logId\":783,\"method\":\"GET\",\"permissions\":\"upms:organization:read\",\"spendTime\":18,\"startTime\":1534503517869,\"uri\":\"/manage/organization/list\",\"url\":\"http://127.0.0.1:1111/manage/organization/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"用户首页\",\"ip\":\"127.0.0.1\",\"logId\":784,\"method\":\"GET\",\"permissions\":\"upms:user:read\",\"spendTime\":14,\"startTime\":1534503521946,\"uri\":\"/manage/user/index\",\"url\":\"http://127.0.0.1:1111/manage/user/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"用户列表\",\"ip\":\"127.0.0.1\",\"logId\":785,\"method\":\"GET\",\"permissions\":\"upms:user:read\",\"spendTime\":27,\"startTime\":1534503522333,\"uri\":\"/manage/user/list\",\"url\":\"http://127.0.0.1:1111/manage/user/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"角色首页\",\"ip\":\"127.0.0.1\",\"logId\":786,\"method\":\"GET\",\"permissions\":\"upms:role:read\",\"spendTime\":12,\"startTime\":1534503523021,\"uri\":\"/manage/role/index\",\"url\":\"http://127.0.0.1:1111/manage/role/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"角色列表\",\"ip\":\"127.0.0.1\",\"logId\":787,\"method\":\"GET\",\"permissions\":\"upms:role:read\",\"spendTime\":23,\"startTime\":1534503523331,\"uri\":\"/manage/role/list\",\"url\":\"http://127.0.0.1:1111/manage/role/list\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"},{\"basePath\":\"http://127.0.0.1:1111\",\"description\":\"权限首页\",\"ip\":\"127.0.0.1\",\"logId\":788,\"method\":\"GET\",\"permissions\":\"upms:permission:read\",\"spendTime\":9,\"startTime\":1534503527915,\"uri\":\"/manage/permission/index\",\"url\":\"http://127.0.0.1:1111/manage/permission/index\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"username\":\"admin\"}]}','upms:log:read'),(855,'登录','',1534563219969,12,'http://127.0.0.1:1111','/sso/login','http://127.0.0.1:1111/sso/login','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/sso/login.jsp\"',NULL),(856,'登录','admin',1534563223204,141,'http://127.0.0.1:1111','/sso/login','http://127.0.0.1:1111/sso/login','POST','{password=[123456],rememberMe=[false],backurl=[],username=[admin]}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"code\":1,\"data\":\"http://127.0.0.1:1111\",\"message\":\"success\"}',NULL),(857,'后台首页','admin',1534563223510,83,'http://127.0.0.1:1111','/manage/index','http://127.0.0.1:1111/manage/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/index.jsp\"',NULL),(858,'用户首页','admin',1534563230843,13,'http://127.0.0.1:1111','/manage/user/index','http://127.0.0.1:1111/manage/user/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/user/index.jsp\"','upms:user:read'),(859,'用户列表','admin',1534563231467,21,'http://127.0.0.1:1111','/manage/user/list','http://127.0.0.1:1111/manage/user/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":2,\"rows\":[{\"avatar\":\"/resources/zheng-admin/images/avatar.jpg\",\"ctime\":1,\"email\":\"469741414@qq.com\",\"locked\":0,\"password\":\"3038D9CB63B3152A79B8153FB06C02F7\",\"phone\":\"\",\"realname\":\"张恕征\",\"salt\":\"66f1b370c660445a8657bf8bf1794486\",\"sex\":1,\"userId\":1,\"username\":\"admin\"},{\"avatar\":\"/resources/zheng-admin/images/avatar.jpg\",\"ctime\":1493394720495,\"email\":\"469741414@qq.com\",\"locked\":0,\"password\":\"285C9762F5F9046F5893F752DFAF3476\",\"phone\":\"\",\"realname\":\"张恕征\",\"salt\":\"d2d0d03310444ad388a8b290b0fe8564\",\"sex\":1,\"userId\":2,\"username\":\"test\"}]}','upms:user:read'),(860,'用户权限','admin',1534563242195,5,'http://127.0.0.1:1111','/manage/user/permission/1','http://127.0.0.1:1111/manage/user/permission/1','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/user/permission.jsp\"','upms:user:permission'),(861,'用户权限列表','admin',1534563242592,73,'http://127.0.0.1:1111','/manage/permission/user/1','http://127.0.0.1:1111/manage/permission/user/1','POST','{type=[-1]}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"新增系统\",\"id\":24,\"open\":true},{\"name\":\"编辑系统\",\"id\":25,\"open\":true},{\"name\":\"删除系统\",\"id\":26,\"open\":true}],\"name\":\"系统管理\",\"id\":2,\"open\":true},{\"children\":[{\"name\":\"新增组织\",\"id\":27,\"open\":true},{\"name\":\"编辑组织\",\"id\":28,\"open\":true},{\"name\":\"删除组织\",\"id\":29,\"open\":true}],\"name\":\"组织管理\",\"id\":3,\"open\":true}],\"name\":\"系统组织管理\",\"id\":1,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增用户\",\"id\":30,\"open\":true},{\"name\":\"编辑用户\",\"id\":31,\"open\":true},{\"name\":\"删除用户\",\"id\":32,\"open\":true},{\"name\":\"用户权限\",\"id\":51,\"open\":true},{\"name\":\"用户组织\",\"id\":48,\"open\":true},{\"name\":\"用户角色\",\"id\":50,\"open\":true}],\"name\":\"用户管理\",\"id\":6,\"open\":true},{\"children\":[{\"name\":\"新增角色\",\"id\":33,\"open\":true},{\"name\":\"编辑角色\",\"id\":34,\"open\":true},{\"name\":\"删除角色\",\"id\":35,\"open\":true},{\"name\":\"角色权限\",\"id\":46,\"open\":true}],\"name\":\"角色管理\",\"id\":5,\"open\":true}],\"name\":\"角色用户管理\",\"id\":4,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增权限\",\"id\":36,\"open\":true},{\"name\":\"编辑权限\",\"id\":37,\"open\":true},{\"name\":\"删除权限\",\"id\":38,\"open\":true}],\"name\":\"权限管理\",\"id\":39,\"open\":true}],\"name\":\"权限资源管理\",\"id\":7,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"强制退出\",\"id\":53,\"open\":true}],\"name\":\"会话管理\",\"id\":14,\"open\":true},{\"children\":[{\"name\":\"删除权限\",\"id\":57,\"open\":true}],\"name\":\"日志记录\",\"id\":15,\"open\":true}],\"name\":\"其他数据管理\",\"id\":12,\"open\":true}],\"name\":\"权限管理系统\",\"id\":1,\"nocheck\":true,\"open\":true},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"新增标签\",\"id\":54,\"open\":true},{\"name\":\"编辑标签\",\"id\":55,\"open\":true},{\"name\":\"删除标签\",\"id\":56,\"open\":true}],\"name\":\"标签管理\",\"id\":18,\"open\":true},{\"children\":[{\"name\":\"编辑类目\",\"id\":58,\"open\":true},{\"name\":\"删除类目\",\"id\":59,\"open\":true},{\"name\":\"新增类目\",\"id\":60,\"open\":true}],\"name\":\"类目管理\",\"id\":19,\"open\":true}],\"name\":\"标签类目管理\",\"id\":17,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增文章\",\"id\":76,\"open\":true},{\"name\":\"编辑文章\",\"id\":77,\"open\":true},{\"name\":\"删除文章\",\"id\":78,\"open\":true}],\"name\":\"文章管理\",\"id\":21,\"open\":true},{\"name\":\"回收管理\",\"checked\":true,\"id\":22,\"open\":true},{\"children\":[{\"name\":\"删除评论\",\"id\":63,\"open\":true}],\"name\":\"评论管理\",\"id\":62,\"open\":true}],\"name\":\"文章评论管理\",\"id\":20,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增单页\",\"id\":65,\"open\":true},{\"name\":\"编辑单页\",\"id\":66,\"open\":true},{\"name\":\"删除单页\",\"id\":67,\"open\":true}],\"name\":\"单页管理\",\"id\":64,\"open\":true},{\"children\":[{\"name\":\"新增专题\",\"id\":81,\"open\":true},{\"name\":\"编辑专题\",\"id\":82,\"open\":true},{\"name\":\"删除专题\",\"id\":83,\"open\":true}],\"name\":\"专题管理\",\"id\":80,\"open\":true}],\"name\":\"单页专题管理\",\"id\":79,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增菜单\",\"id\":69,\"open\":true},{\"name\":\"编辑菜单\",\"id\":70,\"open\":true},{\"name\":\"删除菜单\",\"id\":71,\"open\":true},{\"name\":\"上移菜单\",\"id\":84,\"open\":true},{\"name\":\"下移菜单\",\"id\":85,\"open\":true}],\"name\":\"菜单管理\",\"id\":68,\"open\":true},{\"children\":[{\"name\":\"新增设置\",\"id\":73,\"open\":true},{\"name\":\"编辑设置\",\"id\":74,\"open\":true},{\"name\":\"删除设置\",\"id\":75,\"open\":true}],\"name\":\"系统设置\",\"id\":72,\"open\":true}],\"name\":\"其他数据管理\",\"id\":61,\"open\":true}],\"name\":\"内容管理系统\",\"id\":2,\"nocheck\":true,\"open\":true},{\"name\":\"支付管理系统\",\"id\":3,\"nocheck\":true,\"open\":true},{\"name\":\"用户管理系统\",\"id\":4,\"nocheck\":true,\"open\":true},{\"name\":\"存储管理系统\",\"id\":5,\"nocheck\":true,\"open\":true}]','upms:permission:read'),(862,'用户权限列表','admin',1534563242592,73,'http://127.0.0.1:1111','/manage/permission/user/1','http://127.0.0.1:1111/manage/permission/user/1','POST','{type=[1]}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"新增系统\",\"id\":24,\"open\":true},{\"name\":\"编辑系统\",\"id\":25,\"open\":true},{\"name\":\"删除系统\",\"id\":26,\"open\":true}],\"name\":\"系统管理\",\"id\":2,\"open\":true},{\"children\":[{\"name\":\"新增组织\",\"id\":27,\"open\":true},{\"name\":\"编辑组织\",\"id\":28,\"open\":true},{\"name\":\"删除组织\",\"id\":29,\"open\":true}],\"name\":\"组织管理\",\"id\":3,\"open\":true}],\"name\":\"系统组织管理\",\"id\":1,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增用户\",\"id\":30,\"open\":true},{\"name\":\"编辑用户\",\"id\":31,\"open\":true},{\"name\":\"删除用户\",\"id\":32,\"open\":true},{\"name\":\"用户权限\",\"id\":51,\"open\":true},{\"name\":\"用户组织\",\"id\":48,\"open\":true},{\"name\":\"用户角色\",\"id\":50,\"open\":true}],\"name\":\"用户管理\",\"id\":6,\"open\":true},{\"children\":[{\"name\":\"新增角色\",\"id\":33,\"open\":true},{\"name\":\"编辑角色\",\"id\":34,\"open\":true},{\"name\":\"删除角色\",\"id\":35,\"open\":true},{\"name\":\"角色权限\",\"id\":46,\"open\":true}],\"name\":\"角色管理\",\"id\":5,\"open\":true}],\"name\":\"角色用户管理\",\"id\":4,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增权限\",\"id\":36,\"open\":true},{\"name\":\"编辑权限\",\"id\":37,\"open\":true},{\"name\":\"删除权限\",\"id\":38,\"open\":true}],\"name\":\"权限管理\",\"id\":39,\"open\":true}],\"name\":\"权限资源管理\",\"id\":7,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"强制退出\",\"id\":53,\"open\":true}],\"name\":\"会话管理\",\"id\":14,\"open\":true},{\"children\":[{\"name\":\"删除权限\",\"id\":57,\"open\":true}],\"name\":\"日志记录\",\"id\":15,\"open\":true}],\"name\":\"其他数据管理\",\"id\":12,\"open\":true}],\"name\":\"权限管理系统\",\"id\":1,\"nocheck\":true,\"open\":true},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"新增标签\",\"id\":54,\"open\":true},{\"name\":\"编辑标签\",\"id\":55,\"open\":true},{\"name\":\"删除标签\",\"id\":56,\"open\":true}],\"name\":\"标签管理\",\"id\":18,\"open\":true},{\"children\":[{\"name\":\"编辑类目\",\"id\":58,\"open\":true},{\"name\":\"删除类目\",\"id\":59,\"open\":true},{\"name\":\"新增类目\",\"id\":60,\"open\":true}],\"name\":\"类目管理\",\"id\":19,\"open\":true}],\"name\":\"标签类目管理\",\"id\":17,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增文章\",\"id\":76,\"open\":true},{\"name\":\"编辑文章\",\"id\":77,\"open\":true},{\"name\":\"删除文章\",\"id\":78,\"open\":true}],\"name\":\"文章管理\",\"id\":21,\"open\":true},{\"name\":\"回收管理\",\"checked\":true,\"id\":22,\"open\":true},{\"children\":[{\"name\":\"删除评论\",\"id\":63,\"open\":true}],\"name\":\"评论管理\",\"id\":62,\"open\":true}],\"name\":\"文章评论管理\",\"id\":20,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增单页\",\"id\":65,\"open\":true},{\"name\":\"编辑单页\",\"id\":66,\"open\":true},{\"name\":\"删除单页\",\"id\":67,\"open\":true}],\"name\":\"单页管理\",\"id\":64,\"open\":true},{\"children\":[{\"name\":\"新增专题\",\"id\":81,\"open\":true},{\"name\":\"编辑专题\",\"id\":82,\"open\":true},{\"name\":\"删除专题\",\"id\":83,\"open\":true}],\"name\":\"专题管理\",\"id\":80,\"open\":true}],\"name\":\"单页专题管理\",\"id\":79,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增菜单\",\"id\":69,\"open\":true},{\"name\":\"编辑菜单\",\"id\":70,\"open\":true},{\"name\":\"删除菜单\",\"id\":71,\"open\":true},{\"name\":\"上移菜单\",\"id\":84,\"open\":true},{\"name\":\"下移菜单\",\"id\":85,\"open\":true}],\"name\":\"菜单管理\",\"id\":68,\"open\":true},{\"children\":[{\"name\":\"新增设置\",\"id\":73,\"open\":true},{\"name\":\"编辑设置\",\"id\":74,\"open\":true},{\"name\":\"删除设置\",\"id\":75,\"open\":true}],\"name\":\"系统设置\",\"id\":72,\"open\":true}],\"name\":\"其他数据管理\",\"id\":61,\"open\":true}],\"name\":\"内容管理系统\",\"id\":2,\"nocheck\":true,\"open\":true},{\"name\":\"支付管理系统\",\"id\":3,\"nocheck\":true,\"open\":true},{\"name\":\"用户管理系统\",\"id\":4,\"nocheck\":true,\"open\":true},{\"name\":\"存储管理系统\",\"id\":5,\"nocheck\":true,\"open\":true}]','upms:permission:read'),(863,'用户角色','admin',1534563261425,20,'http://127.0.0.1:1111','/manage/user/role/1','http://127.0.0.1:1111/manage/user/role/1','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/user/role.jsp\"','upms:user:role'),(864,'用户组织','admin',1534563265277,25,'http://127.0.0.1:1111','/manage/user/organization/1','http://127.0.0.1:1111/manage/user/organization/1','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/user/organization.jsp\"','upms:user:organization'),(865,'修改用户','admin',1534563269421,4,'http://127.0.0.1:1111','/manage/user/update/1','http://127.0.0.1:1111/manage/user/update/1','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/user/update.jsp\"','upms:user:update'),(866,'用户权限','admin',1534563279603,3,'http://127.0.0.1:1111','/manage/user/permission/1','http://127.0.0.1:1111/manage/user/permission/1','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/user/permission.jsp\"','upms:user:permission'),(867,'用户权限列表','admin',1534563279970,38,'http://127.0.0.1:1111','/manage/permission/user/1','http://127.0.0.1:1111/manage/permission/user/1','POST','{type=[-1]}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"新增系统\",\"id\":24,\"open\":true},{\"name\":\"编辑系统\",\"id\":25,\"open\":true},{\"name\":\"删除系统\",\"id\":26,\"open\":true}],\"name\":\"系统管理\",\"id\":2,\"open\":true},{\"children\":[{\"name\":\"新增组织\",\"id\":27,\"open\":true},{\"name\":\"编辑组织\",\"id\":28,\"open\":true},{\"name\":\"删除组织\",\"id\":29,\"open\":true}],\"name\":\"组织管理\",\"id\":3,\"open\":true}],\"name\":\"系统组织管理\",\"id\":1,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增用户\",\"id\":30,\"open\":true},{\"name\":\"编辑用户\",\"id\":31,\"open\":true},{\"name\":\"删除用户\",\"id\":32,\"open\":true},{\"name\":\"用户权限\",\"id\":51,\"open\":true},{\"name\":\"用户组织\",\"id\":48,\"open\":true},{\"name\":\"用户角色\",\"id\":50,\"open\":true}],\"name\":\"用户管理\",\"id\":6,\"open\":true},{\"children\":[{\"name\":\"新增角色\",\"id\":33,\"open\":true},{\"name\":\"编辑角色\",\"id\":34,\"open\":true},{\"name\":\"删除角色\",\"id\":35,\"open\":true},{\"name\":\"角色权限\",\"id\":46,\"open\":true}],\"name\":\"角色管理\",\"id\":5,\"open\":true}],\"name\":\"角色用户管理\",\"id\":4,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增权限\",\"id\":36,\"open\":true},{\"name\":\"编辑权限\",\"id\":37,\"open\":true},{\"name\":\"删除权限\",\"id\":38,\"open\":true}],\"name\":\"权限管理\",\"id\":39,\"open\":true}],\"name\":\"权限资源管理\",\"id\":7,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"强制退出\",\"id\":53,\"open\":true}],\"name\":\"会话管理\",\"id\":14,\"open\":true},{\"children\":[{\"name\":\"删除权限\",\"id\":57,\"open\":true}],\"name\":\"日志记录\",\"id\":15,\"open\":true}],\"name\":\"其他数据管理\",\"id\":12,\"open\":true}],\"name\":\"权限管理系统\",\"id\":1,\"nocheck\":true,\"open\":true},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"新增标签\",\"id\":54,\"open\":true},{\"name\":\"编辑标签\",\"id\":55,\"open\":true},{\"name\":\"删除标签\",\"id\":56,\"open\":true}],\"name\":\"标签管理\",\"id\":18,\"open\":true},{\"children\":[{\"name\":\"编辑类目\",\"id\":58,\"open\":true},{\"name\":\"删除类目\",\"id\":59,\"open\":true},{\"name\":\"新增类目\",\"id\":60,\"open\":true}],\"name\":\"类目管理\",\"id\":19,\"open\":true}],\"name\":\"标签类目管理\",\"id\":17,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增文章\",\"id\":76,\"open\":true},{\"name\":\"编辑文章\",\"id\":77,\"open\":true},{\"name\":\"删除文章\",\"id\":78,\"open\":true}],\"name\":\"文章管理\",\"id\":21,\"open\":true},{\"name\":\"回收管理\",\"checked\":true,\"id\":22,\"open\":true},{\"children\":[{\"name\":\"删除评论\",\"id\":63,\"open\":true}],\"name\":\"评论管理\",\"id\":62,\"open\":true}],\"name\":\"文章评论管理\",\"id\":20,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增单页\",\"id\":65,\"open\":true},{\"name\":\"编辑单页\",\"id\":66,\"open\":true},{\"name\":\"删除单页\",\"id\":67,\"open\":true}],\"name\":\"单页管理\",\"id\":64,\"open\":true},{\"children\":[{\"name\":\"新增专题\",\"id\":81,\"open\":true},{\"name\":\"编辑专题\",\"id\":82,\"open\":true},{\"name\":\"删除专题\",\"id\":83,\"open\":true}],\"name\":\"专题管理\",\"id\":80,\"open\":true}],\"name\":\"单页专题管理\",\"id\":79,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增菜单\",\"id\":69,\"open\":true},{\"name\":\"编辑菜单\",\"id\":70,\"open\":true},{\"name\":\"删除菜单\",\"id\":71,\"open\":true},{\"name\":\"上移菜单\",\"id\":84,\"open\":true},{\"name\":\"下移菜单\",\"id\":85,\"open\":true}],\"name\":\"菜单管理\",\"id\":68,\"open\":true},{\"children\":[{\"name\":\"新增设置\",\"id\":73,\"open\":true},{\"name\":\"编辑设置\",\"id\":74,\"open\":true},{\"name\":\"删除设置\",\"id\":75,\"open\":true}],\"name\":\"系统设置\",\"id\":72,\"open\":true}],\"name\":\"其他数据管理\",\"id\":61,\"open\":true}],\"name\":\"内容管理系统\",\"id\":2,\"nocheck\":true,\"open\":true},{\"name\":\"支付管理系统\",\"id\":3,\"nocheck\":true,\"open\":true},{\"name\":\"用户管理系统\",\"id\":4,\"nocheck\":true,\"open\":true},{\"name\":\"存储管理系统\",\"id\":5,\"nocheck\":true,\"open\":true}]','upms:permission:read'),(868,'用户权限列表','admin',1534563279970,38,'http://127.0.0.1:1111','/manage/permission/user/1','http://127.0.0.1:1111/manage/permission/user/1','POST','{type=[1]}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"新增系统\",\"id\":24,\"open\":true},{\"name\":\"编辑系统\",\"id\":25,\"open\":true},{\"name\":\"删除系统\",\"id\":26,\"open\":true}],\"name\":\"系统管理\",\"id\":2,\"open\":true},{\"children\":[{\"name\":\"新增组织\",\"id\":27,\"open\":true},{\"name\":\"编辑组织\",\"id\":28,\"open\":true},{\"name\":\"删除组织\",\"id\":29,\"open\":true}],\"name\":\"组织管理\",\"id\":3,\"open\":true}],\"name\":\"系统组织管理\",\"id\":1,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增用户\",\"id\":30,\"open\":true},{\"name\":\"编辑用户\",\"id\":31,\"open\":true},{\"name\":\"删除用户\",\"id\":32,\"open\":true},{\"name\":\"用户权限\",\"id\":51,\"open\":true},{\"name\":\"用户组织\",\"id\":48,\"open\":true},{\"name\":\"用户角色\",\"id\":50,\"open\":true}],\"name\":\"用户管理\",\"id\":6,\"open\":true},{\"children\":[{\"name\":\"新增角色\",\"id\":33,\"open\":true},{\"name\":\"编辑角色\",\"id\":34,\"open\":true},{\"name\":\"删除角色\",\"id\":35,\"open\":true},{\"name\":\"角色权限\",\"id\":46,\"open\":true}],\"name\":\"角色管理\",\"id\":5,\"open\":true}],\"name\":\"角色用户管理\",\"id\":4,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增权限\",\"id\":36,\"open\":true},{\"name\":\"编辑权限\",\"id\":37,\"open\":true},{\"name\":\"删除权限\",\"id\":38,\"open\":true}],\"name\":\"权限管理\",\"id\":39,\"open\":true}],\"name\":\"权限资源管理\",\"id\":7,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"强制退出\",\"id\":53,\"open\":true}],\"name\":\"会话管理\",\"id\":14,\"open\":true},{\"children\":[{\"name\":\"删除权限\",\"id\":57,\"open\":true}],\"name\":\"日志记录\",\"id\":15,\"open\":true}],\"name\":\"其他数据管理\",\"id\":12,\"open\":true}],\"name\":\"权限管理系统\",\"id\":1,\"nocheck\":true,\"open\":true},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"新增标签\",\"id\":54,\"open\":true},{\"name\":\"编辑标签\",\"id\":55,\"open\":true},{\"name\":\"删除标签\",\"id\":56,\"open\":true}],\"name\":\"标签管理\",\"id\":18,\"open\":true},{\"children\":[{\"name\":\"编辑类目\",\"id\":58,\"open\":true},{\"name\":\"删除类目\",\"id\":59,\"open\":true},{\"name\":\"新增类目\",\"id\":60,\"open\":true}],\"name\":\"类目管理\",\"id\":19,\"open\":true}],\"name\":\"标签类目管理\",\"id\":17,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增文章\",\"id\":76,\"open\":true},{\"name\":\"编辑文章\",\"id\":77,\"open\":true},{\"name\":\"删除文章\",\"id\":78,\"open\":true}],\"name\":\"文章管理\",\"id\":21,\"open\":true},{\"name\":\"回收管理\",\"checked\":true,\"id\":22,\"open\":true},{\"children\":[{\"name\":\"删除评论\",\"id\":63,\"open\":true}],\"name\":\"评论管理\",\"id\":62,\"open\":true}],\"name\":\"文章评论管理\",\"id\":20,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增单页\",\"id\":65,\"open\":true},{\"name\":\"编辑单页\",\"id\":66,\"open\":true},{\"name\":\"删除单页\",\"id\":67,\"open\":true}],\"name\":\"单页管理\",\"id\":64,\"open\":true},{\"children\":[{\"name\":\"新增专题\",\"id\":81,\"open\":true},{\"name\":\"编辑专题\",\"id\":82,\"open\":true},{\"name\":\"删除专题\",\"id\":83,\"open\":true}],\"name\":\"专题管理\",\"id\":80,\"open\":true}],\"name\":\"单页专题管理\",\"id\":79,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增菜单\",\"id\":69,\"open\":true},{\"name\":\"编辑菜单\",\"id\":70,\"open\":true},{\"name\":\"删除菜单\",\"id\":71,\"open\":true},{\"name\":\"上移菜单\",\"id\":84,\"open\":true},{\"name\":\"下移菜单\",\"id\":85,\"open\":true}],\"name\":\"菜单管理\",\"id\":68,\"open\":true},{\"children\":[{\"name\":\"新增设置\",\"id\":73,\"open\":true},{\"name\":\"编辑设置\",\"id\":74,\"open\":true},{\"name\":\"删除设置\",\"id\":75,\"open\":true}],\"name\":\"系统设置\",\"id\":72,\"open\":true}],\"name\":\"其他数据管理\",\"id\":61,\"open\":true}],\"name\":\"内容管理系统\",\"id\":2,\"nocheck\":true,\"open\":true},{\"name\":\"支付管理系统\",\"id\":3,\"nocheck\":true,\"open\":true},{\"name\":\"用户管理系统\",\"id\":4,\"nocheck\":true,\"open\":true},{\"name\":\"存储管理系统\",\"id\":5,\"nocheck\":true,\"open\":true}]','upms:permission:read'),(869,'角色首页','admin',1534563304494,8,'http://127.0.0.1:1111','/manage/role/index','http://127.0.0.1:1111/manage/role/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/role/index.jsp\"','upms:role:read'),(870,'角色列表','admin',1534563304911,8,'http://127.0.0.1:1111','/manage/role/list','http://127.0.0.1:1111/manage/role/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":2,\"rows\":[{\"ctime\":1,\"description\":\"拥有所有权限\",\"name\":\"super\",\"orders\":1,\"roleId\":1,\"title\":\"超级管理员\"},{\"ctime\":1487471013117,\"description\":\"拥有除权限管理系统外的所有权限\",\"name\":\"admin\",\"orders\":1487471013117,\"roleId\":2,\"title\":\"管理员\"}]}','upms:role:read'),(871,'会话首页','admin',1534563663379,7,'http://127.0.0.1:1111','/manage/session/index','http://127.0.0.1:1111/manage/session/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/session/index.jsp\"','upms:session:read'),(872,'会话列表','admin',1534563663667,8,'http://127.0.0.1:1111','/manage/session/list','http://127.0.0.1:1111/manage/session/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":1,\"rows\":[{\"attributeKeys\":[\"org.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEY\",\"zheng.upms.type\",\"org.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEY\"],\"status\":\"on_line\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\",\"valid\":true}]}','upms:session:read'),(873,'权限首页','admin',1534563787314,0,'http://127.0.0.1:1111','/manage/permission/index','http://127.0.0.1:1111/manage/permission/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/permission/index.jsp\"','upms:permission:read'),(874,'权限列表','admin',1534563787659,15,'http://127.0.0.1:1111','/manage/permission/list','http://127.0.0.1:1111/manage/permission/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":69,\"rows\":[{\"ctime\":1,\"icon\":\"zmdi zmdi-accounts-list\",\"name\":\"系统组织管理\",\"orders\":1,\"permissionId\":1,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":2,\"icon\":\"\",\"name\":\"系统管理\",\"orders\":2,\"permissionId\":2,\"permissionValue\":\"upms:system:read\",\"pid\":1,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/system/index\"},{\"ctime\":3,\"icon\":\"\",\"name\":\"组织管理\",\"orders\":3,\"permissionId\":3,\"permissionValue\":\"upms:organization:read\",\"pid\":1,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/organization/index\"},{\"ctime\":4,\"icon\":\"zmdi zmdi-accounts\",\"name\":\"角色用户管理\",\"orders\":4,\"permissionId\":4,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":6,\"icon\":\"\",\"name\":\"角色管理\",\"orders\":6,\"permissionId\":5,\"permissionValue\":\"upms:role:read\",\"pid\":4,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/role/index\"},{\"ctime\":5,\"icon\":\"\",\"name\":\"用户管理\",\"orders\":5,\"permissionId\":6,\"permissionValue\":\"upms:user:read\",\"pid\":4,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/user/index\"},{\"ctime\":7,\"icon\":\"zmdi zmdi-lock-outline\",\"name\":\"权限资源管理\",\"orders\":7,\"permissionId\":7,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":12,\"icon\":\"zmdi zmdi-more\",\"name\":\"其他数据管理\",\"orders\":12,\"permissionId\":12,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":14,\"icon\":\"\",\"name\":\"会话管理\",\"orders\":14,\"permissionId\":14,\"permissionValue\":\"upms:session:read\",\"pid\":12,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/session/index\"},{\"ctime\":15,\"icon\":\"\",\"name\":\"日志记录\",\"orders\":15,\"permissionId\":15,\"permissionValue\":\"upms:log:read\",\"pid\":12,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/log/index\"}]}','upms:permission:read'),(875,'退出登录','',1534563832077,6,'http://127.0.0.1:1111','/sso/logout','http://127.0.0.1:1111/sso/logout','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"redirect:http://127.0.0.1:1111/manage/index\"',NULL),(876,'登录','',1534563832127,1,'http://127.0.0.1:1111','/sso/login','http://127.0.0.1:1111/sso/login','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/sso/login.jsp\"',NULL),(877,'登录','',1534563838479,5,'http://127.0.0.1:1111','/sso/login','http://127.0.0.1:1111/sso/login','POST','{password=[123456],rememberMe=[false],backurl=[],username=[super]}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"code\":10103,\"data\":\"帐号不存在！\",\"message\":\"Account does not exist\"}',NULL),(878,'登录','admin',1534563848165,18,'http://127.0.0.1:1111','/sso/login','http://127.0.0.1:1111/sso/login','POST','{password=[123456],rememberMe=[false],backurl=[],username=[admin]}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"code\":1,\"data\":\"http://127.0.0.1:1111\",\"message\":\"success\"}',NULL),(879,'后台首页','admin',1534563848219,19,'http://127.0.0.1:1111','/manage/index','http://127.0.0.1:1111/manage/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/index.jsp\"',NULL),(880,'用户首页','admin',1534563851452,0,'http://127.0.0.1:1111','/manage/user/index','http://127.0.0.1:1111/manage/user/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/user/index.jsp\"','upms:user:read'),(881,'用户列表','admin',1534563851792,8,'http://127.0.0.1:1111','/manage/user/list','http://127.0.0.1:1111/manage/user/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":2,\"rows\":[{\"avatar\":\"/resources/zheng-admin/images/avatar.jpg\",\"ctime\":1,\"email\":\"469741414@qq.com\",\"locked\":0,\"password\":\"3038D9CB63B3152A79B8153FB06C02F7\",\"phone\":\"\",\"realname\":\"张恕征\",\"salt\":\"66f1b370c660445a8657bf8bf1794486\",\"sex\":1,\"userId\":1,\"username\":\"admin\"},{\"avatar\":\"/resources/zheng-admin/images/avatar.jpg\",\"ctime\":1493394720495,\"email\":\"469741414@qq.com\",\"locked\":0,\"password\":\"285C9762F5F9046F5893F752DFAF3476\",\"phone\":\"\",\"realname\":\"张恕征\",\"salt\":\"d2d0d03310444ad388a8b290b0fe8564\",\"sex\":1,\"userId\":2,\"username\":\"test\"}]}','upms:user:read'),(882,'角色首页','admin',1534563855400,0,'http://127.0.0.1:1111','/manage/role/index','http://127.0.0.1:1111/manage/role/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/role/index.jsp\"','upms:role:read'),(883,'角色列表','admin',1534563855574,7,'http://127.0.0.1:1111','/manage/role/list','http://127.0.0.1:1111/manage/role/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":2,\"rows\":[{\"ctime\":1,\"description\":\"拥有所有权限\",\"name\":\"super\",\"orders\":1,\"roleId\":1,\"title\":\"超级管理员\"},{\"ctime\":1487471013117,\"description\":\"拥有除权限管理系统外的所有权限\",\"name\":\"admin\",\"orders\":1487471013117,\"roleId\":2,\"title\":\"管理员\"}]}','upms:role:read'),(884,'权限首页','admin',1534563865576,0,'http://127.0.0.1:1111','/manage/permission/index','http://127.0.0.1:1111/manage/permission/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/permission/index.jsp\"','upms:permission:read'),(885,'权限列表','admin',1534563865867,7,'http://127.0.0.1:1111','/manage/permission/list','http://127.0.0.1:1111/manage/permission/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":69,\"rows\":[{\"ctime\":1,\"icon\":\"zmdi zmdi-accounts-list\",\"name\":\"系统组织管理\",\"orders\":1,\"permissionId\":1,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":2,\"icon\":\"\",\"name\":\"系统管理\",\"orders\":2,\"permissionId\":2,\"permissionValue\":\"upms:system:read\",\"pid\":1,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/system/index\"},{\"ctime\":3,\"icon\":\"\",\"name\":\"组织管理\",\"orders\":3,\"permissionId\":3,\"permissionValue\":\"upms:organization:read\",\"pid\":1,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/organization/index\"},{\"ctime\":4,\"icon\":\"zmdi zmdi-accounts\",\"name\":\"角色用户管理\",\"orders\":4,\"permissionId\":4,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":6,\"icon\":\"\",\"name\":\"角色管理\",\"orders\":6,\"permissionId\":5,\"permissionValue\":\"upms:role:read\",\"pid\":4,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/role/index\"},{\"ctime\":5,\"icon\":\"\",\"name\":\"用户管理\",\"orders\":5,\"permissionId\":6,\"permissionValue\":\"upms:user:read\",\"pid\":4,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/user/index\"},{\"ctime\":7,\"icon\":\"zmdi zmdi-lock-outline\",\"name\":\"权限资源管理\",\"orders\":7,\"permissionId\":7,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":12,\"icon\":\"zmdi zmdi-more\",\"name\":\"其他数据管理\",\"orders\":12,\"permissionId\":12,\"permissionValue\":\"\",\"pid\":0,\"status\":1,\"systemId\":1,\"type\":1,\"uri\":\"\"},{\"ctime\":14,\"icon\":\"\",\"name\":\"会话管理\",\"orders\":14,\"permissionId\":14,\"permissionValue\":\"upms:session:read\",\"pid\":12,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/session/index\"},{\"ctime\":15,\"icon\":\"\",\"name\":\"日志记录\",\"orders\":15,\"permissionId\":15,\"permissionValue\":\"upms:log:read\",\"pid\":12,\"status\":1,\"systemId\":1,\"type\":2,\"uri\":\"/manage/log/index\"}]}','upms:permission:read'),(886,'角色权限','admin',1534563872006,3,'http://127.0.0.1:1111','/manage/role/permission/2','http://127.0.0.1:1111/manage/role/permission/2','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/role/permission.jsp\"','upms:role:permission'),(887,'角色权限列表','admin',1534563872361,18,'http://127.0.0.1:1111','/manage/permission/role/2','http://127.0.0.1:1111/manage/permission/role/2','POST','{}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"新增系统\",\"id\":24,\"open\":true},{\"name\":\"编辑系统\",\"id\":25,\"open\":true},{\"name\":\"删除系统\",\"id\":26,\"open\":true}],\"name\":\"系统管理\",\"id\":2,\"open\":true},{\"children\":[{\"name\":\"新增组织\",\"id\":27,\"open\":true},{\"name\":\"编辑组织\",\"id\":28,\"open\":true},{\"name\":\"删除组织\",\"id\":29,\"open\":true}],\"name\":\"组织管理\",\"id\":3,\"open\":true}],\"name\":\"系统组织管理\",\"id\":1,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增用户\",\"id\":30,\"open\":true},{\"name\":\"编辑用户\",\"id\":31,\"open\":true},{\"name\":\"删除用户\",\"id\":32,\"open\":true},{\"name\":\"用户权限\",\"id\":51,\"open\":true},{\"name\":\"用户组织\",\"id\":48,\"open\":true},{\"name\":\"用户角色\",\"id\":50,\"open\":true}],\"name\":\"用户管理\",\"id\":6,\"open\":true},{\"children\":[{\"name\":\"新增角色\",\"id\":33,\"open\":true},{\"name\":\"编辑角色\",\"id\":34,\"open\":true},{\"name\":\"删除角色\",\"id\":35,\"open\":true},{\"name\":\"角色权限\",\"id\":46,\"open\":true}],\"name\":\"角色管理\",\"id\":5,\"open\":true}],\"name\":\"角色用户管理\",\"id\":4,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增权限\",\"id\":36,\"open\":true},{\"name\":\"编辑权限\",\"id\":37,\"open\":true},{\"name\":\"删除权限\",\"id\":38,\"open\":true}],\"name\":\"权限管理\",\"id\":39,\"open\":true}],\"name\":\"权限资源管理\",\"id\":7,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"强制退出\",\"id\":53,\"open\":true}],\"name\":\"会话管理\",\"id\":14,\"open\":true},{\"children\":[{\"name\":\"删除权限\",\"id\":57,\"open\":true}],\"name\":\"日志记录\",\"id\":15,\"open\":true}],\"name\":\"其他数据管理\",\"id\":12,\"open\":true}],\"name\":\"权限管理系统\",\"id\":1,\"nocheck\":true,\"open\":true},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"新增标签\",\"id\":54,\"open\":true},{\"name\":\"编辑标签\",\"id\":55,\"open\":true},{\"name\":\"删除标签\",\"id\":56,\"open\":true}],\"name\":\"标签管理\",\"id\":18,\"open\":true},{\"children\":[{\"name\":\"编辑类目\",\"id\":58,\"open\":true},{\"name\":\"删除类目\",\"id\":59,\"open\":true},{\"name\":\"新增类目\",\"id\":60,\"open\":true}],\"name\":\"类目管理\",\"id\":19,\"open\":true}],\"name\":\"标签类目管理\",\"id\":17,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增文章\",\"id\":76,\"open\":true},{\"name\":\"编辑文章\",\"id\":77,\"open\":true},{\"name\":\"删除文章\",\"id\":78,\"open\":true}],\"name\":\"文章管理\",\"id\":21,\"open\":true},{\"name\":\"回收管理\",\"id\":22,\"open\":true},{\"children\":[{\"name\":\"删除评论\",\"id\":63,\"open\":true}],\"name\":\"评论管理\",\"id\":62,\"open\":true}],\"name\":\"文章评论管理\",\"id\":20,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增单页\",\"id\":65,\"open\":true},{\"name\":\"编辑单页\",\"id\":66,\"open\":true},{\"name\":\"删除单页\",\"id\":67,\"open\":true}],\"name\":\"单页管理\",\"id\":64,\"open\":true},{\"children\":[{\"name\":\"新增专题\",\"id\":81,\"open\":true},{\"name\":\"编辑专题\",\"id\":82,\"open\":true},{\"name\":\"删除专题\",\"id\":83,\"open\":true}],\"name\":\"专题管理\",\"id\":80,\"open\":true}],\"name\":\"单页专题管理\",\"id\":79,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增菜单\",\"id\":69,\"open\":true},{\"name\":\"编辑菜单\",\"id\":70,\"open\":true},{\"name\":\"删除菜单\",\"id\":71,\"open\":true},{\"name\":\"上移菜单\",\"id\":84,\"open\":true},{\"name\":\"下移菜单\",\"id\":85,\"open\":true}],\"name\":\"菜单管理\",\"id\":68,\"open\":true},{\"children\":[{\"name\":\"新增设置\",\"id\":73,\"open\":true},{\"name\":\"编辑设置\",\"id\":74,\"open\":true},{\"name\":\"删除设置\",\"id\":75,\"open\":true}],\"name\":\"系统设置\",\"id\":72,\"open\":true}],\"name\":\"其他数据管理\",\"id\":61,\"open\":true}],\"name\":\"内容管理系统\",\"id\":2,\"nocheck\":true,\"open\":true},{\"name\":\"支付管理系统\",\"id\":3,\"nocheck\":true,\"open\":true},{\"name\":\"用户管理系统\",\"id\":4,\"nocheck\":true,\"open\":true},{\"name\":\"存储管理系统\",\"id\":5,\"nocheck\":true,\"open\":true}]','upms:permission:read'),(888,'用户权限','admin',1534563899784,3,'http://127.0.0.1:1111','/manage/user/permission/1','http://127.0.0.1:1111/manage/user/permission/1','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/user/permission.jsp\"','upms:user:permission'),(889,'用户权限列表','admin',1534563900150,19,'http://127.0.0.1:1111','/manage/permission/user/1','http://127.0.0.1:1111/manage/permission/user/1','POST','{type=[1]}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"新增系统\",\"id\":24,\"open\":true},{\"name\":\"编辑系统\",\"id\":25,\"open\":true},{\"name\":\"删除系统\",\"id\":26,\"open\":true}],\"name\":\"系统管理\",\"id\":2,\"open\":true},{\"children\":[{\"name\":\"新增组织\",\"id\":27,\"open\":true},{\"name\":\"编辑组织\",\"id\":28,\"open\":true},{\"name\":\"删除组织\",\"id\":29,\"open\":true}],\"name\":\"组织管理\",\"id\":3,\"open\":true}],\"name\":\"系统组织管理\",\"id\":1,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增用户\",\"id\":30,\"open\":true},{\"name\":\"编辑用户\",\"id\":31,\"open\":true},{\"name\":\"删除用户\",\"id\":32,\"open\":true},{\"name\":\"用户权限\",\"id\":51,\"open\":true},{\"name\":\"用户组织\",\"id\":48,\"open\":true},{\"name\":\"用户角色\",\"id\":50,\"open\":true}],\"name\":\"用户管理\",\"id\":6,\"open\":true},{\"children\":[{\"name\":\"新增角色\",\"id\":33,\"open\":true},{\"name\":\"编辑角色\",\"id\":34,\"open\":true},{\"name\":\"删除角色\",\"id\":35,\"open\":true},{\"name\":\"角色权限\",\"id\":46,\"open\":true}],\"name\":\"角色管理\",\"id\":5,\"open\":true}],\"name\":\"角色用户管理\",\"id\":4,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增权限\",\"id\":36,\"open\":true},{\"name\":\"编辑权限\",\"id\":37,\"open\":true},{\"name\":\"删除权限\",\"id\":38,\"open\":true}],\"name\":\"权限管理\",\"id\":39,\"open\":true}],\"name\":\"权限资源管理\",\"id\":7,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"强制退出\",\"id\":53,\"open\":true}],\"name\":\"会话管理\",\"id\":14,\"open\":true},{\"children\":[{\"name\":\"删除权限\",\"id\":57,\"open\":true}],\"name\":\"日志记录\",\"id\":15,\"open\":true}],\"name\":\"其他数据管理\",\"id\":12,\"open\":true}],\"name\":\"权限管理系统\",\"id\":1,\"nocheck\":true,\"open\":true},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"新增标签\",\"id\":54,\"open\":true},{\"name\":\"编辑标签\",\"id\":55,\"open\":true},{\"name\":\"删除标签\",\"id\":56,\"open\":true}],\"name\":\"标签管理\",\"id\":18,\"open\":true},{\"children\":[{\"name\":\"编辑类目\",\"id\":58,\"open\":true},{\"name\":\"删除类目\",\"id\":59,\"open\":true},{\"name\":\"新增类目\",\"id\":60,\"open\":true}],\"name\":\"类目管理\",\"id\":19,\"open\":true}],\"name\":\"标签类目管理\",\"id\":17,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增文章\",\"id\":76,\"open\":true},{\"name\":\"编辑文章\",\"id\":77,\"open\":true},{\"name\":\"删除文章\",\"id\":78,\"open\":true}],\"name\":\"文章管理\",\"id\":21,\"open\":true},{\"name\":\"回收管理\",\"checked\":true,\"id\":22,\"open\":true},{\"children\":[{\"name\":\"删除评论\",\"id\":63,\"open\":true}],\"name\":\"评论管理\",\"id\":62,\"open\":true}],\"name\":\"文章评论管理\",\"id\":20,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增单页\",\"id\":65,\"open\":true},{\"name\":\"编辑单页\",\"id\":66,\"open\":true},{\"name\":\"删除单页\",\"id\":67,\"open\":true}],\"name\":\"单页管理\",\"id\":64,\"open\":true},{\"children\":[{\"name\":\"新增专题\",\"id\":81,\"open\":true},{\"name\":\"编辑专题\",\"id\":82,\"open\":true},{\"name\":\"删除专题\",\"id\":83,\"open\":true}],\"name\":\"专题管理\",\"id\":80,\"open\":true}],\"name\":\"单页专题管理\",\"id\":79,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增菜单\",\"id\":69,\"open\":true},{\"name\":\"编辑菜单\",\"id\":70,\"open\":true},{\"name\":\"删除菜单\",\"id\":71,\"open\":true},{\"name\":\"上移菜单\",\"id\":84,\"open\":true},{\"name\":\"下移菜单\",\"id\":85,\"open\":true}],\"name\":\"菜单管理\",\"id\":68,\"open\":true},{\"children\":[{\"name\":\"新增设置\",\"id\":73,\"open\":true},{\"name\":\"编辑设置\",\"id\":74,\"open\":true},{\"name\":\"删除设置\",\"id\":75,\"open\":true}],\"name\":\"系统设置\",\"id\":72,\"open\":true}],\"name\":\"其他数据管理\",\"id\":61,\"open\":true}],\"name\":\"内容管理系统\",\"id\":2,\"nocheck\":true,\"open\":true},{\"name\":\"支付管理系统\",\"id\":3,\"nocheck\":true,\"open\":true},{\"name\":\"用户管理系统\",\"id\":4,\"nocheck\":true,\"open\":true},{\"name\":\"存储管理系统\",\"id\":5,\"nocheck\":true,\"open\":true}]','upms:permission:read'),(890,'用户权限列表','admin',1534563900150,20,'http://127.0.0.1:1111','/manage/permission/user/1','http://127.0.0.1:1111/manage/permission/user/1','POST','{type=[-1]}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"新增系统\",\"id\":24,\"open\":true},{\"name\":\"编辑系统\",\"id\":25,\"open\":true},{\"name\":\"删除系统\",\"id\":26,\"open\":true}],\"name\":\"系统管理\",\"id\":2,\"open\":true},{\"children\":[{\"name\":\"新增组织\",\"id\":27,\"open\":true},{\"name\":\"编辑组织\",\"id\":28,\"open\":true},{\"name\":\"删除组织\",\"id\":29,\"open\":true}],\"name\":\"组织管理\",\"id\":3,\"open\":true}],\"name\":\"系统组织管理\",\"id\":1,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增用户\",\"id\":30,\"open\":true},{\"name\":\"编辑用户\",\"id\":31,\"open\":true},{\"name\":\"删除用户\",\"id\":32,\"open\":true},{\"name\":\"用户权限\",\"id\":51,\"open\":true},{\"name\":\"用户组织\",\"id\":48,\"open\":true},{\"name\":\"用户角色\",\"id\":50,\"open\":true}],\"name\":\"用户管理\",\"id\":6,\"open\":true},{\"children\":[{\"name\":\"新增角色\",\"id\":33,\"open\":true},{\"name\":\"编辑角色\",\"id\":34,\"open\":true},{\"name\":\"删除角色\",\"id\":35,\"open\":true},{\"name\":\"角色权限\",\"id\":46,\"open\":true}],\"name\":\"角色管理\",\"id\":5,\"open\":true}],\"name\":\"角色用户管理\",\"id\":4,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增权限\",\"id\":36,\"open\":true},{\"name\":\"编辑权限\",\"id\":37,\"open\":true},{\"name\":\"删除权限\",\"id\":38,\"open\":true}],\"name\":\"权限管理\",\"id\":39,\"open\":true}],\"name\":\"权限资源管理\",\"id\":7,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"强制退出\",\"id\":53,\"open\":true}],\"name\":\"会话管理\",\"id\":14,\"open\":true},{\"children\":[{\"name\":\"删除权限\",\"id\":57,\"open\":true}],\"name\":\"日志记录\",\"id\":15,\"open\":true}],\"name\":\"其他数据管理\",\"id\":12,\"open\":true}],\"name\":\"权限管理系统\",\"id\":1,\"nocheck\":true,\"open\":true},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"新增标签\",\"id\":54,\"open\":true},{\"name\":\"编辑标签\",\"id\":55,\"open\":true},{\"name\":\"删除标签\",\"id\":56,\"open\":true}],\"name\":\"标签管理\",\"id\":18,\"open\":true},{\"children\":[{\"name\":\"编辑类目\",\"id\":58,\"open\":true},{\"name\":\"删除类目\",\"id\":59,\"open\":true},{\"name\":\"新增类目\",\"id\":60,\"open\":true}],\"name\":\"类目管理\",\"id\":19,\"open\":true}],\"name\":\"标签类目管理\",\"id\":17,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增文章\",\"id\":76,\"open\":true},{\"name\":\"编辑文章\",\"id\":77,\"open\":true},{\"name\":\"删除文章\",\"id\":78,\"open\":true}],\"name\":\"文章管理\",\"id\":21,\"open\":true},{\"name\":\"回收管理\",\"checked\":true,\"id\":22,\"open\":true},{\"children\":[{\"name\":\"删除评论\",\"id\":63,\"open\":true}],\"name\":\"评论管理\",\"id\":62,\"open\":true}],\"name\":\"文章评论管理\",\"id\":20,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增单页\",\"id\":65,\"open\":true},{\"name\":\"编辑单页\",\"id\":66,\"open\":true},{\"name\":\"删除单页\",\"id\":67,\"open\":true}],\"name\":\"单页管理\",\"id\":64,\"open\":true},{\"children\":[{\"name\":\"新增专题\",\"id\":81,\"open\":true},{\"name\":\"编辑专题\",\"id\":82,\"open\":true},{\"name\":\"删除专题\",\"id\":83,\"open\":true}],\"name\":\"专题管理\",\"id\":80,\"open\":true}],\"name\":\"单页专题管理\",\"id\":79,\"open\":true},{\"children\":[{\"children\":[{\"name\":\"新增菜单\",\"id\":69,\"open\":true},{\"name\":\"编辑菜单\",\"id\":70,\"open\":true},{\"name\":\"删除菜单\",\"id\":71,\"open\":true},{\"name\":\"上移菜单\",\"id\":84,\"open\":true},{\"name\":\"下移菜单\",\"id\":85,\"open\":true}],\"name\":\"菜单管理\",\"id\":68,\"open\":true},{\"children\":[{\"name\":\"新增设置\",\"id\":73,\"open\":true},{\"name\":\"编辑设置\",\"id\":74,\"open\":true},{\"name\":\"删除设置\",\"id\":75,\"open\":true}],\"name\":\"系统设置\",\"id\":72,\"open\":true}],\"name\":\"其他数据管理\",\"id\":61,\"open\":true}],\"name\":\"内容管理系统\",\"id\":2,\"nocheck\":true,\"open\":true},{\"name\":\"支付管理系统\",\"id\":3,\"nocheck\":true,\"open\":true},{\"name\":\"用户管理系统\",\"id\":4,\"nocheck\":true,\"open\":true},{\"name\":\"存储管理系统\",\"id\":5,\"nocheck\":true,\"open\":true}]','upms:permission:read'),(891,'用户首页','admin',1534564405352,0,'http://127.0.0.1:1111','/manage/user/index','http://127.0.0.1:1111/manage/user/index','GET',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','\"/manage/user/index.jsp\"','upms:user:read'),(892,'用户列表','admin',1534564405644,10,'http://127.0.0.1:1111','/manage/user/list','http://127.0.0.1:1111/manage/user/list','GET','order=asc&offset=0&limit=10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','127.0.0.1','{\"total\":2,\"rows\":[{\"avatar\":\"/resources/zheng-admin/images/avatar.jpg\",\"ctime\":1,\"email\":\"469741414@qq.com\",\"locked\":0,\"password\":\"3038D9CB63B3152A79B8153FB06C02F7\",\"phone\":\"\",\"realname\":\"张恕征\",\"salt\":\"66f1b370c660445a8657bf8bf1794486\",\"sex\":1,\"userId\":1,\"username\":\"admin\"},{\"avatar\":\"/resources/zheng-admin/images/avatar.jpg\",\"ctime\":1493394720495,\"email\":\"469741414@qq.com\",\"locked\":0,\"password\":\"285C9762F5F9046F5893F752DFAF3476\",\"phone\":\"\",\"realname\":\"张恕征\",\"salt\":\"d2d0d03310444ad388a8b290b0fe8564\",\"sex\":1,\"userId\":2,\"username\":\"test\"}]}','upms:user:read');
/*!40000 ALTER TABLE `upms_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upms_organization`
--

DROP TABLE IF EXISTS `upms_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upms_organization` (
  `organization_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pid` int(10) DEFAULT NULL COMMENT '所属上级',
  `name` varchar(20) DEFAULT NULL COMMENT '组织名称',
  `description` varchar(1000) DEFAULT NULL COMMENT '组织描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='组织';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upms_organization`
--

LOCK TABLES `upms_organization` WRITE;
/*!40000 ALTER TABLE `upms_organization` DISABLE KEYS */;
INSERT INTO `upms_organization` VALUES (1,NULL,'总部','北京总部',1),(4,NULL,'河北分部','河北石家庄',1488122466236),(5,NULL,'河南分部','河南郑州',1488122480265),(6,NULL,'湖北分部','湖北武汉',1488122493265),(7,NULL,'湖南分部','湖南长沙',1488122502752);
/*!40000 ALTER TABLE `upms_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upms_permission`
--

DROP TABLE IF EXISTS `upms_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upms_permission` (
  `permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `system_id` int(10) unsigned NOT NULL COMMENT '所属系统',
  `pid` int(10) DEFAULT NULL COMMENT '所属上级',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型(1:目录,2:菜单,3:按钮)',
  `permission_value` varchar(50) DEFAULT NULL COMMENT '权限值',
  `uri` varchar(100) DEFAULT NULL COMMENT '路径',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COMMENT='权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upms_permission`
--

LOCK TABLES `upms_permission` WRITE;
/*!40000 ALTER TABLE `upms_permission` DISABLE KEYS */;
INSERT INTO `upms_permission` VALUES (1,1,0,'系统组织管理',1,'','','zmdi zmdi-accounts-list',1,1,1),(2,1,1,'系统管理',2,'upms:system:read','/manage/system/index','',1,2,2),(3,1,1,'组织管理',2,'upms:organization:read','/manage/organization/index','',1,3,3),(4,1,0,'角色用户管理',1,'','','zmdi zmdi-accounts',1,4,4),(5,1,4,'角色管理',2,'upms:role:read','/manage/role/index','',1,6,6),(6,1,4,'用户管理',2,'upms:user:read','/manage/user/index','',1,5,5),(7,1,0,'权限资源管理',1,'','','zmdi zmdi-lock-outline',1,7,7),(12,1,0,'其他数据管理',1,'','','zmdi zmdi-more',1,12,12),(14,1,12,'会话管理',2,'upms:session:read','/manage/session/index','',1,14,14),(15,1,12,'日志记录',2,'upms:log:read','/manage/log/index','',1,15,15),(17,2,0,'标签类目管理',1,NULL,NULL,'zmdi zmdi-menu',1,17,17),(18,2,17,'标签管理',2,'cms:tag:read','/manage/tag/index',NULL,1,18,18),(19,2,17,'类目管理',2,'cms:category:read','/manage/category/index',NULL,1,19,19),(20,2,0,'文章评论管理',1,NULL,NULL,'zmdi zmdi-collection-text',1,20,20),(21,2,20,'文章管理',2,'cms:article:read','/manage/article/index',NULL,1,21,21),(22,2,20,'回收管理',2,'cms:article:read','/manage/article/recycle',NULL,1,22,22),(24,1,2,'新增系统',3,'upms:system:create','/manage/system/create','zmdi zmdi-plus',1,24,24),(25,1,2,'编辑系统',3,'upms:system:update','/manage/system/update','zmdi zmdi-edit',1,25,25),(26,1,2,'删除系统',3,'upms:system:delete','/manage/system/delete','zmdi zmdi-close',1,26,26),(27,1,3,'新增组织',3,'upms:organization:create','/manage/organization/create','zmdi zmdi-plus',1,27,27),(28,1,3,'编辑组织',3,'upms:organization:update','/manage/organization/update','zmdi zmdi-edit',1,28,28),(29,1,3,'删除组织',3,'upms:organization:delete','/manage/organization/delete','zmdi zmdi-close',1,29,29),(30,1,6,'新增用户',3,'upms:user:create','/manage/user/create','zmdi zmdi-plus',1,30,30),(31,1,6,'编辑用户',3,'upms:user:update','/manage/user/update','zmdi zmdi-edit',1,31,31),(32,1,6,'删除用户',3,'upms:user:delete','/manage/user/delete','zmdi zmdi-close',1,32,32),(33,1,5,'新增角色',3,'upms:role:create','/manage/role/create','zmdi zmdi-plus',1,33,33),(34,1,5,'编辑角色',3,'upms:role:update','/manage/role/update','zmdi zmdi-edit',1,34,34),(35,1,5,'删除角色',3,'upms:role:delete','/manage/role/delete','zmdi zmdi-close',1,35,35),(36,1,39,'新增权限',3,'upms:permission:create','/manage/permission/create','zmdi zmdi-plus',1,36,36),(37,1,39,'编辑权限',3,'upms:permission:update','/manage/permission/update','zmdi zmdi-edit',1,37,37),(38,1,39,'删除权限',3,'upms:permission:delete','/manage/permission/delete','zmdi zmdi-close',1,38,38),(39,1,7,'权限管理',2,'upms:permission:read','/manage/permission/index',NULL,1,39,39),(46,1,5,'角色权限',3,'upms:role:permission','/manage/role/permission','zmdi zmdi-key',1,1488091928257,1488091928257),(48,1,6,'用户组织',3,'upms:user:organization','/manage/user/organization','zmdi zmdi-accounts-list',1,1488120011165,1488120011165),(50,1,6,'用户角色',3,'upms:user:role','/manage/user/role','zmdi zmdi-accounts',1,1488120554175,1488120554175),(51,1,6,'用户权限',3,'upms:user:permission','/manage/user/permission','zmdi zmdi-key',1,1488092013302,1488092013302),(53,1,14,'强制退出',3,'upms:session:forceout','/manage/session/forceout','zmdi zmdi-run',1,1488379514715,1488379514715),(54,2,18,'新增标签',3,'cms:tag:create','/manage/tag/create','zmdi zmdi-plus',1,1489417315159,1489417315159),(55,2,18,'编辑标签',3,'cms:tag:update','zmdi zmdi-edit','zmdi zmdi-widgets',1,1489417344931,1489417344931),(56,2,18,'删除标签',3,'cms:tag:delete','/manage/tag/delete','zmdi zmdi-close',1,1489417372114,1489417372114),(57,1,15,'删除权限',3,'upms:log:delete','/manage/log/delete','zmdi zmdi-close',1,1489503867909,1489503867909),(58,2,19,'编辑类目',3,'cms:category:update','/manage/category/update','zmdi zmdi-edit',1,1489586600462,1489586600462),(59,2,19,'删除类目',3,'cms:category:delete','/manage/category/delete','zmdi zmdi-close',1,1489586633059,1489586633059),(60,2,19,'新增类目',3,'cms:category:create','/manage/category/create','zmdi zmdi-plus',1,1489590342089,1489590342089),(61,2,0,'其他数据管理',1,'','','zmdi zmdi-more',1,1489835455359,1489835455359),(62,2,20,'评论管理',2,'cms:comment:read','/manage/comment/index','',1,1489591408224,1489591408224),(63,2,62,'删除评论',3,'cms:comment:delete','/manage/comment/delete','zmdi zmdi-close',1,1489591449614,1489591449614),(64,2,79,'单页管理',2,'cms:page:read','/manage/page/index','',1,1489591332779,1489591332779),(65,2,64,'新增单页',3,'cms:page:create','/manage/page/create','zmdi zmdi-plus',1,1489591614473,1489591614473),(66,2,64,'编辑单页',3,'cms:page:update','/manage/page/update','zmdi zmdi-edit',1,1489591653000,1489591653000),(67,2,64,'删除单页',3,'cms:page:delete','/manage/page/delete','zmdi zmdi-close',1,1489591683552,1489591683552),(68,2,61,'菜单管理',2,'cms:menu:read','/manage/menu/index','zmdi zmdi-widgets',1,1489591746846,1489591746846),(69,2,68,'新增菜单',3,'cms:menu:create','/manage/menu/create','zmdi zmdi-plus',1,1489591791747,1489591791747),(70,2,68,'编辑菜单',3,'cms:menu:update','/manage/menu/update','zmdi zmdi-edit',1,1489591831878,1489591831878),(71,2,68,'删除菜单',3,'cms:menu:delete','/manage/menu/delete','zmdi zmdi-close',1,1489591865454,1489591865454),(72,2,61,'系统设置',2,'cms:setting:read','/manage/setting/index','zmdi zmdi-widgets',1,1489591981165,1489591981165),(73,2,72,'新增设置',3,'cms:setting:create','/manage/setting/create','zmdi zmdi-plus',1,1489592024762,1489592024762),(74,2,72,'编辑设置',3,'cms:setting:update','/manage/setting/update','zmdi zmdi-edit',1,1489592052582,1489592052582),(75,2,72,'删除设置',3,'cms:setting:delete','/manage/setting/delete','zmdi zmdi-close',1,1489592081426,1489592081426),(76,2,21,'新增文章',3,'cms:article:create','/manage/article/create','zmdi zmdi-plus',1,1489820150404,1489820150404),(77,2,21,'编辑文章',3,'cms:article:update','/manage/article/update','zmdi zmdi-edit',1,1489820178269,1489820178269),(78,2,21,'删除文章',3,'cms:article:delete','/manage/article/delete','zmdi zmdi-close',1,1489820207607,1489820207607),(79,2,0,'单页专题管理',1,'','','zmdi zmdi-view-web',1,1489835320327,1489835320327),(80,2,79,'专题管理',2,'cms:topic:read','/manage/topic/index','zmdi zmdi-widgets',1,1489591507566,1489591507566),(81,2,80,'新增专题',3,'cms:topic:create','/manage/topic/create','zmdi zmdi-plus',1,1489843327028,1489843327028),(82,2,80,'编辑专题',3,'cms:topic:update','/manage/topic/update','zmdi zmdi-edit',1,1489843351513,1489843351513),(83,2,80,'删除专题',3,'cms:topic:delete','/manage/topic/delete','zmdi zmdi-close',1,1489843379953,1489843379953),(84,2,68,'上移菜单',3,'cms:menu:up','/manage/menu/up','zmdi zmdi-long-arrow-up',1,1489846486548,1489846486548),(85,2,68,'下移菜单',3,'cms:menu:down','/manage/menu/down','zmdi zmdi-long-arrow-down',1,1489846578051,1489846578051);
/*!40000 ALTER TABLE `upms_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upms_role`
--

DROP TABLE IF EXISTS `upms_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upms_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `title` varchar(20) DEFAULT NULL COMMENT '角色标题',
  `description` varchar(1000) DEFAULT NULL COMMENT '角色描述',
  `ctime` bigint(20) NOT NULL COMMENT '创建时间',
  `orders` bigint(20) NOT NULL COMMENT '排序',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upms_role`
--

LOCK TABLES `upms_role` WRITE;
/*!40000 ALTER TABLE `upms_role` DISABLE KEYS */;
INSERT INTO `upms_role` VALUES (1,'super','超级管理员','拥有所有权限',1,1),(2,'admin','管理员','拥有除权限管理系统外的所有权限',1487471013117,1487471013117);
/*!40000 ALTER TABLE `upms_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upms_role_permission`
--

DROP TABLE IF EXISTS `upms_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upms_role_permission` (
  `role_permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色编号',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限编号',
  PRIMARY KEY (`role_permission_id`),
  KEY `FK_Reference_23` (`role_id`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`role_id`) REFERENCES `upms_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COMMENT='角色权限关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upms_role_permission`
--

LOCK TABLES `upms_role_permission` WRITE;
/*!40000 ALTER TABLE `upms_role_permission` DISABLE KEYS */;
INSERT INTO `upms_role_permission` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,39),(12,1,12),(14,1,14),(15,1,15),(17,1,17),(19,1,19),(20,1,20),(21,1,21),(24,1,24),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,46),(40,1,51),(44,1,48),(45,1,50),(47,1,53),(48,1,18),(49,1,54),(50,1,54),(51,1,55),(52,1,54),(53,1,55),(54,1,56),(55,1,57),(56,1,58),(57,1,58),(58,1,59),(59,1,60),(60,1,61),(61,1,62),(62,1,62),(63,1,63),(64,1,62),(65,1,63),(66,1,64),(67,1,62),(68,1,63),(69,1,64),(70,1,65),(71,1,62),(72,1,63),(73,1,64),(74,1,65),(75,1,66),(76,1,62),(77,1,63),(78,1,64),(79,1,65),(80,1,66),(81,1,67),(82,1,68),(83,1,69),(84,1,69),(85,1,70),(86,1,69),(87,1,70),(88,1,71),(89,1,72),(90,1,72),(91,1,73),(92,1,72),(93,1,73),(94,1,74),(95,1,72),(96,1,73),(97,1,74),(98,1,75),(99,1,76),(100,1,76),(101,1,77),(102,1,76),(103,1,77),(105,1,79),(106,1,80),(107,1,81),(108,1,81),(109,1,82),(110,1,81),(111,1,82),(112,1,83),(113,1,84),(114,1,84),(115,1,85),(121,1,78),(122,1,78),(124,1,25),(125,1,26);
/*!40000 ALTER TABLE `upms_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upms_system`
--

DROP TABLE IF EXISTS `upms_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upms_system` (
  `system_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `banner` varchar(150) DEFAULT NULL COMMENT '背景',
  `theme` varchar(50) DEFAULT NULL COMMENT '主题',
  `basepath` varchar(100) DEFAULT NULL COMMENT '根目录',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(-1:黑名单,1:正常)',
  `name` varchar(20) DEFAULT NULL COMMENT '系统名称',
  `title` varchar(20) DEFAULT NULL COMMENT '系统标题',
  `description` varchar(300) DEFAULT NULL COMMENT '系统描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upms_system`
--

LOCK TABLES `upms_system` WRITE;
/*!40000 ALTER TABLE `upms_system` DISABLE KEYS */;
INSERT INTO `upms_system` VALUES (1,'zmdi zmdi-shield-security','/resources/zheng-admin/images/zheng-upms.png','#29A176','http://127.0.0.1:1111',1,'zheng-upms-server','权限管理系统','用户权限管理系统（RBAC细粒度用户权限、统一后台、单点登录、会话管理）',1,1),(2,'zmdi zmdi-wikipedia','/resources/zheng-admin/images/zheng-cms.png','#455EC5','http://127.0.0.1:2222',1,'zheng-cms-admin','内容管理系统','内容管理系统（门户、博客、论坛、问答等）',2,2),(3,'zmdi zmdi-paypal-alt','/resources/zheng-admin/images/zheng-pay.png','#F06292','http://127.0.0.1:3331',1,'zheng-pay-admin','支付管理系统','支付管理系统',3,3),(4,'zmdi zmdi-account','/resources/zheng-admin/images/zheng-ucenter.png','#6539B4','http://127.0.0.1:4441',1,'zheng-ucenter-home','用户管理系统','用户管理系统',4,4),(5,'zmdi zmdi-cloud','/resources/zheng-admin/images/zheng-oss.png','#0B8DE5','http://127.0.0.1:7771',1,'zheng-oss-web','存储管理系统','存储管理系统',5,5);
/*!40000 ALTER TABLE `upms_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upms_user`
--

DROP TABLE IF EXISTS `upms_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upms_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(20) NOT NULL COMMENT '帐号',
  `password` varchar(32) NOT NULL COMMENT '密码MD5(密码+盐)',
  `salt` varchar(32) DEFAULT NULL COMMENT '盐',
  `realname` varchar(20) DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(150) DEFAULT NULL COMMENT '头像',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别',
  `locked` tinyint(4) DEFAULT NULL COMMENT '状态(0:正常,1:锁定)',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upms_user`
--

LOCK TABLES `upms_user` WRITE;
/*!40000 ALTER TABLE `upms_user` DISABLE KEYS */;
INSERT INTO `upms_user` VALUES (1,'admin','3038D9CB63B3152A79B8153FB06C02F7','66f1b370c660445a8657bf8bf1794486','张恕征','/resources/zheng-admin/images/avatar.jpg','','469741414@qq.com',1,0,1),(2,'test','285C9762F5F9046F5893F752DFAF3476','d2d0d03310444ad388a8b290b0fe8564','张恕征','/resources/zheng-admin/images/avatar.jpg','','469741414@qq.com',1,0,1493394720495);
/*!40000 ALTER TABLE `upms_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upms_user_organization`
--

DROP TABLE IF EXISTS `upms_user_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upms_user_organization` (
  `user_organization_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `organization_id` int(10) unsigned NOT NULL COMMENT '组织编号',
  PRIMARY KEY (`user_organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='用户组织关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upms_user_organization`
--

LOCK TABLES `upms_user_organization` WRITE;
/*!40000 ALTER TABLE `upms_user_organization` DISABLE KEYS */;
INSERT INTO `upms_user_organization` VALUES (19,1,1),(20,1,4),(21,1,5),(22,1,6),(23,1,7);
/*!40000 ALTER TABLE `upms_user_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upms_user_permission`
--

DROP TABLE IF EXISTS `upms_user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upms_user_permission` (
  `user_permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限编号',
  `type` tinyint(4) NOT NULL COMMENT '权限类型(-1:减权限,1:增权限)',
  PRIMARY KEY (`user_permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='用户权限关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upms_user_permission`
--

LOCK TABLES `upms_user_permission` WRITE;
/*!40000 ALTER TABLE `upms_user_permission` DISABLE KEYS */;
INSERT INTO `upms_user_permission` VALUES (3,1,22,-1),(4,1,22,1),(5,2,24,-1),(6,2,26,-1),(7,2,27,-1),(8,2,29,-1),(9,2,32,-1),(10,2,51,-1),(11,2,48,-1),(12,2,50,-1),(13,2,35,-1),(14,2,46,-1),(15,2,37,-1),(16,2,38,-1),(17,2,57,-1),(18,2,56,-1),(19,2,59,-1),(20,2,78,-1),(21,2,67,-1),(22,2,83,-1),(23,2,71,-1),(24,2,75,-1);
/*!40000 ALTER TABLE `upms_user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upms_user_role`
--

DROP TABLE IF EXISTS `upms_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upms_user_role` (
  `user_role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `role_id` int(10) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='用户角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upms_user_role`
--

LOCK TABLES `upms_user_role` WRITE;
/*!40000 ALTER TABLE `upms_user_role` DISABLE KEYS */;
INSERT INTO `upms_user_role` VALUES (4,1,1),(5,1,2),(6,2,1),(7,2,2);
/*!40000 ALTER TABLE `upms_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-22 15:27:44
