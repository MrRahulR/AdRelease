/*
SQLyog Enterprise - MySQL GUI v7.15 
MySQL - 5.6.14 : Database - adbooking
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`adbooking` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `adbooking`;

/*Table structure for table `admin_info` */

DROP TABLE IF EXISTS `admin_info`;

CREATE TABLE `admin_info` (
  `Admin_ID` varchar(10) NOT NULL,
  `Admin_Name` varchar(30) DEFAULT NULL,
  `Admin_MailID` varchar(50) DEFAULT NULL,
  `Admin_Password` varchar(50) DEFAULT NULL,
  `Admin_Address` varchar(100) DEFAULT NULL,
  `Admin_Country` int(11) DEFAULT '101',
  `Admin_State` int(11) DEFAULT NULL,
  `Admin_City` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Admin_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin_info` */

insert  into `admin_info`(`Admin_ID`,`Admin_Name`,`Admin_MailID`,`Admin_Password`,`Admin_Address`,`Admin_Country`,`Admin_State`,`Admin_City`) values ('A123456','Rahul','A123456','1234','Ahmedabad',101,7,'Ahmedabad');

/*Table structure for table `booking_info` */

DROP TABLE IF EXISTS `booking_info`;

CREATE TABLE `booking_info` (
  `Ref_No` int(20) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `ad_name` varchar(30) DEFAULT NULL,
  `ad_type` varchar(30) DEFAULT NULL,
  `book_date` date DEFAULT NULL,
  `ad_content` varchar(5000) DEFAULT NULL,
  `newspaper_id` int(11) DEFAULT NULL,
  `ad_status` varchar(50) DEFAULT 'Pending',
  PRIMARY KEY (`Ref_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `booking_info` */

insert  into `booking_info`(`Ref_No`,`uid`,`ad_name`,`ad_type`,`book_date`,`ad_content`,`newspaper_id`,`ad_status`) values (134868,3,'Rememberance','Classified Text','2014-08-01','abcdefghijklmnopqrstuvwxyz<br>',1,'Pending'),(373084,1,'Announcement','Classified Text','2014-07-31','<div align=\"center\"><font color=\"#CC0033\" size=\"5\"><u><i><b>kl hulgsbiaksgioholciauskbjckaj</b></i></u></font><font color=\"#CC0033\"><br></font></div>',1,'Pending'),(466746,2,'Personal','Classified Text','2014-08-01','<div align=\"left\"><h2><u><i><b>dnwb LWDGBGUIWD</b></i></u></h2></div>',1,'Pending');

/*Table structure for table `city_info` */

DROP TABLE IF EXISTS `city_info`;

CREATE TABLE `city_info` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(50) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `city_info` */

insert  into `city_info`(`city_id`,`city_name`,`state_id`) values (1,'Hyderabad',1),(2,'Itanagar',2),(3,'Dispur',3),(4,'Patna',4),(5,'Raipur',5),(6,'Panjim',6),(7,'Gandhinagar',7),(8,'Ahmedabad',7),(9,'Rajkot',7),(10,'Baroda',7),(11,'Surat',7),(12,'Bhavnagar',7),(13,'Jamnagar',7),(14,'Chandigarh',8),(15,'Shimala',9),(16,'Shrinagar',10),(17,'Jammu',10),(18,'Ranchi',11),(19,'Banglore',12),(20,'Thiruvanthuram',13),(21,'Bhaopal',14),(22,'Mumbai',15),(23,'Pune',15),(24,'Nagpur',15),(25,'Imphal',16),(26,'Shilong',17),(27,'Aizwal',18),(28,'Kohima',19),(29,'Bhubaneshwar',20),(30,'Chandigarh',21),(31,'Ludhiyana',21),(32,'Jaipur',22),(33,'Gangtok',23),(34,'Chennai',24),(35,'Agartala',25),(36,'Lucknow',26),(37,'Dehradun',27),(38,'Kolkatta',28),(39,'Delhi',29),(40,'Daman & Diu',7);

/*Table structure for table `country_info` */

DROP TABLE IF EXISTS `country_info`;

CREATE TABLE `country_info` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `country_info` */

insert  into `country_info`(`country_id`,`country_name`) values (1,'Select Country'),(101,'India');

/*Table structure for table `newspaper_info` */

DROP TABLE IF EXISTS `newspaper_info`;

CREATE TABLE `newspaper_info` (
  `newspaper_id` int(11) NOT NULL AUTO_INCREMENT,
  `newspaper_name` varchar(50) DEFAULT NULL,
  `standard_rate` double DEFAULT NULL,
  `additional_letter_rate` double DEFAULT NULL,
  `color_rate` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`newspaper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `newspaper_info` */

insert  into `newspaper_info`(`newspaper_id`,`newspaper_name`,`standard_rate`,`additional_letter_rate`,`color_rate`,`discount`,`city_id`) values (1,'Times Of India',700,50,100,10,8),(2,'Times Of India',1000,70,125,10,39),(3,'Times Of India',900,60,100,10,22),(4,'Gujarat Samachar',500,30,50,10,8),(5,'Gujarat Samachar',500,30,50,10,9),(6,'Sandesh',500,20,50,10,8);

/*Table structure for table `payment_info` */

DROP TABLE IF EXISTS `payment_info`;

CREATE TABLE `payment_info` (
  `payment_id` int(11) NOT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `chaque_detail` varchar(50) DEFAULT NULL,
  `credit_detail` varchar(50) DEFAULT NULL,
  `debit_detail` varchar(50) DEFAULT NULL,
  `publish_date` varchar(20) DEFAULT NULL,
  `payment` double DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `payment_info` */

insert  into `payment_info`(`payment_id`,`reference_id`,`payment_type`,`chaque_detail`,`credit_detail`,`debit_detail`,`publish_date`,`payment`) values (91194,373084,'Debit ',NULL,NULL,NULL,'08/06/2014',1087),(322562,134868,'Debit ',NULL,NULL,NULL,'08/18/2014',730),(886718,466746,'Debit ',NULL,NULL,NULL,'08/15/2014',847);

/*Table structure for table `state_info` */

DROP TABLE IF EXISTS `state_info`;

CREATE TABLE `state_info` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(50) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `state_info` */

insert  into `state_info`(`state_id`,`state_name`,`country_id`) values (1,'Andhra Pradesh',101),(2,'Arunachal Pradesh',101),(3,'Assam',101),(4,'Bihar',101),(5,'Chhattisgarh',101),(6,'Goa',101),(7,'Gujarat',101),(8,'Hariyana',101),(9,'Himachal Pradesh',101),(10,'Jammu Kashmir',101),(11,'Jharkhand',101),(12,'Karnataka',101),(13,'Kerala ',101),(14,'Madhya Pradesh',101),(15,'Maharashtra',101),(16,'Manipur',101),(17,'Meghalaya',101),(18,'Mizoram',101),(19,'Nagaland',101),(20,'Orissa',101),(21,'Punjab',101),(22,'Rajsthan',101),(23,'Sikkim',101),(24,'Tamilnadu',101),(25,'Triura',101),(26,'Uttar Pradesh',101),(27,'Uttarakhand',101),(28,'West Bengal',101),(29,'Delhi',101);

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `User_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_Name` varchar(50) DEFAULT NULL,
  `User_MailID` varchar(50) DEFAULT NULL,
  `User_Password` varchar(50) DEFAULT NULL,
  `User_Address` varchar(100) DEFAULT NULL,
  `User_Country` varchar(50) DEFAULT NULL,
  `User_State` varchar(50) DEFAULT NULL,
  `User_City` varchar(50) DEFAULT NULL,
  `User_Feedback` varchar(100) DEFAULT NULL,
  `User_Status` varchar(1) DEFAULT '1',
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user_info` */

insert  into `user_info`(`User_ID`,`User_Name`,`User_MailID`,`User_Password`,`User_Address`,`User_Country`,`User_State`,`User_City`,`User_Feedback`,`User_Status`) values (1,'Rob','robson@mail.com','123','Greenview,Texas','101','7','Ahmedabad',NULL,'1'),(2,'Rahul','pandya.rahul00@gmail.com','123','xyz','101','7','Ahmedabad',NULL,'1'),(3,'Dane','dvassley@xmail.com','123','123,xyz,abcde','101','7','Ahmedabad',NULL,'1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
