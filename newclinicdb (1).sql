-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2024 at 03:41 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newclinicdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`) VALUES
('ADM0001'),
('ADM0002');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointmentID` varchar(10) NOT NULL,
  `appointmentDate` date NOT NULL,
  `appointmentStatus` varchar(15) NOT NULL,
  `diagnosis` varchar(250) DEFAULT NULL,
  `doctorID` varchar(10) NOT NULL,
  `patientID` varchar(10) NOT NULL,
  `prescriptionID` varchar(10) DEFAULT NULL,
  `timeSlot` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentID`, `appointmentDate`, `appointmentStatus`, `diagnosis`, `doctorID`, `patientID`, `prescriptionID`, `timeSlot`) VALUES
('APP0001', '2024-05-20', 'Completed', 'Fever', 'D0001', 'P0001', 'PR0001', '1100-1200'),
('APP0002', '2024-05-21', 'Completed', 'Flu', 'D0002', 'P0002', 'PR0002', '1400-1430'),
('APP0003', '2024-05-21', 'Completed', 'Bacterial Infection', 'D0003', 'P0003', 'PR0003', '1600-1630'),
('APP0004', '2024-05-22', 'Completed', 'Psoriasis', 'D0004', 'P0004', 'PR0004', '1700-1730');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctorID` varchar(10) NOT NULL,
  `doctorName` varchar(40) NOT NULL,
  `doctorNRIC` varchar(14) NOT NULL,
  `doctorSpeciality` varchar(30) NOT NULL,
  `availability` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorID`, `doctorName`, `doctorNRIC`, `doctorSpeciality`, `availability`) VALUES
('D0001', 'Dr. Harith Johari', '760929-14-9231', 'Family Medicine', 'Available'),
('D0002', 'Dr. Rashid', '801120-10-0541', 'Psychiatry', 'Available'),
('D0003', 'Dr. Faqiha', '840519-06-3802', 'Family Medicine', 'Available'),
('D0004', 'Dr. Laila', '870212-10-7398', 'Obstetrics and Gynaecology', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `userID` varchar(10) NOT NULL,
  `userPassword` varchar(60) NOT NULL,
  `userTypeID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`userID`, `userPassword`, `userTypeID`) VALUES
('ADM0001', 'adminPass1', 'ADM0001'),
('ADM0002', 'adminPass2', 'ADM0002'),
('D0001', 'doctorPass1', 'D0001'),
('D0002', 'doctorPass2', 'D0002'),
('D0003', 'doctorPass3', 'D0003'),
('D0004', 'doctorPass4', 'D0004'),
('P0001', 'patientPass1', 'P0001'),
('P0002', 'patientPass2', 'P0002'),
('P0003', 'patientPass3', 'P0003'),
('P0004', 'patientPass4', 'P0004'),
('P0005', 'abb12', 'P0005'),
('P0006', 'ABC123', 'P0006'),
('P0007', 'abn123', 'P0007');

-- --------------------------------------------------------

--
-- Table structure for table `medicalcertificate`
--

