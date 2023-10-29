-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2023 at 10:03 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `ClassID` int(11) NOT NULL,
  `ClassName` varchar(100) DEFAULT NULL,
  `RoomNumber` varchar(20) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `TeacherID` int(11) DEFAULT NULL,
  `Schedule` varchar(100) DEFAULT NULL,
  `Semester` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`ClassID`, `ClassName`, `RoomNumber`, `CourseID`, `TeacherID`, `Schedule`, `Semester`) VALUES
(1, 'Math 101-A', 'Room 101', 1, 1, 'MWF 9:00 AM - 10:00 AM', 'Fall 2023'),
(2, 'Biology 101-B', 'Room 102', 2, 2, 'TTH 10:30 AM - 12:00 PM', 'Fall 2023'),
(3, 'English 101-A', 'Room 103', 3, 3, 'MWF 1:30 PM - 3:00 PM', 'Fall 2023'),
(4, 'History 101-A', 'Room 104', 4, 4, 'TTH 1:30 PM - 3:00 PM', 'Fall 2023'),
(5, 'Physics 101-C', 'Room 105', 5, 5, 'MWF 10:30 AM - 12:00 PM', 'Fall 2023'),
(6, 'Chemistry 101-B', 'Room 106', 6, 6, 'MWF 2:00 PM - 3:30 PM', 'Fall 2023'),
(7, 'Art 101-A', 'Room 107', 7, 7, 'TTH 9:00 AM - 10:30 AM', 'Fall 2023'),
(8, 'Physical Education 101-A', 'Gymnasium', 8, 8, 'TTH 3:30 PM - 5:00 PM', 'Fall 2023'),
(9, 'Music 101-A', 'Music Room', 9, 9, 'MWF 11:00 AM - 12:30 PM', 'Fall 2023'),
(10, 'Computer Science 101-A', 'Computer Lab', 10, 10, 'MWF 2:00 PM - 3:30 PM', 'Fall 2023'),
(11, 'Statistics 101-A', 'Room 201', 11, 11, 'MWF 9:00 AM - 10:00 AM', 'Fall 2023'),
(12, 'Physical Education 102-A', 'Gymnasium', 12, 12, 'TTH 10:30 AM - 12:00 PM', 'Fall 2023'),
(13, 'Web Development 101-B', 'Computer Lab', 13, 13, 'MWF 1:30 PM - 3:00 PM', 'Fall 2023'),
(14, 'Algebra 101-A', 'Room 202', 14, 14, 'TTH 1:30 PM - 3:00 PM', 'Fall 2023'),
(15, 'Chemistry 102-B', 'Lab 301', 15, 15, 'MWF 10:30 AM - 12:00 PM', 'Fall 2023'),
(16, 'Literature 101-A', 'Room 203', 16, 16, 'MWF 2:00 PM - 3:30 PM', 'Fall 2023'),
(17, 'Geography 101-A', 'Room 204', 17, 17, 'TTH 9:00 AM - 10:30 AM', 'Fall 2023'),
(18, 'Biology 102-A', 'Lab 302', 18, 18, 'TTH 3:30 PM - 5:00 PM', 'Fall 2023'),
(19, 'Physics 102-B', 'Lab 303', 19, 19, 'MWF 11:00 AM - 12:30 PM', 'Fall 2023'),
(20, 'Art History 101-A', 'Room 205', 20, 20, 'MWF 2:00 PM - 3:30 PM', 'Fall 2023'),
(21, 'Economics 101-A', 'Room 301', 11, 21, 'MWF 9:00 AM - 10:00 AM', 'Fall 2023'),
(22, 'Sociology 101-A', 'Room 302', 12, 22, 'TTH 10:30 AM - 12:00 PM', 'Fall 2023'),
(23, 'Political Science 101-A', 'Room 303', 13, 23, 'MWF 1:30 PM - 3:00 PM', 'Fall 2023'),
(24, 'Psychology 101-A', 'Room 304', 14, 24, 'TTH 1:30 PM - 3:00 PM', 'Fall 2023'),
(25, 'Business 101-A', 'Room 305', 15, 25, 'MWF 10:30 AM - 12:00 PM', 'Fall 2023'),
(26, 'Philosophy 101-A', 'Room 306', 16, 26, 'MWF 2:00 PM - 3:30 PM', 'Fall 2023'),
(27, 'Foreign Language 101-A', 'Room 307', 17, 27, 'TTH 9:00 AM - 10:30 AM', 'Fall 2023'),
(28, 'Marketing 101-A', 'Room 308', 18, 28, 'TTH 3:30 PM - 5:00 PM', 'Fall 2023'),
(29, 'Finance 101-A', 'Room 309', 19, 29, 'MWF 11:00 AM - 12:30 PM', 'Fall 2023'),
(30, 'Environmental Science 101-A', 'Room 310', 20, 30, 'MWF 2:00 PM - 3:30 PM', 'Fall 2023');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `CourseID` int(11) NOT NULL,
  `CourseName` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Credits` int(11) DEFAULT NULL,
  `TeacherID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`CourseID`, `CourseName`, `Description`, `Credits`, `TeacherID`) VALUES
