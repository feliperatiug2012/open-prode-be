-- --------------------------------------------------------
-- Host:                         192.168.56.101
-- Server version:               5.7.21 - MySQL Community Server (GPL)
-- Server OS:                    linux-glibc2.12
-- HeidiSQL Version:             9.5.0.5264
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for open_fixtures
CREATE DATABASE IF NOT EXISTS `open_fixtures` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `open_fixtures`;

-- Dumping structure for table open_fixtures.betting_gratifications
CREATE TABLE IF NOT EXISTS `betting_gratifications` (
  `betting_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `mount` int(11) NOT NULL,
  PRIMARY KEY (`betting_id`),
  KEY `fk_betting_profile` (`profile_id`),
  CONSTRAINT `fk_betting_profile` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`profile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table open_fixtures.games
CREATE TABLE IF NOT EXISTS `games` (
  `game_id` int(11) NOT NULL,
  `phase_id` int(11) DEFAULT NULL,
  `team_a_id` int(11) NOT NULL,
  `team_b_id` int(11) NOT NULL,
  `date_up` datetime DEFAULT NULL,
  `goal_team_a` int(11) DEFAULT '-1',
  `goal_team_b` int(11) DEFAULT '-1',
  PRIMARY KEY (`game_id`),
  KEY `fk_Partido_2_idx` (`phase_id`),
  KEY `fk_Partido_4_idx` (`team_b_id`),
  KEY `fk_Partido_2` (`team_a_id`),
  CONSTRAINT `fk_team_id_1` FOREIGN KEY (`team_a_id`) REFERENCES `teams` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_team_id_2` FOREIGN KEY (`team_b_id`) REFERENCES `teams` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `phase_id` FOREIGN KEY (`phase_id`) REFERENCES `phases` (`phase_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Información de los partidos con equipos y resultados';

-- Data exporting was unselected.
-- Dumping structure for table open_fixtures.peoples
CREATE TABLE IF NOT EXISTS `peoples` (
  `people_id` int(11) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  PRIMARY KEY (`people_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 MAX_ROWS=99999 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table open_fixtures.phases
CREATE TABLE IF NOT EXISTS `phases` (
  `phase_id` int(11) NOT NULL,
  `name_phase` varchar(45) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`phase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 MAX_ROWS=4294967295 ROW_FORMAT=DYNAMIC COMMENT='Fase de Partidos entre los equipos. Se dividen en: Fase de Grupos, Fase Octavos, Fase Cuartos, Fase Semifinal, Fase 3ro, Fase final';

-- Data exporting was unselected.
-- Dumping structure for table open_fixtures.pools
CREATE TABLE IF NOT EXISTS `pools` (
  `pool_id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `phase_id` int(11) NOT NULL,
  `team_win` int(11) NOT NULL,
  `team_loss` int(11) NOT NULL,
  `goal_win` int(2) NOT NULL,
  `goal_loss` int(2) NOT NULL,
  PRIMARY KEY (`pool_id`),
  KEY `idx_pool_id` (`people_id`,`phase_id`),
  KEY `fk_pool_phase` (`phase_id`),
  CONSTRAINT `fk_pool_people` FOREIGN KEY (`people_id`) REFERENCES `peoples` (`people_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pool_phase` FOREIGN KEY (`phase_id`) REFERENCES `phases` (`phase_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table open_fixtures.profiles
CREATE TABLE IF NOT EXISTS `profiles` (
  `profile_id` int(11) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `date_up` date DEFAULT NULL,
  `people_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `persona_UNIQUE` (`people_id`),
  KEY `fk_Perfil_1_idx` (`people_id`),
  CONSTRAINT `people_id` FOREIGN KEY (`people_id`) REFERENCES `peoples` (`people_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table open_fixtures.scores
CREATE TABLE IF NOT EXISTS `scores` (
  `score_id` int(11) NOT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `team_winner` int(11) DEFAULT NULL,
  `GF` int(11) DEFAULT NULL,
  `GC` int(11) DEFAULT NULL,
  PRIMARY KEY (`score_id`),
  KEY `fk_Score_1_idx` (`profile_id`),
  KEY `fk_Score_2_idx` (`game_id`),
  CONSTRAINT `fk_game_id_1` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`profile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_id_2` FOREIGN KEY (`game_id`) REFERENCES `profiles` (`profile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Información de los puntos obtenidos en cada partido';

-- Data exporting was unselected.
-- Dumping structure for table open_fixtures.teams
CREATE TABLE IF NOT EXISTS `teams` (
  `team_id` int(11) NOT NULL,
  `name_team` varchar(45) DEFAULT NULL,
  `short_name` varchar(45) DEFAULT NULL,
  `group` char(1) DEFAULT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de los equipos que participan';

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

