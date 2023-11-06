-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2023 at 03:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4
create database contonso_school;

use contonso_school;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `consonso_school`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddCourse` (IN `CourseID` INT, IN `Title` VARCHAR(100), IN `Credits` INT, IN `DepartmentID` INT)   BEGIN
    INSERT INTO Course (CourseID, Title, Credits, DepartmentID)
    VALUES (CourseID, Title, Credits, DepartmentID);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddGrade` (IN `StudentIDToAdd` INT, IN `CourseIDToAdd` INT, IN `NewGrade` DECIMAL(3,2))   BEGIN
    INSERT INTO StudentGrade (StudentID, CourseID, Grade)
    VALUES (StudentIDToAdd, CourseIDToAdd, NewGrade)
    ON DUPLICATE KEY UPDATE Grade = NewGrade;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddInstructor` (IN `FirstName` VARCHAR(50), IN `LastName` VARCHAR(50), IN `HireDate` DATETIME, IN `EnrollmentDate` DATETIME, IN `Discriminator` VARCHAR(50))   BEGIN
    INSERT INTO Person (FirstName, LastName, HireDate, EnrollmentDate, Discriminator)
    VALUES (FirstName, LastName, HireDate, EnrollmentDate, Discriminator);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddStudent` (IN `FirstName` VARCHAR(50), IN `LastName` VARCHAR(50), IN `EnrollmentDate` DATETIME, IN `Discriminator` VARCHAR(50))   BEGIN
    INSERT INTO Person (FirstName, LastName, EnrollmentDate, Discriminator)
    VALUES (FirstName, LastName, EnrollmentDate, Discriminator);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditCourse` (IN `CourseIDToUpdate` INT, IN `NewTitle` VARCHAR(100), IN `NewCredits` INT, IN `NewDepartmentID` INT)   BEGIN
    UPDATE Course
    SET Title = NewTitle,
        Credits = NewCredits,
        DepartmentID = NewDepartmentID
    WHERE CourseID = CourseIDToUpdate;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditInstructor` (IN `InstructorID` INT, IN `FirstName` VARCHAR(50), IN `LastName` VARCHAR(50), IN `HireDate` DATETIME, IN `Discriminator` VARCHAR(50))   BEGIN
    UPDATE Person
    SET
        FirstName = FirstName,
        LastName = LastName,
        HireDate = HireDate,
        Discriminator = Discriminator
    WHERE PersonID = InstructorID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EditStudent` (IN `StudentID` INT, IN `FirstName` VARCHAR(50), IN `LastName` VARCHAR(50), IN `EnrollmentDate` DATETIME, IN `Discriminator` VARCHAR(50))   BEGIN
    UPDATE Person
    SET
        FirstName = FirstName,
        LastName = LastName,
        EnrollmentDate = EnrollmentDate ,
        Discriminator = Discriminator
    WHERE PersonID = StudentID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EnrollStudent` (IN `StudentIDToAdd` INT, IN `CourseIDToEnroll` INT, IN `Grade` DECIMAL(3,2))   BEGIN
    INSERT INTO StudentGrade (CourseID, StudentID, Grade)
    VALUES (CourseIDToEnroll, StudentIDToAdd, Grade);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetClassList` (IN `CourseIDToRetrieve` INT)   BEGIN
    SELECT P.PersonID, P.LastName, P.FirstName
    FROM StudentGrade SG
    INNER JOIN Person P ON SG.StudentID = P.PersonID
    WHERE SG.CourseID = CourseIDToRetrieve;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetStudentGrades` (IN `StudentIDToRetrieve` INT)   BEGIN
    SELECT
        C.Title AS CourseTitle,
        SG.Grade
    FROM
        StudentGrade AS SG
    JOIN
        Course AS C ON SG.CourseID = C.CourseID
    WHERE
        SG.StudentID = StudentIDToRetrieve;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetStudentTranscript` (IN `StudentIDToRetrieve` INT)   BEGIN
    SELECT
        C.Title AS CourseTitle,
        SG.Grade
    FROM
        StudentGrade AS SG
    JOIN
        Course AS C ON SG.CourseID = C.CourseID
    WHERE
        SG.StudentID = StudentIDToRetrieve;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `CourseID` int(11) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Credits` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseID`, `Title`, `Credits`, `DepartmentID`) VALUES
(1, 'Introduction to Programming', 3, 1),
(2, 'Quantum Mechanics', 4, 2),
(3, 'Calculus I', 4, 3),
(4, 'Organic Chemistry', 4, 4),
(5, 'Cell Biology', 3, 5),
(6, 'Digital Electronics', 3, 6),
(7, 'American History', 4, 7),
(8, 'Intro to Psychology', 4, 8),
(9, 'English Literature', 4, 9),
(10, 'Sociology 101', 3, 10),
(101, 'SQL Fundamentals', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `courseinstructor`
--

CREATE TABLE `courseinstructor` (
  `CourseID` int(11) NOT NULL,
  `PersonID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courseinstructor`
--

INSERT INTO `courseinstructor` (`CourseID`, `PersonID`) VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105),
(6, 109),
(7, 109),
(8, 109),
(9, 109),
(10, 109);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DepartmentID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Budget` decimal(19,4) NOT NULL,
  `StartDate` datetime NOT NULL,
  `Administrator` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepartmentID`, `Name`, `Budget`, `StartDate`, `Administrator`) VALUES
(1, 'Computer Science', 100000.0000, '2023-01-01 00:00:00', 101),
(2, 'Physics', 80000.0000, '2023-02-15 00:00:00', 102),
(3, 'Mathematics', 75000.0000, '2023-03-10 00:00:00', 103),
(4, 'Chemistry', 90000.0000, '2023-04-20 00:00:00', 104),
(5, 'Biology', 85000.0000, '2023-05-30 00:00:00', 105),
(6, 'Electrical Engineering', 95000.0000, '2023-06-15 00:00:00', 106),
(7, 'History', 70000.0000, '2023-07-20 00:00:00', 107),
(8, 'Psychology', 72000.0000, '2023-08-10 00:00:00', 108),
(9, 'English', 68000.0000, '2023-09-05 00:00:00', 109),
(10, 'Sociology', 73000.0000, '2023-10-12 00:00:00', 110);

-- --------------------------------------------------------

--
-- Table structure for table `officeassignment`
--

CREATE TABLE `officeassignment` (
  `InstructorID` int(11) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `officeassignment`
--

INSERT INTO `officeassignment` (`InstructorID`, `Location`, `TimeStamp`) VALUES
(101, 'Room 101A', '2023-10-17 13:19:17'),
(102, 'Room 202B', '2023-10-17 13:19:17'),
(103, 'Room 303C', '2023-10-17 13:19:17'),
(104, 'Room 404D', '2023-10-17 13:19:17'),
(105, 'Room 505E', '2023-10-17 13:19:17'),
(106, 'Room 606F', '2023-10-17 13:19:59'),
(107, 'Room 707G', '2023-10-17 13:19:59'),
(108, 'Room 808H', '2023-10-17 13:19:59'),
(109, 'Room 909I', '2023-10-17 13:19:59'),
(110, 'Room 101J', '2023-10-17 13:19:59');

-- --------------------------------------------------------

--
-- Table structure for table `onlinecourse`
--

CREATE TABLE `onlinecourse` (
  `CourseID` int(11) NOT NULL,
  `Url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `onlinecourse`