(1, 'Math 101', 'Introduction to Mathematics', 3, 1),
(2, 'Biology 101', 'Introduction to Biology', 4, 2),
(3, 'English 101', 'Introduction to English Literature', 3, 3),
(4, 'History 101', 'Introduction to World History', 3, 4),
(5, 'Physics 101', 'Introduction to Physics', 4, 5),
(6, 'Chemistry 101', 'Introduction to Chemistry', 4, 6),
(7, 'Art 101', 'Introduction to Art', 3, 7),
(8, 'Physical Education 101', 'Physical Education Fundamentals', 2, 8),
(9, 'Music 101', 'Introduction to Music Theory', 3, 9),
(10, 'Computer Science 101', 'Introduction to Programming', 4, 10),
(11, 'Statistics 101', 'Introduction to Statistics', 3, 11),
(12, 'Physical Education 102', 'Intermediate Physical Education', 2, 12),
(13, 'Web Development 101', 'Introduction to Web Development', 4, 13),
(14, 'Algebra 101', 'Introduction to Algebra', 3, 14),
(15, 'Chemistry 102', 'Intermediate Chemistry', 4, 15),
(16, 'Literature 101', 'Introduction to Literature', 3, 16),
(17, 'Geography 101', 'Introduction to Geography', 3, 17),
(18, 'Biology 102', 'Intermediate Biology', 4, 18),
(19, 'Physics 102', 'Intermediate Physics', 4, 19),
(20, 'Art History 101', 'Introduction to Art History', 3, 20),
(21, 'Economics 101', 'Introduction to Economics', 3, 21),
(22, 'Sociology 101', 'Introduction to Sociology', 3, 22),
(23, 'Political Science 101', 'Introduction to Political Science', 3, 23),
(24, 'Psychology 101', 'Introduction to Psychology', 3, 24),
(25, 'Business 101', 'Introduction to Business', 3, 25),
(26, 'Philosophy 101', 'Introduction to Philosophy', 3, 26),
(27, 'Foreign Language 101', 'Introduction to Foreign Languages', 3, 27),
(28, 'Marketing 101', 'Introduction to Marketing', 3, 28),
(29, 'Finance 101', 'Introduction to Finance', 3, 29),
(30, 'Environmental Science 101', 'Introduction to Environmental Science', 3, 30);

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `EnrollmentID` int(11) NOT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL,
  `EnrollmentDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`EnrollmentID`, `StudentID`, `ClassID`, `EnrollmentDate`) VALUES
(1, 1, 1, '2023-08-20'),
(2, 2, 2, '2023-08-20'),
(3, 3, 3, '2023-08-20'),
(4, 4, 4, '2023-08-20'),
(5, 5, 5, '2023-08-20'),
(6, 6, 6, '2023-08-20'),
(7, 7, 7, '2023-08-20'),
(8, 8, 8, '2023-08-20'),
(9, 9, 9, '2023-08-20'),
(10, 10, 10, '2023-08-20'),
(11, 11, 11, '2023-08-20'),
(12, 12, 12, '2023-08-20'),
(13, 13, 13, '2023-08-20'),
(14, 14, 14, '2023-08-20'),
(15, 15, 15, '2023-08-20'),
(16, 16, 16, '2023-08-20'),
(17, 17, 17, '2023-08-20'),
(18, 18, 18, '2023-08-20'),
(19, 19, 19, '2023-08-20'),
(20, 20, 20, '2023-08-20'),
(21, 11, 11, '2023-08-20'),
(22, 12, 12, '2023-08-20'),
(23, 13, 13, '2023-08-20'),
(24, 14, 14, '2023-08-20'),
(25, 15, 15, '2023-08-20'),
(26, 16, 16, '2023-08-20'),
(27, 17, 17, '2023-08-20'),
(28, 18, 18, '2023-08-20'),
(29, 19, 19, '2023-08-20'),
(30, 20, 20, '2023-08-20');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `GradeID` int(11) NOT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL,
  `Score` decimal(5,2) DEFAULT NULL,
  `GradeDate` date DEFAULT NULL,
  `Grade` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`GradeID`, `StudentID`, `ClassID`, `Score`, `GradeDate`, `Grade`) VALUES
(1, 1, 1, 95.00, '2023-12-15', 'A'),
(2, 2, 2, 88.50, '2023-12-15', 'B'),
(3, 3, 3, 91.00, '2023-12-15', 'A'),
(4, 4, 4, 89.00, '2023-12-15', 'B'),
(5, 5, 5, 92.50, '2023-12-15', 'A'),
(6, 6, 6, 87.00, '2023-12-15', 'B'),
(7, 7, 7, 94.50, '2023-12-15', 'A'),
(8, 8, 8, 82.00, '2023-12-15', 'B'),
(9, 9, 9, 90.50, '2023-12-15', 'A'),
(10, 10, 10, 96.50, '2023-12-15', 'A'),
(11, 11, 11, 94.00, '2023-12-15', 'A'),
(12, 12, 12, 87.50, '2023-12-15', 'B'),
(13, 13, 13, 91.00, '2023-12-15', 'A'),
(14, 14, 14, 88.50, '2023-12-15', 'B'),
(15, 15, 15, 92.50, '2023-12-15', 'A'),
(16, 16, 16, 86.00, '2023-12-15', 'B'),
(17, 17, 17, 95.50, '2023-12-15', 'A'),
(18, 18, 18, 83.00, '2023-12-15', 'B'),
(19, 19, 19, 90.50, '2023-12-15', 'A'),
(20, 20, 20, 96.50, '2023-12-15', 'A'),
(21, 21, 21, 85.50, '2023-12-15', 'B'),
(22, 22, 22, 91.00, '2023-12-15', 'A'),
(23, 23, 23, 88.00, '2023-12-15', 'B'),
(24, 24, 24, 75.00, '2023-12-15', 'C'),
(25, 25, 25, 89.50, '2023-12-15', 'B'),
(26, 26, 26, 94.00, '2023-12-15', 'A'),
(27, 27, 27, 77.50, '2023-12-15', 'C'),
(28, 28, 28, 90.00, '2023-12-15', 'A'),
(29, 29, 29, 86.50, '2023-12-15', 'B'),
(30, 30, 30, 93.00, '2023-12-15', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `StudentID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `EnrollmentDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentID`, `FirstName`, `LastName`, `DateOfBirth`, `Address`, `Email`, `Phone`, `EnrollmentDate`) VALUES
(1, 'John', 'Doe', '1998-05-10', '123 Main St', 'john.doe@email.com', '555-123-4567', '2022-08-15'),
(2, 'Jane', 'Smith', '1999-02-22', '456 Elm St', 'jane.smith@email.com', '555-987-6543', '2022-08-15'),
(3, 'Robert', 'Johnson', '1997-11-17', '789 Oak St', 'robert.johnson@email.com', '555-222-3333', '2022-08-15'),
(4, 'Emily', 'Davis', '1998-09-03', '567 Pine St', 'emily.davis@email.com', '555-333-4444', '2022-08-15'),
(5, 'Michael', 'Wilson', '1999-04-15', '890 Cedar St', 'michael.wilson@email.com', '555-444-5555', '2022-08-15'),
(6, 'Sarah', 'Brown', '1997-07-20', '345 Birch St', 'sarah.brown@email.com', '555-555-6666', '2022-08-15'),
(7, 'David', 'Martinez', '1998-01-28', '123 Oak St', 'david.martinez@email.com', '555-666-7777', '2022-08-15'),
(8, 'Jennifer', 'Anderson', '1999-06-05', '678 Elm St', 'jennifer.anderson@email.com', '555-777-8888', '2022-08-15'),
(9, 'Daniel', 'Harris', '1997-04-19', '567 Pine St', 'daniel.harris@email.com', '555-888-9999', '2022-08-15'),
(10, 'Olivia', 'Lee', '1998-10-12', '456 Cedar St', 'olivia.lee@email.com', '555-999-0000', '2022-08-15'),
(11, 'William', 'Clark', '1998-06-02', '222 Elm St', 'william.clark@email.com', '555-333-2222', '2022-08-15'),
(12, 'Sophia', 'Garcia', '1999-03-14', '333 Cedar St', 'sophia.garcia@email.com', '555-444-1111', '2022-08-15'),
(13, 'Matthew', 'White', '1997-09-30', '444 Pine St', 'matthew.white@email.com', '555-555-4444', '2022-08-15'),
(14, 'Oliver', 'Davis', '1998-12-09', '555 Oak St', 'oliver.davis@email.com', '555-666-3333', '2022-08-15'),
(15, 'Sophia', 'Brown', '1997-05-24', '666 Elm St', 'sophia.brown@email.com', '555-777-2222', '2022-08-15'),
(16, 'Ava', 'Anderson', '1998-07-15', '777 Cedar St', 'ava.anderson@email.com', '555-888-1111', '2022-08-15'),
(17, 'Liam', 'Martinez', '1999-01-02', '888 Birch St', 'liam.martinez@email.com', '555-999-4444', '2022-08-15'),
(18, 'Emma', 'Johnson', '1997-04-29', '999 Oak St', 'emma.johnson@email.com', '555-111-3333', '2022-08-15'),
(19, 'Noah', 'Williams', '1998-08-07', '123 Pine St', 'noah.williams@email.com', '555-222-1111', '2022-08-15'),
(20, 'Olivia', 'Harris', '1999-02-11', '345 Cedar St', 'olivia.harris@email.com', '555-333-4444', '2022-08-15'),
(21, 'Mia', 'Moore', '1998-06-14', '234 Elm St', 'mia.moore@email.com', '555-777-8888', '2022-08-15'),
(22, 'Ethan', 'Anderson', '1999-02-28', '345 Cedar St', 'ethan.anderson@email.com', '555-888-9999', '2022-08-15'),
(23, 'Liam', 'Martin', '1997-11-12', '456 Pine St', 'liam.martin@email.com', '555-999-1111', '2022-08-15'),
(24, 'Ava', 'Thompson', '1998-09-19', '567 Oak St', 'ava.thompson@email.com', '555-111-2222', '2022-08-15'),
(25, 'Isabella', 'Harris', '1999-04-03', '678 Elm St', 'isabella.harris@email.com', '555-222-3333', '2022-08-15'),
(26, 'Oliver', 'Davis', '1997-07-08', '789 Birch St', 'oliver.davis@email.com', '555-333-4444', '2022-08-15'),
(27, 'Mason', 'Wilson', '1998-01-24', '890 Cedar St', 'mason.wilson@email.com', '555-444-5555', '2022-08-15'),
(28, 'Harper', 'Thomas', '1999-06-09', '123 Pine St', 'harper.thomas@email.com', '555-555-6666', '2022-08-15'),
(29, 'Evelyn', 'Roberts', '1997-04-18', '234 Oak St', 'evelyn.roberts@email.com', '555-666-7777', '2022-08-15'),
(30, 'William', 'Garcia', '1998-10-03', '345 Elm St', 'william.garcia@email.com', '555-777-8888', '2022-08-15');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `TeacherID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `SubjectTaught` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`TeacherID`, `FirstName`, `LastName`, `DateOfBirth`, `Address`, `Email`, `Phone`, `HireDate`, `SubjectTaught`) VALUES
(1, 'Sarah', 'Anderson', '1980-03-05', '111 Pine St', 'sarah.anderson@email.com', '555-444-5555', '2010-08-15', 'Math'),
(2, 'Michael', 'Brown', '1975-08-12', '222 Birch St', 'michael.brown@email.com', '555-777-8888', '2005-09-01', 'Science'),
(3, 'Emily', 'Wilson', '1982-04-28', '333 Cedar St', 'emily.wilson@email.com', '555-999-1111', '2005-09-01', 'English'),
(4, 'David', 'Martinez', '1978-11-22', '444 Oak St', 'david.martinez@email.com', '555-222-3333', '2005-09-01', 'History'),
(5, 'Jennifer', 'Taylor', '1977-06-15', '555 Elm St', 'jennifer.taylor@email.com', '555-333-4444', '2005-09-01', 'Physics'),
(6, 'Daniel', 'Harris', '1979-09-03', '666 Pine St', 'daniel.harris@email.com', '555-555-6666', '2005-09-01', 'Chemistry'),
(7, 'Olivia', 'Smith', '1976-01-28', '777 Cedar St', 'olivia.smith@email.com', '555-666-7777', '2005-09-01', 'Art'),
(8, 'William', 'Johnson', '1981-07-12', '888 Birch St', 'william.johnson@email.com', '555-888-9999', '2005-09-01', 'Physical Education'),
(9, 'Sophia', 'Lee', '1983-03-18', '999 Oak St', 'sophia.lee@email.com', '555-999-0000', '2005-09-01', 'Music'),
(10, 'Matthew', 'Garcia', '1985-05-20', '123 Maple St', 'matthew.garcia@email.com', '555-111-2222', '2005-09-01', 'Computer Science'),
(11, 'James', 'Taylor', '1980-05-15', '111 Birch St', 'james.taylor@email.com', '555-444-1111', '2012-08-15', 'Music'),
(12, 'Ella', 'Davis', '1975-08-29', '222 Oak St', 'ella.davis@email.com', '555-777-2222', '2010-09-01', 'Physical Education'),
(13, 'Liam', 'Anderson', '1982-04-10', '333 Elm St', 'liam.anderson@email.com', '555-999-4444', '2015-07-03', 'Computer Science'),
(14, 'Sophia', 'Wilson', '1978-11-14', '444 Cedar St', 'sophia.wilson@email.com', '555-222-3333', '2008-06-15', 'Math'),
(15, 'Oliver', 'Martinez', '1977-06-30', '555 Pine St', 'oliver.martinez@email.com', '555-333-2222', '2014-03-21', 'Science'),
(16, 'Ava', 'Brown', '1979-09-20', '666 Oak St', 'ava.brown@email.com', '555-666-1111', '2011-10-10', 'English'),
(17, 'Noah', 'Smith', '1976-01-11', '777 Birch St', 'noah.smith@email.com', '555-888-4444', '2009-12-05', 'History'),
(18, 'Emma', 'Garcia', '1981-07-08', '888 Cedar St', 'emma.garcia@email.com', '555-999-1111', '2013-04-11', 'Physics'),
(19, 'Liam', 'Johnson', '1983-03-23', '999 Elm St', 'liam.johnson@email.com', '555-111-4444', '2007-08-25', 'Chemistry'),
(20, 'Ava', 'Taylor', '1985-05-01', '123 Pine St', 'ava.taylor@email.com', '555-222-2222', '2016-01-30', 'Art'),
(21, 'Lucas', 'Brown', '1980-03-20', '111 Oak St', 'lucas.brown@email.com', '555-888-4444', '2013-08-15', 'Geography'),
(22, 'Avery', 'Wright', '1975-08-17', '222 Cedar St', 'avery.wright@email.com', '555-999-1111', '2013-08-15', 'History'),
(23, 'Evelyn', 'Perez', '1982-04-25', '333 Elm St', 'evelyn.perez@email.com', '555-111-3333', '2013-08-15', 'Physical Education'),
(24, 'Sebastian', 'Fisher', '1978-11-07', '444 Pine St', 'sebastian.fisher@email.com', '555-222-2222', '2013-08-15', 'Music'),
(25, 'Harper', 'Baker', '1977-06-30', '555 Oak St', 'harper.baker@email.com', '555-333-4444', '2013-08-15', 'Art'),
(26, 'Jackson', 'Green', '1979-09-12', '666 Cedar St', 'jackson.green@email.com', '555-444-5555', '2013-08-15', 'Computer Science'),
(27, 'Madison', 'Collins', '1976-01-15', '777 Elm St', 'madison.collins@email.com', '555-555-6666', '2013-08-15', 'Math'),
(28, 'Scarlett', 'Stewart', '1981-07-11', '888 Birch St', 'scarlett.stewart@email.com', '555-666-7777', '2013-08-15', 'English'),
(29, 'Ethan', 'Parker', '1983-03-14', '999 Oak St', 'ethan.parker@email.com', '555-777-8888', '2013-08-15', 'Physics'),
(30, 'Aria', 'Turner', '1985-05-08', '123 Elm St', 'aria.turner@email.com', '555-888-9999', '2013-08-15', 'Chemistry');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`ClassID`),
  ADD KEY `CourseID` (`CourseID`),
  ADD KEY `TeacherID` (`TeacherID`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`CourseID`),
  ADD KEY `TeacherID` (`TeacherID`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`EnrollmentID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `ClassID` (`ClassID`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`GradeID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `ClassID` (`ClassID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentID`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`TeacherID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`),
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`TeacherID`) REFERENCES `teachers` (`TeacherID`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teachers` (`TeacherID`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`);

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  ADD CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
