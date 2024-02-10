-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2024 at 09:12 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `world_cup`
--
CREATE DATABASE IF NOT EXISTS `worldcup` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `worldcup`;

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
CREATE TABLE `awards` (
  `key_id` smallint(5) UNSIGNED NOT NULL,
  `award_id` char(4) NOT NULL,
  `award_name` varchar(100) NOT NULL,
  `award_description` varchar(100) NOT NULL,
  `year_introduced` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `award_winners`
--

DROP TABLE IF EXISTS `award_winners`;
CREATE TABLE `award_winners` (
  `tournament_id` char(7) NOT NULL,
  `award_id` char(4) NOT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `player_id` char(8) NOT NULL,
  `team_id` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE `bookings` (
  `booking_id` char(8) NOT NULL,
  `tournament_id` char(7) NOT NULL,
  `match_id` char(13) NOT NULL,
  `team_id` char(5) NOT NULL,
  `home_team` tinyint(1) DEFAULT NULL,
  `away_team` tinyint(1) DEFAULT NULL,
  `player_id` char(8) NOT NULL,
  `shirt_number` smallint(3) DEFAULT NULL,
  `minute_label` varchar(10) DEFAULT NULL,
  `minute_regulation` smallint(3) DEFAULT NULL,
  `minute_stoppage` smallint(3) DEFAULT NULL,
  `match_period` varchar(100) DEFAULT NULL,
  `yellow_card` tinyint(1) DEFAULT NULL,
  `red_card` tinyint(1) DEFAULT NULL,
  `second_yellow_card` tinyint(1) DEFAULT NULL,
  `sending_off` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `confederations`
--

DROP TABLE IF EXISTS `confederations`;
CREATE TABLE `confederations` (
  `key_id` smallint(5) UNSIGNED NOT NULL,
  `confederation_id` char(4) NOT NULL,
  `confederation_name` varchar(100) NOT NULL,
  `confederation_code` varchar(50) DEFAULT NULL,
  `confederation_wikipedia_link` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

DROP TABLE IF EXISTS `goals`;
CREATE TABLE `goals` (
  `goal_id` char(10) NOT NULL,
  `tournament_id` char(7) NOT NULL,
  `match_id` char(13) NOT NULL,
  `team_id` char(5) NOT NULL,
  `home_team` tinyint(1) DEFAULT NULL,
  `away_team` tinyint(1) DEFAULT NULL,
  `player_id` char(8) NOT NULL,
  `shirt_number` smallint(3) DEFAULT NULL,
  `player_team_id` char(5) NOT NULL,
  `minute_label` char(5) DEFAULT NULL,
  `minute_regulation` smallint(4) DEFAULT NULL,
  `minute_stoppage` smallint(3) DEFAULT NULL,
  `match_period` varchar(50) DEFAULT NULL,
  `own_goal` tinyint(1) DEFAULT NULL,
  `penalty` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `tournament_id` char(7) NOT NULL,
  `stage_number` smallint(2) NOT NULL,
  `stage_name` varchar(50) DEFAULT NULL,
  `group_name` varchar(50) NOT NULL,
  `count_teams` smallint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_standings`
--

DROP TABLE IF EXISTS `group_standings`;
CREATE TABLE `group_standings` (
  `tournament_id` char(7) NOT NULL,
  `stage_number` smallint(2) NOT NULL,
  `stage_name` varchar(50) DEFAULT NULL,
  `group_name` varchar(5) NOT NULL,
  `position` smallint(2) NOT NULL,
  `team_id` char(5) NOT NULL,
  `played` smallint(2) DEFAULT NULL,
  `wins` smallint(2) DEFAULT NULL,
  `draws` smallint(2) DEFAULT NULL,
  `losses` smallint(2) DEFAULT NULL,
  `goals_for` smallint(2) DEFAULT NULL,
  `goals_against` smallint(2) DEFAULT NULL,
  `goal_difference` smallint(2) DEFAULT NULL,
  `points` smallint(2) DEFAULT NULL,
  `advanced` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `host_countries`
--

DROP TABLE IF EXISTS `host_countries`;
CREATE TABLE `host_countries` (
  `tournament_id` char(7) NOT NULL,
  `team_id` char(5) NOT NULL,
  `performance` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
CREATE TABLE `managers` (
  `key_id` smallint(5) UNSIGNED NOT NULL,
  `manager_id` char(5) NOT NULL,
  `family_name` varchar(100) NOT NULL,
  `given_name` varchar(100) NOT NULL,
  `female` tinyint(1) DEFAULT NULL,
  `country_name` varchar(100) NOT NULL,
  `manager_wikipedia_link` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manager_appearances`
--

DROP TABLE IF EXISTS `manager_appearances`;
CREATE TABLE `manager_appearances` (
  `tournament_id` char(7) NOT NULL,
  `match_id` char(13) NOT NULL,
  `team_id` char(4) NOT NULL,
  `home_team` tinyint(1) DEFAULT NULL,
  `away_team` tinyint(1) DEFAULT NULL,
  `manager_id` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manager_appointments`
--

DROP TABLE IF EXISTS `manager_appointments`;
CREATE TABLE `manager_appointments` (
  `tournament_id` char(7) NOT NULL,
  `team_id` char(4) NOT NULL,
  `manager_id` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
CREATE TABLE `matches` (
  `key_id` smallint(5) UNSIGNED NOT NULL,
  `tournament_id` char(7) NOT NULL,
  `match_id` char(13) NOT NULL,
  `match_name` varchar(100) NOT NULL,
  `stage_name` varchar(100) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `group_stage` tinyint(1) DEFAULT NULL,
  `knockout_stage` tinyint(1) DEFAULT NULL,
  `replayed` tinyint(1) DEFAULT NULL,
  `replay` tinyint(1) DEFAULT NULL,
  `match_date` date NOT NULL,
  `match_time` char(6) NOT NULL,
  `stadium_id` char(5) NOT NULL,
  `home_team_id` char(4) NOT NULL,
  `away_team_id` char(4) NOT NULL,
  `score` char(4) NOT NULL,
  `home_team_score` smallint(2) DEFAULT NULL,
  `away_team_score` smallint(2) DEFAULT NULL,
  `home_team_score_margin` smallint(2) DEFAULT NULL,
  `away_team_score_margin` smallint(2) DEFAULT NULL,
  `extra_time` tinyint(1) DEFAULT NULL,
  `penalty_shootout` tinyint(1) DEFAULT NULL,
  `score_penalties` char(4) DEFAULT NULL,
  `home_team_score_penalties` smallint(2) DEFAULT NULL,
  `away_team_score_penalties` smallint(2) DEFAULT NULL,
  `match_result` varchar(50) DEFAULT NULL,
  `home_team_win` tinyint(1) DEFAULT NULL,
  `away_team_win` tinyint(1) DEFAULT NULL,
  `draw` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penalty_kicks`
--

DROP TABLE IF EXISTS `penalty_kicks`;
CREATE TABLE `penalty_kicks` (
  `penalty_kick_id` char(10) NOT NULL,
  `tournament_id` char(7) NOT NULL,
  `match_id` char(13) NOT NULL,
  `team_id` char(5) NOT NULL,
  `home_team` tinyint(1) DEFAULT NULL,
  `away_team` tinyint(1) DEFAULT NULL,
  `player_id` char(8) NOT NULL,
  `shirt_number` smallint(3) DEFAULT NULL,
  `converted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
CREATE TABLE `players` (
  `key_id` smallint(5) UNSIGNED NOT NULL,
  `player_id` char(8) NOT NULL,
  `family_name` varchar(100) NOT NULL,
  `given_name` varchar(100) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `female` tinyint(1) DEFAULT NULL,
  `goal_keeper` tinyint(1) DEFAULT NULL,
  `defender` tinyint(1) DEFAULT NULL,
  `midfielder` tinyint(1) DEFAULT NULL,
  `forward` tinyint(1) DEFAULT NULL,
  `count_tournaments` smallint(5) UNSIGNED DEFAULT NULL,
  `list_tournaments` varchar(100) NOT NULL,
  `player_wikipedia_link` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_appearances`
--

DROP TABLE IF EXISTS `player_appearances`;
CREATE TABLE `player_appearances` (
  `tournament_id` char(7) NOT NULL,
  `match_id` char(13) NOT NULL,
  `team_id` char(4) NOT NULL,
  `home_team` tinyint(1) DEFAULT NULL,
  `away_team` tinyint(1) DEFAULT NULL,
  `player_id` char(8) NOT NULL,
  `shirt_number` smallint(3) NOT NULL,
  `position_name` varchar(100) NOT NULL,
  `position_code` char(2) NOT NULL,
  `starter` tinyint(1) DEFAULT NULL,
  `substitute` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qualified_teams`
--

DROP TABLE IF EXISTS `qualified_teams`;
CREATE TABLE `qualified_teams` (
  `key_id` smallint(5) UNSIGNED NOT NULL,
  `tournament_id` char(7) NOT NULL,
  `team_id` char(4) NOT NULL,
  `count_matches` smallint(2) DEFAULT NULL,
  `performance` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referees`
--

DROP TABLE IF EXISTS `referees`;
CREATE TABLE `referees` (
  `key_id` smallint(5) UNSIGNED NOT NULL,
  `referee_id` char(5) NOT NULL,
  `family_name` varchar(100) NOT NULL,
  `given_name` varchar(100) NOT NULL,
  `female` tinyint(1) DEFAULT NULL,
  `country_name` varchar(100) NOT NULL,
  `confederation_id` char(4) NOT NULL,
  `referee_wikipedia_link` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referee_appearances`
--

DROP TABLE IF EXISTS `referee_appearances`;
CREATE TABLE `referee_appearances` (
  `tournament_id` char(7) NOT NULL,
  `match_id` char(13) NOT NULL,
  `referee_id` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referee_appointments`
--

DROP TABLE IF EXISTS `referee_appointments`;
CREATE TABLE `referee_appointments` (
  `tournament_id` char(7) NOT NULL,
  `referee_id` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `squads`
--

DROP TABLE IF EXISTS `squads`;
CREATE TABLE `squads` (
  `key_id` smallint(5) UNSIGNED NOT NULL,
  `tournament_id` char(7) NOT NULL,
  `team_id` char(4) NOT NULL,
  `player_id` char(8) NOT NULL,
  `shirt_number` smallint(2) DEFAULT NULL,
  `position_name` varchar(50) NOT NULL,
  `position_code` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stadiums`
--

DROP TABLE IF EXISTS `stadiums`;
CREATE TABLE `stadiums` (
  `key_id` smallint(5) UNSIGNED NOT NULL,
  `stadium_id` char(5) NOT NULL,
  `stadium_name` varchar(100) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `country_name` varchar(100) NOT NULL,
  `stadium_capacity` int(11) DEFAULT NULL,
  `stadium_wikipedia_link` varchar(250) DEFAULT NULL,
  `city_wikipedia_link` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `substitutions`
--

DROP TABLE IF EXISTS `substitutions`;
CREATE TABLE `substitutions` (
  `substitution_id` char(8) NOT NULL,
  `tournament_id` char(7) NOT NULL,
  `match_id` char(13) NOT NULL,
  `team_id` char(5) NOT NULL,
  `home_team` tinyint(1) DEFAULT NULL,
  `away_team` tinyint(1) DEFAULT NULL,
  `player_id` char(8) NOT NULL,
  `shirt_number` smallint(3) DEFAULT NULL,
  `minute_label` varchar(10) DEFAULT NULL,
  `minute_regulation` smallint(3) DEFAULT NULL,
  `minute_stoppage` smallint(3) DEFAULT NULL,
  `match_period` varchar(100) DEFAULT NULL,
  `going_off` tinyint(1) DEFAULT NULL,
  `coming_on` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams` (
  `key_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` char(4) NOT NULL,
  `team_name` varchar(100) NOT NULL,
  `team_code` char(3) NOT NULL,
  `mens_team` tinyint(1) DEFAULT NULL,
  `womens_team` tinyint(1) DEFAULT NULL,
  `federation_name` varchar(100) NOT NULL,
  `region_name` varchar(100) NOT NULL,
  `confederation_id` char(4) NOT NULL,
  `mens_team_wikipedia_link` varchar(250) NOT NULL,
  `womens_team_wikipedia_link` varchar(250) NOT NULL,
  `federation_wikipedia_link` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_appearances`
--

DROP TABLE IF EXISTS `team_appearances`;
CREATE TABLE `team_appearances` (
  `tournament_id` char(7) NOT NULL,
  `match_id` char(13) NOT NULL,
  `team_id` char(4) NOT NULL,
  `opponent_id` char(4) NOT NULL,
  `home_team` tinyint(1) DEFAULT NULL,
  `away_team` tinyint(1) DEFAULT NULL,
  `goals_for` smallint(2) DEFAULT NULL,
  `goals_against` smallint(2) DEFAULT NULL,
  `goal_differential` smallint(2) DEFAULT NULL,
  `extra_time` tinyint(1) DEFAULT NULL,
  `penalty_shootout` tinyint(1) DEFAULT NULL,
  `penalties_for` smallint(2) DEFAULT NULL,
  `penalties_against` smallint(2) DEFAULT NULL,
  `match_result` varchar(20) DEFAULT NULL,
  `win` tinyint(1) DEFAULT NULL,
  `lose` tinyint(1) DEFAULT NULL,
  `draw` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tournaments`
--

DROP TABLE IF EXISTS `tournaments`;
CREATE TABLE `tournaments` (
  `key_id` smallint(5) UNSIGNED NOT NULL,
  `tournament_id` char(7) NOT NULL,
  `tournament_name` varchar(100) NOT NULL,
  `year` year(4) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `host_country` varchar(100) NOT NULL,
  `winner` varchar(100) NOT NULL,
  `host_won` tinyint(1) NOT NULL,
  `count_teams` int(11) NOT NULL,
  `group_stage` tinyint(1) NOT NULL,
  `second_group_stage` tinyint(1) NOT NULL,
  `final_round` tinyint(1) NOT NULL,
  `round_of_16` tinyint(1) NOT NULL,
  `quarter_finals` tinyint(1) NOT NULL,
  `semi_finals` tinyint(1) NOT NULL,
  `third_place_match` tinyint(1) NOT NULL,
  `final` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tournament_stages`
--

DROP TABLE IF EXISTS `tournament_stages`;
CREATE TABLE `tournament_stages` (
  `tournament_id` char(7) NOT NULL,
  `stage_number` smallint(2) NOT NULL,
  `stage_name` varchar(50) DEFAULT NULL,
  `group_stage` tinyint(1) DEFAULT NULL,
  `knockout_stage` tinyint(1) DEFAULT NULL,
  `unbalanced_groups` tinyint(1) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `count_matches` smallint(2) DEFAULT NULL,
  `count_teams` smallint(2) DEFAULT NULL,
  `count_scheduled` smallint(2) DEFAULT NULL,
  `count_replays` smallint(2) DEFAULT NULL,
  `count_playoffs` smallint(2) DEFAULT NULL,
  `count_walkovers` smallint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tournament_standings`
--

DROP TABLE IF EXISTS `tournament_standings`;
CREATE TABLE `tournament_standings` (
  `tournament_id` char(7) NOT NULL,
  `position` smallint(2) NOT NULL,
  `team_id` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`award_id`);

--
-- Indexes for table `award_winners`
--
ALTER TABLE `award_winners`
  ADD PRIMARY KEY (`tournament_id`,`award_id`,`player_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `award_id` (`award_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `tournament_id` (`tournament_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `confederations`
--
ALTER TABLE `confederations`
  ADD PRIMARY KEY (`confederation_id`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`goal_id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `player_team_id` (`player_team_id`),
  ADD KEY `tournament_id` (`tournament_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`tournament_id`,`stage_number`,`group_name`);

--
-- Indexes for table `group_standings`
--
ALTER TABLE `group_standings`
  ADD PRIMARY KEY (`tournament_id`,`stage_number`,`group_name`,`position`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `host_countries`
--
ALTER TABLE `host_countries`
  ADD PRIMARY KEY (`tournament_id`,`team_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `managers`
--
ALTER TABLE `managers`
  ADD PRIMARY KEY (`manager_id`);

--
-- Indexes for table `manager_appearances`
--
ALTER TABLE `manager_appearances`
  ADD PRIMARY KEY (`tournament_id`,`match_id`,`team_id`,`manager_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Indexes for table `manager_appointments`
--
ALTER TABLE `manager_appointments`
  ADD PRIMARY KEY (`tournament_id`,`team_id`,`manager_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`match_id`),
  ADD KEY `home_team_id` (`home_team_id`),
  ADD KEY `away_team_id` (`away_team_id`),
  ADD KEY `stadium_id` (`stadium_id`),
  ADD KEY `tournament_id` (`tournament_id`);

--
-- Indexes for table `penalty_kicks`
--
ALTER TABLE `penalty_kicks`
  ADD PRIMARY KEY (`penalty_kick_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `tournament_id` (`tournament_id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player_id`);

--
-- Indexes for table `player_appearances`
--
ALTER TABLE `player_appearances`
  ADD PRIMARY KEY (`tournament_id`,`match_id`,`team_id`,`player_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `qualified_teams`
--
ALTER TABLE `qualified_teams`
  ADD PRIMARY KEY (`tournament_id`,`team_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `referees`
--
ALTER TABLE `referees`
  ADD PRIMARY KEY (`referee_id`),
  ADD KEY `confederation_id` (`confederation_id`);

--
-- Indexes for table `referee_appearances`
--
ALTER TABLE `referee_appearances`
  ADD PRIMARY KEY (`tournament_id`,`match_id`,`referee_id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `referee_id` (`referee_id`);

--
-- Indexes for table `referee_appointments`
--
ALTER TABLE `referee_appointments`
  ADD PRIMARY KEY (`tournament_id`,`referee_id`),
  ADD KEY `referee_id` (`referee_id`);

--
-- Indexes for table `squads`
--
ALTER TABLE `squads`
  ADD PRIMARY KEY (`tournament_id`,`team_id`,`player_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `stadiums`
--
ALTER TABLE `stadiums`
  ADD PRIMARY KEY (`stadium_id`);

--
-- Indexes for table `substitutions`
--
ALTER TABLE `substitutions`
  ADD PRIMARY KEY (`substitution_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `tournament_id` (`tournament_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`team_id`),
  ADD KEY `confederation_id` (`confederation_id`);

--
-- Indexes for table `team_appearances`
--
ALTER TABLE `team_appearances`
  ADD PRIMARY KEY (`tournament_id`,`match_id`,`team_id`),
  ADD KEY `opponent_id` (`opponent_id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `tournaments`
--
ALTER TABLE `tournaments`
  ADD PRIMARY KEY (`tournament_id`);

--
-- Indexes for table `tournament_stages`
--
ALTER TABLE `tournament_stages`
  ADD PRIMARY KEY (`tournament_id`,`stage_number`);

--
-- Indexes for table `tournament_standings`
--
ALTER TABLE `tournament_standings`
  ADD PRIMARY KEY (`tournament_id`,`position`),
  ADD KEY `team_id` (`team_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `award_winners`
--
ALTER TABLE `award_winners`
  ADD CONSTRAINT `award_winners_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`),
  ADD CONSTRAINT `award_winners_ibfk_2` FOREIGN KEY (`award_id`) REFERENCES `awards` (`award_id`),
  ADD CONSTRAINT `award_winners_ibfk_3` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`),
  ADD CONSTRAINT `award_winners_ibfk_4` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`);

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`),
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  ADD CONSTRAINT `bookings_ibfk_4` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`);

--
-- Constraints for table `goals`
--
ALTER TABLE `goals`
  ADD CONSTRAINT `goals_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  ADD CONSTRAINT `goals_ibfk_2` FOREIGN KEY (`player_team_id`) REFERENCES `teams` (`team_id`),
  ADD CONSTRAINT `goals_ibfk_3` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`),
  ADD CONSTRAINT `goals_ibfk_4` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`),
  ADD CONSTRAINT `goals_ibfk_5` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`);

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`);

--
-- Constraints for table `group_standings`
--
ALTER TABLE `group_standings`
  ADD CONSTRAINT `group_standings_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`),
  ADD CONSTRAINT `group_standings_ibfk_2` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`);

--
-- Constraints for table `host_countries`
--
ALTER TABLE `host_countries`
  ADD CONSTRAINT `host_countries_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`),
  ADD CONSTRAINT `host_countries_ibfk_2` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`);

--
-- Constraints for table `manager_appearances`
--
ALTER TABLE `manager_appearances`
  ADD CONSTRAINT `manager_appearances_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`),
  ADD CONSTRAINT `manager_appearances_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  ADD CONSTRAINT `manager_appearances_ibfk_3` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`),
  ADD CONSTRAINT `manager_appearances_ibfk_4` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`manager_id`);

--
-- Constraints for table `manager_appointments`
--
ALTER TABLE `manager_appointments`
  ADD CONSTRAINT `manager_appointments_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`),
  ADD CONSTRAINT `manager_appointments_ibfk_2` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`),
  ADD CONSTRAINT `manager_appointments_ibfk_3` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`manager_id`);

--
-- Constraints for table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`home_team_id`) REFERENCES `teams` (`team_id`),
  ADD CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`away_team_id`) REFERENCES `teams` (`team_id`),
  ADD CONSTRAINT `matches_ibfk_3` FOREIGN KEY (`stadium_id`) REFERENCES `stadiums` (`stadium_id`),
  ADD CONSTRAINT `matches_ibfk_4` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`);

--
-- Constraints for table `penalty_kicks`
--
ALTER TABLE `penalty_kicks`
  ADD CONSTRAINT `penalty_kicks_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`),
  ADD CONSTRAINT `penalty_kicks_ibfk_2` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`),
  ADD CONSTRAINT `penalty_kicks_ibfk_3` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  ADD CONSTRAINT `penalty_kicks_ibfk_4` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`);

--
-- Constraints for table `player_appearances`
--
ALTER TABLE `player_appearances`
  ADD CONSTRAINT `player_appearances_ibfk_1` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`),
  ADD CONSTRAINT `player_appearances_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`),
  ADD CONSTRAINT `player_appearances_ibfk_3` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  ADD CONSTRAINT `player_appearances_ibfk_4` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`);

--
-- Constraints for table `qualified_teams`
--
ALTER TABLE `qualified_teams`
  ADD CONSTRAINT `qualified_teams_ibfk_1` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`),
  ADD CONSTRAINT `qualified_teams_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`);

--
-- Constraints for table `referees`
--
ALTER TABLE `referees`
  ADD CONSTRAINT `referees_ibfk_1` FOREIGN KEY (`confederation_id`) REFERENCES `confederations` (`confederation_id`);

--
-- Constraints for table `referee_appearances`
--
ALTER TABLE `referee_appearances`
  ADD CONSTRAINT `referee_appearances_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  ADD CONSTRAINT `referee_appearances_ibfk_2` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`),
  ADD CONSTRAINT `referee_appearances_ibfk_3` FOREIGN KEY (`referee_id`) REFERENCES `referees` (`referee_id`);

--
-- Constraints for table `referee_appointments`
--
ALTER TABLE `referee_appointments`
  ADD CONSTRAINT `referee_appointments_ibfk_1` FOREIGN KEY (`referee_id`) REFERENCES `referees` (`referee_id`),
  ADD CONSTRAINT `referee_appointments_ibfk_2` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`);

--
-- Constraints for table `squads`
--
ALTER TABLE `squads`
  ADD CONSTRAINT `squads_ibfk_1` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`),
  ADD CONSTRAINT `squads_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`),
  ADD CONSTRAINT `squads_ibfk_3` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`);

--
-- Constraints for table `substitutions`
--
ALTER TABLE `substitutions`
  ADD CONSTRAINT `substitutions_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`),
  ADD CONSTRAINT `substitutions_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  ADD CONSTRAINT `substitutions_ibfk_3` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`),
  ADD CONSTRAINT `substitutions_ibfk_4` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`);

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`confederation_id`) REFERENCES `confederations` (`confederation_id`);

--
-- Constraints for table `team_appearances`
--
ALTER TABLE `team_appearances`
  ADD CONSTRAINT `team_appearances_ibfk_1` FOREIGN KEY (`opponent_id`) REFERENCES `teams` (`team_id`),
  ADD CONSTRAINT `team_appearances_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  ADD CONSTRAINT `team_appearances_ibfk_3` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`),
  ADD CONSTRAINT `team_appearances_ibfk_4` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`);

--
-- Constraints for table `tournament_stages`
--
ALTER TABLE `tournament_stages`
  ADD CONSTRAINT `tournament_stages_ibfk_1` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`);

--
-- Constraints for table `tournament_standings`
--
ALTER TABLE `tournament_standings`
  ADD CONSTRAINT `tournament_standings_ibfk_1` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`),
  ADD CONSTRAINT `tournament_standings_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
