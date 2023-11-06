-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2023 at 03:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4
Create database hospital;

use hospital;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `appointment_date` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `patient_id`, `doctor_id`, `appointment_date`, `notes`) VALUES
(61, 1, 1, '2023-03-05 09:00:00', 'Regular check-up'),
(62, 2, 2, '2023-03-10 14:30:00', 'Child vaccination'),
(63, 3, 3, '2023-03-15 10:45:00', 'Follow-up appointment'),
(64, 4, 4, '2023-03-20 11:30:00', 'Dental check-up'),
(65, 5, 5, '2023-03-25 15:15:00', 'Orthopedic consultation'),
(66, 6, 6, '2023-03-30 16:30:00', 'Eye examination'),
(67, 7, 7, '2023-04-05 08:45:00', 'General health check'),
(68, 8, 8, '2023-04-10 13:00:00', 'Gynecology appointment'),
(69, 9, 9, '2023-04-15 14:30:00', 'Allergy test'),
(70, 10, 10, '2023-04-20 10:15:00', 'Physical therapy'),
(71, 11, 11, '2023-04-25 12:30:00', 'X-ray examination'),
(72, 12, 12, '2023-05-05 09:45:00', 'ENT consultation'),
(73, 13, 13, '2023-05-10 11:00:00', 'Neurology check-up'),
(74, 14, 14, '2023-05-15 14:00:00', 'Psychiatry session'),
(75, 15, 15, '2023-05-20 15:30:00', 'Dermatology appointment'),
(76, 16, 16, '2023-05-25 16:45:00', 'Urology consultation'),
(77, 17, 17, '2023-06-05 08:30:00', 'Endocrinology check-up'),
(78, 18, 18, '2023-06-10 13:15:00', 'Radiology test'),
(79, 19, 19, '2023-06-15 10:00:00', 'Oncology appointment'),
(80, 20, 20, '2023-06-20 12:00:00', 'Nephrology consultation'),
(81, 21, 21, '2023-06-25 09:15:00', 'Pulmonology check-up'),
(82, 22, 22, '2023-07-05 11:30:00', 'Dietician session'),
(83, 23, 23, '2023-07-10 14:45:00', 'Physical examination'),
(84, 24, 24, '2023-07-15 15:00:00', 'Chiropractic appointment'),
(85, 25, 25, '2023-07-20 16:30:00', 'Podiatry consultation'),
(86, 26, 26, '2023-07-25 08:15:00', 'Allergy test'),
(87, 27, 27, '2023-08-05 12:45:00', 'Orthopedic consultation'),
(88, 28, 28, '2023-08-10 09:00:00', 'ENT examination'),
(89, 29, 29, '2023-08-15 10:30:00', 'Gynecology appointment'),
(90, 30, 30, '2023-08-20 13:15:00', 'Cardiology check-up');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `name`, `description`) VALUES
(1, 'Cardiology', 'Specializes in heart diseases'),
(2, 'Pediatrics', 'Specializes in children\'s health'),
(3, 'Dermatology', 'Deals with skin and related issues'),
(4, 'Orthopedics', 'Focuses on musculoskeletal problems'),
(5, 'Oncology', 'Treats cancer and related diseases'),
(6, 'Neurology', 'Deals with nervous system disorders'),
(7, 'Endocrinology', 'Focuses on hormonal issues'),
(8, 'Gastroenterology', 'Deals with digestive system problems'),
(9, 'Psychiatry', 'Mental health treatment'),
(10, 'Urology', 'Specializes in urinary system issues'),
(11, 'Ophthalmology', 'Deals with eye-related problems'),
(12, 'Dentistry', 'Focuses on dental and oral health'),
(13, 'Radiology', 'Imaging and diagnostic services'),
(14, 'Nephrology', 'Deals with kidney diseases'),
(15, 'Pulmonology', 'Focuses on respiratory problems'),
(16, 'Rheumatology', 'Treats autoimmune diseases'),
(17, 'Hematology', 'Focuses on blood disorders'),
(18, 'Otolaryngology', 'Deals with ear, nose, and throat issues'),
(19, 'Allergy and Immunology', 'Allergy and immune system treatment'),
(20, 'Gynecology', 'Women\'s reproductive health'),
(21, 'Gastrointestinal Surgery', 'Surgery for digestive system issues'),
(22, 'Dietetics', 'Diet and nutrition advice'),
(23, 'Physical Therapy', 'Rehabilitation and physical therapy services'),
(24, 'Chiropractic Care', 'Chiropractic treatment'),
(25, 'Podiatry', 'Foot and ankle health'),
(26, 'Geriatrics', 'Elderly care and health'),
(27, 'Emergency Medicine', 'Urgent care and emergencies'),
(28, 'Sports Medicine', 'Sports-related injuries and health'),
(29, 'Plastic Surgery', 'Cosmetic and reconstructive surgery'),
(30, 'Dermatopathology', 'Skin pathology and analysis'),
(31, 'Cardiology', 'Specializes in heart diseases'),
(32, 'Pediatrics', 'Specializes in children\'s health'),
(33, 'Dermatology', 'Deals with skin and related issues'),
(34, 'Orthopedics', 'Focuses on musculoskeletal problems'),
(35, 'Oncology', 'Treats cancer and related diseases'),
(36, 'Neurology', 'Deals with nervous system disorders'),
(37, 'Endocrinology', 'Focuses on hormonal issues'),
(38, 'Gastroenterology', 'Deals with digestive system problems'),
(39, 'Psychiatry', 'Mental health treatment'),
(40, 'Urology', 'Specializes in urinary system issues'),
(41, 'Ophthalmology', 'Deals with eye-related problems'),
(42, 'Dentistry', 'Focuses on dental and oral health'),
(43, 'Radiology', 'Imaging and diagnostic services'),
(44, 'Nephrology', 'Deals with kidney diseases'),
(45, 'Pulmonology', 'Focuses on respiratory problems'),
(46, 'Rheumatology', 'Treats autoimmune diseases'),
(47, 'Hematology', 'Focuses on blood disorders'),
(48, 'Otolaryngology', 'Deals with ear, nose, and throat issues'),
(49, 'Allergy and Immunology', 'Allergy and immune system treatment'),
(50, 'Gynecology', 'Women\'s reproductive health'),
(51, 'Gastrointestinal Surgery', 'Surgery for digestive system issues'),
(52, 'Dietetics', 'Diet and nutrition advice'),
(53, 'Physical Therapy', 'Rehabilitation and physical therapy services'),
(54, 'Chiropractic Care', 'Chiropractic treatment'),
(55, 'Podiatry', 'Foot and ankle health'),
(56, 'Geriatrics', 'Elderly care and health'),
(57, 'Emergency Medicine', 'Urgent care and emergencies'),
(58, 'Sports Medicine', 'Sports-related injuries and health'),
(59, 'Plastic Surgery', 'Cosmetic and reconstructive surgery'),
(60, 'Dermatopathology', 'Skin pathology and analysis');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `specialty` varchar(50) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `first_name`, `last_name`, `specialty`, `contact_number`, `email`, `hire_date`, `salary`, `is_available`) VALUES
(1, 'Dr. Michael', 'Johnson', 'Cardiologist', '555-111-2222', 'michael@example.com', '2015-03-10', 150000.00, 1),
(2, 'Dr. Sarah', 'Williams', 'Pediatrician', '555-333-4444', 'sarah@example.com', '2018-08-20', 120000.00, 1),
(3, 'Dr. David', 'Smith', 'Dermatologist', '555-555-5555', 'david@example.com', '2016-05-15', 135000.00, 1),
(4, 'Dr. Jessica', 'Brown', 'Orthopedic Surgeon', '555-777-8888', 'jessica@example.com', '2019-01-30', 160000.00, 1),
(5, 'Dr. James', 'Taylor', 'Neurologist', '555-123-9876', 'james@example.com', '2017-09-25', 145000.00, 1),
(6, 'Dr. Susan', 'Davis', 'Gynecologist', '555-222-3333', 'susan@example.com', '2020-11-12', 130000.00, 1),
(7, 'Dr. Richard', 'Anderson', 'Oncologist', '555-666-9999', 'richard@example.com', '2014-07-05', 170000.00, 1),
(8, 'Dr. Emily', 'Martinez', 'Psychiatrist', '555-888-1111', 'emily@example.com', '2018-12-30', 125000.00, 1),
(9, 'Dr. Daniel', 'Clark', 'Cardiologist', '555-333-5555', 'daniel@example.com', '2015-02-20', 150000.00, 1),
(10, 'Dr. Karen', 'Jackson', 'Pediatrician', '555-444-3333', 'karen@example.com', '2017-03-08', 120000.00, 1),
(11, 'Dr. Thomas', 'Wilson', 'Dermatologist', '555-555-5555', 'thomas@example.com', '2019-08-05', 135000.00, 1),
(12, 'Dr. Patricia', 'Lee', 'Orthopedic Surgeon', '555-123-4444', 'patricia@example.com', '2020-01-10', 160000.00, 1),
(13, 'Dr. Joseph', 'Young', 'Neurologist', '555-333-2222', 'joseph@example.com', '2016-11-22', 145000.00, 1),
(14, 'Dr. Megan', 'Harris', 'Gynecologist', '555-444-1111', 'megan@example.com', '2018-04-15', 130000.00, 1),
(15, 'Dr. Charles', 'Evans', 'Oncologist', '555-555-7777', 'charles@example.com', '2014-02-18', 170000.00, 1),
(16, 'Dr. Elizabeth', 'Thompson', 'Psychiatrist', '555-123-3333', 'elizabeth@example.com', '2017-07-09', 125000.00, 1),
(17, 'Dr. William', 'Moore', 'Cardiologist', '555-333-4444', 'william@example.com', '2015-05-15', 150000.00, 1),
(18, 'Dr. Nancy', 'Hall', 'Pediatrician', '555-444-5555', 'nancy@example.com', '2018-08-20', 120000.00, 1),
(19, 'Dr. Matthew', 'Garcia', 'Dermatologist', '555-555-5555', 'matthew@example.com', '2016-03-25', 135000.00, 1),
(20, 'Dr. Lisa', 'Brown', 'Orthopedic Surgeon', '555-777-8888', 'lisa@example.com', '2019-09-30', 160000.00, 1),
(21, 'Dr. Andrew', 'Smith', 'Neurologist', '555-123-9876', 'andrew@example.com', '2017-12-15', 145000.00, 1),
(22, 'Dr. Karen', 'Taylor', 'Gynecologist', '555-222-3333', 'karen@example.com', '2020-03-20', 130000.00, 1),
(23, 'Dr. David', 'Williams', 'Oncologist', '555-666-9999', 'david@example.com', '2014-10-05', 170000.00, 1),
(24, 'Dr. Jessica', 'Jackson', 'Psychiatrist', '555-888-1111', 'jessica@example.com', '2018-01-30', 125000.00, 1),
(25, 'Dr. Michael', 'Jones', 'Cardiologist', '555-333-5555', 'michael@example.com', '2015-07-15', 150000.00, 1),
(26, 'Dr. Mary', 'Wilson', 'Pediatrician', '555-444-3333', 'mary@example.com', '2018-02-08', 120000.00, 1),
(27, 'Dr. Robert', 'Clark', 'Dermatologist', '555-555-5555', 'robert@example.com', '2016-04-25', 135000.00, 1),
(28, 'Dr. Jennifer', 'Smith', 'Orthopedic Surgeon', '555-777-8888', 'jennifer@example.com', '2019-11-30', 160000.00, 1),
(29, 'Dr. Christopher', 'Davis', 'Neurologist', '555-123-9876', 'christopher@example.com', '2017-09-15', 145000.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_departments`
--

CREATE TABLE `doctor_departments` (
  `doctor_department_id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_departments`
--

INSERT INTO `doctor_departments` (`doctor_department_id`, `doctor_id`, `department_id`) VALUES
(61, 1, 1),
(62, 2, 2),
(63, 3, 3),
(64, 4, 4),
(65, 5, 5),
(66, 6, 6),
(67, 7, 7),
(68, 8, 8),
(69, 9, 9),
(70, 10, 10),
(71, 11, 11),
(72, 12, 12),
(73, 13, 13),
(74, 14, 14),
(75, 15, 15),
(76, 16, 16),
(77, 17, 17),
(78, 18, 18),
(79, 19, 19),
(80, 20, 20),
(81, 21, 21),
(82, 22, 22),
(83, 23, 23),
(84, 24, 24),
(85, 25, 25),
(86, 26, 26),
(87, 27, 27),
(88, 28, 28),
(89, 29, 29),
(90, 30, 30);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `first_name`, `last_name`, `date_of_birth`, `gender`, `contact_number`, `address`, `registration_date`) VALUES
(1, 'John', 'Doe', '1990-05-15', 'Male', '555-123-4567', '123 Main St, City', '2023-11-06 07:29:40'),
(2, 'Jane', 'Smith', '1985-07-20', 'Female', '555-987-6543', '456 Elm St, Town', '2023-11-06 07:29:40'),
(3, 'Michael', 'Brown', '1978-03-08', 'Male', '555-222-3333', '789 Oak St, Village', '2023-11-06 07:29:40'),
(4, 'Samantha', 'Wilson', '1995-11-12', 'Female', '555-777-8888', '567 Pine St, Town', '2023-11-06 07:29:40'),
(5, 'David', 'Clark', '1982-09-30', 'Male', '555-555-5555', '345 Cedar St, City', '2023-11-06 07:29:40'),
(6, 'Mary', 'Johnson', '1992-02-25', 'Female', '555-888-9999', '890 Birch St, Village', '2023-11-06 07:29:40'),
(7, 'Robert', 'Davis', '1970-12-04', 'Male', '555-444-3333', '234 Elm St, Town', '2023-11-06 07:29:40'),
(8, 'Linda', 'Martinez', '1987-08-01', 'Female', '555-999-1111', '456 Pine St, City', '2023-11-06 07:29:40'),
(9, 'William', 'White', '1993-06-18', 'Male', '555-123-9876', '678 Oak St, Village', '2023-11-06 07:29:40'),
(10, 'Patricia', 'Moore', '1980-04-22', 'Female', '555-777-5555', '567 Maple St, Town', '2023-11-06 07:29:40'),
(11, 'James', 'Lee', '1975-10-07', 'Male', '555-654-1234', '345 Cedar St, Village', '2023-11-06 07:29:40'),
(12, 'Karen', 'Garcia', '1998-08-29', 'Female', '555-333-7777', '123 Birch St, City', '2023-11-06 07:29:40'),
(13, 'Michael', 'Hall', '1979-01-14', 'Male', '555-987-4567', '234 Oak St, Town', '2023-11-06 07:29:40'),
(14, 'Jennifer', 'Jackson', '1989-07-26', 'Female', '555-222-1111', '890 Pine St, Village', '2023-11-06 07:29:40'),
(15, 'Christopher', 'Adams', '1991-03-19', 'Male', '555-555-7777', '567 Elm St, City', '2023-11-06 07:29:40'),
(16, 'Elizabeth', 'Brown', '1977-05-12', 'Female', '555-333-4444', '123 Main St, Town', '2023-11-06 07:29:40'),
(17, 'Joseph', 'Evans', '1984-09-09', 'Male', '555-654-7890', '456 Cedar St, Village', '2023-11-06 07:29:40'),
(18, 'Megan', 'Hall', '1996-11-03', 'Female', '555-222-9876', '890 Oak St, City', '2023-11-06 07:29:40'),
(19, 'Daniel', 'Harris', '1976-02-17', 'Male', '555-888-3333', '234 Maple St, Town', '2023-11-06 07:29:40'),
(20, 'Susan', 'Young', '1990-08-07', 'Female', '555-777-2222', '567 Pine St, Village', '2023-11-06 07:29:40'),
(21, 'Richard', 'Anderson', '1988-04-26', 'Male', '555-123-1111', '678 Cedar St, City', '2023-11-06 07:29:40'),
(22, 'Lisa', 'Wilson', '1974-12-31', 'Female', '555-987-6543', '890 Elm St, Village', '2023-11-06 07:29:40'),
(23, 'Thomas', 'Smith', '1994-06-24', 'Male', '555-777-9876', '345 Oak St, Town', '2023-11-06 07:29:40'),
(24, 'Nancy', 'Thompson', '1983-10-15', 'Female', '555-123-4444', '123 Birch St, Village', '2023-11-06 07:29:40'),
(25, 'Charles', 'Johnson', '1973-03-05', 'Male', '555-555-5555', '456 Pine St, City', '2023-11-06 07:29:40'),
(26, 'Jessica', 'Martinez', '1997-07-16', 'Female', '555-333-1111', '567 Maple St, Town', '2023-11-06 07:29:40'),
(27, 'Matthew', 'Garcia', '1981-09-28', 'Male', '555-222-2222', '234 Main St, Village', '2023-11-06 07:29:40'),
(28, 'Karen', 'Jones', '1999-01-09', 'Female', '555-987-1111', '678 Elm St, City', '2023-11-06 07:29:40'),
(29, 'Andrew', 'Davis', '1971-08-14', 'Male', '555-777-7777', '890 Cedar St, Town', '2023-11-06 07:29:40'),
(30, 'Emily', 'Taylor', '1986-04-10', 'Female', '555-123-3333', '345 Pine St, Village', '2023-11-06 07:29:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `doctor_departments`
--
ALTER TABLE `doctor_departments`
  ADD PRIMARY KEY (`doctor_department_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `doctor_departments`
--
ALTER TABLE `doctor_departments`
  MODIFY `doctor_department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`);

--
-- Constraints for table `doctor_departments`
--
ALTER TABLE `doctor_departments`
  ADD CONSTRAINT `doctor_departments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`),
  ADD CONSTRAINT `doctor_departments_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
