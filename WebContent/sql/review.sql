/*
Navicat MySQL Data Transfer

Source Server         : doudizhu
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : video

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-06-24 20:37:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `username` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `review_date` datetime NOT NULL,
  `upload_date` datetime NOT NULL,
  PRIMARY KEY (`username`,`review_date`),
  KEY `author` (`author`),
  KEY `upload_date` (`upload_date`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`author`) REFERENCES `video` (`author`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`upload_date`) REFERENCES `video` (`upload_date`),
  CONSTRAINT `review_ibfk_3` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review
-- ----------------------------
