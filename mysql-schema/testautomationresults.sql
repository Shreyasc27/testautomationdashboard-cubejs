-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.14-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for testautomationresults
CREATE DATABASE IF NOT EXISTS `testautomationresults` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `testautomationresults`;

-- Dumping structure for table testautomationresults.tbexecution
CREATE TABLE IF NOT EXISTS `tbexecution` (
  `ExecutionId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ExecutionId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table testautomationresults.tbexecution: ~6 rows (approximately)
/*!40000 ALTER TABLE `tbexecution` DISABLE KEYS */;
INSERT INTO `tbexecution` (`ExecutionId`, `Name`) VALUES
	(1, 'Execution-1'),
	(2, 'Execution-2'),
	(3, 'Execution-3'),
	(4, 'Execution-4'),
	(5, 'Execution-5'),
	(6, 'Execution-6');
/*!40000 ALTER TABLE `tbexecution` ENABLE KEYS */;

-- Dumping structure for table testautomationresults.tbexecutiondetails
CREATE TABLE IF NOT EXISTS `tbexecutiondetails` (
  `ExecutionDetailsId` int(11) NOT NULL AUTO_INCREMENT,
  `ExecutionId` int(11) NOT NULL,
  `FeatureId` int(11) NOT NULL,
  `TestplanId` int(11) NOT NULL,
  `TestcaseId` int(11) NOT NULL,
  `Status` varchar(255) NOT NULL,
  PRIMARY KEY (`ExecutionDetailsId`),
  KEY `FK_tbexecution_tbtestplan` (`TestplanId`),
  KEY `FK_tbexecution_tbtestcases` (`TestcaseId`),
  KEY `FK_tbexecution_tbfeature` (`FeatureId`),
  KEY `FK_tbexecutiondetails_tbexecution` (`ExecutionId`),
  CONSTRAINT `FK_tbexecution_tbfeature` FOREIGN KEY (`FeatureId`) REFERENCES `tbfeature` (`FeatureId`),
  CONSTRAINT `FK_tbexecution_tbtestcases` FOREIGN KEY (`TestcaseId`) REFERENCES `tbtestcases` (`TestcaseId`),
  CONSTRAINT `FK_tbexecution_tbtestplan` FOREIGN KEY (`TestplanId`) REFERENCES `tbtestplan` (`TestplanId`),
  CONSTRAINT `FK_tbexecutiondetails_tbexecution` FOREIGN KEY (`ExecutionId`) REFERENCES `tbexecution` (`ExecutionId`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

-- Dumping data for table testautomationresults.tbexecutiondetails: ~104 rows (approximately)
/*!40000 ALTER TABLE `tbexecutiondetails` DISABLE KEYS */;
INSERT INTO `tbexecutiondetails` (`ExecutionDetailsId`, `ExecutionId`, `FeatureId`, `TestplanId`, `TestcaseId`, `Status`) VALUES
	(1, 1, 1, 1, 1, 'Pass'),
	(2, 1, 1, 1, 2, 'Fail'),
	(3, 1, 1, 1, 3, 'Pass'),
	(4, 1, 1, 2, 4, 'Fail'),
	(5, 1, 1, 2, 5, 'Pass'),
	(6, 1, 1, 2, 6, 'Pass'),
	(7, 1, 1, 3, 7, 'Fail'),
	(8, 1, 1, 3, 8, 'Fail'),
	(9, 1, 1, 3, 9, 'Pass'),
	(10, 1, 2, 4, 10, 'Pass'),
	(11, 1, 2, 4, 11, 'Pass'),
	(12, 1, 2, 4, 12, 'Pass'),
	(13, 1, 2, 5, 13, 'Fail'),
	(14, 1, 2, 5, 14, 'Fail'),
	(15, 1, 2, 6, 15, 'Pass'),
	(16, 1, 2, 6, 16, 'Pass'),
	(17, 1, 2, 6, 17, 'Pass'),
	(18, 2, 1, 1, 1, 'Pass'),
	(19, 2, 1, 1, 2, 'Fail'),
	(20, 2, 1, 1, 3, 'Pass'),
	(21, 2, 1, 2, 4, 'Fail'),
	(22, 2, 1, 2, 5, 'Pass'),
	(23, 2, 1, 2, 6, 'Pass'),
	(24, 2, 1, 3, 7, 'Pass'),
	(25, 2, 1, 3, 8, 'Pass'),
	(26, 2, 1, 3, 9, 'Pass'),
	(27, 2, 2, 4, 10, 'Pass'),
	(28, 2, 2, 4, 11, 'Pass'),
	(29, 2, 2, 4, 12, 'Pass'),
	(30, 2, 2, 5, 13, 'Fail'),
	(31, 2, 2, 5, 14, 'Pass'),
	(32, 2, 2, 6, 15, 'Pass'),
	(33, 2, 2, 6, 16, 'Pass'),
	(34, 2, 2, 6, 17, 'Pass'),
	(35, 3, 1, 1, 1, 'Pass'),
	(36, 3, 1, 1, 2, 'Pass'),
	(37, 3, 1, 1, 3, 'Pass'),
	(38, 3, 1, 2, 4, 'Fail'),
	(39, 3, 1, 2, 5, 'Pass'),
	(40, 3, 1, 2, 6, 'Pass'),
	(41, 3, 1, 3, 7, 'Fail'),
	(42, 3, 1, 3, 8, 'Fail'),
	(43, 3, 1, 3, 9, 'Pass'),
	(44, 3, 2, 4, 10, 'Pass'),
	(45, 3, 2, 4, 11, 'Pass'),
	(46, 3, 2, 4, 12, 'Pass'),
	(47, 3, 2, 5, 13, 'Fail'),
	(48, 3, 2, 5, 14, 'Fail'),
	(49, 3, 2, 6, 15, 'Pass'),
	(50, 3, 2, 6, 16, 'Pass'),
	(51, 3, 2, 6, 17, 'Pass'),
	(52, 5, 1, 1, 1, 'Pass'),
	(53, 5, 1, 1, 2, 'Pass'),
	(54, 5, 1, 1, 3, 'Pass'),
	(55, 5, 1, 2, 4, 'Fail'),
	(56, 5, 1, 2, 5, 'Pass'),
	(57, 5, 1, 2, 6, 'Pass'),
	(58, 5, 1, 3, 7, 'Fail'),
	(59, 5, 1, 3, 8, 'Fail'),
	(60, 5, 1, 3, 9, 'Pass'),
	(61, 5, 2, 4, 10, 'Pass'),
	(62, 5, 2, 4, 11, 'Pass'),
	(63, 5, 2, 4, 12, 'Pass'),
	(64, 5, 2, 5, 13, 'Fail'),
	(65, 5, 2, 5, 14, 'Fail'),
	(66, 5, 2, 6, 15, 'Pass'),
	(67, 5, 2, 6, 16, 'Pass'),
	(68, 5, 2, 6, 17, 'Pass'),
	(69, 4, 1, 1, 1, 'Pass'),
	(70, 4, 1, 1, 2, 'Pass'),
	(71, 4, 1, 1, 3, 'Pass'),
	(72, 4, 1, 2, 4, 'Fail'),
	(73, 4, 1, 2, 5, 'Pass'),
	(74, 4, 1, 2, 6, 'Pass'),
	(75, 4, 1, 3, 7, 'Fail'),
	(76, 4, 1, 3, 8, 'Fail'),
	(77, 4, 1, 3, 9, 'Pass'),
	(78, 4, 2, 4, 10, 'Pass'),
	(79, 4, 2, 4, 11, 'Pass'),
	(80, 4, 2, 4, 12, 'Pass'),
	(81, 4, 2, 5, 13, 'Fail'),
	(82, 4, 2, 5, 14, 'Fail'),
	(83, 4, 2, 6, 15, 'Pass'),
	(84, 4, 2, 6, 16, 'Pass'),
	(85, 4, 2, 6, 17, 'Pass'),
	(86, 5, 3, 1, 1, 'Pass'),
	(87, 5, 3, 7, 18, 'Pass'),
	(88, 6, 1, 1, 1, 'Pass'),
	(89, 6, 1, 1, 2, 'Fail'),
	(90, 6, 1, 1, 3, 'Pass'),
	(91, 6, 1, 2, 4, 'Fail'),
	(92, 6, 1, 2, 5, 'Pass'),
	(93, 6, 1, 2, 6, 'Pass'),
	(94, 6, 1, 3, 7, 'Fail'),
	(95, 6, 1, 3, 8, 'Fail'),
	(96, 6, 1, 3, 9, 'Pass'),
	(97, 6, 2, 4, 10, 'Pass'),
	(98, 6, 2, 4, 11, 'Pass'),
	(99, 6, 2, 4, 12, 'Pass'),
	(100, 6, 2, 5, 13, 'Fail'),
	(101, 6, 2, 5, 14, 'Fail'),
	(102, 6, 2, 6, 15, 'Pass'),
	(103, 6, 2, 6, 16, 'Pass'),
	(104, 6, 2, 6, 17, 'Pass');
/*!40000 ALTER TABLE `tbexecutiondetails` ENABLE KEYS */;

-- Dumping structure for table testautomationresults.tbfeature
CREATE TABLE IF NOT EXISTS `tbfeature` (
  `FeatureId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`FeatureId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table testautomationresults.tbfeature: ~5 rows (approximately)
/*!40000 ALTER TABLE `tbfeature` DISABLE KEYS */;
INSERT INTO `tbfeature` (`FeatureId`, `Name`) VALUES
	(1, 'Feature-1'),
	(2, 'Feature-2'),
	(3, 'Feature-3'),
	(4, 'Feature-4'),
	(5, 'Feature-5');
/*!40000 ALTER TABLE `tbfeature` ENABLE KEYS */;

-- Dumping structure for table testautomationresults.tbtestcases
CREATE TABLE IF NOT EXISTS `tbtestcases` (
  `TestcaseId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `TestplanId` int(11) NOT NULL,
  PRIMARY KEY (`TestcaseId`),
  KEY `TestplanId` (`TestplanId`),
  CONSTRAINT `tbtestcases_ibfk_1` FOREIGN KEY (`TestplanId`) REFERENCES `tbtestplan` (`TestplanId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- Dumping data for table testautomationresults.tbtestcases: ~39 rows (approximately)
/*!40000 ALTER TABLE `tbtestcases` DISABLE KEYS */;
INSERT INTO `tbtestcases` (`TestcaseId`, `Name`, `TestplanId`) VALUES
	(1, 'Testcase-1', 1),
	(2, 'Testcase-2', 1),
	(3, 'Testcase-3', 1),
	(4, 'Testcase-1', 2),
	(5, 'Testcase-2', 2),
	(6, 'Testcase-3', 2),
	(7, 'Testcase-1', 3),
	(8, 'Testcase-2', 3),
	(9, 'Testcase-3', 3),
	(10, 'Testcase-1', 4),
	(11, 'Testcase-2', 4),
	(12, 'Testcase-3', 4),
	(13, 'Testcase-1', 5),
	(14, 'Testcase-2', 5),
	(15, 'Testcase-3', 6),
	(16, 'Testcase-1', 6),
	(17, 'Testcase-2', 7),
	(18, 'Testcase-3', 7),
	(19, 'Testcase-1', 8),
	(20, 'Testcase-2', 8),
	(21, 'Testcase-3', 9),
	(22, 'Testcase-1', 9),
	(23, 'Testcase-2', 9),
	(24, 'Testcase-3', 10),
	(25, 'Testcase-1', 10),
	(26, 'Testcase-2', 10),
	(27, 'Testcase-3', 10),
	(28, 'Testcase-1', 11),
	(29, 'Testcase-2', 11),
	(30, 'Testcase-3', 12),
	(31, 'Testcase-1', 13),
	(32, 'Testcase-2', 13),
	(33, 'Testcase-3', 13),
	(34, 'Testcase-1', 14),
	(35, 'Testcase-2', 14),
	(36, 'Testcase-3', 14),
	(37, 'Testcase-1', 15),
	(38, 'Testcase-2', 15),
	(39, 'Testcase-3', 15);
/*!40000 ALTER TABLE `tbtestcases` ENABLE KEYS */;

-- Dumping structure for table testautomationresults.tbtestplan
CREATE TABLE IF NOT EXISTS `tbtestplan` (
  `TestplanId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `FeatureId` int(11) NOT NULL,
  PRIMARY KEY (`TestplanId`),
  KEY `FeatureId` (`FeatureId`),
  CONSTRAINT `tbtestplan_ibfk_1` FOREIGN KEY (`FeatureId`) REFERENCES `tbfeature` (`FeatureId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table testautomationresults.tbtestplan: ~15 rows (approximately)
/*!40000 ALTER TABLE `tbtestplan` DISABLE KEYS */;
INSERT INTO `tbtestplan` (`TestplanId`, `Name`, `FeatureId`) VALUES
	(1, 'Testplan-1', 1),
	(2, 'Testplan-2', 1),
	(3, 'Testplan-3', 1),
	(4, 'Testplan-1', 2),
	(5, 'Testplan-2', 2),
	(6, 'Testplan-3', 2),
	(7, 'Testplan-1', 3),
	(8, 'Testplan-2', 3),
	(9, 'Testplan-3', 3),
	(10, 'Testplan-1', 4),
	(11, 'Testplan-2', 4),
	(12, 'Testplan-3', 4),
	(13, 'Testplan-1', 5),
	(14, 'Testplan-2', 5),
	(15, 'Testplan-3', 5);
/*!40000 ALTER TABLE `tbtestplan` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
