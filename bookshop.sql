/*
Navicat MySQL Data Transfer

Source Server         : conn
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : bookshop

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2019-02-19 18:24:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(1024) DEFAULT NULL,
  `admin_password` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('12', 'meng', '12');

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `book_auther` varchar(255) DEFAULT NULL,
  `book_publisher` varchar(255) DEFAULT NULL,
  `book_publish_date` varchar(255) DEFAULT NULL,
  `book_price` int(11) DEFAULT NULL,
  `book_type_id` int(11) DEFAULT NULL,
  `book_img_id` int(11) DEFAULT NULL,
  `book_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `type_id` (`book_type_id`),
  KEY `img_id` (`book_img_id`),
  CONSTRAINT `img_id` FOREIGN KEY (`book_img_id`) REFERENCES `images` (`img_id`),
  CONSTRAINT `type_id` FOREIGN KEY (`book_type_id`) REFERENCES `booktype` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '红楼梦', '曹雪芹', '岳麓书社', '2017年1月', '34', '6', '1', 'h.png');
INSERT INTO `book` VALUES ('2', '三国演义', '罗贯中', '北京联合出版社', '2017年1月', '234', '6', '2', 'san.png');
INSERT INTO `book` VALUES ('3', '孙膑兵法全集', '陈才俊 主编', '海潮出版社', '2009年7月', '12', '1', '3', 's.png');
INSERT INTO `book` VALUES ('4', '金融学', '刘挥', '立信会计出版社', '2017年1月', '50', '2', '4', 'jing.png');
INSERT INTO `book` VALUES ('5', '口才与演讲', '陈才俊 ', '高等教育出版社', '2017年1月', '21', '3', '5', 'yu.png');
INSERT INTO `book` VALUES ('6', '山海经', '高山', ' 吉林出版集团', '2017年1月', '39', '4', '6', 'd.png');
INSERT INTO `book` VALUES ('7', '动物细胞培养', 'R.I.Freshney', '科学出版社', '2014年4月', '280', '5', '7', 'wu.png');
INSERT INTO `book` VALUES ('8', '飞向太空港', '李鸣生', '长江文艺', '2014-01-01', '32', '7', '8', 't.png');
INSERT INTO `book` VALUES ('9', '全息自然农法实践', '何以兴农', '中国农业科学技术出版社', '2014-01-01', '23', '8', '9', 'n.png');
INSERT INTO `book` VALUES ('10', '中国制造2025思维', '周梅森', '江苏文艺出版社', '2008年01月', '80', '9', '10', 'g.png');
INSERT INTO `book` VALUES ('11', '交通运输导论', '黄晓明', '人民交通出版社', '2014年7月', '42', '10', '11', 'yun.png');

-- ----------------------------
-- Table structure for `bookcar`
-- ----------------------------
DROP TABLE IF EXISTS `bookcar`;
CREATE TABLE `bookcar` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_book_id` int(11) DEFAULT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `book_img` varchar(255) DEFAULT NULL,
  `book_price` int(11) DEFAULT NULL,
  `book_count` int(11) DEFAULT NULL,
  `cart_user_id` int(11) NOT NULL,
  PRIMARY KEY (`car_id`,`cart_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookcar
-- ----------------------------
INSERT INTO `bookcar` VALUES ('78', '4', '金融学', 'jing.png', '50', '1', '32');
INSERT INTO `bookcar` VALUES ('81', '1', '红楼梦', 'h.png', '58', '2', '32');
INSERT INTO `bookcar` VALUES ('82', '11', '交通运输导论', 'yun.png', '42', '2', '32');
INSERT INTO `bookcar` VALUES ('104', '2', '三国演义', 'san.png', '21', '1', '567');
INSERT INTO `bookcar` VALUES ('115', '4', '金融学', 'jing.png', '50', '2', '21');
INSERT INTO `bookcar` VALUES ('116', '3', '孙膑兵法全集', 's.png', '12', '3', '123123');
INSERT INTO `bookcar` VALUES ('117', '4', '金融学', 'jing.png', '50', '4', '123123');
INSERT INTO `bookcar` VALUES ('118', '1', '红楼梦', 'h.png', '67', '1', '1231');
INSERT INTO `bookcar` VALUES ('119', '2', '三国演义', 'san.png', '234', '1', '1231');
INSERT INTO `bookcar` VALUES ('125', '2', '三国演义', 'san.png', '234', '3', '45');
INSERT INTO `bookcar` VALUES ('126', '1', '红楼梦', 'h.png', '34', '1', '45');

-- ----------------------------
-- Table structure for `booktype`
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES ('1', '军事');
INSERT INTO `booktype` VALUES ('2', '经济');
INSERT INTO `booktype` VALUES ('3', '语言、文字');
INSERT INTO `booktype` VALUES ('4', '历史、地理');
INSERT INTO `booktype` VALUES ('5', '生物科学');
INSERT INTO `booktype` VALUES ('6', '文学');
INSERT INTO `booktype` VALUES ('7', '航空、航天');
INSERT INTO `booktype` VALUES ('8', '农业科学');
INSERT INTO `booktype` VALUES ('9', '工业技术');
INSERT INTO `booktype` VALUES ('10', '交通运输');

-- ----------------------------
-- Table structure for `images`
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `img_id` int(11) NOT NULL,
  `img1` varchar(255) DEFAULT NULL,
  `img2` varchar(255) DEFAULT NULL,
  `img3` varchar(255) DEFAULT NULL,
  `img4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES ('1', 'hong1.png', 'hong2.png', 'hong3.png', 'hong4.png');
INSERT INTO `images` VALUES ('2', 'san1.png', 'san2.png', 'san3.png', 'san4.png');
INSERT INTO `images` VALUES ('3', 's1.png', 's2.png', 's3.png', 's4.png');
INSERT INTO `images` VALUES ('4', 'j1.png', 'j2.png', 'j3.png', 'j4.png');
INSERT INTO `images` VALUES ('5', 'y1.png', 'y2.png', 'y3.png', 'y4.png');
INSERT INTO `images` VALUES ('6', 'd1.png', 'd2.png', 'd3.png', 'd4.png');
INSERT INTO `images` VALUES ('7', 'w1.png', 'w2.png', 'w3.png', 'w4.png');
INSERT INTO `images` VALUES ('8', 't1.png', 't2.png', 't3.png', 't4.png');
INSERT INTO `images` VALUES ('9', 'n1.png', 'n2.png', 'n3.png', 'n4.png');
INSERT INTO `images` VALUES ('10', 'g1.png', 'g2.png', 'g3.png', 'g4.png');
INSERT INTO `images` VALUES ('11', 'yun1.png', 'yun2.png', 'yun3.png', 'yun4.png');

-- ----------------------------
-- Table structure for `journal`
-- ----------------------------
DROP TABLE IF EXISTS `journal`;
CREATE TABLE `journal` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(1024) DEFAULT NULL,
  `login_time` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of journal
-- ----------------------------
INSERT INTO `journal` VALUES ('21', 'name', '星期五 2017.12.08 at 07:36:32 下午 CST');
INSERT INTO `journal` VALUES ('21', 'name', '星期五 2017.12.08 at 08:09:02 下午 CST');
INSERT INTO `journal` VALUES ('21', 'name', '星期五 2017.12.08 at 08:16:12 下午 CST');
INSERT INTO `journal` VALUES ('21', 'name', '星期五 2017.12.08 at 08:19:48 下午 CST');
INSERT INTO `journal` VALUES ('45', 'name', '星期五 2017.12.08 at 08:26:57 下午 CST');
INSERT INTO `journal` VALUES ('45', 'name', '星期五 2017.12.08 at 08:29:34 下午 CST');
INSERT INTO `journal` VALUES ('21', 'name', '星期五 2017.12.08 at 10:51:18 下午 CST');
INSERT INTO `journal` VALUES ('45', 'name', '星期五 2017.12.08 at 10:58:10 下午 CST');
INSERT INTO `journal` VALUES ('45', 'name', '星期日 2017.12.10 at 09:24:48 上午 CST');
INSERT INTO `journal` VALUES ('21', 'name', '星期日 2017.12.10 at 10:25:31 上午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期日 2017.12.10 at 10:27:19 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期日 2017.12.10 at 10:52:47 上午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期一 2017.12.11 at 08:52:13 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期一 2017.12.11 at 08:55:44 上午 CST');
INSERT INTO `journal` VALUES ('32', 'meng', '星期一 2017.12.11 at 08:56:20 上午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期一 2017.12.11 at 08:56:40 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期一 2017.12.11 at 04:13:26 下午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期一 2017.12.11 at 07:09:41 下午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期一 2017.12.11 at 11:19:22 下午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期二 2017.12.12 at 12:38:40 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期二 2017.12.12 at 01:28:24 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期二 2017.12.12 at 09:35:59 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期二 2017.12.12 at 09:38:33 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期二 2017.12.12 at 09:41:24 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期二 2017.12.12 at 09:51:20 上午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期二 2017.12.12 at 10:54:39 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期二 2017.12.12 at 02:06:16 下午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期二 2017.12.12 at 05:11:03 下午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期二 2017.12.12 at 05:13:54 下午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期三 2017.12.13 at 08:34:11 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期三 2017.12.13 at 11:00:10 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期三 2017.12.13 at 11:02:56 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期三 2017.12.13 at 01:58:17 下午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期三 2017.12.13 at 02:05:57 下午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期三 2017.12.13 at 02:34:16 下午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期三 2017.12.13 at 02:54:44 下午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期三 2017.12.13 at 05:00:08 下午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期四 2017.12.14 at 08:50:58 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期四 2017.12.14 at 08:53:28 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期四 2017.12.14 at 09:51:44 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期四 2017.12.14 at 10:59:06 上午 CST');
INSERT INTO `journal` VALUES ('567', 'meng', '星期四 2017.12.14 at 02:37:20 下午 CST');
INSERT INTO `journal` VALUES ('1', 'q', '星期四 2017.12.14 at 02:41:41 下午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期四 2017.12.14 at 02:42:27 下午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期四 2017.12.14 at 05:17:01 下午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期四 2017.12.14 at 05:18:38 下午 CST');
INSERT INTO `journal` VALUES ('567', 'meng', '星期四 2017.12.14 at 05:19:22 下午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期四 2017.12.14 at 05:22:08 下午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期一 2017.12.18 at 08:09:30 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期一 2017.12.18 at 08:46:29 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期二 2017.12.19 at 05:32:52 下午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期二 2017.12.19 at 05:36:05 下午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期二 2017.12.19 at 05:45:27 下午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期四 2017.12.21 at 10:55:15 下午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期四 2017.12.21 at 10:55:48 下午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期四 2017.12.21 at 10:58:59 下午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期四 2017.12.21 at 11:00:18 下午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期四 2017.12.21 at 11:03:09 下午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期四 2017.12.21 at 11:04:51 下午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期五 2017.12.22 at 07:45:25 上午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期五 2017.12.22 at 07:46:18 上午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期五 2017.12.22 at 07:46:34 上午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期五 2017.12.22 at 07:47:50 上午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期五 2017.12.22 at 08:09:43 上午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期五 2017.12.22 at 10:38:52 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期五 2017.12.22 at 10:45:01 上午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期一 2018.01.08 at 02:07:59 下午 CST');
INSERT INTO `journal` VALUES ('123123', 'qweq', '星期四 2018.03.29 at 09:50:40 上午 CST');
INSERT INTO `journal` VALUES ('123123', 'qweq', '星期四 2018.03.29 at 11:18:18 上午 CST');
INSERT INTO `journal` VALUES ('1231', 'qweqw', '星期四 2018.04.19 at 09:47:45 上午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期二 2018.05.22 at 03:49:47 下午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期二 2018.05.22 at 03:49:53 下午 CST');
INSERT INTO `journal` VALUES ('21', 'meng', '星期三 2018.05.23 at 09:13:36 上午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期三 2018.05.23 at 02:29:45 下午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期六 2018.05.26 at 08:47:03 下午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期四 2018.06.21 at 04:36:07 下午 CST');
INSERT INTO `journal` VALUES ('45', 'meng', '星期二 2019.02.19 at 05:32:36 下午 CST');

-- ----------------------------
-- Table structure for `login`
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `user_id` int(11) NOT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('21', '21');
INSERT INTO `login` VALUES ('32', '32');
INSERT INTO `login` VALUES ('45', '45');
INSERT INTO `login` VALUES ('121', '231231');
INSERT INTO `login` VALUES ('123', '678');
INSERT INTO `login` VALUES ('567', '567567');
INSERT INTO `login` VALUES ('1231', '1231');
INSERT INTO `login` VALUES ('123123', '123');
INSERT INTO `login` VALUES ('123232', '321321321');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(1024) DEFAULT NULL,
  `user_telephone` varchar(1024) DEFAULT NULL,
  `book_massage` varchar(1024) DEFAULT NULL,
  `user_address` varchar(1024) DEFAULT NULL,
  `sum_price` int(11) DEFAULT NULL,
  `order_user_id` int(11) DEFAULT NULL,
  `order_time` varchar(1024) DEFAULT NULL,
  `orderdelete` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('4', 'meng', '365578819', '书名：山海经价格：￥39数量：11', '河北省石家庄市', '429', '21', '星期五 2017.12.08  10:51:24 下午', 'yesdelete');
INSERT INTO `orders` VALUES ('5', 'meng', '365578819', ' 书名：山海经 价格：￥39 数量：11书名：金融学 价格：￥50 数量：2', '河北省石家庄市', '529', '21', '星期五 2017.12.08  10:53:49 下午 ', 'yesdelete');
INSERT INTO `orders` VALUES ('10', 'meng', '365578819', ' 书名：山海经  价格：￥39  数量：11  书名：金融学  价格：￥50  数量：2  书名：红楼梦  价格：￥58  数量：1  书名：动物细胞培养  价格：￥280  数量：1  ', '河北省石家庄市', '867', '21', '星期一 2017.12.11 08:55:50 上午 ', 'yesdelete');
INSERT INTO `orders` VALUES ('11', 'meng', '365578819', ' 书名：金融学  价格：￥50  数量：1  书名：红楼梦  价格：￥58  数量：2  书名：交通运输导论  价格：￥42  数量：2  ', '河北省石家庄市', '250', '32', '星期一 2017.12.11 08:56:24 上午 ', 'no');
INSERT INTO `orders` VALUES ('12', 'meng', '365578819', ' 书名：三国演义  价格：￥20  数量：1  书名：中国制造2025思维  价格：￥80  数量：3  ', '河北省石家庄市', '260', '45', '星期一 2017.12.11  08:56:46 上午 ', 'yesdelete');
INSERT INTO `orders` VALUES ('13', 'meng', '365578819', ' 书名：山海经  价格：￥39  数量：11  书名：金融学  价格：￥50  数量：2  书名：红楼梦  价格：￥58  数量：1  书名：动物细胞培养  价格：￥280  数量：1  ', '河北省石家庄市', '867', '21', '星期一 2017.12.11  04:13:31 下午 ', 'yesdelete');
INSERT INTO `orders` VALUES ('14', 'meng', '365578819', ' 书名：山海经  价格：￥39  数量：11  书名：金融学  价格：￥50  数量：2  书名：红楼梦  价格：￥58  数量：1  书名：动物细胞培养  价格：￥280  数量：1  ', '河北省石家庄市', '867', '21', '星期二 2017.12.12  12:38:45 上午 ', 'yesdelete');
INSERT INTO `orders` VALUES ('15', 'meng', '365578819', ' 书名：山海经  价格：￥39  数量：11  书名：金融学  价格：￥50  数量：2  书名：红楼梦  价格：￥58  数量：1  书名：动物细胞培养  价格：￥280  数量：1  ', '河北省石家庄市', '867', '21', '星期二 2017.12.12  12:40:51 上午 ', 'yesdelete');
INSERT INTO `orders` VALUES ('16', 'meng', '365578819', ' 书名：山海经  价格：￥39  数量：11  书名：金融学  价格：￥50  数量：2  书名：红楼梦  价格：￥58  数量：1  书名：动物细胞培养  价格：￥280  数量：1  ', '河北省石家庄市', '867', '21', '星期二 2017.12.12  12:43:06 上午 ', 'yesdelete');
INSERT INTO `orders` VALUES ('49', 'meng', '365578819', ' 书名：红楼梦  价格：￥58  数量：2  书名：口才与演讲  价格：￥21  数量：1  书名：金融学  价格：￥50  数量：1  ', '河北省石家庄市', '187', '45', '星期三 2017.12.13  02:53:51 下午 ', 'yesdelete');
INSERT INTO `orders` VALUES ('51', 'meng', '365578819', ' 书名：红楼梦  价格：￥58  数量：2  书名：口才与演讲  价格：￥21  数量：1  书名：金融学  价格：￥50  数量：1  ', '河北省石家庄市', '187', '45', '星期三 2017.12.13  02:54:17 下午 ', 'yesdelete');
INSERT INTO `orders` VALUES ('52', 'meng', '365578819', ' 书名：红楼梦  价格：￥58  数量：2  书名：口才与演讲  价格：￥21  数量：1  书名：金融学  价格：￥50  数量：1  ', '河北省石家庄市', '187', '45', '星期三 2017.12.13  02:54:57 下午 ', 'yesdelete');
INSERT INTO `orders` VALUES ('53', 'meng', '365578819', ' 书名：红楼梦  价格：￥58  数量：2  书名：口才与演讲  价格：￥21  数量：1  书名：金融学  价格：￥50  数量：1  ', '河北省石家庄市', '187', '45', '星期三 2017.12.13  02:55:02 下午 ', 'yesdelete');
INSERT INTO `orders` VALUES ('54', 'meng', '11111111111', ' 书名：三国演义  价格：￥21  数量：1  ', '河北石家庄', '21', '567', '星期四 2017.12.14  02:37:46 下午 ', 'no');
INSERT INTO `orders` VALUES ('56', 'meng', '11111111111', ' 书名：三国演义  价格：￥21  数量：1  ', '河北石家庄', '21', '567', '星期四 2017.12.14  05:19:31 下午 ', 'no');
INSERT INTO `orders` VALUES ('57', 'meng', '365578819', ' 书名：红楼梦  价格：￥58  数量：2  书名：口才与演讲  价格：￥21  数量：8  ', '河北省石家庄市', '284', '45', '星期四 2017.12.14  05:22:14 下午 ', 'yesdelete');
INSERT INTO `orders` VALUES ('59', 'meng', '365578819', ' 书名：红楼梦  价格：￥58  数量：2  书名：口才与演讲  价格：￥21  数量：8  书名：山海经  价格：￥39  数量：3  ', '河北省石家庄市', '401', '45', '星期二 2017.12.19  05:36:12 下午 ', 'yesdelete');
INSERT INTO `orders` VALUES ('61', 'meng', '365578819', ' 书名：金融学  价格：￥50  数量：1  ', '河北省石家庄市', '50', '21', '星期四 2017.12.21  11:01:20 下午 ', 'yesdelete');
INSERT INTO `orders` VALUES ('62', 'meng', '365578819', ' 书名：金融学  价格：￥50  数量：1  ', '河北省石家庄市', '50', '21', '星期四 2017.12.21  11:05:04 下午 ', 'yesdelete');
INSERT INTO `orders` VALUES ('63', 'meng', '365578819', ' 书名：口才与演讲  价格：￥21  数量：1  ', '河北省石家庄市', '21', '45', '星期五 2017.12.22  07:46:48 上午 ', 'yesdelete');
INSERT INTO `orders` VALUES ('64', 'meng', '365578819', ' 书名：三国演义  价格：￥21  数量：1  ', '河北省石家庄市', '21', '45', '星期一 2018.01.08  02:09:13 下午 ', 'no');
INSERT INTO `orders` VALUES ('65', 'meng', '365578819', ' 书名：金融学  价格：￥50  数量：1  书名：动物细胞培养  价格：￥280  数量：11  ', '河北省石家庄市', '3130', '21', '星期二 2018.05.22  03:50:49 下午 ', 'yesdelete');
INSERT INTO `orders` VALUES ('67', 'meng', '365578819', ' 书名：三国演义  价格：￥21  数量：3  ', '河北省石家庄市', '63', '45', '星期三 2018.05.23  02:30:26 下午 ', 'no');
INSERT INTO `orders` VALUES ('68', 'meng', '365578819', ' 书名：三国演义  价格：￥234  数量：3  ', '河北省石家庄市', '702', '45', '星期六 2018.05.26  08:48:23 下午 ', 'no');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(1024) DEFAULT NULL,
  `user_email` varchar(1024) DEFAULT NULL,
  `user_telephone` varchar(1024) DEFAULT NULL,
  `user_address` varchar(1024) DEFAULT NULL,
  `user_posttime` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('21', 'meng', '296875574@qq.com', '365578819', '河北省石家庄市', '星期一 2017.11.29 at 03:20:00 下午 CST');
INSERT INTO `users` VALUES ('32', 'meng', '296875574@qq.com', '365578819', '河北省石家庄市', '星期一2017.11.29 at 03:22:03 下午 CST');
INSERT INTO `users` VALUES ('45', 'meng', '296875574@qq.com', '365578819', '河北省石家庄市', '星期一2017.11.29 at 03:49:30 下午 CST');
INSERT INTO `users` VALUES ('121', 'qwe', '3287321783@gmail.com', '12321432242', 'User Address', '星期一 2018.01.08 at 02:11:16 下午 CST');
INSERT INTO `users` VALUES ('1231', 'qweqw', 'qweqw', '12312321', 'asdasda', '星期四 2018.04.19 at 09:47:36 上午 CST');
INSERT INTO `users` VALUES ('123123', 'qweq', 'qweq@qq.com', '1231', 'adjaosdi', '星期四 2018.03.29 at 09:50:36 上午 CST');
INSERT INTO `users` VALUES ('123232', '32123', '3287321783@gmail.com', '12321432242', '往往', '星期五 2017.12.22 at 10:38:39 上午 CST');
