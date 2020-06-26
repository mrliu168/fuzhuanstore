/*
 Navicat Premium Data Transfer

 Source Server         : local2
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : education

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 22/06/2020 18:36:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  `sales` int(10) DEFAULT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `stock` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
BEGIN;
INSERT INTO `books` VALUES (1, '萝莉套装', '阿迪', 27.20, 100, 'static/img/default.jpg', 999);
INSERT INTO `books` VALUES (2, '连衣裙', '时髦挖掘机', 23.00, 100, 'static/img/lianyi.jpg', 100);
INSERT INTO `books` VALUES (3, '撩人美群', '时髦挖掘机', 44.50, 100, 'static/img/meiqun.jpg', 100);
INSERT INTO `books` VALUES (4, '卫衣裙', '时髦挖掘机', 19.33, 100, 'static/img/weiyiqun.jpg', 100);
INSERT INTO `books` VALUES (5, '碎花裙', '韩流', 19.30, 100, 'static/img/suihua.jpg', 100);
INSERT INTO `books` VALUES (6, '短裙', '韩流', 29.50, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (7, '蕾丝裙', '韩流', 19.80, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (8, 'T桖', '韩流', 22.20, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (9, '牛仔裤', '韩流', 16.50, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (10, '大妈裤子', '韩流', 55.00, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (11, '背带裤', '韩流', 14.00, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (12, '小脚裤', '韩流', 31.20, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (13, '短裙', '韩流', 39.90, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (14, '阔腿裤', '韩流', 56.50, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (15, '短裤', '韩流', 19.50, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (16, '性感内衣', '韩流', 11.00, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (17, '铅笔裤', '韩流', 19.20, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (18, '个性装', '韩流', 11.30, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (19, '潮流装', '韩流', 25.20, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (20, '潮流外套', '韩流', 23.90, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (21, '卫衣', '韩流', 16.40, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (22, '毛衣', '韩流', 37.20, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (23, '衬衣', '韩流', 55.90, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (24, '吊带衫', '韩流', 45.00, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (25, '背带裤', '韩流', 29.90, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (26, '长裙', '韩流', 70.50, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (27, '孕妇装', '韩流', 20.20, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (28, '阿迪达斯装', '韩流', 33.80, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (29, '可爱装', '韩流', 47.20, 100, 'static/img/default.jpg', 100);
INSERT INTO `books` VALUES (30, '韩流', '韩流', 29.00, 100, 'static/img/default.jpg', 100);
COMMIT;

-- ----------------------------
-- Table structure for cart_itmes
-- ----------------------------
DROP TABLE IF EXISTS `cart_itmes`;
CREATE TABLE `cart_itmes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `COUNT` int(11) NOT NULL,
  `amount` double(11,2) NOT NULL,
  `book_id` int(11) NOT NULL,
  `cart_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `cart_id` (`cart_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart_itmes
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `id` varchar(100) NOT NULL,
  `total_count` int(11) NOT NULL,
  `total_amount` double(11,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carts
-- ----------------------------
BEGIN;
INSERT INTO `carts` VALUES ('7053a7f5-b060-4d48-6e9c-99016b9c7636', 1, 23.00, 1);
COMMIT;

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `COUNT` int(11) NOT NULL,
  `amount` double(11,2) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `price` double(11,2) NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_items
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(100) NOT NULL,
  `create_time` datetime NOT NULL,
  `total_count` int(11) NOT NULL,
  `total_amount` double(11,2) NOT NULL,
  `state` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES ('9b898db7-3b57-47aa-60fa-1b57d1e2e855', '2020-03-12 11:09:13', 1, 44.50, 2, 1);
INSERT INTO `orders` VALUES ('db1f489e-dc36-441c-4afd-ea3b903f8c7e', '2020-03-12 11:09:17', 1, 44.50, 2, 1);
INSERT INTO `orders` VALUES ('2531e06a-cca2-4685-410e-05d8b0872420', '2020-06-12 21:10:10', 1, 23.00, 2, 1);
COMMIT;

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `session_id` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sessions
-- ----------------------------
BEGIN;
INSERT INTO `sessions` VALUES ('3c9a07ea-bf72-4c90-5b40-cfdddc908531', 'admin', 1);
INSERT INTO `sessions` VALUES ('21c3616f-25f3-438b-4ad5-1c0f82714274', 'admin', 1);
INSERT INTO `sessions` VALUES ('aa332217-32f7-4180-53da-f68975b05f69', 'admin', 1);
INSERT INTO `sessions` VALUES ('19553c22-a55b-4caf-4a05-f1c0cbf47e93', 'admin', 1);
INSERT INTO `sessions` VALUES ('7509f208-403e-4cd3-6832-0f5ac0518a4c', 'admin', 1);
INSERT INTO `sessions` VALUES ('7fa39e52-952c-4a6e-7566-9a80d0f86841', 'admin', 1);
INSERT INTO `sessions` VALUES ('b7e6c7ea-892d-42f7-6d84-1d7f5a39fced', 'admin', 1);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'admin', '123abc', '');
INSERT INTO `users` VALUES (2, 'mrliu123', '123456', '');
INSERT INTO `users` VALUES (3, '', '', '');
INSERT INTO `users` VALUES (4, 'rrrr112', 'woshiliuying2012', '');
INSERT INTO `users` VALUES (5, 'mrliuying', '135791', '1108@qq.com');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
