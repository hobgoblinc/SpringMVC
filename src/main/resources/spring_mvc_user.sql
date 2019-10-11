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
use mysql;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `records`
-- ----------------------------

drop table if exists `tx_service_type`;
create table `tx_service_type` (
 `id` int(11) not null AUTO_INCREMENT,
 `service_id` varchar(11) not null,
 `service_name` varchar(50) not null
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `records`;
CREATE TABLE `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `date` timestamp default current_timestamp on update current_timestamp,
  `user_id` INT(11) NOT NULL,
  `pay_date` DATETIME DEFAULT NULL ,
  `NEXT_DATE` DATETIME DEFAULT NULL ,
  `GIVE_UP_DATE` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `customers`
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `business` varchar(2) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  `counselor` varchar(255) DEFAULT NULL,
  `income` double(12, 2) DEFAULT NULL,
  `create_time` timestamp default current_timestamp on update current_timestamp,
  `service_type` VARCHAR(2) DEFAULT NULL ,
  `customer_type` VARCHAR(2) DEFAULT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `customers`
-- ----------------------------
BEGIN;
INSERT INTO `customers` VALUES ('1', '有限公司😃😃', 'swift', '15527485868','1', '1','1', '销售人员', '0.00', now(), '1','A'),
  ('2', '有限公司2', 'jack', '15527485868','1', '2','1', '销售人员', '100.00', now(),'1','A');
INSERT INTO `records` VALUES ('1','联系记录记录在此',now(), '1',now(),now() ,now() );
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;




