/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.7.20-log : Database - distribution
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`distribution` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `distribution`;

/*Table structure for table `dis_dictionary` */

DROP TABLE IF EXISTS `dis_dictionary`;

CREATE TABLE `dis_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dis_code` varchar(20) DEFAULT NULL COMMENT '字典编码',
  `dis_type` varchar(100) DEFAULT NULL COMMENT '字典隐藏字段',
  `dis_value` varchar(100) DEFAULT NULL COMMENT '字典值，为前台显示用',
  `dis_sort` int(11) DEFAULT NULL COMMENT '排序',
  `dis_sys_id` varchar(1) DEFAULT NULL,
  `is_delete` varchar(1) DEFAULT NULL,
  `add_time` varchar(100) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dis_dictionary` */

insert  into `dis_dictionary`(`id`,`dis_code`,`dis_type`,`dis_value`,`dis_sort`,`dis_sys_id`,`is_delete`,`add_time`,`update_time`) values (1000,'disUserType','1','会员',NULL,NULL,'N',NULL,NULL),(1001,'disUserType','0','代理商',NULL,NULL,'N',NULL,NULL),(1002,'disProMode','0','百分比',NULL,NULL,'N',NULL,NULL),(1003,'disProMode','1','金额',NULL,NULL,'N',NULL,NULL),(1004,'disProType','0','交易分润',NULL,NULL,'N',NULL,NULL),(1005,'disProType','1','上下级分润',NULL,NULL,'N',NULL,NULL),(1006,'disProLevel','1','一级',NULL,NULL,'N',NULL,NULL),(1007,'disProLevel','2','二级',NULL,NULL,'N',NULL,NULL),(1008,'disProLevel','3','三级',NULL,NULL,'N',NULL,NULL);

/*Table structure for table `dis_dictionary_type` */

DROP TABLE IF EXISTS `dis_dictionary_type`;

CREATE TABLE `dis_dictionary_type` (
  `dic_type_id` int(11) NOT NULL,
  `dic_type_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dis_code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dic_type_notes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dic_type_order` int(11) DEFAULT NULL,
  `system_no` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_delete` varchar(20) COLLATE utf8_bin DEFAULT 'N',
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`dic_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `dis_dictionary_type` */

/*Table structure for table `dis_member_info` */

DROP TABLE IF EXISTS `dis_member_info`;

CREATE TABLE `dis_member_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dis_platform_id` varchar(100) DEFAULT NULL,
  `dis_user_id` varchar(100) DEFAULT NULL COMMENT '用户id',
  `dis_model_id` varchar(100) DEFAULT NULL COMMENT '上级id',
  `dis_full_index` varchar(100) DEFAULT NULL COMMENT '全路径',
  `dis_user_name` varchar(100) DEFAULT NULL,
  `dis_level` int(11) DEFAULT NULL COMMENT '级别',
  `dis_user_type` varchar(10) DEFAULT NULL COMMENT '身份类型(0 代理商 1会员)',
  `dis_note` varchar(100) DEFAULT NULL COMMENT '备注',
  `add_time` varchar(20) DEFAULT NULL COMMENT '添加时间',
  `update_time` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `is_delete` varchar(1) DEFAULT 'N' COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `dis_member_info` */

insert  into `dis_member_info`(`id`,`dis_platform_id`,`dis_user_id`,`dis_model_id`,`dis_full_index`,`dis_user_name`,`dis_level`,`dis_user_type`,`dis_note`,`add_time`,`update_time`,`is_delete`) values (1,'admin','1111','','1111','11',0,'1','11','2018-03-01 19:16:11','2018-03-01 19:16:11','N'),(2,'admin','111111','1111','1111.111111','11',1,'1','11','2018-04-04 12:21:21','2018-04-04 12:21:21','N'),(3,'admin','12312','111111','1111.111111.12312','aaa',2,'0','aa','2018-04-05 15:56:15','2018-04-05 15:56:15','N'),(4,'admin','12abc','12312','1111.111111.12312.12abc','aabbcc',3,'0','111','2018-04-05 22:12:12','2018-04-05 22:12:12','N'),(5,'admin','12abcsss','111111','1111.111111.12abcsss','aabbccdddd',2,'0','111','2018-04-05 22:12:45','2018-04-05 22:12:45','N'),(6,'admin','asdfsadf','111111','1111.111111.asdfsadf','112321',2,'0','111','2018-04-05 22:12:53','2018-04-05 22:12:53','N'),(7,'admin','ssss','1111','1111.ssss','test',1,'1','string','2018-04-07 20:35:57','2018-04-07 20:35:57','N');

/*Table structure for table `dis_profi_param` */

DROP TABLE IF EXISTS `dis_profi_param`;

CREATE TABLE `dis_profi_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dis_platform_id` varchar(100) DEFAULT NULL COMMENT '平台id',
  `dis_pro_mode` varchar(100) NOT NULL COMMENT '分润模型，如 百分比和固定金额',
  `dis_pro_type` varchar(100) DEFAULT NULL COMMENT '分润类别，如上级发展下级分润 ，交易分润。。。。',
  `dis_pro_value` varchar(20) DEFAULT NULL COMMENT '分润值',
  `dis_pro_level` varchar(100) DEFAULT NULL COMMENT '从下往上对应的级别关系',
  `dis_user_type` varchar(100) DEFAULT NULL COMMENT '会员类型（0:代理商 1：会员）',
  `is_delete` varchar(1) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  `add_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='分润参数设置';

