-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 20, 2012 at 02:44 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `question`
--

-- --------------------------------------------------------

--
-- Table structure for table `answeredquestion`
--

CREATE TABLE IF NOT EXISTS `answeredquestion` (
  `studentId` char(12) NOT NULL DEFAULT '',
  `questionId` char(29) NOT NULL DEFAULT '',
  `answerText_1` tinyint(1) DEFAULT NULL,
  `answerText_2` tinyint(1) DEFAULT NULL,
  `answerText_3` tinyint(1) DEFAULT NULL,
  `answerText_4` tinyint(1) DEFAULT NULL,
  `answerText_5` tinyint(1) DEFAULT NULL,
  `answer` double DEFAULT NULL,
  `takenTime` int(11) DEFAULT NULL,
  `downloadTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentId`,`questionId`),
  KEY `questionId` (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answeredquestion`
--

INSERT INTO `answeredquestion` (`studentId`, `questionId`, `answerText_1`, `answerText_2`, `answerText_3`, `answerText_4`, `answerText_5`, `answer`, `takenTime`, `downloadTime`) VALUES
('BASE12S1015', 'BASE_IIT_MAT_1_1_1', 0, 1, 0, 0, 0, NULL, 60, NULL),
('BASE12S1015', 'BASE_IIT_MAT_1_1_2', 1, 0, 0, 1, 0, NULL, 100, NULL),
('BASE12S1015', 'BASE_IIT_MAT_1_3_1', 0, 0, 1, 0, 0, NULL, 55, NULL),
('BASE12S1016', 'BASE_IIT_MAT_1_1_2', 1, 0, 1, 0, 0, NULL, 80, NULL),
('BASE12S1016', 'BASE_IIT_MAT_1_3_1', 0, 0, 1, 0, 0, NULL, 60, NULL),
('BASE12S1017', 'BASE_IIT_MAT_1_1_1', 0, 1, 0, 0, 0, NULL, 70, NULL),
('BASE12S1017', 'BASE_IIT_MAT_1_1_2', 1, 0, 0, 1, 0, NULL, 180, NULL),
('BASE12S1018', 'BASE_IIT_MAT_1_3_1', 0, 0, 1, 0, 0, NULL, 80, NULL),
('TIME12S1016', 'TIME_CET_PHY_3_1_2', 0, 0, 1, 0, 0, NULL, 80, NULL),
('TIME12S1017', 'TIME_CET_PHY_3_1_2', 0, 1, 0, 0, 0, NULL, 40, NULL),
('TIME12S1020', 'TIME_CET_PHY_3_1_1', 1, 0, 0, 1, 1, NULL, 80, NULL),
('TIME12S1020', 'TIME_CET_PHY_3_1_2', 0, 1, 0, 0, 0, NULL, 80, NULL),
('TIME12S1022', 'TIME_CET_PHY_3_1_1', 0, 0, 0, 0, 1, NULL, 130, NULL),
('TIME12S1022', 'TIME_CET_PHY_3_1_2', 0, 1, 0, 0, 0, NULL, 100, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chapter`
--

CREATE TABLE IF NOT EXISTS `chapter` (
  `id` char(23) NOT NULL,
  `unitId` char(19) DEFAULT NULL,
  `chapterNumber` char(3) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unitId` (`unitId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chapter`
--

INSERT INTO `chapter` (`id`, `unitId`, `chapterNumber`, `name`) VALUES
('BASE_IIT_MAT_1_1', 'BASE_IIT_MAT_1', '1', 'Limits'),
('BASE_IIT_MAT_1_3', 'BASE_IIT_MAT_1', '3', 'Integration'),
('TIME_CET_PHY_3_1', 'TIME_CET_PHY_3', '1', 'Static Electricity');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `id` char(11) NOT NULL,
  `institutionId` char(5) DEFAULT NULL,
  `courseId` char(5) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `institutionId` (`institutionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `institutionId`, `courseId`, `name`) VALUES
('BASE_AIEEE', 'BASE', 'AIEEE', 'AIEEE'),
('BASE_CET', 'BASE', 'CET', 'CET'),
('BASE_FI', 'BASE', 'FI', 'Foundation IIT'),
('BASE_IIT', 'BASE', 'IIT', 'IIT-JEE'),
('ET_CE', 'ET', 'CE', 'CET Engineering'),
('ET_CM', 'ET', 'CM', 'CET Medical'),
('SES_AIEEE', 'SES', 'AIEEE', 'AIEEE'),
('SES_CE', 'SES', 'CE', 'CET Engineering'),
('SES_CM', 'SES', 'CM', 'CET Medical'),
('TIME_AIEEE', 'TIME', 'AIEEE', 'AIEEE'),
('TIME_CAT', 'TIME', 'CAT', 'CAT'),
('TIME_CET', 'TIME', 'CET', 'CET'),
('TIME_GATE', 'TIME', 'GATE', 'GATE'),
('TIME_IIT', 'TIME', 'IIT', 'IIT-JEE');

-- --------------------------------------------------------

--
-- Table structure for table `institution`
--

CREATE TABLE IF NOT EXISTS `institution` (
  `id` char(5) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `institution`
--

INSERT INTO `institution` (`id`, `name`) VALUES
('BASE', 'BASE Educational Institutions'),
('ET', 'Expert Tutorials'),
('SES', 'Shastry Educational Society'),
('TIME', 'TIME Academy');

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE IF NOT EXISTS `parent` (
  `id` char(12) NOT NULL,
  `password` char(64) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `mobile` char(10) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`id`, `password`, `name`, `mobile`, `email`) VALUES
('BASE12P1001', 'RLO1311FON2JP', 'SARALA', '9623617855', 'sarala_5_27@yahoo.co.in'),
('BASE12P1002', 'CQH5811LNY4AL', 'AYUSH', '8123559208', 'ayush_9_6@google.com'),
('BASE12P1003', 'EKZ4111OFS4XD', 'ADWAITA', '9533864578', 'adwaita_4_19@google.com'),
('BASE12P1004', 'BBL2611ZNZ5QP', 'SHYAMANGI', '9804903487', 'shyamangi_10_22@yahoo.co.in'),
('BASE12P1005', 'VDK3611JUR7YC', 'ABHIMODA', '9661577574', 'abhimoda_3_12@google.com'),
('BASE12P1006', 'UJF3511YWM0XN', 'RADHESHYAM', '7452674922', 'radheshyam_11_3@yahoo.co.in'),
('BASE12P1007', 'NDD5611CBH7XL', 'SIDDHIMA', '9717822905', 'siddhima_5_9@google.com'),
('BASE12P1008', 'DFC5011THY8CH', 'AASHISH JOE', '9702976553', 'aashish_joe_5_19@google.com'),
('BASE12P1009', 'CMW0311ICF8QJ', 'SUBHASHINI', '8824963573', 'subhashini_9_9@google.com'),
('BASE12P1010', 'ZDA0211HUD7YI', 'SALIMA AGRAWAL', '8743559783', 'salima_agrawal_1_14@google.com'),
('BASE12P1011', 'VLI5711HLW5NI', 'SUNANDINI RAJAPPA', '8870637784', 'sunandini_rajappa_10_17@google.com'),
('BASE12P1012', 'MNQ8611WRG2QJ', 'AYUSHMAN CYRIL', '9887721374', 'ayushman_cyril_1_15@google.com'),
('BASE12P1013', 'FSO5511RGL0BX', 'SANCHALI', '8878625772', 'sanchali_12_2@yahoo.co.in'),
('BASE12P1014', 'JQQ6011MGP8SC', 'ATREYA', '8870803006', 'atreya_8_1@google.com'),
('BASE12P1015', 'LNS2111ZMV3SO', 'SULOCHANA RAVI', '9756550171', 'sulochana_ravi_11_14@google.com'),
('BASE12P1016', 'XGC6511OQP4AG', 'ACHAL PAUL', '7656919183', 'achal_paul_5_13@google.com'),
('BASE12P1017', 'DRI6911XKQ0WE', 'ABDUL-AZEEZ WADEYAR', '9534582331', 'abdul-azeez_wadeyar_8_12@yahoo.co.in'),
('BASE12P1018', 'TDJ7611FBJ7ZQ', 'AYOG', '9575671678', 'ayog_2_25@yahoo.co.in'),
('BASE12P1019', 'XOD4211SXF9AX', 'SALMA', '9830762751', 'salma_1_2@google.com'),
('BASE12P1020', 'HQV1011MFX6YB', 'ADINATH MAJUMDER', '9580649122', 'adinath_majumder_2_18@yahoo.co.in'),
('BASE12P1021', 'AQS2611BZR6WG', 'SHAILI CHAKRAVARTY', '9672855722', 'shaili_chakravarty_11_13@google.com'),
('BASE12P1022', 'VIL5211RNH5VX', 'SEVATI', '7812857763', 'sevati_3_20@google.com'),
('BASE12P1023', 'KAZ8211XNE9NV', 'RUSTOM', '9575915982', 'rustom_10_12@google.com'),
('BASE12P1024', 'QSN7711EKP4FY', 'REHMAN GOANTIYA', '9569719593', 'rehman_goantiya_4_6@google.com'),
('BASE12P1025', 'WTE5211LCC3MC', 'ABDUL-HAMEED', '9887895208', 'abdul-hameed_4_26@yahoo.co.in'),
('BASE12P1026', 'JJI2811MFJ2WC', 'ARIVUCHELVAN', '8123777954', 'arivuchelvan_11_11@yahoo.co.in'),
('BASE12P1027', 'UPV9911KJE3FX', 'SHATARUPA', '9828959132', 'shatarupa_1_11@google.com'),
('SES12P1001', 'CFW8111UQJ8EO', 'SAMATA', '9845726951', 'samata_6_17@yahoo.co.in'),
('SES12P1002', 'UBQ6211VUA0PX', 'SHYAMASRI', '7656660274', 'shyamasri_12_27@google.com'),
('SES12P1003', 'BYH7711JIV5LB', 'RAFAT RAO', '9443692785', 'rafat_rao_2_2@google.com'),
('SES12P1004', 'LHE2911NCC0WD', 'ACARYA', '9906717824', 'acarya_4_28@google.com'),
('SES12P1005', 'SNJ5311JOX2PV', 'SHOBHANA REDDY', '7599899504', 'shobhana_reddy_12_9@yahoo.co.in'),
('SES12P1006', 'OIP9611KND4YK', 'ARJIT', '9634868315', 'arjit_8_22@yahoo.co.in'),
('SES12P1007', 'QFI1211KGE5YR', 'SANTAWANA GOWDA', '7804718781', 'santawana_gowda_11_10@google.com'),
('SES12P1008', 'WNZ2011WNQ7CZ', 'SUHINA AWASTHI', '8870746184', 'suhina_awasthi_3_17@yahoo.co.in'),
('SES12P1009', 'HAR7511UEM1UR', 'AMIL SINGH', '9906593381', 'amil_singh_6_3@google.com'),
('SES12P1010', 'MZZ8211DJE8GR', 'RAKSHA MURTHY', '9533622985', 'raksha_murthy_11_18@google.com'),
('SES12P1011', 'UNS6011JJD3RD', 'ABHICANDRA MOTAGI', '8743927852', 'abhicandra_motagi_3_3@yahoo.co.in'),
('SES12P1012', 'AJR7511DYI8KI', 'AMALENDU PATIL', '9841630578', 'amalendu_patil_8_3@google.com'),
('SES12P1013', 'VGN9611RTX3OK', 'SEEMA', '9841844664', 'seema_9_20@google.com'),
('SES12P1014', 'BFL4511OTG7TP', 'RAVINDRA', '7459976768', 'ravindra_5_1@google.com'),
('SES12P1015', 'KND5411MKW8FD', 'AMAR KHAN', '8123846315', 'amar_khan_7_6@yahoo.co.in'),
('SES12P1016', 'IEU9911SIM1JS', 'ADHITA KUMAR', '7463557373', 'adhita_kumar_11_2@yahoo.co.in'),
('SES12P1017', 'OUH1511NWH1GV', 'RATANNABHA', '9906882272', 'ratannabha_12_17@yahoo.co.in'),
('SES12P1018', 'HUH7111EPK3XO', 'RAJANYA', '9575576823', 'rajanya_4_17@yahoo.co.in'),
('SES12P1019', 'DXM8211YYP6MJ', 'SANA', '8784810817', 'sana_1_26@yahoo.co.in'),
('SES12P1020', 'YQX4411EQT0XN', 'RAHAS', '9808985095', 'rahas_3_21@google.com'),
('SES12P1021', 'IST4311DVG6YD', 'ACALAPATI GOGERI', '9569891342', 'acalapati_gogeri_1_15@google.com'),
('SES12P1022', 'ETJ1611YUE3SU', 'SANITHI', '9534560214', 'sanithi_3_24@google.com'),
('SES12P1023', 'FFH3811AKT5SL', 'AMLANKUSUM', '9645855883', 'amlankusum_2_25@yahoo.co.in'),
('SES12P1024', 'HET4011ZCY1GR', 'SWARNALATA', '9534677978', 'swarnalata_8_26@google.com'),
('SES12P1025', 'MJJ4111OTX3YC', 'SAVITRI', '9804842018', 'savitri_10_6@google.com'),
('SES12P1026', 'PIX6711QEL0LP', 'ARIVUMANI', '9755911887', 'arivumani_9_13@yahoo.co.in'),
('SES12P1027', 'WWP8911OZF2MP', 'AVANISH JAIN', '9623961578', 'avanish_jain_4_6@google.com'),
('SES12P1028', 'PYT1611QMQ7BZ', 'RWIJU', '9839779673', 'rwiju_6_18@google.com'),
('SES12P1029', 'RSS3811DKH7GE', 'SONAL KHALEEL', '9575981493', 'sonal_khaleel_5_18@google.com'),
('SES12P1030', 'JDC8111IDP9SN', 'RAJENDRAKUMAR', '9755656331', 'rajendrakumar_12_26@google.com'),
('SES12P1031', 'RVF3211VBJ8SB', 'SAMIT', '9529834544', 'samit_4_22@yahoo.co.in'),
('SES12P1032', 'NAY6411FJS3SV', 'ANAMITRA SINGH', '8822853412', 'anamitra_singh_10_6@google.com'),
('SES12P1033', 'NPX8711NSL0KG', 'AJAMIL', '8822786866', 'ajamil_11_24@yahoo.co.in'),
('SES12P1034', 'FSO0711YWL9KM', 'SHOMILI NAMOSHI', '8933942841', 'shomili_namoshi_5_24@yahoo.co.in'),
('SES12P1035', 'XAX1411PND4BT', 'ALAGARASU', '8933986972', 'alagarasu_2_6@yahoo.co.in'),
('SES12P1036', 'JWL8511XWZ1CR', 'ANISH', '7835974573', 'anish_10_5@google.com'),
('SES12P1037', 'SEK6011WQL3OM', 'RADHAK', '9569814264', 'radhak_1_17@google.com'),
('SES12P1038', 'GSW8211ZHH7QD', 'RAAKAA JAIN', '7432984484', 'raakaa_jain_1_15@google.com'),
('SES12P1039', 'EMS0311SFM3YQ', 'SWADHINTA', '7585700798', 'swadhinta_1_21@yahoo.co.in'),
('SES12P1040', 'UPR6211CAU5HM', 'ANANT', '9755832885', 'anant_6_20@yahoo.co.in'),
('SES12P1041', 'KDT4411ADC1HP', 'SUMEDHA', '9533814091', 'sumedha_12_5@yahoo.co.in'),
('SES12P1042', 'WJY5511LYN0TD', 'ABDUL-BAARI', '9575917694', 'abdul-baari_4_23@google.com'),
('SES12P1043', 'SKJ8411EJR6UV', 'SELMA', '8876894173', 'selma_1_22@google.com'),
('SES12P1044', 'KEG3211JOP9LY', 'ABHIMANYUSUTA REDDY', '9886789363', 'abhimanyusuta_reddy_9_24@yahoo.co.in'),
('SES12P1045', 'XAN3911BJS1BD', 'SABRANG', '9904735185', 'sabrang_9_23@google.com'),
('SES12P1046', 'OWO7211GJA0TE', 'SOUMYA', '9914718585', 'soumya_8_28@yahoo.co.in'),
('SES12P1047', 'IEM6711BQD0NE', 'RANGAN', '9534838828', 'rangan_7_26@yahoo.co.in'),
('TIME12P1001', 'NTE9811GJI3SS', 'SAHANA', '9808672135', 'sahana_7_20@yahoo.co.in'),
('TIME12P1002', 'RZO1111YLB0FQ', 'SUNANDITA', '9529910108', 'sunandita_8_10@google.com'),
('TIME12P1003', 'WFP2511UQU7EN', 'SHAMITA BHAT', '8822579462', 'shamita_bhat_4_9@google.com'),
('TIME12P1004', 'XEI1511RNG3EF', 'ANJUMAN', '8975571017', 'anjuman_10_10@google.com'),
('TIME12P1005', 'YIK8711MYZ1VE', 'AGNEYA', '7804873427', 'agneya_12_9@yahoo.co.in'),
('TIME12P1006', 'TDS5711NGY0DC', 'SUMANOLATA', '9674946946', 'sumanolata_12_14@yahoo.co.in'),
('TIME12P1007', 'IHQ0711WJY0IG', 'SIKATA SINGANAL', '7452636768', 'sikata_singanal_2_28@yahoo.co.in'),
('TIME12P1008', 'NFA9111ZDZ1WD', 'SAHIRA', '8824965203', 'sahira_10_2@yahoo.co.in'),
('TIME12P1009', 'WKX3611VKT9TA', 'AKMAL SINGH', '8876835765', 'akmal_singh_3_26@yahoo.co.in'),
('TIME12P1010', 'OTV4111TNL0AQ', 'SRUJANIKA', '7585808965', 'srujanika_12_3@yahoo.co.in'),
('TIME12P1011', 'BAV0111VEZ9BK', 'SOORAT PATIL', '8870697198', 'soorat_patil_3_11@google.com'),
('TIME12P1012', 'VLA6811UPO8DI', 'RAJEEV SORAGANVI', '9533811708', 'rajeev_soraganvi_7_17@yahoo.co.in'),
('TIME12P1013', 'POL3011XKB5LB', 'SAANVI', '9834576944', 'saanvi_9_12@google.com'),
('TIME12P1014', 'JMF1611ECS5XD', 'AMANATH JESWAL', '9906652461', 'amanath_jeswal_3_24@yahoo.co.in'),
('TIME12P1015', 'POZ3111OEG8UV', 'SAHITHA', '9924667181', 'sahitha_4_5@yahoo.co.in'),
('TIME12P1016', 'IDW2511YTZ0CM', 'ADWAYA PATIL', '9634913083', 'adwaya_patil_9_26@google.com'),
('TIME12P1017', 'FGC3311UZG9OU', 'SADIQUA', '7804837078', 'sadiqua_3_26@google.com'),
('TIME12P1018', 'XXY4011EIW9QA', 'SADHANA GUDIHAL', '9839749423', 'sadhana_gudihal_11_5@google.com'),
('TIME12P1019', 'WWO7511OUR0ZY', 'SANCHITA GUPTA', '7804539465', 'sanchita_gupta_7_12@yahoo.co.in'),
('TIME12P1020', 'DKH9311NWX3UV', 'SUDEEPA ODEYAR', '9918676727', 'sudeepa_odeyar_7_11@google.com'),
('TIME12P1021', 'GGX4511ULG7IC', 'RATHIK', '9834893744', 'rathik_7_16@yahoo.co.in'),
('TIME12P1022', 'JCR9911JYX3BH', 'RITHUL', '9682715385', 'rithul_9_8@yahoo.co.in'),
('TIME12P1023', 'PZQ1811OLR4SX', 'SANATANI', '9834827285', 'sanatani_8_13@yahoo.co.in'),
('TIME12P1024', 'IEM1611TXY8GB', 'SUNETRA GOWDA', '9702686797', 'sunetra_gowda_9_6@google.com'),
('TIME12P1025', 'NEY8111WEE1UE', 'SHAKAMBARI', '7835590077', 'shakambari_8_21@yahoo.co.in'),
('TIME12P1026', 'UXB3311SUB6CG', 'SHIULI', '7463916705', 'shiuli_11_5@yahoo.co.in');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` char(29) NOT NULL,
  `chapterId` char(23) DEFAULT NULL,
  `questionNumber` char(5) DEFAULT NULL,
  `difficulty` int(11) DEFAULT NULL,
  `answerType` int(11) DEFAULT NULL,
  `questionType` int(11) DEFAULT NULL,
  `suggestedTime` int(11) DEFAULT NULL,
  `staffId` char(12) DEFAULT NULL,
  `uploadTime` int(11) DEFAULT NULL,
  `copyright` varchar(500) DEFAULT NULL,
  `questionText` varchar(2000) DEFAULT NULL,
  `optionText_1` varchar(2000) DEFAULT NULL,
  `optionText_2` varchar(2000) DEFAULT NULL,
  `optionText_3` varchar(2000) DEFAULT NULL,
  `optionText_4` varchar(2000) DEFAULT NULL,
  `optionText_5` varchar(2000) DEFAULT NULL,
  `answerText_1` tinyint(1) DEFAULT NULL,
  `answerText_2` tinyint(1) DEFAULT NULL,
  `answerText_3` tinyint(1) DEFAULT NULL,
  `answerText_4` tinyint(1) DEFAULT NULL,
  `answerText_5` tinyint(1) DEFAULT NULL,
  `answer` double DEFAULT NULL,
  `answer_precision` double DEFAULT NULL,
  `explanation` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chapterId` (`chapterId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `chapterId`, `questionNumber`, `difficulty`, `answerType`, `questionType`, `suggestedTime`, `staffId`, `uploadTime`, `copyright`, `questionText`, `optionText_1`, `optionText_2`, `optionText_3`, `optionText_4`, `optionText_5`, `answerText_1`, `answerText_2`, `answerText_3`, `answerText_4`, `answerText_5`, `answer`, `answer_precision`, `explanation`) VALUES
('BASE_IIT_MAT_1_1_1', 'BASE_IIT_MAT_1_1', '1', 8, 1, 4, 60, 'BASE10L1004', NULL, 'Author_1, Book_1, page 32, TMH', 'Question_1', 'Option_1', 'Option_2', 'Option_3', 'Option_4', 'Option_5', 0, 1, 0, 0, 0, NULL, NULL, 'Explanation_1'),
('BASE_IIT_MAT_1_1_2', 'BASE_IIT_MAT_1_1', '2', 9, 2, 2, 150, 'BASE12L1003', NULL, 'Author_2, Book_2, page 158, Pearson Education', 'Question_2', 'Option_1', 'Option_2', 'Option_3', 'Option_4', 'Option_5', 1, 0, 1, 0, 0, NULL, NULL, 'Explanation_2'),
('BASE_IIT_MAT_1_3_1', 'BASE_IIT_MAT_1_3', '1', 6, 4, 1, 45, 'BASE10L1004', NULL, 'Author_3, Book_3, Pearson Education', 'Question_3', 'Option_1', 'Option_2', 'Option_3', 'Option_4', 'Option_5', 0, 0, 1, 0, 0, NULL, NULL, 'Explanation_3'),
('TIME_CET_PHY_3_1_1', 'TIME_CET_PHY_3_1', '1', 7, 1, 1, 100, 'TIME10L1002', NULL, 'H C Verma, Concepts in Physics, Volume 1, Page 158', 'Question_4', 'Option_1', 'Option_2', 'Option_3', 'Option_4', 'Option_5', 0, 0, 0, 1, 1, NULL, NULL, 'Explanation_4'),
('TIME_CET_PHY_3_1_2', 'TIME_CET_PHY_3_1', '2', 8, 3, 3, 60, 'TIME10L1001', NULL, 'H C Verma, Concepts in Physics, Volume 1, Page 154', 'Question_5', 'Option_1', 'Option_2', 'Option_3', 'Option_4', 'Option_5', 0, 1, 0, 0, 0, NULL, NULL, 'Explanation_5');

-- --------------------------------------------------------

--
-- Stand-in structure for view `questionstatistics`
--
CREATE TABLE IF NOT EXISTS `questionstatistics` (
`id` char(29)
,`count_total` bigint(21)
,`count_correct` bigint(21)
,`count_incorrect` bigint(21)
,`suggestedTime` int(11)
,`c_avgTime` decimal(18,4)
,`a_avgTime` decimal(18,4)
);
-- --------------------------------------------------------

--
-- Table structure for table `registeredcourse`
--

CREATE TABLE IF NOT EXISTS `registeredcourse` (
  `studentId` char(12) NOT NULL DEFAULT '',
  `courseId` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`studentId`,`courseId`),
  KEY `courseId` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registeredcourse`
--

INSERT INTO `registeredcourse` (`studentId`, `courseId`) VALUES
('BASE12S1019', 'BASE_CET'),
('BASE12S1020', 'BASE_CET'),
('BASE12S1021', 'BASE_CET'),
('BASE12S1022', 'BASE_CET'),
('BASE12S1023', 'BASE_CET'),
('BASE12S1024', 'BASE_CET'),
('BASE12S1025', 'BASE_CET'),
('BASE12S1026', 'BASE_CET'),
('BASE12S1027', 'BASE_CET'),
('BASE12S1001', 'BASE_IIT'),
('BASE12S1002', 'BASE_IIT'),
('BASE12S1003', 'BASE_IIT'),
('BASE12S1004', 'BASE_IIT'),
('BASE12S1005', 'BASE_IIT'),
('BASE12S1006', 'BASE_IIT'),
('BASE12S1007', 'BASE_IIT'),
('BASE12S1008', 'BASE_IIT'),
('BASE12S1009', 'BASE_IIT'),
('BASE12S1010', 'BASE_IIT'),
('BASE12S1011', 'BASE_IIT'),
('BASE12S1012', 'BASE_IIT'),
('BASE12S1013', 'BASE_IIT'),
('BASE12S1014', 'BASE_IIT'),
('BASE12S1015', 'BASE_IIT'),
('BASE12S1016', 'BASE_IIT'),
('BASE12S1017', 'BASE_IIT'),
('BASE12S1018', 'BASE_IIT'),
('SES12S1001', 'SES_CE'),
('SES12S1002', 'SES_CE'),
('SES12S1003', 'SES_CE'),
('SES12S1004', 'SES_CE'),
('SES12S1005', 'SES_CE'),
('SES12S1006', 'SES_CE'),
('SES12S1007', 'SES_CE'),
('SES12S1008', 'SES_CE'),
('SES12S1009', 'SES_CE'),
('SES12S1010', 'SES_CE'),
('SES12S1011', 'SES_CE'),
('SES12S1012', 'SES_CE'),
('SES12S1013', 'SES_CE'),
('SES12S1014', 'SES_CE'),
('SES12S1015', 'SES_CE'),
('SES12S1016', 'SES_CE'),
('SES12S1017', 'SES_CE'),
('SES12S1018', 'SES_CE'),
('SES12S1019', 'SES_CE'),
('SES12S1020', 'SES_CE'),
('SES12S1021', 'SES_CE'),
('SES12S1022', 'SES_CE'),
('SES12S1023', 'SES_CE'),
('SES12S1024', 'SES_CE'),
('SES12S1025', 'SES_CE'),
('SES12S1026', 'SES_CE'),
('SES12S1027', 'SES_CE'),
('SES12S1028', 'SES_CE'),
('SES12S1029', 'SES_CE'),
('SES12S1030', 'SES_CE'),
('SES12S1031', 'SES_CE'),
('SES12S1032', 'SES_CE'),
('SES12S1033', 'SES_CE'),
('SES12S1034', 'SES_CE'),
('SES12S1035', 'SES_CE'),
('SES12S1036', 'SES_CE'),
('SES12S1037', 'SES_CM'),
('SES12S1038', 'SES_CM'),
('SES12S1039', 'SES_CM'),
('SES12S1040', 'SES_CM'),
('SES12S1041', 'SES_CM'),
('SES12S1042', 'SES_CM'),
('SES12S1043', 'SES_CM'),
('SES12S1044', 'SES_CM'),
('SES12S1045', 'SES_CM'),
('SES12S1046', 'SES_CM'),
('SES12S1047', 'SES_CM'),
('TIME12S1016', 'TIME_CET'),
('TIME12S1017', 'TIME_CET'),
('TIME12S1018', 'TIME_CET'),
('TIME12S1019', 'TIME_CET'),
('TIME12S1020', 'TIME_CET'),
('TIME12S1021', 'TIME_CET'),
('TIME12S1022', 'TIME_CET'),
('TIME12S1023', 'TIME_CET'),
('TIME12S1024', 'TIME_CET'),
('TIME12S1025', 'TIME_CET'),
('TIME12S1026', 'TIME_CET'),
('TIME12S1001', 'TIME_IIT'),
('TIME12S1002', 'TIME_IIT'),
('TIME12S1003', 'TIME_IIT'),
('TIME12S1004', 'TIME_IIT'),
('TIME12S1005', 'TIME_IIT'),
('TIME12S1006', 'TIME_IIT'),
('TIME12S1007', 'TIME_IIT'),
('TIME12S1008', 'TIME_IIT'),
('TIME12S1009', 'TIME_IIT'),
('TIME12S1010', 'TIME_IIT'),
('TIME12S1011', 'TIME_IIT'),
('TIME12S1012', 'TIME_IIT'),
('TIME12S1013', 'TIME_IIT'),
('TIME12S1014', 'TIME_IIT'),
('TIME12S1015', 'TIME_IIT');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `id` char(12) NOT NULL,
  `password` char(64) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `institutionId` char(5) DEFAULT NULL,
  `yearOfJoining` char(2) DEFAULT NULL,
  `accountType` char(1) DEFAULT NULL,
  `staffId` char(4) DEFAULT NULL,
  `mobile` char(10) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `institutionId` (`institutionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `password`, `name`, `institutionId`, `yearOfJoining`, `accountType`, `staffId`, `mobile`, `email`, `DOB`) VALUES
('BASE11L1001', 'EUV4112NJS7XG', 'ARUN KUMAR', 'BASE', '11', 'L', '1001', '9845483705', 'arun_kumar_1991_10_17@yahoo.co.in', '1965-11-24'),
('BASE11L1003', 'TZK3512TKU7HI', 'ATISHU JAIN', 'BASE', '11', 'L', '1003', '9845578414', 'atishu_jain_1989_11_3@google.com', '1975-11-23'),
('BASE11L1004', 'CIY4812RWQ4EZ', 'ATREYA KRISHNA NITTALA', 'BASE', '11', 'L', '1004', '9845535632', 'atreya_krishna_nittala_1990_4_22@google.com', '1968-08-11'),
('BASE12L1002', 'FKU6512IAG0XN', 'ASHUTOSH VAISH', 'BASE', '12', 'L', '1002', '9845095353', 'ashutosh_vaish_1989_9_7@yahoo.co.in', '1979-02-27'),
('ET10L1003', 'UBJ4412YGF9QD', 'POOJA ANAND J', 'ET', '10', 'L', '1003', '9845393037', 'pooja_anand_j_1989_1_3@yahoo.co.in', '1964-12-05'),
('ET10L1005', 'QXE5012LSK6NW', 'PRATEEK JAYA PRASAD', 'ET', '10', 'L', '1005', '9845710739', 'prateek_jaya_prasad_1991_12_6@rvce.edu.in', '1977-05-06'),
('ET11L1004', 'NRI9112HEI2UM', 'PRAKHAR ACHARYA', 'ET', '11', 'L', '1004', '9845350912', 'prakhar_acharya_1991_5_28@google.com', '1963-03-26'),
('ET12L1001', 'ETA1912XFI3PE', 'NAGESH RAO K P', 'ET', '12', 'L', '1001', '9845415545', 'nagesh_rao_k_p_1989_4_8@google.com', '1962-06-16'),
('ET12L1002', 'MMR6412PVT9KX', 'NISHANTH', 'ET', '12', 'L', '1002', '9845841458', 'nishanth_1990_11_3@yahoo.co.in', '1972-08-17'),
('SES10L1004', 'ITH0212XDD5HN', 'MAYUKH SAMANTA', 'SES', '10', 'L', '1004', '9845870458', 'mayukh_samanta_1990_10_4@yahoo.co.in', '1963-01-27'),
('SES10L1005', 'XYZ9212XCJ4JW', 'MEHISSA FLORINE DLIMA', 'SES', '10', 'L', '1005', '9845145933', 'mehissa_florine_dlima_1990_10_24@yahoo.co.in', '1977-12-01'),
('SES11L1001', 'LUX0812UYB8SD', 'KASTURI NAGESH PAI', 'SES', '11', 'L', '1001', '9845106043', 'kasturi_nagesh_pai_1990_12_13@rvce.edu.in', '1966-09-17'),
('SES11L1002', 'ILJ4212EJJ0BN', 'KRISHNA PRASAD ADHIKARI', 'SES', '11', 'L', '1002', '9845201387', 'krishna_prasad_adhikari_1990_4_14@rvce.edu.in', '1962-06-06'),
('SES11L1003', 'IFL7512QCW6DJ', 'MANOJ SAIPRASAD', 'SES', '11', 'L', '1003', '9845508575', 'manoj_saiprasad_1991_10_23@rvce.edu.in', '1972-01-07'),
('TIME10L1001', 'RGK1012BBS5FR', 'BHAGYA SHREE', 'TIME', '10', 'L', '1001', '9845366475', 'bhagya_shree_1991_1_5@rvce.edu.in', '1960-09-01'),
('TIME11L1004', 'BML7912IGE1WW', 'HEMANT BAGLA', 'TIME', '11', 'L', '1004', '9845579721', 'hemant_bagla_1991_8_26@rvce.edu.in', '1977-10-27'),
('TIME12L1002', 'RYJ8012LWT9CL', 'BHARATH G RELEKAR', 'TIME', '12', 'L', '1002', '9845487519', 'bharath_g_relekar_1990_12_1@rvce.edu.in', '1975-10-07'),
('TIME12L1003', 'WLK6412WNF8PR', 'GAURAV KUMAR', 'TIME', '12', 'L', '1003', '9845225622', 'gaurav_kumar_1990_3_9@yahoo.co.in', '1968-08-21'),
('TIME12L1005', 'XCP6012XWF0TC', 'JAFER', 'TIME', '12', 'L', '1005', '9845853738', 'jafer_1989_2_3@google.com', '1970-06-09');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` char(12) NOT NULL,
  `password` char(64) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `institutionId` char(5) DEFAULT NULL,
  `yearOfJoining` char(2) DEFAULT NULL,
  `accountType` char(1) DEFAULT NULL,
  `studentId` char(4) DEFAULT NULL,
  `mobile` char(10) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `parentId` char(12) DEFAULT NULL,
  `councellorId` char(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `institutionId` (`institutionId`),
  KEY `parentId` (`parentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `password`, `name`, `institutionId`, `yearOfJoining`, `accountType`, `studentId`, `mobile`, `email`, `DOB`, `parentId`, `councellorId`) VALUES
('BASE12S1001', 'IVW2611RBG7PC', 'BHARADWAJ R K', 'BASE', '12', 'S', '1001', '9830843261', 'bharadwaj_r_k_1990_5_27@google.com', '1990-05-27', 'BASE12P1001', 'BASE10L1001'),
('BASE12S1002', 'CWO2411FIS9XV', 'BHARATH A', 'BASE', '12', 'S', '1002', '9674708624', 'bharath_a_1991_9_6@rvce.edu.in', '1991-09-06', 'BASE12P1002', 'BASE10L1001'),
('BASE12S1003', 'XZU1411ANF9LA', 'DEVAPRASAD G R', 'BASE', '12', 'S', '1003', '9787750203', 'devaprasad_g_r_1991_4_19@rvce.edu.in', '1991-04-19', 'BASE12P1003', 'BASE10L1001'),
('BASE12S1004', 'YDB1611BRV0CV', 'GOUTHAM G R', 'BASE', '12', 'S', '1004', '9634846476', 'goutham_g_r_1990_10_22@rvce.edu.in', '1990-10-22', 'BASE12P1004', 'BASE10L1001'),
('BASE12S1005', 'HBN4611PCM6EI', 'IRFANMIYAN', 'BASE', '12', 'S', '1005', '7463981407', 'irfanmiyan_1989_3_12@rvce.edu.in', '1989-03-12', 'BASE12P1005', 'BASE10L1001'),
('BASE12S1006', 'ZEO3811DMJ7RR', 'JITESH KUMAR', 'BASE', '12', 'S', '1006', '9804904191', 'jitesh_kumar_1990_11_3@yahoo.co.in', '1990-11-03', 'BASE12P1006', 'BASE10L1001'),
('BASE12S1007', 'TOV1411ZQU7IL', 'MANISH KUMAR JAIN', 'BASE', '12', 'S', '1007', '8933909367', 'manish_kumar_jain_1990_5_9@yahoo.co.in', '1990-05-09', 'BASE12P1007', 'BASE10L1001'),
('BASE12S1008', 'PUH7211HJZ0SL', 'MATHEW JOE', 'BASE', '12', 'S', '1008', '9575631127', 'mathew_joe_1990_5_19@rvce.edu.in', '1990-05-19', 'BASE12P1008', 'BASE10L1001'),
('BASE12S1009', 'PZV3111CSE0KQ', 'MIRLE VARUN', 'BASE', '12', 'S', '1009', '9808811637', 'mirle_varun_1989_9_9@rvce.edu.in', '1989-09-09', 'BASE12P1009', 'BASE10L1001'),
('BASE12S1010', 'EZD4111GFI3PZ', 'MOHIT AGRAWAL', 'BASE', '12', 'S', '1010', '9835652263', 'mohit_agrawal_1989_1_14@google.com', '1989-01-14', 'BASE12P1010', 'BASE10L1001'),
('BASE12S1011', 'VDQ3311WNQ1DP', 'NIHAR RAJAPPA', 'BASE', '12', 'S', '1011', '7804742498', 'nihar_rajappa_1990_10_17@rvce.edu.in', '1990-10-17', 'BASE12P1011', 'BASE10L1001'),
('BASE12S1012', 'WGV1511RRF8VU', 'NISHA CYRIL', 'BASE', '12', 'S', '1012', '7656582338', 'nisha_cyril_1990_1_15@yahoo.co.in', '1990-01-15', 'BASE12P1012', 'BASE10L1001'),
('BASE12S1013', 'ILI4911ZEE8ZZ', 'PAWAN KUMAR S P', 'BASE', '12', 'S', '1013', '9845868345', 'pawan_kumar_s_p_1991_12_2@google.com', '1991-12-02', 'BASE12P1013', 'BASE10L1001'),
('BASE12S1014', 'KDV8111VBH7BH', 'PEIE ETE', 'BASE', '12', 'S', '1014', '8810793844', 'peie_ete_1991_8_1@yahoo.co.in', '1991-08-01', 'BASE12P1014', 'BASE10L1001'),
('BASE12S1015', 'HGB1311XGR5IZ', 'PRATHIK RAVI KUMAR', 'BASE', '12', 'S', '1015', '9756709257', 'prathik_ravi_kumar_1991_11_14@yahoo.co.in', '1991-11-14', 'BASE12P1015', 'BASE10L1003'),
('BASE12S1016', 'COH2911ENP7VO', 'RAMKRISHNA PAUL', 'BASE', '12', 'S', '1016', '9906926613', 'ramkrishna_paul_1990_5_13@google.com', '1990-05-13', 'BASE12P1016', 'BASE10L1003'),
('BASE12S1017', 'OJV8211AKX7FL', 'SACHIN MARUTI WADEYAR', 'BASE', '12', 'S', '1017', '9906684975', 'maruti_wadeyar_1989_8_12@rvce.edu.in', '1989-08-12', 'BASE12P1017', 'BASE10L1003'),
('BASE12S1018', 'PTJ4011JVX1BJ', 'SALIMPASHA', 'BASE', '12', 'S', '1018', '9676819987', 'salimpasha_1991_2_25@rvce.edu.in', '1991-02-25', 'BASE12P1018', 'BASE10L1003'),
('BASE12S1019', 'WFY2211ICE4EN', 'SAMARJEET RAVI', 'BASE', '12', 'S', '1019', '9885804727', 'samarjeet_ravi_1990_1_2@google.com', '1990-01-02', 'BASE12P1019', 'BASE10L1003'),
('BASE12S1020', 'YWX2011FJG6NU', 'SAMRIDHA MAJUMDER', 'BASE', '12', 'S', '1020', '9841566154', 'samridha_majumder_1989_2_18@rvce.edu.in', '1989-02-18', 'BASE12P1020', 'BASE10L1003'),
('BASE12S1021', 'TII9311NIQ2VK', 'SOHAM CHAKRAVARTY', 'BASE', '12', 'S', '1021', '8876649356', 'soham_chakravarty_1991_11_13@yahoo.co.in', '1991-11-13', 'BASE12P1021', 'BASE10L1003'),
('BASE12S1022', 'QNQ6911EYO3TZ', 'ULLASGOWDA', 'BASE', '12', 'S', '1022', '9887948112', 'ullasgowda_1990_3_20@google.com', '1990-03-20', 'BASE12P1022', 'BASE10L1003'),
('BASE12S1023', 'MZI0911MAM8TM', 'VIGNESH R CHANDAN', 'BASE', '12', 'S', '1023', '9535735056', 'vignesh_r_chandan_1990_10_12@rvce.edu.in', '1990-10-12', 'BASE12P1023', 'BASE10L1003'),
('BASE12S1024', 'TBX8911KWM2QY', 'VINAYAK GOANTIYA', 'BASE', '12', 'S', '1024', '9755661108', 'vinayak_goantiya_1989_4_6@google.com', '1989-04-06', 'BASE12P1024', 'BASE10L1003'),
('BASE12S1025', 'TVH6811RMH9CF', 'VITTA SANKET KUMAR', 'BASE', '12', 'S', '1025', '9529707136', 'vitta_sanket_kumar_1990_4_26@rvce.edu.in', '1990-04-26', 'BASE12P1025', 'BASE10L1003'),
('BASE12S1026', 'HJT8111LJM3MS', 'ANANYA PRAHERSH', 'BASE', '12', 'S', '1026', '9808715248', 'ananya_prahersh_1991_11_11@rvce.edu.in', '1991-11-11', 'BASE12P1026', 'BASE10L1003'),
('BASE12S1027', 'FKY1511JMB7ZT', 'HARIHARAN SUBRAMANIAN', 'BASE', '12', 'S', '1027', '9767707793', 'hariharan_subramanian_1990_1_11@yahoo.co.in', '1990-01-11', 'BASE12P1027', 'BASE10L1003'),
('SES12S1001', 'EUV4111NJS7XG', 'GANESH H', 'SES', '12', 'S', '1001', '8822899967', 'ganesh_h_1989_6_17@yahoo.co.in', '1989-06-17', 'SES12P1001', 'SES12L1002'),
('SES12S1002', 'FKU6511IAG0XN', 'GANESH VISHWANATH BHAT', 'SES', '12', 'S', '1002', '9869551932', 'ganesh_vishwanath_bhat_1989_12_27@google.com', '1989-12-27', 'SES12P1002', 'SES12L1002'),
('SES12S1003', 'TZK3511TKU7HI', 'GAURAV S RAO', 'SES', '12', 'S', '1003', '9859988237', 'gaurav_s_rao_1990_2_2@google.com', '1990-02-02', 'SES12P1003', 'SES12L1002'),
('SES12S1004', 'CIY4811RWQ4EZ', 'GAYATHARI', 'SES', '12', 'S', '1004', '9827612058', 'gayathari_1989_4_28@yahoo.co.in', '1989-04-28', 'SES12P1004', 'SES12L1002'),
('SES12S1005', 'RGK1011BBS5FR', 'GOVERDHAN REDDY P', 'SES', '12', 'S', '1005', '7812870537', 'goverdhan_reddy_p_1990_12_9@rvce.edu.in', '1990-12-09', 'SES12P1005', 'SES12L1002'),
('SES12S1006', 'RYJ8011LWT9CL', 'JAYESH RAMESH CHANDIRAMANI', 'SES', '12', 'S', '1006', '9924882563', 'jayesh_ramesh_chandiramani_1991_8_22@google.com', '1991-08-22', 'SES12P1006', 'SES12L1002'),
('SES12S1007', 'WLK6411WNF8PR', 'KEERTHI GOWDA B S', 'SES', '12', 'S', '1007', '9787853236', 'keerthi_gowda_b_s_1990_11_10@rvce.edu.in', '1990-11-10', 'SES12P1007', 'SES12L1002'),
('SES12S1008', 'BML7911IGE1WW', 'KRITI AWASTHI', 'SES', '12', 'S', '1008', '8743873512', 'kriti_awasthi_1989_3_17@yahoo.co.in', '1989-03-17', 'SES12P1008', 'SES12L1002'),
('SES12S1009', 'XCP6011XWF0TC', 'KULGAURAVI SINGH RANAWAT', 'SES', '12', 'S', '1009', '9830808706', 'kulgauravi_singh_ranawat_1989_6_3@google.com', '1989-06-03', 'SES12P1009', 'SES12L1002'),
('SES12S1010', 'LUX0811UYB8SD', 'KUSHAL D MURTHY', 'SES', '12', 'S', '1010', '8810678942', 'kushal_d_murthy_1989_11_18@rvce.edu.in', '1989-11-18', 'SES12P1010', 'SES12L1002'),
('SES12S1011', 'ILJ4211EJJ0BN', 'LALITKUMAR MOTAGI', 'SES', '12', 'S', '1011', '8845609647', 'lalitkumar_motagi_1990_3_3@google.com', '1990-03-03', 'SES12P1011', 'SES12L1002'),
('SES12S1012', 'IFL7511QCW6DJ', 'LINGARAJ PATIL', 'SES', '12', 'S', '1012', '8810559062', 'lingaraj_patil_1990_8_3@google.com', '1990-08-03', 'SES12P1012', 'SES12L1002'),
('SES12S1013', 'ITH0211XDD5HN', 'MADHU R', 'SES', '12', 'S', '1013', '9575947126', 'madhu_r_1990_9_20@google.com', '1990-09-20', 'SES12P1013', 'SES12L1002'),
('SES12S1014', 'XYZ9211XCJ4JW', 'MAYUR B K', 'SES', '12', 'S', '1014', '7738707555', 'mayur_b_k_1989_5_1@yahoo.co.in', '1989-05-01', 'SES12P1014', 'SES12L1002'),
('SES12S1015', 'ETA1911XFI3PE', 'MD IBRAHIM KHAN', 'SES', '12', 'S', '1015', '9534664344', 'md_ibrahim_khan_1991_7_6@yahoo.co.in', '1991-07-06', 'SES12P1015', 'SES12L1002'),
('SES12S1016', 'MMR6411PVT9KX', 'MITHUN KUMAR S', 'SES', '12', 'S', '1016', '9886978725', 'mithun_kumar_s_1990_11_2@google.com', '1990-11-02', 'SES12P1016', 'SES12L1002'),
('SES12S1017', 'UBJ4411YGF9QD', 'MOHAMMAD YASAR', 'SES', '12', 'S', '1017', '7835788956', 'mohammad_yasar_1990_12_17@rvce.edu.in', '1990-12-17', 'SES12P1017', 'SES12L1002'),
('SES12S1018', 'NRI9111HEI2UM', 'MOHAMMED SALMAN', 'SES', '12', 'S', '1018', '8824967998', 'mohammed_salman_1990_4_17@rvce.edu.in', '1990-04-17', 'SES12P1018', 'SES12L1002'),
('SES12S1019', 'QXE5011LSK6NW', 'MOHANKUMAR N', 'SES', '12', 'S', '1019', '9676789783', 'mohankumar_n_1990_1_26@google.com', '1990-01-26', 'SES12P1019', 'SES10L1004'),
('SES12S1020', 'UTU3711GBE9OA', 'MONIKA M N', 'SES', '12', 'S', '1020', '9827765582', 'monika_m_n_1991_3_21@yahoo.co.in', '1991-03-21', 'SES12P1020', 'SES10L1004'),
('SES12S1021', 'ODW9911CZC0ND', 'MURUGHENDRA GOGERI', 'SES', '12', 'S', '1021', '9827697432', 'murughendra_gogeri_1991_1_15@yahoo.co.in', '1991-01-15', 'SES12P1021', 'SES10L1004'),
('SES12S1022', 'SNJ6411MPO5DR', 'MUTHUKUMAR THANGARAJAN', 'SES', '12', 'S', '1022', '9623608891', 'muthukumar_thangarajan_1989_3_24@yahoo.co.in', '1989-03-24', 'SES12P1022', 'SES10L1004'),
('SES12S1023', 'INI9911VPN3SE', 'NABEEL AHMED KHAN', 'SES', '12', 'S', '1023', '7469750467', 'nabeel_ahmed_khan_1991_2_25@rvce.edu.in', '1991-02-25', 'SES12P1023', 'SES10L1004'),
('SES12S1024', 'BZP0911LQM8IQ', 'NIDHI SATISH', 'SES', '12', 'S', '1024', '7469579463', 'nidhi_satish_1991_8_26@yahoo.co.in', '1991-08-26', 'SES12P1024', 'SES10L1004'),
('SES12S1025', 'YJW9311IPU1XL', 'NIDHI VISWANATH', 'SES', '12', 'S', '1025', '9755827532', 'nidhi_viswanath_1989_10_6@rvce.edu.in', '1989-10-06', 'SES12P1025', 'SES10L1004'),
('SES12S1026', 'JWS3211AXA1VL', 'NISHANT S YADALAM', 'SES', '12', 'S', '1026', '9924964448', 'nishant_s_yadalam_1990_9_13@yahoo.co.in', '1990-09-13', 'SES12P1026', 'SES10L1004'),
('SES12S1027', 'SSV0911VZX9UJ', 'NITIN A JAIN', 'SES', '12', 'S', '1027', '9802719612', 'nitin_a_jain_1991_4_6@google.com', '1991-04-06', 'SES12P1027', 'SES10L1004'),
('SES12S1028', 'TPD8511ZUK9PU', 'NITIN K', 'SES', '12', 'S', '1028', '9924772348', 'nitin_k_1991_6_18@rvce.edu.in', '1991-06-18', 'SES12P1028', 'SES10L1004'),
('SES12S1029', 'YGM7711LOE4DZ', 'NOOR KHALEEL KHAN', 'SES', '12', 'S', '1029', '9702734442', 'noor_khaleel_khan_1989_5_18@yahoo.co.in', '1989-05-18', 'SES12P1029', 'SES10L1004'),
('SES12S1030', 'LJA1111MTI8WH', 'PARTH PRASHANT', 'SES', '12', 'S', '1030', '9535950361', 'parth_prashant_1990_12_26@yahoo.co.in', '1990-12-26', 'SES12P1030', 'SES10L1004'),
('SES12S1031', 'CGA3311NBR4XZ', 'PARTHIBAN S', 'SES', '12', 'S', '1031', '7804788558', 'parthiban_s_1991_4_22@rvce.edu.in', '1991-04-22', 'SES12P1031', 'SES10L1004'),
('SES12S1032', 'SGH9611UBI1YH', 'PAVNEET SINGH', 'SES', '12', 'S', '1032', '8784661135', 'pavneet_singh_1989_10_6@yahoo.co.in', '1989-10-06', 'SES12P1032', 'SES10L1004'),
('SES12S1033', 'DIK1911EEG3CO', 'PRADEEP T L', 'SES', '12', 'S', '1033', '9841761855', 'pradeep_t_l_1990_11_24@google.com', '1990-11-24', 'SES12P1033', 'SES10L1004'),
('SES12S1034', 'VBG9011LCH7EV', 'PRAFUL S NAMOSHI', 'SES', '12', 'S', '1034', '7804632178', 'praful_s_namoshi_1990_5_24@google.com', '1990-05-24', 'SES12P1034', 'SES10L1004'),
('SES12S1035', 'TUJ6811VUC6YY', 'PRAMOD T M', 'SES', '12', 'S', '1035', '7469869588', 'pramod_t_m_1989_2_6@rvce.edu.in', '1989-02-06', 'SES12P1035', 'SES10L1004'),
('SES12S1036', 'FKI8211DRI7PG', 'PRASHANTH C', 'SES', '12', 'S', '1036', '9839653313', 'prashanth_c_1991_10_5@google.com', '1991-10-05', 'SES12P1036', 'SES10L1004'),
('SES12S1037', 'DFV0411ZRT7HZ', 'PRASHANTH P', 'SES', '12', 'S', '1037', '9535794806', 'prashanth_p_1989_1_17@yahoo.co.in', '1989-01-17', 'SES12P1037', 'SES10L1004'),
('SES12S1038', 'WLM8811MOQ2WQ', 'PRATEEK JAIN', 'SES', '12', 'S', '1038', '8743953402', 'prateek_jain_1991_1_15@yahoo.co.in', '1991-01-15', 'SES12P1038', 'SES10L1001'),
('SES12S1039', 'ATS9611EMG3JX', 'PRATHIK K G', 'SES', '12', 'S', '1039', '7459630185', 'prathik_k_g_1989_1_21@rvce.edu.in', '1989-01-21', 'SES12P1039', 'SES10L1001'),
('SES12S1040', 'XXF8511JIU7RS', 'PRITHVI V S', 'SES', '12', 'S', '1040', '9830852323', 'prithvi_v_s_1989_6_20@google.com', '1989-06-20', 'SES12P1040', 'SES10L1001'),
('SES12S1041', 'EFT0711CIO8ZH', 'RACHIT SONI', 'SES', '12', 'S', '1041', '9676854067', 'rachit_soni_1991_12_5@yahoo.co.in', '1991-12-05', 'SES12P1041', 'SES10L1001'),
('SES12S1042', 'UBA8811DDJ9DQ', 'RAGHAVENDRA', 'SES', '12', 'S', '1042', '7469588466', 'raghavendra_1991_4_23@rvce.edu.in', '1991-04-23', 'SES12P1042', 'SES10L1001'),
('SES12S1043', 'CUI8611LAZ4EQ', 'RAHUL DAMODAR BHAT', 'SES', '12', 'S', '1043', '7585836746', 'rahul_damodar_bhat_1990_1_22@rvce.edu.in', '1990-01-22', 'SES12P1043', 'SES10L1001'),
('SES12S1044', 'OQL4211XMG3QX', 'RAHUL REDDY G', 'SES', '12', 'S', '1044', '9839917787', 'rahul_reddy_g_1990_9_24@google.com', '1990-09-24', 'SES12P1044', 'SES10L1001'),
('SES12S1045', 'ESL6911JCF6TC', 'RAJKUMAR S M', 'SES', '12', 'S', '1045', '9645661417', 'rajkumar_s_m_1989_9_23@google.com', '1989-09-23', 'SES12P1045', 'SES10L1001'),
('SES12S1046', 'KXM0811VCC5WF', 'RAKESH T U', 'SES', '12', 'S', '1046', '7835752031', 'rakesh_t_u_1990_8_28@yahoo.co.in', '1990-08-28', 'SES12P1046', 'SES10L1001'),
('SES12S1047', 'CPQ8711UVP0NW', 'RANJAN R', 'SES', '12', 'S', '1047', '9887938213', 'ranjan_r_1989_7_26@yahoo.co.in', '1989-07-26', 'SES12P1047', 'SES10L1001'),
('TIME12S1001', 'CBU2611ESR8RL', 'PRATIK V', 'TIME', '12', 'S', '1001', '8876832503', 'pratik_v_1989_7_20@google.com', '1989-07-20', 'TIME12P1001', 'TIME11L1001'),
('TIME12S1002', 'RKC8011GPS1GD', 'AISHWARYA SUKUMARAN', 'TIME', '12', 'S', '1002', '8767911892', 'aishwarya_sukumaran_1990_8_10@rvce.edu.in', '1990-08-10', 'TIME12P1002', 'TIME11L1001'),
('TIME12S1003', 'CHE9311LOA5VD', 'AALOK P BHAT', 'TIME', '12', 'S', '1003', '9802543437', 'aalok_p_bhat_1990_4_9@google.com', '1990-04-09', 'TIME12P1003', 'TIME11L1001'),
('TIME12S1004', 'EML1711WTU4PY', 'ABHAY RANJAN', 'TIME', '12', 'S', '1004', '9682777938', 'abhay_ranjan_1990_10_10@rvce.edu.in', '1990-10-10', 'TIME12P1004', 'TIME11L1001'),
('TIME12S1005', 'QBB8811YOQ4DO', 'ABHIJIT M', 'TIME', '12', 'S', '1005', '9914797551', 'abhijit_m_1991_12_9@rvce.edu.in', '1991-12-09', 'TIME12P1005', 'TIME11L1001'),
('TIME12S1006', 'VCT6911RFO1JC', 'ABHISHEK KUMAR SENGER', 'TIME', '12', 'S', '1006', '7656663801', 'abhishek_kumar_senger_1990_12_14@yahoo.co.in', '1990-12-14', 'TIME12P1006', 'TIME11L1001'),
('TIME12S1007', 'WQV5511NSC6BF', 'ABHISHEK SINGANAL', 'TIME', '12', 'S', '1007', '9813698076', 'abhishek_singanal_1989_2_28@yahoo.co.in', '1989-02-28', 'TIME12P1007', 'TIME11L1001'),
('TIME12S1008', 'FZU7511HLQ8NW', 'ADITYA D', 'TIME', '12', 'S', '1008', '9859759266', 'aditya_d_1990_10_2@yahoo.co.in', '1990-10-02', 'TIME12P1008', 'TIME11L1001'),
('TIME12S1009', 'CDD8611KHI3UE', 'ADRIT SINGH', 'TIME', '12', 'S', '1009', '9986548333', 'adrit_singh_1991_3_26@google.com', '1991-03-26', 'TIME12P1009', 'TIME11L1001'),
('TIME12S1010', 'QST4311DTS4NX', 'AKSHATHA SHRINIVAS', 'TIME', '12', 'S', '1010', '9845786941', 'akshatha_shrinivas_1990_12_3@google.com', '1990-12-03', 'TIME12P1010', 'TIME11L1001'),
('TIME12S1011', 'CGI5611MHK9VH', 'AMEYA PATIL', 'TIME', '12', 'S', '1011', '8784634635', 'ameya_patil_1991_3_11@yahoo.co.in', '1991-03-11', 'TIME12P1011', 'TIME11L1001'),
('TIME12S1012', 'YPG5211TVR6QY', 'ANANO SORAGANVI', 'TIME', '12', 'S', '1012', '7812593336', 'anano_soraganvi_1989_7_17@yahoo.co.in', '1989-07-17', 'TIME12P1012', 'TIME11L1001'),
('TIME12S1013', 'EVS6011LMT1DS', 'ANANTHA M S', 'TIME', '12', 'S', '1013', '8876658057', 'anantha_m_s_1991_9_12@google.com', '1991-09-12', 'TIME12P1013', 'TIME11L1001'),
('TIME12S1014', 'CEM7211XGA0KS', 'ANKITA JESWAL', 'TIME', '12', 'S', '1014', '9885896363', 'ankita_jeswal_1991_3_24@google.com', '1991-03-24', 'TIME12P1014', 'TIME11L1001'),
('TIME12S1015', 'BKZ8611XCR9MK', 'ASHAY SHRIDHAR PANSHIKAR', 'TIME', '12', 'S', '1015', '7738765695', 'ashay_shridhar_panshikar_1990_4_5@rvce.edu.in', '1990-04-05', 'TIME12P1015', 'TIME11L1001'),
('TIME12S1016', 'NTA3411YLC8XN', 'BASANAGOUDA S PATIL', 'TIME', '12', 'S', '1016', '9918697698', 'basanagouda_s_patil_1989_9_26@google.com', '1989-09-26', 'TIME12P1016', 'TIME11L1001'),
('TIME12S1017', 'ELC5811AYZ9WM', 'BHAGYASHREE A', 'TIME', '12', 'S', '1017', '9529804435', 'bhagyashree_a_1991_3_26@yahoo.co.in', '1991-03-26', 'TIME12P1017', 'TIME10L1004'),
('TIME12S1018', 'DIY6111YQD8MQ', 'BHARAT GUDIHAL', 'TIME', '12', 'S', '1018', '9702874938', 'bharat_gudihal_1989_11_5@yahoo.co.in', '1989-11-05', 'TIME12P1018', 'TIME10L1004'),
('TIME12S1019', 'JFW0311VQN6DD', 'CHITRANSHI GUPTA', 'TIME', '12', 'S', '1019', '8824665346', 'chitranshi_gupta_1989_7_12@rvce.edu.in', '1989-07-12', 'TIME12P1019', 'TIME10L1004'),
('TIME12S1020', 'ESB1011WVQ5YT', 'DARSHAN P ODEYAR', 'TIME', '12', 'S', '1020', '7599780427', 'darshan_p_odeyar_1989_7_11@yahoo.co.in', '1989-07-11', 'TIME12P1020', 'TIME10L1004'),
('TIME12S1021', 'MRC6711ZMK5LE', 'DEEP NARAYAN DUBEY', 'TIME', '12', 'S', '1021', '8870947867', 'deep_narayan_dubey_1990_7_16@google.com', '1990-07-16', 'TIME12P1021', 'TIME10L1004'),
('TIME12S1022', 'INT0311TMS2YW', 'DEEPAK KUMAR S', 'TIME', '12', 'S', '1022', '9904984162', 'deepak_kumar_s_1991_9_8@google.com', '1991-09-08', 'TIME12P1022', 'TIME10L1004'),
('TIME12S1023', 'YBM9311FLB4KY', 'DEEPAK RAMACHANDRA SHET', 'TIME', '12', 'S', '1023', '9702717195', 'deepak_ramachandra_shet_1990_8_13@google.com', '1990-08-13', 'TIME12P1023', 'TIME10L1004'),
('TIME12S1024', 'EMW1811CPX5ZW', 'DHANANJAY GOWDA N', 'TIME', '12', 'S', '1024', '7469966012', 'dhananjay_gowda_n_1991_9_6@rvce.edu.in', '1991-09-06', 'TIME12P1024', 'TIME10L1004'),
('TIME12S1025', 'ZKW0211YRE5QA', 'DIVYA VASANTHAM', 'TIME', '12', 'S', '1025', '9755866224', 'divya_vasantham_1991_8_21@google.com', '1991-08-21', 'TIME12P1025', 'TIME10L1004'),
('TIME12S1026', 'EDT2311SXN2OO', 'PRATHYUSHA PRAKASH GADDALAY', 'TIME', '12', 'S', '1026', '9869623271', 'prathyusha_prakash_gaddalay_1989_11_5@google.com', '1989-11-05', 'TIME12P1026', 'TIME10L1004');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `id` char(15) NOT NULL,
  `courseId` char(11) DEFAULT NULL,
  `subjectId` char(3) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courseId` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `courseId`, `subjectId`, `name`) VALUES
('BASE_IIT_CHE', 'BASE_IIT', 'CHE', 'Chemistry'),
('BASE_IIT_MAT', 'BASE_IIT', 'MAT', 'Mathematics'),
('BASE_IIT_PHY', 'BASE_IIT', 'PHY', 'Physics'),
('TIME_CET_CHE', 'TIME_CET', 'CHE', 'Chemistry'),
('TIME_CET_MAT', 'TIME_CET', 'MAT', 'Mathematics'),
('TIME_CET_PHY', 'TIME_CET', 'PHY', 'Physics');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE IF NOT EXISTS `unit` (
  `id` char(19) NOT NULL,
  `subjectId` char(15) DEFAULT NULL,
  `unitNumber` char(3) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subjectId` (`subjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `subjectId`, `unitNumber`, `name`) VALUES
('BASE_IIT_MAT_1', 'BASE_IIT_MAT', '1', 'Calculus'),
('BASE_IIT_MAT_2', 'BASE_IIT_MAT', '2', 'Algebra'),
('BASE_IIT_MAT_3', 'BASE_IIT_MAT', '3', 'Trignometry'),
('TIME_CET_PHY_1', 'TIME_CET_PHY', '1', 'Optics'),
('TIME_CET_PHY_2', 'TIME_CET_PHY', '2', 'Magnetism'),
('TIME_CET_PHY_3', 'TIME_CET_PHY', '3', 'Electricity');

-- --------------------------------------------------------

--
-- Stand-in structure for view `user`
--
CREATE TABLE IF NOT EXISTS `user` (
`id` char(12)
);
-- --------------------------------------------------------

--
-- Structure for view `questionstatistics`
--
DROP TABLE IF EXISTS `questionstatistics`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `questionstatistics` AS select distinct `q`.`id` AS `id`,(select count(0) from `answeredquestion` `a1` where (`a1`.`questionId` = `q`.`id`)) AS `count_total`,(select count(0) from `answeredquestion` `a2` where ((`a2`.`questionId` = `q`.`id`) and (`a2`.`studentId`,`a2`.`questionId`) in (select `a1`.`studentId`,`a1`.`questionId` from (`answeredquestion` `a1` join `question` `q1`) where ((`a1`.`questionId` = `q1`.`id`) and (isnull(`q1`.`answerText_1`) or (`a1`.`answerText_1` = `q1`.`answerText_1`)) and (isnull(`q1`.`answerText_2`) or (`a1`.`answerText_2` = `q1`.`answerText_2`)) and (isnull(`q1`.`answerText_3`) or (`a1`.`answerText_3` = `q1`.`answerText_3`)) and (isnull(`q1`.`answerText_4`) or (`a1`.`answerText_4` = `q1`.`answerText_4`)) and (isnull(`q1`.`answerText_5`) or (`a1`.`answerText_5` = `q1`.`answerText_5`)))))) AS `count_correct`,(select count(0) from `answeredquestion` `a2` where ((`a2`.`questionId` = `q`.`id`) and (not((`a2`.`studentId`,`a2`.`questionId`) in (select `a1`.`studentId`,`a1`.`questionId` from (`answeredquestion` `a1` join `question` `q1`) where ((`a1`.`questionId` = `q1`.`id`) and (isnull(`q1`.`answerText_1`) or (`a1`.`answerText_1` = `q1`.`answerText_1`)) and (isnull(`q1`.`answerText_2`) or (`a1`.`answerText_2` = `q1`.`answerText_2`)) and (isnull(`q1`.`answerText_3`) or (`a1`.`answerText_3` = `q1`.`answerText_3`)) and (isnull(`q1`.`answerText_4`) or (`a1`.`answerText_4` = `q1`.`answerText_4`)) and (isnull(`q1`.`answerText_5`) or (`a1`.`answerText_5` = `q1`.`answerText_5`)))))))) AS `count_incorrect`,`q`.`suggestedTime` AS `suggestedTime`,(select avg(`a2`.`takenTime`) AS `c_avgTime` from `answeredquestion` `a2` where ((`a2`.`questionId` = `q`.`id`) and (`a2`.`studentId`,`a2`.`questionId`) in (select `a1`.`studentId`,`a1`.`questionId` from (`answeredquestion` `a1` join `question` `q1`) where ((`a1`.`questionId` = `q1`.`id`) and (isnull(`q1`.`answerText_1`) or (`a1`.`answerText_1` = `q1`.`answerText_1`)) and (isnull(`q1`.`answerText_2`) or (`a1`.`answerText_2` = `q1`.`answerText_2`)) and (isnull(`q1`.`answerText_3`) or (`a1`.`answerText_3` = `q1`.`answerText_3`)) and (isnull(`q1`.`answerText_4`) or (`a1`.`answerText_4` = `q1`.`answerText_4`)) and (isnull(`q1`.`answerText_5`) or (`a1`.`answerText_5` = `q1`.`answerText_5`))))) group by `a2`.`questionId` union select 0 AS `c_avgTime` from `question` `q2` where ((`q2`.`id` = `q`.`id`) and (not(`q2`.`id` in (select `a1`.`questionId` from (`answeredquestion` `a1` join `question` `q1`) where ((`a1`.`questionId` = `q1`.`id`) and (isnull(`q1`.`answerText_1`) or (`a1`.`answerText_1` = `q1`.`answerText_1`)) and (isnull(`q1`.`answerText_2`) or (`a1`.`answerText_2` = `q1`.`answerText_2`)) and (isnull(`q1`.`answerText_3`) or (`a1`.`answerText_3` = `q1`.`answerText_3`)) and (isnull(`q1`.`answerText_4`) or (`a1`.`answerText_4` = `q1`.`answerText_4`)) and (isnull(`q1`.`answerText_5`) or (`a1`.`answerText_5` = `q1`.`answerText_5`)))))))) AS `c_avgTime`,(select avg(`a2`.`takenTime`) AS `a_avgTime` from `answeredquestion` `a2` where ((`a2`.`questionId` = `q`.`id`) and `a2`.`questionId` in (select `a1`.`questionId` from `answeredquestion` `a1` where (`a1`.`questionId` = `q`.`id`))) group by `a2`.`questionId` union select 0 AS `a_avgTime` from `question` `q2` where ((`q2`.`id` = `q`.`id`) and (not(`q2`.`id` in (select `a1`.`questionId` from `answeredquestion` `a1` where (`a1`.`questionId` = `q`.`id`)))))) AS `a_avgTime` from `question` `q`;

-- --------------------------------------------------------

--
-- Structure for view `user`
--
DROP TABLE IF EXISTS `user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user` AS select `student`.`id` AS `id` from `student` union select `staff`.`id` AS `id` from `staff`;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answeredquestion`
--
ALTER TABLE `answeredquestion`
  ADD CONSTRAINT `answeredquestion_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `answeredquestion_ibfk_2` FOREIGN KEY (`questionId`) REFERENCES `question` (`id`);

--
-- Constraints for table `chapter`
--
ALTER TABLE `chapter`
  ADD CONSTRAINT `chapter_ibfk_1` FOREIGN KEY (`unitId`) REFERENCES `unit` (`id`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`institutionId`) REFERENCES `institution` (`id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`chapterId`) REFERENCES `chapter` (`id`);

--
-- Constraints for table `registeredcourse`
--
ALTER TABLE `registeredcourse`
  ADD CONSTRAINT `registeredcourse_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `registeredcourse_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`institutionId`) REFERENCES `institution` (`id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`institutionId`) REFERENCES `institution` (`id`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`parentId`) REFERENCES `parent` (`id`);

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`);

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
