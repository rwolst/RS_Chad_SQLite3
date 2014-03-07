/*
SQLyog Community Edition- MySQL GUI v8.15 Beta1
MySQL - 5.1.28-rc-community : Database - retrosheet
*********************************************************************
*/
/*Table structure for table `lkup_cd_bases` */

DROP TABLE IF EXISTS `lkup_cd_bases`;

CREATE TABLE `lkup_cd_bases` (
  `VALUE_CD` int(11) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL 
);
CREATE INDEX `VALUE_CD_idx` ON lkup_cd_bases (`VALUE_CD`,`LONGNAME_TX`);

/*Data for the table `lkup_cd_bases` */

insert  into `lkup_cd_bases`(`VALUE_CD`,`SHORTNAME_TX`,`LONGNAME_TX`,`DESCRIPTION_TX`) values (0,'___','Empty',NULL),(1,'1__','1B only',NULL),(2,'_2_','2B only',NULL),(3,'12_','1B & 2B',NULL),(4,'__3','3B only',NULL),(5,'1_3','1B & 3B',NULL),(6,'_23','2B & 3B',NULL),(7,'123','Loaded',NULL);

/*Table structure for table `lkup_cd_battedball` */

DROP TABLE IF EXISTS `lkup_cd_battedball`;

CREATE TABLE `lkup_cd_battedball` (
  `VALUE_CD` varchar(1) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_cd_battedball` */

insert  into `lkup_cd_battedball`(`VALUE_CD`,`SHORTNAME_TX`,`LONGNAME_TX`,`DESCRIPTION_TX`) values ('F','FB','Fly Ball',NULL),('G','GB','Ground Ball',NULL),('L','LD','Line Drive',NULL),('P','PU','Pop Up',NULL);

/*Table structure for table `lkup_cd_event` */

DROP TABLE IF EXISTS `lkup_cd_event`;

CREATE TABLE `lkup_cd_event` (
  `VALUE_CD` int(11) NOT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`VALUE_CD`)
);

/*Data for the table `lkup_cd_event` */

insert  into `lkup_cd_event`(`VALUE_CD`,`SHORTNAME_TX`,`LONGNAME_TX`,`DESCRIPTION_TX`) values (2,'Out','Generic Out',NULL),(3,'K','Strikeout',NULL),(4,'SB','Stolen Base',NULL),(5,'DI','Defensive Indifferen',NULL),(6,'CS','Caught Stealing',NULL),(8,'PK','Pickoff',NULL),(9,'WP','Wild Pitch',NULL),(10,'PB','Passed Ball',NULL),(11,'BK','Balk',NULL),(12,'OA','Other Advance',NULL),(13,'FE','Foul Error',NULL),(14,'NIBB','Nonintentional Walk',NULL),(15,'IBB','Intentional Walk',NULL),(16,'HBP','Hit By Pitch',NULL),(17,'XI','Interference',NULL),(18,'ROE','Error',NULL),(19,'FC','Fielder Choice',NULL),(20,'1B','Single',NULL),(21,'2B','Double',NULL),(22,'3B','Triple',NULL),(23,'HR','Homerun',NULL);

/*Table structure for table `lkup_cd_fld` */

DROP TABLE IF EXISTS `lkup_cd_fld`;

CREATE TABLE `lkup_cd_fld` (
  `VALUE_CD` int(11) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_cd_fld` */

insert  into `lkup_cd_fld`(`VALUE_CD`,`SHORTNAME_TX`,`LONGNAME_TX`,`DESCRIPTION_TX`) values (1,'P','Pitcher',NULL),(2,'C','Catcher',NULL),(3,'1B','Firstbase',NULL),(4,'2B','Secondbase',NULL),(5,'3B','Thirdbase',NULL),(6,'SS','Shortstop',NULL),(7,'LF','Leftfield',NULL),(8,'CF','Centerfield',NULL),(9,'RF','Rightfield',NULL);

/*Table structure for table `lkup_cd_h` */

DROP TABLE IF EXISTS `lkup_cd_h`;

CREATE TABLE `lkup_cd_h` (
  `VALUE_CD` int(11) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_cd_h` */

insert  into `lkup_cd_h`(`VALUE_CD`,`SHORTNAME_TX`,`LONGNAME_TX`,`DESCRIPTION_TX`) values (1,'1B','Single',NULL),(2,'2B','Double',NULL),(3,'3B','Triple',NULL),(4,'HR','Homerun',NULL);

/*Table structure for table `lkup_cd_hand` */

DROP TABLE IF EXISTS `lkup_cd_hand`;

CREATE TABLE `lkup_cd_hand` (
  `VALUE_CD` varchar(1) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_cd_hand` */

insert  into `lkup_cd_hand`(`VALUE_CD`,`SHORTNAME_TX`,`LONGNAME_TX`,`DESCRIPTION_TX`) values ('?',NULL,'Unknown',NULL),('F',NULL,'Unknown',NULL),('L','LH','Lefthanded',NULL),('R','RH','Righthanded',NULL);

/*Table structure for table `lkup_cd_park_daynight` */

DROP TABLE IF EXISTS `lkup_cd_park_daynight`;

CREATE TABLE `lkup_cd_park_daynight` (
  `VALUE_CD` varchar(1) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_cd_park_daynight` */

insert  into `lkup_cd_park_daynight`(`VALUE_CD`,`SHORTNAME_TX`,`LONGNAME_TX`,`DESCRIPTION_TX`) values ('D','D','Day',NULL),('N','N','Night',NULL);

/*Table structure for table `lkup_cd_park_field` */

DROP TABLE IF EXISTS `lkup_cd_park_field`;

CREATE TABLE `lkup_cd_park_field` (
  `VALUE_CD` int(11) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_cd_park_field` */

insert  into `lkup_cd_park_field`(`VALUE_CD`,`SHORTNAME_TX`,`LONGNAME_TX`,`DESCRIPTION_TX`) values (0,'Unknown','Unknown',NULL),(1,'Soaked','Soaked',NULL),(2,'Wet','Wet',NULL),(3,'Damp','Damp',NULL),(4,'Dry','Dry',NULL);

/*Table structure for table `lkup_cd_park_precip` */

DROP TABLE IF EXISTS `lkup_cd_park_precip`;

CREATE TABLE `lkup_cd_park_precip` (
  `VALUE_CD` int(11) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_cd_park_precip` */

insert  into `lkup_cd_park_precip`(`VALUE_CD`,`SHORTNAME_TX`,`LONGNAME_TX`,`DESCRIPTION_TX`) values (0,'Unknown','Unknown',NULL),(1,'None','None',NULL),(2,'Drizzle','Drizzle',NULL),(3,'Showers','Showers',NULL),(4,'Rain','Rain',NULL),(5,'Snow','Snow',NULL);

/*Table structure for table `lkup_cd_park_sky` */

DROP TABLE IF EXISTS `lkup_cd_park_sky`;

CREATE TABLE `lkup_cd_park_sky` (
  `VALUE_CD` int(11) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_cd_park_sky` */

insert  into `lkup_cd_park_sky`(`VALUE_CD`,`SHORTNAME_TX`,`LONGNAME_TX`,`DESCRIPTION_TX`) values (0,'Unknown','Unknown',NULL),(1,'Sunny','Sunny',NULL),(2,'Cloudy','Cloudy',NULL),(3,'Overcast','Overcast',NULL),(4,'Night','Night',NULL),(5,'Dome','Dome',NULL);

/*Table structure for table `lkup_cd_park_wind_direction` */

DROP TABLE IF EXISTS `lkup_cd_park_wind_direction`;

CREATE TABLE `lkup_cd_park_wind_direction` (
  `VALUE_CD` int(11) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_cd_park_wind_direction` */

insert  into `lkup_cd_park_wind_direction`(`VALUE_CD`,`SHORTNAME_TX`,`LONGNAME_TX`,`DESCRIPTION_TX`) values (0,'Unknown','Unknown',NULL),(1,'tolf','To LF',NULL),(2,'tocf','To CF',NULL),(3,'torf','To RF',NULL),(4,'ltor','LF to RF',NULL),(5,'fromlf','From LF',NULL),(6,'fromcf','From CF',NULL),(7,'fromrf','From RF',NULL),(8,'rtol','RF to LF',NULL);

/*Table structure for table `lkup_cd_recorder_method` */

DROP TABLE IF EXISTS `lkup_cd_recorder_method`;

CREATE TABLE `lkup_cd_recorder_method` (
  `VALUE_CD` int(11) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_cd_recorder_method` */

insert  into `lkup_cd_recorder_method`(`VALUE_CD`,`SHORTNAME_TX`,`LONGNAME_TX`,`DESCRIPTION_TX`) values (0,'Unknown','Unknown',NULL),(1,'Park','Park',NULL),(2,'TV','TV',NULL),(3,'Radio','Radio',NULL);

/*Table structure for table `lkup_cd_recorder_pitches` */

DROP TABLE IF EXISTS `lkup_cd_recorder_pitches`;

CREATE TABLE `lkup_cd_recorder_pitches` (
  `VALUE_CD` int(11) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_cd_recorder_pitches` */

insert  into `lkup_cd_recorder_pitches`(`VALUE_CD`,`SHORTNAME_TX`,`LONGNAME_TX`,`DESCRIPTION_TX`) values (0,'Unknown','Unknown',NULL),(1,'Pitches','Pitches',NULL),(2,'Count','Count',NULL);

/*Table structure for table `lkup_id_base` */

DROP TABLE IF EXISTS `lkup_id_base`;

CREATE TABLE `lkup_id_base` (
  `VALUE_CD` int(11) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_id_base` */

insert  into `lkup_id_base`(`VALUE_CD`,`SHORTNAME_TX`,`LONGNAME_TX`,`DESCRIPTION_TX`) values (0,'None','None',NULL),(1,'1B','Firstbase',NULL),(2,'2B','Secondbase',NULL),(3,'3B','Thirdbase',NULL),(4,'ER','Earned Run',NULL),(5,'UER','Unearned Run',NULL),(6,'TUER','Team Unearned Run',NULL);

/*Table structure for table `lkup_id_home` */

DROP TABLE IF EXISTS `lkup_id_home`;

CREATE TABLE `lkup_id_home` (
  `VALUE_CD` int(11) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_id_home` */

insert  into `lkup_id_home`(`VALUE_CD`,`SHORTNAME_TX`,`LONGNAME_TX`,`DESCRIPTION_TX`) values (0,'A','Away',NULL),(1,'H','Home',NULL);

/*Table structure for table `lkup_id_last` */

DROP TABLE IF EXISTS `lkup_id_last`;

CREATE TABLE `lkup_id_last` (
  `VALUE_CD` int(11) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_id_last` */

insert  into `lkup_id_last`(`VALUE_CD`,`SHORTNAME_TX`,`LONGNAME_TX`,`DESCRIPTION_TX`) values (0,'F','First',NULL),(1,'L','Last',NULL);

/*Table structure for table `lkup_id_park` */

DROP TABLE IF EXISTS `lkup_id_park`;

CREATE TABLE `lkup_id_park` (
  `VALUE_CD` varchar(8) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_id_park` */

/*Table structure for table `lkup_id_player` */

DROP TABLE IF EXISTS `lkup_id_player`;

CREATE TABLE `lkup_id_player` (
  `VALUE_CD` varchar(8) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_id_player` */

/*Table structure for table `lkup_id_recorder` */

DROP TABLE IF EXISTS `lkup_id_recorder`;

CREATE TABLE `lkup_id_recorder` (
  `VALUE_CD` varchar(8) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_id_recorder` */

/*Table structure for table `lkup_id_team` */

DROP TABLE IF EXISTS `lkup_id_team`;

CREATE TABLE `lkup_id_team` (
  `VALUE_CD` varchar(8) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_id_team` */

/*Table structure for table `lkup_id_ump` */

DROP TABLE IF EXISTS `lkup_id_ump`;

CREATE TABLE `lkup_id_ump` (
  `VALUE_CD` varchar(8) DEFAULT NULL,
  `SHORTNAME_TX` varchar(8) DEFAULT NULL,
  `LONGNAME_TX` varchar(30) DEFAULT NULL,
  `DESCRIPTION_TX` varchar(255) DEFAULT NULL
);

/*Data for the table `lkup_id_ump` */