/*Data for the table `dis_profi_param` */

insert  into `dis_profi_param`(`id`,`dis_platform_id`,`dis_pro_mode`,`dis_pro_type`,`dis_pro_value`,`dis_pro_level`,`dis_user_type`,`is_delete`,`update_time`,`add_time`) values (1,'admin','0','1','12','1','1','N','2018-04-05 16:24:04','2018-04-05 16:24:04'),(2,'admin','0','0','0.1','2','1','N','2018-04-05 16:30:21','2018-04-05 16:30:21'),(3,'admin','0','0','0.1','2','1','N','2018-04-05 16:32:52','2018-04-05 16:32:52'),(6,'admin','0','0','12','1','1','N',NULL,NULL),(7,'admin','0','0','12','1','1','N',NULL,NULL),(8,'admin','0','0','11','1','1','N',NULL,NULL),(9,'admin','0','0','11','1','1','N',NULL,NULL),(10,'dist','0','0','1','1','1','N',NULL,NULL),(11,'dist','0','0','112','1','1','N',NULL,NULL),(12,'dist','0','0','12','1','1','N',NULL,NULL),(13,'dist','0','0','1','1','1','N',NULL,NULL);

/*Table structure for table `dis_profit_record` */

DROP TABLE IF EXISTS `dis_profit_record`;

CREATE TABLE `dis_profit_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dis_platform_id` varchar(100) DEFAULT NULL,
  `dis_get_user_id` varchar(100) DEFAULT NULL,
  `dis_set_user_id` varchar(100) DEFAULT NULL,
  `dis_amount` decimal(12,2) DEFAULT NULL,
  `dis_pro_type` varchar(100) DEFAULT NULL COMMENT '交易类型',
  `dis_note` varchar(400) DEFAULT NULL COMMENT '备注',
  `dis_user_type` varchar(400) DEFAULT NULL,
  `dis_order_id` varchar(20) DEFAULT NULL COMMENT '对应第三方订单编号',
  `is_delete` varchar(1) DEFAULT NULL,
  `add_time` varchar(20) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='分润记录表';

/*Data for the table `dis_profit_record` */

insert  into `dis_profit_record`(`id`,`dis_platform_id`,`dis_get_user_id`,`dis_set_user_id`,`dis_amount`,`dis_pro_type`,`dis_note`,`dis_user_type`,`dis_order_id`,`is_delete`,`add_time`,`update_time`) values (18,'admin','1111','12312','10.00','0','1','1','123','N','2018-04-05 16:44:10','2018-04-05 16:44:10'),(19,'admin','1111','12312','10.00','0','1','1','123','N','2018-04-05 16:44:10','2018-04-05 16:44:10'),(20,'admin','111111','12312','1200.00','1','1','1','123','N','2018-04-05 16:44:42','2018-04-05 16:44:42');

/*Table structure for table `sys_dic` */

DROP TABLE IF EXISTS `sys_dic`;

CREATE TABLE `sys_dic` (
  `dic_id` int(11) NOT NULL AUTO_INCREMENT,
  `dic_no` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dic_notes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dic_order` int(11) DEFAULT NULL,
  `dic_type_no` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dic_value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_delete` varchar(20) COLLATE utf8_bin DEFAULT 'N',
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`dic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sys_dic` */

insert  into `sys_dic`(`dic_id`,`dic_no`,`dic_notes`,`dic_order`,`dic_type_no`,`dic_value`,`is_delete`,`add_time`,`update_time`) values (1,'1',NULL,NULL,'12','1','N',NULL,NULL),(2,'a',NULL,NULL,'213','b','N',NULL,NULL),(3,'c',NULL,NULL,'213','d','N',NULL,NULL),(4,'f',NULL,NULL,'213','g','N',NULL,NULL);

/*Table structure for table `sys_dic_type` */

DROP TABLE IF EXISTS `sys_dic_type`;

CREATE TABLE `sys_dic_type` (
  `dic_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `dic_type_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dic_type_no` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dic_type_notes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dic_type_order` int(11) DEFAULT NULL,
  `system_no` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_delete` varchar(20) COLLATE utf8_bin DEFAULT 'N',
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`dic_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sys_dic_type` */

insert  into `sys_dic_type`(`dic_type_id`,`dic_type_name`,`dic_type_no`,`dic_type_notes`,`dic_type_order`,`system_no`,`is_delete`,`add_time`,`update_time`) values (1,'12','12',NULL,NULL,'pc','N',NULL,NULL),(2,'213','213',NULL,NULL,'pc','N',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
