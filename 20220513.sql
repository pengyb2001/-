/*
MySQL Backup
Database: se_demo
Backup Time: 2022-05-13 20:12:38
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `se_demo`.`t_admin`;
DROP TABLE IF EXISTS `se_demo`.`t_class_schedule`;
DROP TABLE IF EXISTS `se_demo`.`t_course`;
DROP TABLE IF EXISTS `se_demo`.`t_course_access_setting`;
DROP TABLE IF EXISTS `se_demo`.`t_course_classroom`;
DROP TABLE IF EXISTS `se_demo`.`t_course_request`;
DROP TABLE IF EXISTS `se_demo`.`t_course_selection_info`;
DROP TABLE IF EXISTS `se_demo`.`t_course_selection_request`;
DROP TABLE IF EXISTS `se_demo`.`t_course_selection_status`;
DROP TABLE IF EXISTS `se_demo`.`t_login_info`;
DROP TABLE IF EXISTS `se_demo`.`t_user`;
DROP TABLE IF EXISTS `se_demo`.`t_user_department`;
DROP TABLE IF EXISTS `se_demo`.`t_user_school`;
CREATE TABLE `t_admin` (
  `admin_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_password` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`admin_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
CREATE TABLE `t_class_schedule` (
  `sequence` int NOT NULL,
  `start_time` varchar(5) DEFAULT NULL,
  `end_time` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
CREATE TABLE `t_course` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `course_code` varchar(20) DEFAULT NULL,
  `course_name` varchar(30) DEFAULT NULL,
  `course_department` int DEFAULT NULL,
  `course_credit` int DEFAULT NULL,
  `course_start_time` int DEFAULT NULL,
  `course_end_time` int DEFAULT NULL,
  `course_classroom` int DEFAULT NULL,
  `course_capacity` int DEFAULT NULL,
  `course_teacher_number` varchar(8) DEFAULT NULL,
  `course_day` int DEFAULT NULL,
  `course_type` int DEFAULT NULL,
  `course_term` varchar(6) DEFAULT NULL,
  `course_enrollment` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
CREATE TABLE `t_course_access_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_code` varchar(9) DEFAULT NULL,
  `course_term` varchar(6) DEFAULT NULL,
  `department_number` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
CREATE TABLE `t_course_classroom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `classroom` varchar(20) DEFAULT NULL,
  `is_available` int DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
CREATE TABLE `t_course_request` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `request_status` int DEFAULT '2',
  `course_name` varchar(20) DEFAULT NULL,
  `course_department_number` int DEFAULT NULL,
  `course_day` int DEFAULT NULL,
  `course_start_time` int DEFAULT NULL,
  `course_end_time` int DEFAULT NULL,
  `course_credit` int DEFAULT NULL,
  `course_capacity` int DEFAULT NULL,
  `course_classroom_id` int DEFAULT NULL,
  `course_teacher_number` int DEFAULT NULL,
  `course_term` varchar(10) DEFAULT NULL,
  `course_type` int DEFAULT NULL,
  `course_access` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
CREATE TABLE `t_course_selection_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_number` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `student_name` varchar(10) DEFAULT NULL,
  `course_code` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `course_term` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `round` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student` (`student_number`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
CREATE TABLE `t_course_selection_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_number` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `student_name` varchar(30) DEFAULT NULL,
  `course_code` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `course_name` varchar(50) DEFAULT NULL,
  `course_term` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `request_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `request_status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
CREATE TABLE `t_course_selection_status` (
  `id` int NOT NULL,
  `round` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
CREATE TABLE `t_login_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3;
CREATE TABLE `t_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` int DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `identity` varchar(28) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `department` int(4) unsigned zerofill DEFAULT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `t_user_ibfk_1` (`department`),
  KEY `number` (`number`),
  CONSTRAINT `t_user_ibfk_1` FOREIGN KEY (`department`) REFERENCES `t_user_department` (`department_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
CREATE TABLE `t_user_department` (
  `department_number` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `department_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `school` int NOT NULL,
  PRIMARY KEY (`department_number`),
  KEY `department_number` (`department_number`),
  KEY `t_user_department_ibfk_1` (`school`),
  CONSTRAINT `t_user_department_ibfk_1` FOREIGN KEY (`school`) REFERENCES `t_user_school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
CREATE TABLE `t_user_school` (
  `school_id` int NOT NULL AUTO_INCREMENT,
  `school_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`school_id`) USING BTREE,
  KEY `school_number` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
BEGIN;
LOCK TABLES `se_demo`.`t_admin` WRITE;
DELETE FROM `se_demo`.`t_admin`;
INSERT INTO `se_demo`.`t_admin` (`admin_no`,`admin_password`) VALUES ('00000', '123');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `se_demo`.`t_class_schedule` WRITE;
DELETE FROM `se_demo`.`t_class_schedule`;
INSERT INTO `se_demo`.`t_class_schedule` (`sequence`,`start_time`,`end_time`) VALUES (1, '07:10', '08:00'),(2, '08:05', '08:30'),(3, '09:50', '12:00'),(4, '00:00', '00:00'),(5, '00:00', '00:00'),(6, '00:00', '00:00'),(7, '00:00', '00:00'),(8, '00:00', '00:00'),(9, '00:00', '00:00'),(10, '00:00', '00:00'),(11, '00:00', '00:00'),(12, '00:00', '00:00'),(13, '21:50', '22:00');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `se_demo`.`t_course` WRITE;
DELETE FROM `se_demo`.`t_course`;
INSERT INTO `se_demo`.`t_course` (`id`,`course_code`,`course_name`,`course_department`,`course_credit`,`course_start_time`,`course_end_time`,`course_classroom`,`course_capacity`,`course_teacher_number`,`course_day`,`course_type`,`course_term`,`course_enrollment`) VALUES (1, '110072.01', '结构力学A', 1, 2, 1, 3, 1, 20, '20220319', 2, 2, '2022-1', 0),(2, '123123.01', '昆虫与健康', 5, 3, 4, 5, 1, 5, '22220405', 2, 1, '2022-1', 0),(3, '202204.01', '高级英语', 3, 2, 4, 5, 1, 4, '22220405', 4, 1, '2022-1', 1),(6, '202204.02', '高级英语', 3, 2, 5, 6, 2, 30, '23052222', 3, 1, '2022-1', 0),(7, '233220.01', 'Python程序设计', 13, 3, 7, 9, 6, 60, '23052222', 3, 1, '2022-1', 1),(8, '185211.01', '学术英语（经管）', 3, 2, 1, 2, 5, 25, '22124710', 2, 1, '2022-1', 0),(9, '185212.01', '学术英语视听说', 3, 2, 1, 2, 4, 25, '22124710', 4, 1, '2022-1', 0),(14, '202211.01', '英语视听', 3, 2, 1, 2, 2, 30, '20222222', 1, 1, '2022-1', 0),(15, '123221.01', '英语课1', 3, 2, 4, 5, 3, 3, '22000005', 5, 3, '2022-1', 0),(17, '123200.01', '学术英语', 3, 2, 1, 2, 11, 25, '22124710', 4, 1, '2022-1', 0),(18, '174612.01', '英美文化概论', 3, 2, 3, 4, 10, 1, '22124710', 3, 1, '2022-1', 1),(19, '175012.01', '英语笔译', 3, 2, 1, 2, 10, 20, '20222222', 1, 3, '2022-1', 1),(20, '123221.02', '英文报刊', 11, 2, 6, 8, 3, 30, '22124710', 3, 3, '2022-1', 0),(23, '123123.01', '昆虫与健康', 5, 3, 4, 5, 4, 5, '22220405', 3, 1, '2021-1', 0),(24, '233220.02', 'Python程序设计', 13, 2, 3, 5, 1, 5, '22031122', 1, 1, '2022-1', 0);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `se_demo`.`t_course_access_setting` WRITE;
DELETE FROM `se_demo`.`t_course_access_setting`;
INSERT INTO `se_demo`.`t_course_access_setting` (`id`,`course_code`,`course_term`,`department_number`) VALUES (1, '175012.01', '2022-1', 3),(2, '175012.01', '2022-1', 11),(14, '123221.01', '2022-1', 2),(15, '123221.01', '2022-1', 3),(18, '123221.02', '2021-2', 2),(19, '123221.02', '2021-2', 3),(20, '199999.01', '2022-1', 1),(21, '199999.01', '2022-1', 2),(28, '123221.02', '2022-1', 5),(29, '123221.02', '2022-1', 4),(32, '123123.01', '2021-1', 13),(33, '123123.01', '2021-1', 8);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `se_demo`.`t_course_classroom` WRITE;
DELETE FROM `se_demo`.`t_course_classroom`;
INSERT INTO `se_demo`.`t_course_classroom` (`id`,`classroom`,`is_available`,`capacity`) VALUES (1, 'H2205', 1, 20),(2, 'H3301', 0, 30),(3, 'H2203', 1, 30),(4, 'H3305', 1, 30),(5, 'H4201', 1, 30),(6, 'H3309', 1, 30),(7, 'HGX406', 0, 30),(8, 'H2301', 0, 30),(9, 'H6101', 0, 30),(10, 'H6102', 1, 30),(11, 'H4203', 1, 30);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `se_demo`.`t_course_request` WRITE;
DELETE FROM `se_demo`.`t_course_request`;
INSERT INTO `se_demo`.`t_course_request` (`request_id`,`request_status`,`course_name`,`course_department_number`,`course_day`,`course_start_time`,`course_end_time`,`course_credit`,`course_capacity`,`course_classroom_id`,`course_teacher_number`,`course_term`,`course_type`,`course_access`) VALUES (1, 1, '学术英语', 3, 4, 1, 2, 2, 25, 11, 22124710, '2022-1', 1, NULL),(2, 0, '英语口译', 3, 5, 1, 2, 2, 20, 10, 22124710, '2022-1', 1, NULL),(3, 1, '英语笔译', 3, 1, 1, 2, 2, 20, 10, 20222222, '2022-1', 1, NULL),(5, 0, '英语发音', 3, 4, 11, 12, 2, 40, 1, 22124710, '2022-1', 1, NULL),(6, 1, '英美文化概论', 3, 3, 3, 4, 2, 20, 10, 22124710, '2022-1', 1, NULL);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `se_demo`.`t_course_selection_info` WRITE;
DELETE FROM `se_demo`.`t_course_selection_info`;
INSERT INTO `se_demo`.`t_course_selection_info` (`id`,`student_number`,`student_name`,`course_code`,`course_term`,`round`,`status`) VALUES (2, '191244', '杨梦', '174612.01', '2022-1', 1, 1),(3, '191244', '杨梦', '175012.01', '2021-1', 1, 1),(20, '220304', '章三', '233220.01', '2022-1', 1, 1),(22, '220304', '章三', '123123.01', '2021-1', 1, 1),(25, '220304', '章三', '202204.01', '2022-1', 4, 1);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `se_demo`.`t_course_selection_request` WRITE;
DELETE FROM `se_demo`.`t_course_selection_request`;
INSERT INTO `se_demo`.`t_course_selection_request` (`id`,`student_number`,`student_name`,`course_code`,`course_name`,`course_term`,`request_note`,`request_status`) VALUES (2, '220304', '章三', '202204.01', '高级英语', '2022-1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1),(3, '220304', '章三', '174612.01', '英美文化概论', '2022-1', 'Test', 0);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `se_demo`.`t_course_selection_status` WRITE;
DELETE FROM `se_demo`.`t_course_selection_status`;
INSERT INTO `se_demo`.`t_course_selection_status` (`id`,`round`) VALUES (1, 1);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `se_demo`.`t_login_info` WRITE;
DELETE FROM `se_demo`.`t_login_info`;
INSERT INTO `se_demo`.`t_login_info` (`id`,`user_number`,`login_date`) VALUES (1, '220304', '2022-03-12 18:49:34.325000'),(3, '220304', '2022-03-12 18:52:53.965000'),(4, '220304', '2022-03-12 19:00:02.221000'),(6, '220211', '2022-03-12 19:03:46.594000'),(7, '22123456', '2022-03-12 22:13:14.580000'),(8, '22031122', '2022-03-12 22:14:59.523000'),(9, '22031122', '2022-03-12 22:15:40.603000'),(25, '220304', '2022-03-14 15:58:59.134000'),(26, '220211', '2022-03-19 21:10:58.587000'),(27, '20220319', '2022-03-19 21:15:47.831000'),(28, '202222', '2022-03-20 15:13:47.460000'),(29, '202222', '2022-03-20 15:15:09.396000'),(30, '21111111', '2022-03-20 15:15:41.249000'),(31, '21111111', '2022-03-20 15:16:17.099000'),(32, '203020', '2022-03-20 15:17:34.946000'),(33, '203020', '2022-03-20 15:18:20.029000'),(34, '203020', '2022-03-20 15:18:28.901000'),(35, '203020', '2022-03-20 15:18:29.479000'),(36, '203020', '2022-03-20 15:18:29.819000'),(37, '203020', '2022-03-20 15:18:49.925000'),(38, '220304', '2022-03-30 14:17:12.154000'),(39, '220304', '2022-03-30 14:27:35.555000'),(40, '220211', '2022-03-30 15:42:52.097000'),(41, '220304', '2022-04-03 12:49:11.798000'),(42, '20222222', '2022-04-04 22:05:34.846000'),(43, '220328', '2022-04-10 22:08:35.591000'),(44, '20220403', '2022-04-10 22:20:16.046000'),(45, '22124710', '2022-04-10 22:26:42.400000'),(46, '20220403', '2022-04-11 12:25:34.128000'),(47, '22124710', '2022-04-11 17:11:00.708000'),(48, '22124710', '2022-04-11 17:23:55.891000'),(49, '220304', '2022-04-11 22:10:26.939000'),(50, '220304', '2022-04-11 22:11:35.859000'),(51, '191244', '2022-04-11 22:14:24.713000'),(52, '220304', '2022-04-11 22:39:24.231000'),(53, '220304', '2022-05-02 14:27:55.142000'),(54, '22220405', '2022-05-02 17:11:31.775000'),(55, '220304', '2022-05-05 18:31:38.369000'),(56, '220304', '2022-05-13 17:13:28.030000'),(57, '22220405', '2022-05-13 18:07:42.120000');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `se_demo`.`t_user` WRITE;
DELETE FROM `se_demo`.`t_user`;
INSERT INTO `se_demo`.`t_user` (`id`,`number`,`password`,`type`,`name`,`identity`,`mobile`,`email`,`department`,`status`) VALUES (2, '220304', 'student12', 1, '章三', '210203197503102721', '18321211111', 'est@fudan.edu.cn', 0005, 1),(6, '22031122', '1111stu', 2, '孙永', '370103198802159473', '', '', 0005, 1),(7, '220211', '12_34567', 1, '杨松琦', '130529197809106098', '', '', 0004, 0),(9, '20220319', 'azura__', 2, '郎岩', '23540719510611274X', '18220902322', '23@ee.cn', 0001, 1),(10, '202222', 'abcd123', 1, '戚轮伯', '520323197806058856', '18321640939', '213@3.e', 0004, 1),(16, '220328', 'maniac3', 1, '佟悬叶', '410106199001264659', '', 'tmgc@gdbx.cn', 0001, 1),(18, '22220405', 'hkw123', 2, '何凯文', '310112933828475828', NULL, NULL, 0003, 1),(20, '20222222', 'dili123', 2, '狄莉', '230822197201256034', '18472990134', '', 0003, 1),(21, '23052222', '123456', 2, '韩建鹏', '220283198907215739', '', '', 0011, 1),(22, '222221', '123456', 1, '王五', '110115195708043734', '', '41@test.com', 0001, 1),(23, '111100', '123456', 1, '张三', '110115199102059596', '', '', 0002, 0),(24, '22000004', '123456', 2, '贺珊', '110108197103089882', '19200449277', '', 0004, 1),(25, '22000005', '123456', 2, '贺珊删', '110108197103089182', '', '', 0003, 1),(26, '22124710', 'linwei1', 2, '林伟', '230421197701292113', '17027380948', NULL, 0003, 1),(27, '20220403', 'staymad2', 2, '谭旭', '3203117707060012', NULL, NULL, 0001, 1),(33, '191244', 'ym123', 1, '杨梦', '350430197208095507', '', 'ymy1912@test.cn', 0003, 1);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `se_demo`.`t_user_department` WRITE;
DELETE FROM `se_demo`.`t_user_department`;
INSERT INTO `se_demo`.`t_user_department` (`department_number`,`department_name`,`school`) VALUES (0001, '土木工程', 1),(0002, '智能建造', 1),(0003, '英语', 2),(0004, '口腔医学', 3),(0005, '临床医学', 3),(0008, '新闻传播', 4),(0009, '力学', 5),(0011, '翻译', 2),(0013, '自动化', 6);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `se_demo`.`t_user_school` WRITE;
DELETE FROM `se_demo`.`t_user_school`;
INSERT INTO `se_demo`.`t_user_school` (`school_id`,`school_name`) VALUES (1, '土木工程学院'),(2, '外语学院'),(3, '医学院'),(4, '新闻学院'),(5, '物理学院'),(6, '电子信息学院');
UNLOCK TABLES;
COMMIT;
