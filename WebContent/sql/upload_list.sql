/*
Navicat MySQL Data Transfer

Source Server         : doudizhu
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : video

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-06-17 11:55:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for upload_list
-- ----------------------------
DROP TABLE IF EXISTS `upload_list`;
CREATE TABLE `upload_list` (
  `upload_date` datetime NOT NULL,
  `author` varchar(255) NOT NULL,
  `description` text,
  `video_name` varchar(255) NOT NULL,
  `praise_number` int(11) DEFAULT NULL,
  `size` longblob NOT NULL,
  PRIMARY KEY (`upload_date`,`author`),
  KEY `author` (`author`),
  CONSTRAINT `upload_list_ibfk_1` FOREIGN KEY (`author`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upload_list
-- ----------------------------
