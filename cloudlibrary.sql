/*
 Navicat Premium Data Transfer

 Source Server         : conn-localhost
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : cloudlibrary

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 07/06/2022 16:05:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `book_id` int NOT NULL AUTO_INCREMENT COMMENT '图书编号',
  `book_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书名称',
  `book_isbn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书标准ISBN编号',
  `book_press` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书出版社',
  `book_author` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书作者',
  `book_pagination` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `book_price` double(10, 0) NULL DEFAULT NULL COMMENT '图书价格',
  `book_uploadtime` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书上架时间',
  `book_status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '图书状态（0：可借阅，1:已借阅，2：归还中，3：已下架）',
  `book_borrower` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书借阅人',
  `book_borrowtime` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书借阅时间',
  `book_returntime` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书预计归还时间',
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, 'Java基础案例教程（第2版）', '9787115547477', '人民邮电出版社', '传智播客', 'Java基础案例教程（第2版）.jpg', 59, '2020-12-11', NULL, '文若', '2022-05-29', NULL);
INSERT INTO `book` VALUES (2, '算法通关之路', '9787121412783', '电子工业出版社', '路志鹏', '算法通关之路.jpg', 99, '2021-08-06', '0', '文若', '2022-05-29', NULL);
INSERT INTO `book` VALUES (3, 'MySQL8数据库原理与应用', '9787121394102', '电子工业出版社', '徐丽霞', 'MySQL8数据库原理与应用.jpg', 59, '2022-05-03', '0', '文若', '2022-06-03', NULL);
INSERT INTO `book` VALUES (4, 'JavaWeb程序设计任务教程', '9787115439369', '人民邮电出版社', '传智播客', 'JavaWeb程序设计任务教程.jpg', 56, '2020-12-14', '', '', '', NULL);
INSERT INTO `book` VALUES (5, '计算机网络基础', '9787302024221', '清华大学出版社', '肖朝晖', '计算机网络基础.jpg', 29, '2019-01-28', '0', NULL, NULL, NULL);
INSERT INTO `book` VALUES (6, '数据结构(c语言第二版)', '9787115379504', '人民邮电出版社', '严蔚敏', '数据结构(c语言第二版).jpg', 35, '2022-05-27', '0', NULL, NULL, NULL);
INSERT INTO `book` VALUES (7, '剑指offer', '9787121415203', '电子工业出版社', '何海涛', '剑指offer.jpg', 89, '2021-12-11', '0', NULL, NULL, NULL);
INSERT INTO `book` VALUES (8, 'C语言程序设计', '9787404051983', '高等教育出版社', '苏小红', 'C语言程序设计.jpg', 49, '2020-09-29', '0', NULL, NULL, NULL);
INSERT INTO `book` VALUES (9, '软件工程(第四版)', '978704050960', '高等教育出版社', '齐治昌', '软件工程(第四版).jpg', 58, '2022-05-29', '0', NULL, NULL, NULL);
INSERT INTO `book` VALUES (10, '构建之法（第三版）', '9787115460769', '人民邮电出版社', '邹欣', '构建之法（第三版）.jpg', 69, '2000-05-29', '0', NULL, NULL, NULL);
INSERT INTO `book` VALUES (11, '解构领域驱动设计', '9787115566232', '人民邮电出版社', '张逸', '解构领域驱动设计.jpg', 149, '2015-02-06', '0', NULL, NULL, NULL);
INSERT INTO `book` VALUES (12, '代码整洁之道', '9787115216878', '人民邮电出版社', '韩磊', '代码整洁之道.jpg', 59, '2015-06-18', '0', NULL, NULL, NULL);
INSERT INTO `book` VALUES (13, '重构（第2版）', '9787115508645', '人民邮电出版社', '熊节', '重构（第2版）.jpg', 168, '2014-05-03', '0', NULL, NULL, NULL);
INSERT INTO `book` VALUES (14, '编程之美', '9787121337826', '电子工业出版商', '博文视点', '编程之美.jpg', 68, '2018-02-03', '0', NULL, NULL, NULL);
INSERT INTO `book` VALUES (17, 'Python源码剖析', '9787121068744', '电子工业出版社', '博文视点', 'Python源码剖析.jpg', 80, '2022-06-03', NULL, '', '', NULL);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `record_id` int NOT NULL AUTO_INCREMENT COMMENT '借阅记录id',
  `record_bookname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '借阅的图书名称',
  `record_bookisbn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '借阅的图书的ISBN编号',
  `record_borrower` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书借阅人',
  `record_borrowtime` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书借阅时间',
  `record_remandtime` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书归还时间',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (14, 'Java基础案例教程（第2版）', '9787115547477', '文若', '2022-05-29', '2022-05-29');
INSERT INTO `record` VALUES (15, '算法通关之路', '9787121412783', '文若', '2022-05-29', '2022-06-03');
INSERT INTO `record` VALUES (16, 'MySQL8数据库原理与应用', '9787121394102', '文若', '2022-06-03', '等待确认中..');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `user_password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `user_email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱（用户账号）',
  `user_role` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户角色',
  `user_status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户状态（0:正常,1:禁用）',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '李鑫', 'heroxin', 'hero_xin59@163.com', 'admin', NULL);
INSERT INTO `user` VALUES (5, '文若', 'heroxin', '3439696392@qq.com', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
