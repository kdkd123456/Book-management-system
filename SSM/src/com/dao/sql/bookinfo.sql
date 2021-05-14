/*
 Navicat Premium Data Transfer

 Source Server         : sql
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 14/05/2021 19:45:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bookinfo
-- ----------------------------
DROP TABLE IF EXISTS `bookinfo`;
CREATE TABLE `bookinfo`  (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `bname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bprice` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bpublisher` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bpublishdate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creater` int(255) NOT NULL,
  `bctimestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookinfo
-- ----------------------------
INSERT INTO `bookinfo` VALUES (1, '水浒传', '36.00', '1', '2001-10-21', 2, '2021-04-15 09:33:42');
INSERT INTO `bookinfo` VALUES (2, '红楼梦', '78.00', '2', '2001-10-21', 2, '2021-04-15 09:32:38');
INSERT INTO `bookinfo` VALUES (3, '新三国', '42.00', '1', '2001-10-21', 1, '2021-04-15 09:32:35');
INSERT INTO `bookinfo` VALUES (4, '西游记', '66.00', '2', '2001-10-21', 1, '2021-04-15 09:32:32');
INSERT INTO `bookinfo` VALUES (6, 'html', '23.00', '1', '2001-10-21', 1, '2021-04-15 09:32:30');
INSERT INTO `bookinfo` VALUES (8, '白虎传', '56.00', '1', '2001-10-21', 2, '2021-04-15 09:32:26');
INSERT INTO `bookinfo` VALUES (10, '玄武传', '56.00', '2', '2001-10-21', 1, '2021-04-15 09:32:22');
INSERT INTO `bookinfo` VALUES (11, '青龙传', '45.00', '1', '2001-10-21', 1, '2021-04-15 09:32:18');
INSERT INTO `bookinfo` VALUES (12, '朱雀传', '68.00', '2', '2001-10-21', 1, '2021-04-15 09:32:08');
INSERT INTO `bookinfo` VALUES (14, '测试', '53.00', '1', '2021-04-09', 1, '2021-04-15 22:20:36');
INSERT INTO `bookinfo` VALUES (33, '大数据', '77.00', '1', '2001-10-21', 1, '2021-04-15 09:32:14');
INSERT INTO `bookinfo` VALUES (36, 'Java', '56.00', '2', '2021-04-21', 2, '2021-04-15 22:43:17');
INSERT INTO `bookinfo` VALUES (37, 'Linux', '56.00', '1', '2021-04-08', 1, '2021-04-15 22:42:59');
INSERT INTO `bookinfo` VALUES (38, 'spring boot', '66.00', '2', '2021-02-02', 1, '2021-04-15 22:43:57');
INSERT INTO `bookinfo` VALUES (39, 'vue', '77.00', '1', '2021-03-29', 1, '2021-04-15 23:06:58');
INSERT INTO `bookinfo` VALUES (42, 'Mybatis', '67.00', '2', '2018-04-21', 71, '2021-04-19 10:31:34');
INSERT INTO `bookinfo` VALUES (43, 'SSM整合', '77.00', '1', '2017-04-10', 71, '2021-04-19 10:27:47');
INSERT INTO `bookinfo` VALUES (44, '大学英语', '23.00', '1', '2021-02-09', 71, '2021-04-19 10:28:44');
INSERT INTO `bookinfo` VALUES (45, '高数', '44.99', '1', '2020-08-13', 71, '2021-04-19 10:30:42');

SET FOREIGN_KEY_CHECKS = 1;
