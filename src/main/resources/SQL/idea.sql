/*
 Navicat Premium Data Transfer

 Source Server         : HDQ
 Source Server Type    : MySQL
 Source Server Version : 50558
 Source Host           : localhost:3306
 Source Schema         : idea

 Target Server Type    : MySQL
 Target Server Version : 50558
 File Encoding         : 65001

 Date: 21/05/2018 13:30:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for applydevice
-- ----------------------------
DROP TABLE IF EXISTS `applydevice`;
CREATE TABLE `applydevice`  (
  `apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `device_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `apply_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `deal_man` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0',
  `apply_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`apply_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of applydevice
-- ----------------------------
INSERT INTO `applydevice` VALUES (1, '1', 1, 3, '通过', '张三', '2018-05-07 00:00:00');
INSERT INTO `applydevice` VALUES (2, '2', 1, 3, '申请不通过', '张三', '2018-05-07 00:00:00');
INSERT INTO `applydevice` VALUES (3, '天气炎热', 2, 3, '通过', '张三', '2018-05-12 00:00:00');
INSERT INTO `applydevice` VALUES (4, '天气太热 办公室正缺这玩意儿', 2, 3, '通过', '张三', '2018-05-12 00:00:00');
INSERT INTO `applydevice` VALUES (5, '由于有机箱已经坏了', 4, 3, '通过', '张三', '2018-05-16 13:01:13');
INSERT INTO `applydevice` VALUES (6, '由于下雨', 5, 3, '通过', '张三', '2018-05-16 13:12:07');

-- ----------------------------
-- Table structure for applylab
-- ----------------------------
DROP TABLE IF EXISTS `applylab`;
CREATE TABLE `applylab`  (
  `apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `lab_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `apply_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `deal_man` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0',
  `apply_time` timestamp NULL DEFAULT NULL,
  `use_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`apply_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of applylab
-- ----------------------------
INSERT INTO `applylab` VALUES (5, '2112', 1, 3, '通过', '张三', '2018-05-05 00:00:00', '2018-5-12');
INSERT INTO `applylab` VALUES (6, '用于社团文化节的准备', 1003, 3, '未通过', '0', '2018-05-12 00:00:00', '2018-5-12');
INSERT INTO `applylab` VALUES (7, '我要举办part', 1003, 3, '未通过', '0', '2018-05-12 00:00:00', '2018-05-12');
INSERT INTO `applylab` VALUES (8, '操办社团活动', 1003, 3, '通过', '张三', '2018-05-12 00:00:00', '2018-5-12');
INSERT INTO `applylab` VALUES (9, '我要借用教室一会', 1003, 3, '通过', '张三', '2018-05-12 00:00:00', '2018-05-12');
INSERT INTO `applylab` VALUES (10, '我要用这个教室', 1002, 3, '未通过', '0', '2018-05-12 00:00:00', '2018-05-12');
INSERT INTO `applylab` VALUES (11, '我就是要用', 1, 3, '未通过', '0', '2018-05-12 20:03:49', '2018-05-12');
INSERT INTO `applylab` VALUES (12, '我要进行教课', 1002, 3, '未通过', '0', '2018-05-16 13:00:38', '2018-05-16');
INSERT INTO `applylab` VALUES (13, '我要对实验室进行开课', 11505, 3, '通过', '张三', '2018-05-16 13:11:44', '2018-05-16');

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device`  (
  `device_id` int(11) NOT NULL AUTO_INCREMENT,
  `device_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `device_time` timestamp NULL DEFAULT NULL,
  `device_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`device_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES (2, '风扇', '2018-05-12 00:00:00', '已借出');
INSERT INTO `device` VALUES (3, '电脑1', '2018-05-12 00:00:00', '空闲');
INSERT INTO `device` VALUES (4, '机箱', '2018-05-12 00:00:00', '已借出');
INSERT INTO `device` VALUES (5, '雨伞', '2018-05-12 19:58:29', '已借出');
INSERT INTO `device` VALUES (7, '大萨达', '2018-05-16 13:23:45', '空闲');
INSERT INTO `device` VALUES (8, '联想笔记本', '2018-05-16 13:24:57', '空闲');

-- ----------------------------
-- Table structure for devicelab
-- ----------------------------
DROP TABLE IF EXISTS `devicelab`;
CREATE TABLE `devicelab`  (
  `devicelab_id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_id` int(11) NULL DEFAULT NULL,
  `device_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`devicelab_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lab
-- ----------------------------
DROP TABLE IF EXISTS `lab`;
CREATE TABLE `lab`  (
  `lab_id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_man` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `lab_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`lab_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11509 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of lab
-- ----------------------------
INSERT INTO `lab` VALUES (1002, '网理论', '空闲');
INSERT INTO `lab` VALUES (1003, '伍红林', '已借出');
INSERT INTO `lab` VALUES (1111, '侯代全', '空闲');
INSERT INTO `lab` VALUES (11111, '侯代全', '空闲');
INSERT INTO `lab` VALUES (11504, '周鹏', '空闲');
INSERT INTO `lab` VALUES (11505, '张力文', '已借出');
INSERT INTO `lab` VALUES (11506, '李军', '空闲');
INSERT INTO `lab` VALUES (11508, '樊俊添', '空闲');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '123', '张三', '123', '管理员', '11111');
INSERT INTO `user` VALUES (2, '321', '李四', '123', '管理员', '22222');
INSERT INTO `user` VALUES (3, '610717159', '黄鑫', '123', '用户', '13980890233');
INSERT INTO `user` VALUES (4, '1137116520', '赵六', '123', '用户', '44444');
INSERT INTO `user` VALUES (5, '222', '李雷', '123', '用户', '55555');
INSERT INTO `user` VALUES (7, '159159', '韩梅梅', '123', '用户', '15520773816');

SET FOREIGN_KEY_CHECKS = 1;