--

INSERT INTO `onlinecourse` (`CourseID`, `Url`) VALUES
(1, 'http://www.example.com/course1'),
(2, 'http://www.example.com/course2'),
(3, 'http://www.example.com/course3'),
(4, 'http://www.example.com/course4'),
(5, 'http://www.example.com/course5'),
(6, 'http://www.example.com/course6'),
(7, 'http://www.example.com/course7'),
(8, 'http://www.example.com/course8'),
(9, 'http://www.example.com/course9'),
(10, 'http://www.example.com/course10');

-- --------------------------------------------------------

--
-- Table structure for table `onsitecourse`
--

CREATE TABLE `onsitecourse` (
  `CourseID` int(11) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Days` varchar(50) NOT NULL,
  `Time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `onsitecourse`
--

INSERT INTO `onsitecourse` (`CourseID`, `Location`, `Days`, `Time`) VALUES
(1, 'Campus A', 'Mon/Wed', '2023-07-05 09:00:00'),
(2, 'Campus B', 'Tue/Thu', '2023-07-06 10:30:00'),
(3, 'Campus C', 'Mon/Wed', '2023-07-05 14:00:00'),
(4, 'Campus D', 'Tue/Thu', '2023-07-06 16:00:00'),
(5, 'Campus E', 'Mon/Wed', '2023-07-05 13:30:00'),
(6, 'Campus F', 'Tue/Thu', '2023-08-15 10:00:00'),
(7, 'Campus G', 'Mon/Wed', '2023-09-12 13:00:00'),
(8, 'Campus H', 'Tue/Thu', '2023-10-10 11:30:00'),
(9, 'Campus I', 'Mon/Wed', '2023-11-14 09:30:00'),
(10, 'Campus J', 'Tue/Thu', '2023-12-15 14:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `PersonID` int(11) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `HireDate` datetime DEFAULT NULL,
  `EnrollmentDate` datetime DEFAULT NULL,
  `Discriminator` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`PersonID`, `LastName`, `FirstName`, `HireDate`, `EnrollmentDate`, `Discriminator`) VALUES
(0, 'Smith', 'Jane', NULL, '2023-11-03 11:00:00', 'Student'),
(101, 'Smith', 'John', '2020-05-15 00:00:00', '2020-05-15 00:00:00', 'Instructor'),
(102, 'Johnson', 'Alice', '2019-09-20 00:00:00', '2020-01-10 00:00:00', 'Instructor'),
(103, 'Brown', 'Robert', '2021-02-18 00:00:00', NULL, 'Student'),
(104, 'Wilson', 'Emily', '2021-04-02 00:00:00', NULL, 'Student'),
(105, 'Lee', 'Michael', '2022-03-10 00:00:00', NULL, 'Student'),
(106, 'Martinez', 'Maria', '2021-07-01 00:00:00', NULL, 'Student'),
(107, 'Gonzalez', 'Carlos', '2022-03-15 00:00:00', NULL, 'Student'),
(108, 'Hernandez', 'Andrea', '2022-05-20 00:00:00', NULL, 'Student'),
(109, 'Lopez', 'David', '2019-11-10 00:00:00', '2020-02-01 00:00:00', 'Instructor'),
(110, 'Torres', 'Sophia', '2020-10-05 00:00:00', NULL, 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `studentgrade`
--

CREATE TABLE `studentgrade` (
  `EnrollmentID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `Grade` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studentgrade`
--

INSERT INTO `studentgrade` (`EnrollmentID`, `CourseID`, `StudentID`, `Grade`) VALUES
(1, 1, 103, 3.50),
(2, 2, 104, 4.00),
(3, 3, 105, 3.70),
(4, 4, 103, 3.00),
(5, 5, 104, 3.90),
(6, 6, 106, 3.30),
(7, 7, 107, 3.80),
(8, 8, 108, 4.00),
(9, 9, 106, 3.50),
(10, 10, 107, 3.90);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CourseID`),
  ADD KEY `DepartmentID` (`DepartmentID`);

--
-- Indexes for table `courseinstructor`
--
ALTER TABLE `courseinstructor`
  ADD PRIMARY KEY (`CourseID`,`PersonID`),
  ADD KEY `PersonID` (`PersonID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Indexes for table `officeassignment`
--
ALTER TABLE `officeassignment`
  ADD PRIMARY KEY (`InstructorID`);

--
-- Indexes for table `onlinecourse`
--
ALTER TABLE `onlinecourse`
  ADD PRIMARY KEY (`CourseID`);

--
-- Indexes for table `onsitecourse`
--
ALTER TABLE `onsitecourse`
  ADD PRIMARY KEY (`CourseID`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`PersonID`);

--
-- Indexes for table `studentgrade`
--
ALTER TABLE `studentgrade`
  ADD PRIMARY KEY (`EnrollmentID`),
  ADD KEY `CourseID` (`CourseID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `Course_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`);

--
-- Constraints for table `courseinstructor`
--
ALTER TABLE `courseinstructor`
  ADD CONSTRAINT `CourseInstructor_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`),
  ADD CONSTRAINT `CourseInstructor_ibfk_2` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`);

--
-- Constraints for table `officeassignment`
--
ALTER TABLE `officeassignment`
  ADD CONSTRAINT `OfficeAssignment_ibfk_1` FOREIGN KEY (`InstructorID`) REFERENCES `person` (`PersonID`);

--
-- Constraints for table `onlinecourse`
--
ALTER TABLE `onlinecourse`
  ADD CONSTRAINT `OnlineCourse_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`);

--
-- Constraints for table `onsitecourse`
--
ALTER TABLE `onsitecourse`
  ADD CONSTRAINT `OnsiteCourse_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`);

--
-- Constraints for table `studentgrade`
--
ALTER TABLE `studentgrade`
  ADD CONSTRAINT `StudentGrade_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`),
  ADD CONSTRAINT `StudentGrade_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `person` (`PersonID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
