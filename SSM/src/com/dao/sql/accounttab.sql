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

 Date: 14/05/2021 19:45:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounttab
-- ----------------------------
DROP TABLE IF EXISTS `accounttab`;
CREATE TABLE `accounttab`  (
  `accountId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `accountName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `accountPassword` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `nickName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  PRIMARY KEY (`accountId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounttab
-- ----------------------------
INSERT INTO `accounttab` VALUES (1, 'admin', '123', '管理员');
INSERT INTO `accounttab` VALUES (9, 'bbb', '123', 'jl');
INSERT INTO `accounttab` VALUES (12, 'hrthg', '123', 'as');
INSERT INTO `accounttab` VALUES (27, 'rwe', 'rwe', 'rew');
INSERT INTO `accounttab` VALUES (28, 'aaa', 'aaa', 'aaa');
INSERT INTO `accounttab` VALUES (40, 'qwq', 'qqq', 'qqq');
INSERT INTO `accounttab` VALUES (41, 'qqq', 'www', 'www');
INSERT INTO `accounttab` VALUES (42, 'eee', 'eee', 'eee');
INSERT INTO `accounttab` VALUES (43, 'rrr', 'rrr', 'rrr');
INSERT INTO `accounttab` VALUES (44, 'aaa', 'aaa', 'aaa');
INSERT INTO `accounttab` VALUES (53, 'ewq', 'ewq', 'ewq');
INSERT INTO `accounttab` VALUES (54, 'hhh', 'hhh', 'hhh');
INSERT INTO `accounttab` VALUES (55, 'qqq', 'www', 'qqq');
INSERT INTO `accounttab` VALUES (56, 'uuu', 'uuu', 'uuu');
INSERT INTO `accounttab` VALUES (62, 'abc', 'abc', 'abc');
INSERT INTO `accounttab` VALUES (63, 'yyy', 'yyy', 'yyy');
INSERT INTO `accounttab` VALUES (64, 'hhh', 'hhh', 'hhh');
INSERT INTO `accounttab` VALUES (65, 'qqq', '123', 'ddd');
INSERT INTO `accounttab` VALUES (67, 'ere', 'eee', 'ere');
INSERT INTO `accounttab` VALUES (68, 'zhangsan', '123456', '张三');
INSERT INTO `accounttab` VALUES (69, 'lisi', '123456', '李四');
INSERT INTO `accounttab` VALUES (70, 'wangwu', 'ssss', '王五');
INSERT INTO `accounttab` VALUES (71, 'zhaoliu', '123456', '赵六');
INSERT INTO `accounttab` VALUES (72, 'xiaoming', '123456', '小明');

SET FOREIGN_KEY_CHECKS = 1;
