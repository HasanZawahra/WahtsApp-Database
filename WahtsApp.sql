-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 25, 2023 at 10:52 PM
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
-- Database: `HOM`
--

-- --------------------------------------------------------

--
-- Table structure for table `Chats`
--

CREATE TABLE `Chats` (
  `ChatID` int(11) NOT NULL,
  `ChatType` varchar(255) DEFAULT NULL,
  `LastMessageID` int(11) DEFAULT NULL,
  `ChatPicture` varchar(255) DEFAULT NULL,
  `PinnedMessageID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Chats`
--

INSERT INTO `Chats` (`ChatID`, `ChatType`, `LastMessageID`, `ChatPicture`, `PinnedMessageID`) VALUES
(123456, '', NULL, NULL, NULL),
(987987, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Chats_Users`
--

CREATE TABLE `Chats_Users` (
  `ChatID` int(11) NOT NULL,
  `PhoneNumber` varchar(255) NOT NULL,
  `IsMuted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Chats_Users`
--

INSERT INTO `Chats_Users` (`ChatID`, `PhoneNumber`, `IsMuted`) VALUES
(123456, '0599999999', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Contacts`
--

CREATE TABLE `Contacts` (
  `ContactPhoneNumber` varchar(255) NOT NULL,
  `OwnerPhoneNumber` varchar(255) NOT NULL,
  `NickName` varchar(255) DEFAULT NULL,
  `IsBlocked` tinyint(1) DEFAULT NULL,
  `ShowStatus` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Contacts`
--

INSERT INTO `Contacts` (`ContactPhoneNumber`, `OwnerPhoneNumber`, `NickName`, `IsBlocked`, `ShowStatus`) VALUES
('0599571137', '0599999999', 'hasan', NULL, NULL),
('0599645654', '0599571137', 'obada', NULL, NULL),
('0599999999', '0599645654', 'mohammad', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Groups`
--

CREATE TABLE `Groups` (
  `GroupID` int(11) NOT NULL,
  `ChatID` int(11) DEFAULT NULL,
  `GroupName` varchar(255) DEFAULT NULL,
  `GroupPicture` varchar(255) DEFAULT NULL,
  `GroupBio` varchar(139) DEFAULT NULL,
  `GroupSettings` JSON CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`GroupSettings`)),
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Groups`
--

INSERT INTO `Groups` (`GroupID`, `ChatID`, `GroupName`, `GroupPicture`, `GroupBio`, `GroupSettings`, `CreatedBy`, `CreatedAt`) VALUES
(999965432, 123456, 'hello', NULL, 'helloooo', NULL, '0599571137', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `GroupsUsers`
--

CREATE TABLE `GroupsUsers` (
  `GroupID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `AddedBy` int(1) DEFAULT NULL,
  `AddedOn` datetime DEFAULT NULL,
  `IsAdmin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `GroupsUsers`
--

INSERT INTO `GroupsUsers` (`GroupID`, `UserID`, `AddedBy`, `AddedOn`, `IsAdmin`) VALUES
(999965432, '0599571137', NULL, '2023-12-11 23:41:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Media`
--

CREATE TABLE `Media` (
  `MediaID` int(11) NOT NULL,
  `MediaType` varchar(255) DEFAULT NULL,
  `URL` varchar(512) DEFAULT NULL,
  `Size` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Media`
--

INSERT INTO `Media` (`MediaID`, `MediaType`, `URL`, `Size`) VALUES
(8, 'link', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Messages`
--

CREATE TABLE `Messages` (
  `MessageID` int(11) NOT NULL,
  `ChatID` int(11) DEFAULT NULL,
  `SenderPhoneNumber` varchar(255) DEFAULT NULL,
  `MessageType` varchar(255) DEFAULT NULL,
  `Content` varchar(255) DEFAULT NULL,
  `MediaID` int(11) DEFAULT NULL,
  `SentAt` datetime DEFAULT NULL,
  `ReadByAll` tinyint(1) DEFAULT NULL,
  `DeliveredToAll` tinyint(1) DEFAULT NULL,
  `IsStarred` tinyint(1) DEFAULT NULL,
  `ForwardCount` int(11) DEFAULT NULL,
  `ReplyToMessageID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Messages`
--

INSERT INTO `Messages` (`MessageID`, `ChatID`, `SenderPhoneNumber`, `MessageType`, `Content`, `MediaID`, `SentAt`, `ReadByAll`, `DeliveredToAll`, `IsStarred`, `ForwardCount`, `ReplyToMessageID`) VALUES
(11, 123456, '0599571137', 'text', 'hi there', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `MessageStatus`
--

CREATE TABLE `MessageStatus` (
  `RecieverPhoneNumber` varchar(255) DEFAULT NULL,
  `MessageID` int(11) DEFAULT NULL,
  `ReadAt` datetime DEFAULT NULL,
  `DeliveredAt` datetime DEFAULT NULL,
  `Reaction` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `MessageStatus`
--

INSERT INTO `MessageStatus` (`RecieverPhoneNumber`, `MessageID`, `ReadAt`, `DeliveredAt`, `Reaction`) VALUES
('0599999999', 11, '2023-12-26 23:45:50', '2023-12-03 23:45:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Stories`
--

CREATE TABLE `Stories` (
  `StoryID` int(11) NOT NULL,
  `PhoneNumber` varchar(255) DEFAULT NULL,
  `MediaID` int(11) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Stories`
--

INSERT INTO `Stories` (`StoryID`, `PhoneNumber`, `MediaID`, `CreatedAt`) VALUES
(69, '0599645654', 8, '2023-12-18 23:50:45');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `PhoneNumber` int(11) NOT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `ProfilePicture` varchar(255) DEFAULT NULL,
  `isOnline` tinyint(1) DEFAULT NULL,
  `LastSeen` datetime DEFAULT NULL,
  `About` varchar(1500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`PhoneNumber`, `UserName`, `ProfilePicture`, `isOnline`, `LastSeen`, `About`) VALUES
('0599571137', 'hasan', NULL, NULL, NULL, '~'),
('0599645654', 'obada', NULL, NULL, NULL, NULL),
('0599999999', 'mohammad', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ViewedBy`
--

CREATE TABLE `ViewedBy` (
  `StoryID` int(11) NOT NULL,
  `PhoneNumber` varchar(255) NOT NULL,
  `ViewedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ViewedBy`
--

INSERT INTO `ViewedBy` (`StoryID`, `PhoneNumber`, `ViewedAt`) VALUES
(69, '0599999999', '2023-12-16 23:51:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Chats`
--
ALTER TABLE `Chats`
  ADD PRIMARY KEY (`ChatID`),
  ADD KEY `FK_Chats_LastMessageID` (`LastMessageID`);

--
-- Indexes for table `Chats_Users`
--
ALTER TABLE `Chats_Users`
  ADD PRIMARY KEY (`ChatID`,`PhoneNumber`),
  ADD KEY `FK_Chats_Users_PhoneNumber` (`PhoneNumber`);

--
-- Indexes for table `Contacts`
--
ALTER TABLE `Contacts`
  ADD PRIMARY KEY (`ContactPhoneNumber`,`OwnerPhoneNumber`),
  ADD KEY `FK_Contacts_OwnerPhoneNumber` (`OwnerPhoneNumber`);

--
-- Indexes for table `Groups`
--
ALTER TABLE `Groups`
  ADD PRIMARY KEY (`GroupID`),
  ADD KEY `FK_Groups_ChatID` (`ChatID`),
  ADD KEY `CreatedBy` (`CreatedBy`);

--
-- Indexes for table `GroupsUsers`
--
ALTER TABLE `GroupsUsers`
  ADD KEY `GroupID` (`GroupID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `AddedBy` (`AddedBy`);

--
-- Indexes for table `Media`
--
ALTER TABLE `Media`
  ADD PRIMARY KEY (`MediaID`);

--
-- Indexes for table `Messages`
--
ALTER TABLE `Messages`
  ADD PRIMARY KEY (`MessageID`),
  ADD KEY `FK_Messages_ChatID` (`ChatID`),
  ADD KEY `FK_Messages_SenderPhoneNumber` (`SenderPhoneNumber`),
  ADD KEY `FK_Messages_MediaID` (`MediaID`),
  ADD KEY `FK_Messages_ReplyToMessageID` (`ReplyToMessageID`);

--
-- Indexes for table `MessageStatus`
--
ALTER TABLE `MessageStatus`
  ADD KEY `MessageID` (`MessageID`),
  ADD KEY `RecieverPhoneNumber` (`RecieverPhoneNumber`);

--
-- Indexes for table `Stories`
--
ALTER TABLE `Stories`
  ADD PRIMARY KEY (`StoryID`),
  ADD KEY `PhoneNumber` (`PhoneNumber`),
  ADD KEY `MediaID` (`MediaID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`PhoneNumber`);

--
-- Indexes for table `ViewedBy`
--
ALTER TABLE `ViewedBy`
  ADD PRIMARY KEY (`StoryID`,`PhoneNumber`),
  ADD KEY `FK_ViewedBy_PhoneNumber` (`PhoneNumber`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Chats`
--
ALTER TABLE `Chats`
  ADD CONSTRAINT `FK_Chats_LastMessageID` FOREIGN KEY (`LastMessageID`) REFERENCES `Messages` (`MessageID`);

--
-- Constraints for table `Chats_Users`
--
ALTER TABLE `Chats_Users`
  ADD CONSTRAINT `FK_Chats_Users_ChatID` FOREIGN KEY (`ChatID`) REFERENCES `Chats` (`ChatID`),
  ADD CONSTRAINT `FK_Chats_Users_PhoneNumber` FOREIGN KEY (`PhoneNumber`) REFERENCES `Users` (`PhoneNumber`);

--
-- Constraints for table `Contacts`
--
ALTER TABLE `Contacts`
  ADD CONSTRAINT `FK_Contacts_ContactPhoneNumber` FOREIGN KEY (`ContactPhoneNumber`) REFERENCES `Users` (`PhoneNumber`),
  ADD CONSTRAINT `FK_Contacts_OwnerPhoneNumber` FOREIGN KEY (`OwnerPhoneNumber`) REFERENCES `Users` (`PhoneNumber`);

--
-- Constraints for table `Groups`
--
ALTER TABLE `Groups`
  ADD CONSTRAINT `CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`PhoneNumber`),
  ADD CONSTRAINT `FK_Groups_ChatID` FOREIGN KEY (`ChatID`) REFERENCES `Chats` (`ChatID`);

--
-- Constraints for table `GroupsUsers`
--
ALTER TABLE `GroupsUsers`
  ADD CONSTRAINT `AddedBy` FOREIGN KEY (`AddedBy`) REFERENCES `Users` (`PhoneNumber`),
  ADD CONSTRAINT `GroupID` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`GroupID`),
  ADD CONSTRAINT `UserID` FOREIGN KEY (`UserID`) REFERENCES `Users` (`PhoneNumber`);

--
-- Constraints for table `Messages`
--
ALTER TABLE `Messages`
  ADD CONSTRAINT `FK_Messages_ChatID` FOREIGN KEY (`ChatID`) REFERENCES `Chats` (`ChatID`),
  ADD CONSTRAINT `FK_Messages_MediaID` FOREIGN KEY (`MediaID`) REFERENCES `Media` (`MediaID`),
  ADD CONSTRAINT `FK_Messages_ReplyToMessageID` FOREIGN KEY (`ReplyToMessageID`) REFERENCES `Messages` (`MessageID`),
  ADD CONSTRAINT `FK_Messages_SenderPhoneNumber` FOREIGN KEY (`SenderPhoneNumber`) REFERENCES `Users` (`PhoneNumber`);

--
-- Constraints for table `MessageStatus`
--
ALTER TABLE `MessageStatus`
  ADD CONSTRAINT `messagestatus_ibfk_1` FOREIGN KEY (`MessageID`) REFERENCES `Messages` (`MessageID`),
  ADD CONSTRAINT `messagestatus_ibfk_2` FOREIGN KEY (`RecieverPhoneNumber`) REFERENCES `Users` (`PhoneNumber`);

--
-- Constraints for table `Stories`
--
ALTER TABLE `Stories`
  ADD CONSTRAINT `MediaID` FOREIGN KEY (`MediaID`) REFERENCES `Media` (`MediaID`),
  ADD CONSTRAINT `PhoneNumber` FOREIGN KEY (`PhoneNumber`) REFERENCES `Users` (`PhoneNumber`);

--
-- Constraints for table `ViewedBy`
--
ALTER TABLE `ViewedBy`
  ADD CONSTRAINT `FK_ViewedBy_PhoneNumber` FOREIGN KEY (`PhoneNumber`) REFERENCES `Users` (`PhoneNumber`),
  ADD CONSTRAINT `FK_ViewedBy_StoryID` FOREIGN KEY (`StoryID`) REFERENCES `Stories` (`StoryID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
