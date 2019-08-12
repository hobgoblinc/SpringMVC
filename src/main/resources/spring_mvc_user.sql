/*
 Navicat MySQL Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 50542
 Source Host           : 127.0.0.1
 Source Database       : test

 Target Server Type    : MySQL
 Target Server Version : 50542
 File Encoding         : utf-8

 Date: 08/04/2017 21:20:53 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `spring_mvc_user`
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `business` varchar(2) DEFAULT NULL,
  `source` varchar(2) DEFAULT NULL,
  `counselor` varchar(255) DEFAULT NULL,
  `income` double(12, 2) DEFAULT NULL,
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `spring_mvc_user`
-- ----------------------------
BEGIN;
INSERT INTO `customers` VALUES ('1', '有限公司', 'swift', '15527485868','1', '1','1', '销售人员', '0.00', now()), ('2', '有限公司2', 'jack', '15527485868','1', '2','1', '销售人员', '100.00', now());
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
