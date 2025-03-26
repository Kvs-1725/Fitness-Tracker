

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+04:00";

-- Database: `fitbliss`

-- --------------------------------------------------------

-- Table structure for table `exercises`

CREATE TABLE `exercises`
(
    `exerciseID`     int(10) UNSIGNED NOT NULL,
    `exerciseName`   varchar(25) NOT NULL,
    `caloriesPerMin` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `exercises`

INSERT INTO `exercises` (`exerciseID`, `exerciseName`, `caloriesPerMin`)
VALUES (1, 'Running', 12),
       (2, 'Stair climbing', 7),
       (3, 'Walking', 4),
       (4, 'Cycling', 12),
       (5, 'Swimming', 7),
       (6, 'Weight training', 6),
       (7, 'Aerobics', 8),
       (8, 'Gymnastics', 6),
       (9, 'Jump rope', 15),
       (10, 'Badminton', 9),
       (11, 'Basketball', 9),
       (12, 'Football', 9),
       (13, 'Tennis', 9),
       (14, 'Volleyball', 12);

-- --------------------------------------------------------

-- Table structure for table `histories` (No Data)

CREATE TABLE `histories`
(
    `historyID`  int(10) UNSIGNED NOT NULL,
    `username`   varchar(15) NOT NULL,
    `exerciseID` int(10) UNSIGNED NOT NULL,
    `duration`   int(10) UNSIGNED NOT NULL,
    `date`       date        NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

-- Table structure for table `users` (No Data)

CREATE TABLE `users`
(
    `username` varchar(15) NOT NULL,
    `height`   int(10) UNSIGNED NOT NULL,
    `weight`   int(10) UNSIGNED NOT NULL,
    `birthYear` year(4) NOT NULL,
    `gender`   enum('Male','Female') NOT NULL,
    `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Indexes for dumped tables

-- Indexes for table `exercises`
ALTER TABLE `exercises`
    ADD PRIMARY KEY (`exerciseID`);

-- Indexes for table `histories`
ALTER TABLE `histories`
    ADD PRIMARY KEY (`historyID`),
	ADD KEY `exercise` (`exerciseID`),
	ADD KEY `user` (`username`) USING BTREE;

-- Indexes for table `users`
ALTER TABLE `users`
    ADD PRIMARY KEY (`username`);

-- AUTO_INCREMENT for dumped tables

-- AUTO_INCREMENT for table `exercises`
ALTER TABLE `exercises`
    MODIFY `exerciseID` int (10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

-- AUTO_INCREMENT for table `histories`
ALTER TABLE `histories`
    MODIFY `historyID` int (10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

-- Constraints for dumped tables

-- Constraints for table `histories`
ALTER TABLE `histories`
    ADD CONSTRAINT `exercise` FOREIGN KEY (`exerciseID`) REFERENCES `exercises` (`exerciseID`) ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