CREATE TABLE `medicalcertificate` (
  `mcSerialNumber` varchar(15) NOT NULL,
  `mcDate` date NOT NULL,
  `duration` int(11) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `appointmentID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicalcertificate`
--

INSERT INTO `medicalcertificate` (`mcSerialNumber`, `mcDate`, `duration`, `reason`, `appointmentID`) VALUES
('MC0001', '2024-05-21', 3, 'Fever', 'APP0001'),
('MC0002', '2024-05-22', 2, 'Flu', 'APP0002'),
('MC0003', '2024-05-23', 2, 'Bacterial Infection', 'APP0003');

-- --------------------------------------------------------

--
-- Table structure for table `medication`
--

CREATE TABLE `medication` (
  `medSerialNumber` varchar(15) NOT NULL,
  `medName` varchar(40) NOT NULL,
  `mfgDate` date NOT NULL,
  `expDate` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `medFactory` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medication`
--

INSERT INTO `medication` (`medSerialNumber`, `medName`, `mfgDate`, `expDate`, `quantity`, `medFactory`) VALUES
('MED0001', 'Paracetamol', '2025-02-01', '2027-02-01', 200, 'ABC Pharma'),
('MED0002', 'Ibuprofen', '2025-03-10', '2027-03-10', 200, 'XYZ Pharma'),
('MED0003', 'Amoxicillin', '2025-03-17', '2027-03-17', 150, 'Medic Pharma'),
('MED0004', 'Methotrexate', '2025-03-21', '2027-03-21', 50, 'ABC Pharma');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientID` varchar(10) NOT NULL,
  `patientNRIC` varchar(14) NOT NULL,
  `patientName` varchar(40) NOT NULL,
  `patientPhoneNo` varchar(12) NOT NULL,
  `patientAddress` varchar(250) NOT NULL,
  `registerDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientID`, `patientNRIC`, `patientName`, `patientPhoneNo`, `patientAddress`, `registerDate`) VALUES
('P0001', '011011-10-1001', 'Ryan Tan', '011-79205542', '7, Jalan Orkid 1', '2024-05-20'),
('P0002', '980819-02-1022', 'Puteri Julia binti Khairul', '012-44230929', '29, Jalan Ipoh', '2024-05-21'),
('P0003', '860218-10-3732', 'Ayu binti Zaki', '013-9892730', '67, Jalan Orkid 6', '2024-05-23'),
('P0004', '901129-08-7390', 'Hidayah bin Zainul', '018-4082762', '8, Jalan Indah Kasturi', '2024-05-24'),
('P0005', '040809140298', 'Zakirah Halim', '0198976123', '45 , Jalan Meranti', '2024-06-04'),
('P0006', '990812110987', 'Hazim Aiman', '0182345213', '12 , Jalan Kesini', '2024-06-04'),
('P0007', '970112072134', 'Kylie Jenner', '0106752379', '21 , US Embassy Kuala Lumpur', '2024-06-04');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentID` varchar(10) NOT NULL,
  `riskPanelAvailability` varchar(15) NOT NULL,
  `panelName` varchar(40) DEFAULT NULL,
  `billCharges` decimal(6,2) NOT NULL,
  `appointmentID` varchar(10) NOT NULL,
  `adminID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentID`, `riskPanelAvailability`, `panelName`, `billCharges`, `appointmentID`, `adminID`) VALUES
('PAY0001', 'Not Available', NULL, '100.00', 'APP0001', 'ADM0001'),
('PAY0002', 'Available', 'Panel A', '0.00', 'APP0002', 'ADM0001'),
('PAY0003', 'Available', 'Panel Z', '0.00', 'APP0003', 'ADM0002'),
('PAY0004', 'Not Available', NULL, '80.00', 'APP0004', 'ADM0002');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescriptionID` varchar(10) NOT NULL,
  `medSerialNumber` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescriptionID`, `medSerialNumber`) VALUES
('PR0001', 'MED0001'),
('PR0002', 'MED0002'),
('PR0003', 'MED0003'),
('PR0004', 'MED0004');

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `userTypeID` varchar(10) NOT NULL,
  `userType` enum('admin','doctor','patient') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`userTypeID`, `userType`) VALUES
('ADM0001', 'admin'),
('ADM0002', 'admin'),
('D0001', 'doctor'),
('D0002', 'doctor'),
('D0003', 'doctor'),
('D0004', 'doctor'),
('P0001', 'patient'),
('P0002', 'patient'),
('P0003', 'patient'),
('P0004', 'patient'),
('P0005', 'patient'),
('P0006', 'patient'),
('P0007', 'patient');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentID`),
  ADD KEY `doctorID` (`doctorID`),
  ADD KEY `patientID` (`patientID`),
  ADD KEY `prescriptionID` (`prescriptionID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `userTypeID` (`userTypeID`);

--
-- Indexes for table `medicalcertificate`
--
ALTER TABLE `medicalcertificate`
  ADD PRIMARY KEY (`mcSerialNumber`),
  ADD KEY `appointmentID` (`appointmentID`);

--
-- Indexes for table `medication`
--
ALTER TABLE `medication`
  ADD PRIMARY KEY (`medSerialNumber`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentID`),
  ADD KEY `appointmentID` (`appointmentID`),
  ADD KEY `adminID` (`adminID`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescriptionID`),
  ADD KEY `medSerialNumber` (`medSerialNumber`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`userTypeID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`doctorID`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`),
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`prescriptionID`) REFERENCES `prescription` (`prescriptionID`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`userTypeID`) REFERENCES `usertype` (`userTypeID`);

--
-- Constraints for table `medicalcertificate`
--
ALTER TABLE `medicalcertificate`
  ADD CONSTRAINT `medicalcertificate_ibfk_1` FOREIGN KEY (`appointmentID`) REFERENCES `appointment` (`appointmentID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`appointmentID`) REFERENCES `appointment` (`appointmentID`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`medSerialNumber`) REFERENCES `medication` (`medSerialNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
