/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : iblog_data

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-08-23 16:46:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auditor
-- ----------------------------
DROP TABLE IF EXISTS `auditor`;
CREATE TABLE `auditor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '元素名称',
  `description` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述信息',
  `deleted` int(1) NOT NULL DEFAULT '1' COMMENT '是否删除: 0-否 1-是，默认0-否',
  `version` int(1) NOT NULL DEFAULT '1' COMMENT '版本号',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间,默认当前时间',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '最后修改人',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='审计员';

-- ----------------------------
-- Records of auditor
-- ----------------------------

-- ----------------------------
-- Table structure for druid_app
-- ----------------------------
DROP TABLE IF EXISTS `druid_app`;
CREATE TABLE `druid_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `app` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`,`app`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of druid_app
-- ----------------------------
INSERT INTO `druid_app` VALUES ('1', 'default', 'default');

-- ----------------------------
-- Table structure for druid_cluster
-- ----------------------------
DROP TABLE IF EXISTS `druid_cluster`;
CREATE TABLE `druid_cluster` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `app` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `cluster` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`,`app`,`cluster`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of druid_cluster
-- ----------------------------
INSERT INTO `druid_cluster` VALUES ('1', 'default', 'default', 'default');

-- ----------------------------
-- Table structure for druid_datasource
-- ----------------------------
DROP TABLE IF EXISTS `druid_datasource`;
CREATE TABLE `druid_datasource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `app` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `cluster` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `host` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `pid` int(10) NOT NULL,
  `collectTime` datetime NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL,
  `dbType` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL,
  `driverClassName` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL,
  `activeCount` int(10) DEFAULT NULL,
  `activePeak` int(10) DEFAULT NULL,
  `activePeakTime` bigint(20) DEFAULT NULL,
  `poolingCount` int(10) DEFAULT NULL,
  `poolingPeak` int(10) DEFAULT NULL,
  `poolingPeakTime` bigint(20) DEFAULT NULL,
  `connectCount` bigint(20) DEFAULT NULL,
  `closeCount` bigint(20) DEFAULT NULL,
  `waitThreadCount` bigint(20) DEFAULT NULL,
  `notEmptyWaitCount` bigint(20) DEFAULT NULL,
  `notEmptyWaitNanos` bigint(20) DEFAULT NULL,
  `logicConnectErrorCount` bigint(20) DEFAULT NULL,
  `physicalConnectCount` bigint(20) DEFAULT NULL,
  `physicalCloseCount` bigint(20) DEFAULT NULL,
  `physicalConnectErrorCount` bigint(20) DEFAULT NULL,
  `executeCount` bigint(20) DEFAULT NULL,
  `errorCount` bigint(20) DEFAULT NULL,
  `commitCount` bigint(20) DEFAULT NULL,
  `rollbackCount` bigint(20) DEFAULT NULL,
  `pstmtCacheHitCount` bigint(20) DEFAULT NULL,
  `pstmtCacheMissCount` bigint(20) DEFAULT NULL,
  `startTransactionCount` bigint(20) DEFAULT NULL,
  `keepAliveCheckCount` bigint(20) DEFAULT NULL,
  `txn_0_1` bigint(20) DEFAULT NULL,
  `txn_1_10` bigint(20) DEFAULT NULL,
  `txn_10_100` bigint(20) DEFAULT NULL,
  `txn_100_1000` bigint(20) DEFAULT NULL,
  `txn_1000_10000` bigint(20) DEFAULT NULL,
  `txn_10000_100000` bigint(20) DEFAULT NULL,
  `txn_more` bigint(20) DEFAULT NULL,
  `clobOpenCount` bigint(20) DEFAULT NULL,
  `blobOpenCount` bigint(20) DEFAULT NULL,
  `sqlSkipCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `druid_datasource_index` (`collectTime`,`domain`,`app`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of druid_datasource
-- ----------------------------
INSERT INTO `druid_datasource` VALUES ('1', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '10216', '2019-07-11 20:55:55', 'DataSource-1191123629', 'mysql', 'com.mysql.jdbc.Driver', null, '1', '1562849769272', '1', '1', '1562849769272', '5', '5', null, '1', null, null, '1', null, null, '4', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `druid_datasource` VALUES ('2', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '15864', '2019-08-19 14:04:04', 'DataSource-1790453435', 'mysql', 'com.mysql.jdbc.Driver', null, '1', '1566194653320', '1', '1', '1566194653320', '5', '5', null, '1', null, null, '1', null, null, '4', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for druid_domain
-- ----------------------------
DROP TABLE IF EXISTS `druid_domain`;
CREATE TABLE `druid_domain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of druid_domain
-- ----------------------------
INSERT INTO `druid_domain` VALUES ('1', 'default');

-- ----------------------------
-- Table structure for druid_inst
-- ----------------------------
DROP TABLE IF EXISTS `druid_inst`;
CREATE TABLE `druid_inst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `domain` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `cluster` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `host` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `ip` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `lastActiveTime` datetime NOT NULL,
  `lastPID` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`,`app`,`cluster`,`host`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of druid_inst
-- ----------------------------
INSERT INTO `druid_inst` VALUES ('1', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '192.168.1.27', '2019-08-19 14:09:25', '15208');

-- ----------------------------
-- Table structure for druid_sql
-- ----------------------------
DROP TABLE IF EXISTS `druid_sql`;
CREATE TABLE `druid_sql` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `app` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `cluster` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `host` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `pid` int(10) NOT NULL,
  `collectTime` datetime NOT NULL,
  `sqlHash` bigint(20) DEFAULT NULL,
  `dataSource` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL,
  `lastStartTime` bigint(20) DEFAULT NULL,
  `batchTotal` bigint(20) DEFAULT NULL,
  `batchToMax` int(10) DEFAULT NULL,
  `execSuccessCount` bigint(20) DEFAULT NULL,
  `execNanoTotal` bigint(20) DEFAULT NULL,
  `execNanoMax` bigint(20) DEFAULT NULL,
  `running` int(10) DEFAULT NULL,
  `concurrentMax` int(10) DEFAULT NULL,
  `rsHoldTime` bigint(20) DEFAULT NULL,
  `execRsHoldTime` bigint(20) DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL,
  `file` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL,
  `dbType` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL,
  `execNanoMaxOccurTime` bigint(20) DEFAULT NULL,
  `errorCount` bigint(20) DEFAULT NULL,
  `errorLastMsg` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL,
  `errorLastClass` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL,
  `errorLastStackTrace` varchar(6383) COLLATE utf8mb4_bin DEFAULT NULL,
  `errorLastTime` bigint(20) DEFAULT NULL,
  `updateCount` bigint(20) DEFAULT NULL,
  `updateCountMax` bigint(20) DEFAULT NULL,
  `fetchRowCount` bigint(20) DEFAULT NULL,
  `fetchRowCountMax` bigint(20) DEFAULT NULL,
  `inTxnCount` bigint(20) DEFAULT NULL,
  `lastSlowParameters` varchar(6383) COLLATE utf8mb4_bin DEFAULT NULL,
  `clobOpenCount` bigint(20) DEFAULT NULL,
  `blobOpenCount` bigint(20) DEFAULT NULL,
  `readStringLength` bigint(20) DEFAULT NULL,
  `readBytesLength` bigint(20) DEFAULT NULL,
  `inputStreamOpenCount` bigint(20) DEFAULT NULL,
  `readerOpenCount` bigint(20) DEFAULT NULL,
  `h1` bigint(20) DEFAULT NULL,
  `h10` bigint(20) DEFAULT NULL,
  `h100` int(10) DEFAULT NULL,
  `h1000` int(10) DEFAULT NULL,
  `h10000` int(10) DEFAULT NULL,
  `h100000` int(10) DEFAULT NULL,
  `h1000000` int(10) DEFAULT NULL,
  `hmore` int(10) DEFAULT NULL,
  `eh1` bigint(20) DEFAULT NULL,
  `eh10` bigint(20) DEFAULT NULL,
  `eh100` int(10) DEFAULT NULL,
  `eh1000` int(10) DEFAULT NULL,
  `eh10000` int(10) DEFAULT NULL,
  `eh100000` int(10) DEFAULT NULL,
  `eh1000000` int(10) DEFAULT NULL,
  `ehmore` int(10) DEFAULT NULL,
  `f1` bigint(20) DEFAULT NULL,
  `f10` bigint(20) DEFAULT NULL,
  `f100` bigint(20) DEFAULT NULL,
  `f1000` int(10) DEFAULT NULL,
  `f10000` int(10) DEFAULT NULL,
  `fmore` int(10) DEFAULT NULL,
  `u1` bigint(20) DEFAULT NULL,
  `u10` bigint(20) DEFAULT NULL,
  `u100` bigint(20) DEFAULT NULL,
  `u1000` int(10) DEFAULT NULL,
  `u10000` int(10) DEFAULT NULL,
  `umore` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `druid_sql_index` (`collectTime`,`domain`,`app`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of druid_sql
-- ----------------------------
INSERT INTO `druid_sql` VALUES ('1', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '10216', '2019-07-11 20:55:55', '-3386304145104710992', null, '1562849769293', null, null, '1', '16683900', '16683900', null, '1', '2322600', '19006500', null, null, 'mysql', '1562849769310', null, null, null, null, null, null, null, '1', '1', null, null, null, null, '14', null, null, null, null, null, '1', null, null, null, null, null, '1', null, null, null, null, null, null, null, null, '1', null, null, null, null, '1', null, null, null, null, null);
INSERT INTO `druid_sql` VALUES ('2', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '10216', '2019-07-11 20:55:55', '58919835318929600', null, '1562849769313', null, null, '1', '3501200', '3501200', null, '1', '145400', '3646600', null, null, 'mysql', '1562849769316', null, null, null, null, null, null, null, '1', '1', null, null, null, null, '21', null, null, null, null, '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, '1', null, null, null, null, '1', null, null, null, null, null);
INSERT INTO `druid_sql` VALUES ('3', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '10216', '2019-07-11 20:55:55', '3970858707943370672', null, '1562849769317', null, null, '1', '2660600', '2660600', null, '1', '596800', '3257400', null, null, 'mysql', '1562849769319', null, null, null, null, null, null, null, '1', '1', null, null, null, null, '48', null, null, null, null, '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, '1', null, null, null, null, '1', null, null, null, null, null);
INSERT INTO `druid_sql` VALUES ('4', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '10216', '2019-07-11 20:55:55', '3722764995638781559', null, '1562849769323', null, null, '1', '9659300', '9659300', null, '1', null, null, null, null, 'mysql', '1562849769333', null, null, null, null, null, '1', '1', null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `druid_sql` VALUES ('5', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '15864', '2019-08-19 14:04:04', '-3386304145104710992', null, '1566194653331', null, null, '1', '5046300', '5046300', null, '1', '1418101', '6464401', null, null, 'mysql', '1566194653336', null, null, null, null, null, null, null, '1', '1', null, null, null, null, '14', null, null, null, null, '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, '1', null, null, null, null, '1', null, null, null, null, null);
INSERT INTO `druid_sql` VALUES ('6', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '15864', '2019-08-19 14:04:04', '58919835318929600', null, '1566194653338', null, null, '1', '1279101', '1279101', null, '1', '120099', '1399200', null, null, 'mysql', '1566194653339', null, null, null, null, null, null, null, '1', '1', null, null, null, null, '21', null, null, null, null, '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, '1', null, null, null, null, '1', null, null, null, null, null);
INSERT INTO `druid_sql` VALUES ('7', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '15864', '2019-08-19 14:04:04', '3970858707943370672', null, '1566194653339', null, null, '1', '2351999', '2351999', null, '1', '332200', '2684199', null, null, 'mysql', '1566194653342', null, null, null, null, null, null, null, '1', '1', null, null, null, null, '48', null, null, null, null, '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, '1', null, null, null, null, '1', null, null, null, null, null);
INSERT INTO `druid_sql` VALUES ('8', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '15864', '2019-08-19 14:04:04', '3722764995638781559', null, '1566194653344', null, null, '1', '3504400', '3504400', null, '1', null, null, null, null, 'mysql', '1566194653348', null, null, null, null, null, '1', '1', null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, '1', null, null, null, null);

-- ----------------------------
-- Table structure for druid_webapp
-- ----------------------------
DROP TABLE IF EXISTS `druid_webapp`;
CREATE TABLE `druid_webapp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `app` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `cluster` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `host` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `pid` int(10) NOT NULL,
  `collectTime` datetime NOT NULL,
  `contextPath` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL,
  `runningCount` int(10) DEFAULT NULL,
  `concurrentMax` int(10) DEFAULT NULL,
  `requestCount` bigint(20) DEFAULT NULL,
  `sessionCount` bigint(20) DEFAULT NULL,
  `jdbcFetchRowCount` bigint(20) DEFAULT NULL,
  `jdbcUpdateCount` bigint(20) DEFAULT NULL,
  `jdbcExecuteCount` bigint(20) DEFAULT NULL,
  `jdbcExecuteTimeNano` bigint(20) DEFAULT NULL,
  `jdbcCommitCount` bigint(20) DEFAULT NULL,
  `jdbcRollbackCount` bigint(20) DEFAULT NULL,
  `osMacOSXCount` bigint(20) DEFAULT NULL,
  `osWindowsCount` bigint(20) DEFAULT NULL,
  `osLinuxCount` bigint(20) DEFAULT NULL,
  `osSymbianCount` bigint(20) DEFAULT NULL,
  `osFreeBSDCount` bigint(20) DEFAULT NULL,
  `osOpenBSDCount` bigint(20) DEFAULT NULL,
  `osAndroidCount` bigint(20) DEFAULT NULL,
  `osWindows98Count` bigint(20) DEFAULT NULL,
  `osWindowsXPCount` bigint(20) DEFAULT NULL,
  `osWindows2000Count` bigint(20) DEFAULT NULL,
  `osWindowsVistaCount` bigint(20) DEFAULT NULL,
  `osWindows7Count` bigint(20) DEFAULT NULL,
  `osWindows8Count` bigint(20) DEFAULT NULL,
  `osAndroid15Count` bigint(20) DEFAULT NULL,
  `osAndroid16Count` bigint(20) DEFAULT NULL,
  `osAndroid20Count` bigint(20) DEFAULT NULL,
  `osAndroid21Count` bigint(20) DEFAULT NULL,
  `osAndroid22Count` bigint(20) DEFAULT NULL,
  `osAndroid23Count` bigint(20) DEFAULT NULL,
  `osAndroid30Count` bigint(20) DEFAULT NULL,
  `osAndroid31Count` bigint(20) DEFAULT NULL,
  `osAndroid32Count` bigint(20) DEFAULT NULL,
  `osAndroid40Count` bigint(20) DEFAULT NULL,
  `osAndroid41Count` bigint(20) DEFAULT NULL,
  `osAndroid42Count` bigint(20) DEFAULT NULL,
  `osAndroid43Count` bigint(20) DEFAULT NULL,
  `osLinuxUbuntuCount` bigint(20) DEFAULT NULL,
  `browserIECount` bigint(20) DEFAULT NULL,
  `browserFirefoxCount` bigint(20) DEFAULT NULL,
  `browserChromeCount` bigint(20) DEFAULT NULL,
  `browserSafariCount` bigint(20) DEFAULT NULL,
  `browserOperaCount` bigint(20) DEFAULT NULL,
  `browserIE5Count` bigint(20) DEFAULT NULL,
  `browserIE6Count` bigint(20) DEFAULT NULL,
  `browserIE7Count` bigint(20) DEFAULT NULL,
  `browserIE8Count` bigint(20) DEFAULT NULL,
  `browserIE9Count` bigint(20) DEFAULT NULL,
  `browserIE10Count` bigint(20) DEFAULT NULL,
  `browser360SECount` bigint(20) DEFAULT NULL,
  `deviceAndroidCount` bigint(20) DEFAULT NULL,
  `deviceIpadCount` bigint(20) DEFAULT NULL,
  `deviceIphoneCount` bigint(20) DEFAULT NULL,
  `deviceWindowsPhoneCount` bigint(20) DEFAULT NULL,
  `botCount` bigint(20) DEFAULT NULL,
  `botBaiduCount` bigint(20) DEFAULT NULL,
  `botYoudaoCount` bigint(20) DEFAULT NULL,
  `botGoogleCount` bigint(20) DEFAULT NULL,
  `botMsnCount` bigint(20) DEFAULT NULL,
  `botBingCount` bigint(20) DEFAULT NULL,
  `botSosoCount` bigint(20) DEFAULT NULL,
  `botSogouCount` bigint(20) DEFAULT NULL,
  `botYahooCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `druid_webapp_index` (`collectTime`,`domain`,`app`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of druid_webapp
-- ----------------------------
INSERT INTO `druid_webapp` VALUES ('1', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '10216', '2019-07-11 20:55:55', '/', null, '1', '1', '1', null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `druid_webapp` VALUES ('2', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '15864', '2019-08-19 14:04:04', '/', null, '3', '9', '1', null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for druid_weburi
-- ----------------------------
DROP TABLE IF EXISTS `druid_weburi`;
CREATE TABLE `druid_weburi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `app` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `cluster` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `host` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `pid` int(10) NOT NULL,
  `collectTime` datetime NOT NULL,
  `uri` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL,
  `runningCount` int(10) DEFAULT NULL,
  `concurrentMax` int(10) DEFAULT NULL,
  `requestCount` bigint(20) DEFAULT NULL,
  `requestTimeNano` bigint(20) DEFAULT NULL,
  `requestTimeNanoMax` bigint(20) DEFAULT NULL,
  `jdbcFetchRowCount` bigint(20) DEFAULT NULL,
  `jdbcFetchRowPeak` bigint(20) DEFAULT NULL,
  `jdbcUpdateCount` bigint(20) DEFAULT NULL,
  `jdbcUpdatePeak` bigint(20) DEFAULT NULL,
  `jdbcExecuteCount` bigint(20) DEFAULT NULL,
  `jdbcExecuteErrorCount` bigint(20) DEFAULT NULL,
  `jdbcExecutePeak` bigint(20) DEFAULT NULL,
  `jdbcExecuteTimeNano` bigint(20) DEFAULT NULL,
  `jdbcCommitCount` bigint(20) DEFAULT NULL,
  `jdbcRollbackCount` bigint(20) DEFAULT NULL,
  `jdbcPoolConnectionOpenCount` bigint(20) DEFAULT NULL,
  `jdbcPoolConnectionCloseCount` bigint(20) DEFAULT NULL,
  `jdbcResultSetOpenCount` bigint(20) DEFAULT NULL,
  `jdbcResultSetCloseCount` bigint(20) DEFAULT NULL,
  `errorCount` bigint(20) DEFAULT NULL,
  `lastAccessTime` datetime DEFAULT NULL,
  `h1` bigint(20) DEFAULT NULL,
  `h10` bigint(20) DEFAULT NULL,
  `h100` bigint(20) DEFAULT NULL,
  `h1000` bigint(20) DEFAULT NULL,
  `h10000` int(10) DEFAULT NULL,
  `h100000` int(10) DEFAULT NULL,
  `h1000000` int(10) DEFAULT NULL,
  `hmore` int(10) DEFAULT NULL,
  `requestTimeNanoMaxOccurTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `druid_weburi_index` (`collectTime`,`domain`,`app`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of druid_weburi
-- ----------------------------
INSERT INTO `druid_weburi` VALUES ('1', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '10216', '2019-07-11 20:55:55', '/demo/readResources', null, '1', '1', '32972398900', '32972398900', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2019-07-11 20:56:31', null, null, null, null, null, '1', null, null, '2019-07-11 20:57:04');
INSERT INTO `druid_weburi` VALUES ('2', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '15864', '2019-08-19 14:04:04', '/v2/api-docs', null, '1', '1', '132998200', '132998200', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2019-08-19 14:04:29', null, null, null, '1', null, null, null, null, '2019-08-19 14:04:29');
INSERT INTO `druid_weburi` VALUES ('3', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '15864', '2019-08-19 14:04:04', '/swagger-ui.html', null, '1', '1', '40180799', '40180799', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2019-08-19 14:04:29', null, null, '1', null, null, null, null, null, '2019-08-19 14:04:29');
INSERT INTO `druid_weburi` VALUES ('4', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '15864', '2019-08-19 14:04:04', '/swagger-resources/configuration/ui', null, '1', '1', '61211401', '61211401', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2019-08-19 14:04:29', null, null, '1', null, null, null, null, null, '2019-08-19 14:04:29');
INSERT INTO `druid_weburi` VALUES ('5', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '15864', '2019-08-19 14:04:04', '/swagger-resources/configuration/security', null, '1', '1', '6457300', '6457300', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2019-08-19 14:04:30', null, '1', null, null, null, null, null, null, '2019-08-19 14:04:30');
INSERT INTO `druid_weburi` VALUES ('6', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '15864', '2019-08-19 14:04:04', '/swagger-resources', null, '1', '1', '10616199', '10616199', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2019-08-19 14:04:29', null, null, '1', null, null, null, null, null, '2019-08-19 14:04:29');
INSERT INTO `druid_weburi` VALUES ('7', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '15864', '2019-08-19 14:04:04', '/webjars/springfox-swagger-ui/fonts/DroidSans-Bold-84ee90c29a39673dbe46681001e5358d.ttf', null, '1', '1', '21484799', '21484799', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2019-08-19 14:04:29', null, null, '1', null, null, null, null, null, '2019-08-19 14:04:29');
INSERT INTO `druid_weburi` VALUES ('8', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '15864', '2019-08-19 14:04:04', '/valid/validate3', null, '1', '1', '133169470199', '133169470199', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2019-08-19 14:05:25', null, null, null, null, null, null, '1', null, '2019-08-19 14:07:39');
INSERT INTO `druid_weburi` VALUES ('9', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '15864', '2019-08-19 14:04:04', '/valid/validate2', null, '1', '1', '37359666799', '37359666799', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2019-08-19 14:04:37', null, null, null, null, null, '1', null, null, '2019-08-19 14:05:14');
INSERT INTO `druid_weburi` VALUES ('10', 'default', 'default', 'default', 'DESKTOP-P5PUO5T', '15864', '2019-08-19 14:04:04', '/webjars/springfox-swagger-ui/fonts/DroidSans-d8c764234801aa57ad44a96b95af8bed.ttf', null, '1', '1', '21642300', '21642300', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2019-08-19 14:04:29', null, null, '1', null, null, null, null, null, '2019-08-19 14:04:29');

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `age` int(3) NOT NULL DEFAULT '0',
  `birth` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学生';

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '刘备', '34', '2019-06-28 16:52:25');
INSERT INTO `student` VALUES ('2', '曹操', '45', '2019-06-28 16:52:25');
INSERT INTO `student` VALUES ('3', '孙权', '43', '2019-06-28 16:52:25');
INSERT INTO `student` VALUES ('4', '袁绍', '38', '2019-06-28 16:52:26');
INSERT INTO `student` VALUES ('5', '马腾', '58', '2019-06-28 16:52:26');
INSERT INTO `student` VALUES ('6', '关羽', '23', '2019-06-28 16:52:26');
INSERT INTO `student` VALUES ('7', '史蒂夫', '27', '2019-06-28 16:52:26');

-- ----------------------------
-- Table structure for tbl_sequence
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sequence`;
CREATE TABLE `tbl_sequence` (
  `seq_name` varchar(50) NOT NULL COMMENT '序列名称',
  `min_value` bigint(20) NOT NULL COMMENT '最小值',
  `max_value` bigint(20) NOT NULL COMMENT '最大值',
  `current_val` bigint(20) NOT NULL COMMENT '当前值',
  `increment_val` int(11) NOT NULL DEFAULT '1' COMMENT '增长步数',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`seq_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sequence表';

-- ----------------------------
-- Records of tbl_sequence
-- ----------------------------
INSERT INTO `tbl_sequence` VALUES ('depot_number_seq', '1', '999999999999999999', '1', '1', '单据编号sequence');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of tb_user
-- ----------------------------

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `age` int(3) NOT NULL DEFAULT '0',
  `student_id` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='老师';

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '吴菲菲', '34', '1');
INSERT INTO `teacher` VALUES ('2', '扣扣', '45', '1');
INSERT INTO `teacher` VALUES ('3', '范德萨', '43', '1');

-- ----------------------------
-- Function structure for _nextval
-- ----------------------------
DROP FUNCTION IF EXISTS `_nextval`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `_nextval`(name varchar(50)) RETURNS mediumtext CHARSET utf8
begin
    declare _cur bigint;
    declare _maxvalue bigint; -- 接收最大值
    declare _increment int; -- 接收增长步数
    set _increment = (select increment_val from tbl_sequence where seq_name = name);
    set _maxvalue = (select max_value from tbl_sequence where seq_name = name);
    set _cur = (select current_val from tbl_sequence where seq_name = name for update);
    update tbl_sequence -- 更新当前值
    set current_val = _cur + increment_val
    where seq_name = name ;
    if(_cur + _increment >= _maxvalue) then -- 判断是都达到最大值
        update tbl_sequence
        set current_val = minvalue
        where seq_name = name ;
    end if;
    return _cur;
end
;;
DELIMITER ;
