/*
Navicat MySQL Data Transfer

Source Server         : doudizhu
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : video

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-06-24 20:37:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `upload_date` datetime NOT NULL,
  `author` varchar(255) NOT NULL,
  `description` text,
  `video_name` varchar(255) NOT NULL,
  `praise_number` int(11) DEFAULT NULL,
  `size` longblob,
  `duration` time(6) NOT NULL,
  PRIMARY KEY (`upload_date`,`author`),
  KEY `author` (`author`),
  CONSTRAINT `video_ibfk_1` FOREIGN KEY (`author`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('2019-06-22 13:36:55', 'docker', 'Lua 是一种轻量小巧的脚本语言，用标准C语言编写并以源代码形式开放。', '1、Lua语言介绍', null, null, '13:36:50.000000');
INSERT INTO `video` VALUES ('2019-06-22 13:50:03', 'cocos', '那只又贱又暴力的熊猫，铺主一直没搞懂这个暴力熊猫的来源，直到最近发现，这原来是一个熊猫奶酪的广告', '暴力熊猫广告', null, null, '13:51:14.000000');
INSERT INTO `video` VALUES ('2019-06-22 13:51:50', 'layabox', 'CocosBuilder是一款原生的支持cocos2d和cocos2d-x的UI编辑器。', 'cocos2d-x游戏开发之cocosbuilder', null, null, '13:52:22.000000');
INSERT INTO `video` VALUES ('2019-06-22 13:53:10', 'openstack', '粒子是游戏设计及其重要的组成部分，在Unity3.5版本以后，新推出Shuriken粒子系统，采用模块化管理，个性化的粒子模块配合曲线编辑器使用户更容易创作出各种缤纷复杂的粒子效果。', '1、粒子界面及创建', null, null, '13:53:14.000000');
INSERT INTO `video` VALUES ('2019-06-22 13:53:46', 'cocos', 'NGUI是严格遵循KISS原则并用C#编写的Unity（适用于专业版和免费版）插件，提供强大的UI系统和事件通知框架。', 'NGUI基本介绍', null, null, '13:53:58.000000');
