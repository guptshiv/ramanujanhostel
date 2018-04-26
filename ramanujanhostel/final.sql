drop database ramanujan_test;
create database ramanujan_test;
use ramanujan_test;



CREATE TABLE `branch` (
  `department` varchar(100) NOT NULL,
  `course` varchar(10) NOT NULL,
  `year` int(10) unsigned NOT NULL,
  `strength` int(11) NOT NULL,
  PRIMARY KEY (`department`,`course`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#LOCK TABLES `branch` WRITE;
INSERT INTO `branch` VALUES 
('Computer Engineering','B.E.',1,100),
('Electronics and Communication Engineering','B.E.',1,100),
('Instrumentation and Control Engineering','B.E.',1,50),
('Manufacturing Processing and Automation Engineering','B.E.',1,50);
#UNLOCK TABLES;






CREATE TABLE `hostel` (
  `name` varchar(100) NOT NULL,
  `capacity` int(10) unsigned NOT NULL,
  `head_warden` varchar(50) NOT NULL,
  `head_warden_email` varchar(50) NOT NULL,
  `head_warden_passwd` varchar(50) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#LOCK TABLES `hostel` WRITE;
INSERT INTO `hostel` VALUES 
('Ramanujan Hostel',350,'S.P. Singh','spsingh@nsit.ac.in','spsingh123','M');
#UNLOCK TABLES;






CREATE TABLE `resides_in` (
  `hostel_name` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `course` varchar(10) NOT NULL,
  `year` int(10) unsigned NOT NULL,
  `strength` int(10) unsigned NOT NULL,
  `range_start` int(10) unsigned NOT NULL,
  `range_end` int(10) unsigned NOT NULL,
  `seater` int(10) unsigned DEFAULT '2',
  PRIMARY KEY (`hostel_name`,`department`,`course`,`year`),
  KEY `fk_resides_br` (`department`,`course`,`year`),
  CONSTRAINT `fk_resides_br` FOREIGN KEY (`department`, `course`, `year`) REFERENCES `branch` (`department`, `course`, `year`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_resides_host` FOREIGN KEY (`hostel_name`) REFERENCES `hostel` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#LOCK TABLES `resides_in` WRITE;
INSERT INTO `resides_in` VALUES
('Ramanujan Hostel','Computer Engineering',                               'B.E.',1,100,  1,100,1),
('Ramanujan Hostel','Electronics and Communication Engineering',          'B.E.',1,100,101,200,1),
('Ramanujan Hostel','Instrumentation and Control Engineering',            'B.E.',1, 50,201,250,1),
('Ramanujan Hostel','Manufacturing Processing and Automation Engineering','B.E.',1, 50,251,300,1);
#UNLOCK TABLES;





CREATE TABLE `student` (
  `name` varchar(50) NOT NULL,
  `roll_num` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mess_fee_receipt_num` varchar(20) NOT NULL,
  `contact_num` varchar(13) NOT NULL,
  `department` varchar(100) NOT NULL,
  `course` varchar(10) NOT NULL,
  `year` int(10) unsigned NOT NULL,
  `local_guardian_name` varchar(50) NOT NULL,
  `local_guardian_contact` varchar(13) NOT NULL,
  `local_guardian_address` varchar(300) NOT NULL,
  `bank_account_number` varchar(100) DEFAULT NULL,
  `hostel_name` varchar(100) NOT NULL,
  PRIMARY KEY (`roll_num`),
  UNIQUE KEY `roll_num` (`roll_num`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mess_fee_receipt_num` (`mess_fee_receipt_num`),
  KEY `fk_stud_br` (`department`,`course`,`year`),
  KEY `fk_stud_host` (`hostel_name`),
  CONSTRAINT `fk_stud_br` FOREIGN KEY (`department`, `course`, `year`) REFERENCES `branch` (`department`, `course`, `year`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stud_host` FOREIGN KEY (`hostel_name`) REFERENCES `hostel` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#LOCK TABLES `student` WRITE;
INSERT INTO `student` VALUES 
('Siddharth Gaur',    '215',   'siddharthgaur@nsit.ac.in','9632114','9599566167','Electronics and Communication Engineering','B.E.',1,'Sindhu',   '9448235700','Rajgir Chowraha',      '5920825583627','Ramanujan Hostel'),
('Shubhankar Sinha',  '216', 'shubhankarsinha@nsit.ac.in','1960503','9811594496','Electronics and Communication Engineering','B.E.',1,'Malik',    '7309254715','Shurma Gate',          '4335287181893','Ramanujan Hostel'),
('Sameer Garg',       '344',      'sameergarg@nsit.ac.in','7581694','9685674498','Computer Engineering',					    'B.E.',1,'Kush',     '7048794668','Lanka Gate',           '6492445484036','Ramanujan Hostel'),
('Shivam Garg',      '361',      'shivamgarg@nsit.ac.in','3326576','8165182287','Computer Engineering',					    'B.E.',1,'Lajpath',  '8303675653','Indira Chowk',         '4365462909220','Ramanujan Hostel'),
('Shivam Gupta',      '362',     'shivamgupta@nsit.ac.in','5862650','9888702212','Computer Engineering',					    'B.E.',1,'Ramesh',   '7902685222','Malaviya Bhawan',      '5240510631818','Ramanujan Hostel'),
('Shubham Garg',      '365',     'shubhamgarg@nsit.ac.in','2355177','9879841220','Computer Engineering',                     'B.E.',1,'Sachin',   '9544136616','Subhash C. Bose Nagar','8810223464155','Ramanujan Hostel'),
('Shubham Kumar',     '367',    'shubhamkumar@nsit.ac.in','1607295','8529604792','Computer Engineering',                     'B.E.',1,'Rajendra', '9745392489','Lanka Gate',           '3196262099548','Ramanujan Hostel'),
('Shubham Roy',       '368',      'shubhamroy@nsit.ac.in','6100954','8135557115','Computer Engineering',					    'B.E.',1,'Raja Jain','7822639935','Subhash C. Bose Nagar','3934846602613','Ramanujan Hostel'),
('Vishu Rao',         '700',        'vishurao@nsit.ac.in','6792031','8816788259','Instrumentation and Control Engineering',  'B.E.',1,'Rahgir',   '9129143543','Kabir Colony',         '9304919464513','Ramanujan Hostel');
#UNLOCK TABLES;






CREATE TABLE `room` (
  `number` int(10) unsigned NOT NULL,
  `roll_num` varchar(15) NOT NULL,
  `hostel_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`roll_num`),
  UNIQUE KEY `roll_num` (`roll_num`),
  KEY `fk_room_hostel` (`hostel_name`),
  CONSTRAINT `fk_room_stud` FOREIGN KEY (`roll_num`) REFERENCES `student` (`roll_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_room_hostel` FOREIGN KEY (`hostel_name`) REFERENCES `hostel` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `room` WRITE;
INSERT INTO `room` VALUES 
(135,'215','Ramanujan Hostel'),
(139,'216','Ramanujan Hostel'),
(29, '344','Ramanujan Hostel'),
(42, '361','Ramanujan Hostel'),
(11, '362','Ramanujan Hostel'),
(23, '365','Ramanujan Hostel'),
(56, '367','Ramanujan Hostel'),
(69, '368','Ramanujan Hostel'),
(232,'700','Ramanujan Hostel');
UNLOCK TABLES;





CREATE TABLE `student_id` (
  `roll_num` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `passwd` varchar(40) NOT NULL,
  PRIMARY KEY (`roll_num`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
#LOCK TABLES `student_id` WRITE;
INSERT INTO `student_id` VALUES 
('215',  'siddharthgaur@nsit.ac.in',    'siddharthgaur123'),
('216','shubhankarsinha@nsit.ac.in',  'shubhankarsinha123'),
('344',     'sameergarg@nsit.ac.in',       'sameergarg123'),
('361',     'shivamgarg@nsit.ac.in',       'shivamgarg123'),
('362',    'shivamgupta@nsit.ac.in',      'shivamgupta123'),
('365',    'shubhamgarg@nsit.ac.in',      'shubhamgarg123'),
('367',   'shubhamkumar@nsit.ac.in',     'shubhamkumar123'),
('368',     'shubhamroy@nsit.ac.in',       'shubhamroy123'),
('372',    'siddheshwar@nsit.ac.in',      'siddheshwar123'),
('380',     'sumityadav@nsit.ac.in',       'sumityadav123'),
('381',    'swarajkumar@nsit.ac.in',      'swarajkumar123'),
('401',    'vigneshiyer@nsit.ac.in',      'vigneshiyer123'),
('402',   'vikasgoswami@nsit.ac.in',     'vikasgoswami123'),
('700',       'vishurao@nsit.ac.in',         'vishurao123');
#UNLOCK TABLES;
