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
 
DROP DATABASE IF EXISTS `open_fixture`; 
-- Dumping database structure for open_fixture 
CREATE DATABASE IF NOT EXISTS `open_fixture` /*!40100 DEFAULT CHARACTER SET latin1 */; 
USE `open_fixture`; 
 
 
-- Data exporting was unselected. 
-- Dumping structure for table open_fixture.games 
CREATE TABLE IF NOT EXISTS `games` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `phase_id` int(11) DEFAULT NULL, 
  `team_a_id` int(11) NOT NULL, 
  `team_b_id` int(11) NOT NULL, 
  `date_up` datetime DEFAULT NULL, 
  `goals_team_a` int(11) DEFAULT 0, 
  `goals_team_b` int(11) DEFAULT 0, 
    `created` datetime DEFAULT now(), 
  `modified` datetime DEFAULT now(), 
  `deleted` int(1) DEFAULT 0, 
  PRIMARY KEY (`id`), 
  FOREIGN KEY (`team_a_id`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION, 
  FOREIGN KEY (`team_b_id`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION, 
  FOREIGN KEY (`phase_id`) REFERENCES `phases` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Información de los partidos con equipos y resultados'; 
 
-- Data exporting was unselected. 
-- Dumping structure for table open_fixture.peoples 
CREATE TABLE IF NOT EXISTS `users` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT,  -- por convenciones de cakephp la clave primaria de todas las tablas se llama "id" 
  `title` varchar(45) DEFAULT NULL, -- por normas de CAKEPHP todos los nombres deben llamarse "TITLE" 
  `alias` varchar(45) DEFAULT NULL, 
  `username` varchar(45) DEFAULT NULL, 
  `password` varchar(300) DEFAULT NULL, 
  `approved` int(1) DEFAULT 0, -- aqui se indica si se valido el pago del usuario por defecto es 0 
  `created` datetime DEFAULT now(), 
  `modified` datetime DEFAULT now(), 
  `deleted` int(1) DEFAULT 0, 
 
 
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 MAX_ROWS=99999 ROW_FORMAT=DYNAMIC; 
 
-- Data exporting was unselected. 
-- Dumping structure for table open_fixture.phases 
CREATE TABLE IF NOT EXISTS `phases` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `title` varchar(45) DEFAULT NULL, 
  `start_date` datetime DEFAULT NULL, 
  `end_date` datetime DEFAULT NULL, 
    `created` datetime DEFAULT no-- -------------------------------------------------------- 
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
 
DROP DATABASE IF EXISTS `open_fixture`; 
-- Dumping database structure for open_fixture 
CREATE DATABASE IF NOT EXISTS `open_fixture` /*!40100 DEFAULT CHARACTER SET latin1 */; 
USE `open_fixture`; 
 
 
-- Data exporting was unselected. 
-- Dumping structure for table open_fixture.games 
CREATE TABLE IF NOT EXISTS `games` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `phase_id` int(11) DEFAULT NULL, 
  `team_a_id` int(11) NOT NULL, 
  `team_b_id` int(11) NOT NULL, 
  `date_up` datetime DEFAULT NULL, 
  `goals_team_a` int(11) DEFAULT 0, 
  `goals_team_b` int(11) DEFAULT 0, 
    `created` datetime DEFAULT now(), 
  `modified` datetime DEFAULT now(), 
  `deleted` int(1) DEFAULT 0, 
  PRIMARY KEY (`id`), 
  FOREIGN KEY (`team_a_id`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION, 
  FOREIGN KEY (`team_b_id`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION, 
  FOREIGN KEY (`phase_id`) REFERENCES `phases` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Información de los partidos con equipos y resultados'; 
 
-- Data exporting was unselected. 
-- Dumping structure for table open_fixture.peoples 
CREATE TABLE IF NOT EXISTS `users` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT,  -- por convenciones de cakephp la clave primaria de todas las tablas se llama "id" 
  `title` varchar(45) DEFAULT NULL, -- por normas de CAKEPHP todos los nombres deben llamarse "TITLE" 
  `alias` varchar(45) DEFAULT NULL, 
  `username` varchar(45) DEFAULT NULL, 
  `password` varchar(300) DEFAULT NULL, 
  `approved` int(1) DEFAULT 0, -- aqui se indica si se valido el pago del usuario por defecto es 0 
  `created` datetime DEFAULT now(), 
  `modified` datetime DEFAULT now(), 
  `deleted` int(1) DEFAULT 0, 
 
 
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 MAX_ROWS=99999 ROW_FORMAT=DYNAMIC; 
 
-- Data exporting was unselected. 
-- Dumping structure for table open_fixture.phases 
CREATE TABLE IF NOT EXISTS `phases` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `title` varchar(45) DEFAULT NULL, 
  `start_date` datetime DEFAULT NULL, 
  `end_date` datetime DEFAULT NULL, 
    `created` datetime DEFAULT now(), 
  `modified` datetime DEFAULT now(), 
  `deleted` int(1) DEFAULT 0, 
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 MAX_ROWS=4294967295 ROW_FORMAT=DYNAMIC COMMENT='Fase de Partidos entre los equipos. Se dividen en: Fase de Grupos, Fase Octavos, Fase Cuartos, Fase Semifinal, Fase 3ro, Fase final'; 
 
 
-- Data exporting was unselected. 
-- Dumping structure for table open_fixture.scores 
CREATE TABLE IF NOT EXISTS `scores` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `user_id` int(11) DEFAULT NULL, 
  `game_id` int(11) DEFAULT NULL, 
  `goals_team_a` int(2) NOT NULL DEFAULT 0, -- no hace falta indicar el equipo ganador, con los goloes se sabe, ademas que puede no haber ganador 
  `goals_team_b` int(2) NOT NULL DEFAULT 0, 
  `created` datetime DEFAULT now(), 
  `modified` datetime DEFAULT now(), 
  `deleted` int(1) DEFAULT 0, 
  PRIMARY KEY (`id`), 
  FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE NO ACTION ON UPDATE NO ACTION, 
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE NO ACTION ON UPDATE NO ACTION 
 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Información de los puntos obtenidos en cada partido'; 
 
 
 
-- Dumping structure for table open_fixture.teams 
CREATE TABLE IF NOT EXISTS `groups` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `title` varchar(45) DEFAULT NULL, 
  `created` datetime DEFAULT now(), 
  `modified` datetime DEFAULT now(), 
  `deleted` int(1) DEFAULT 0, 
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Organizacion por grupos de los equipos'; 
 
 
 
-- Data exporting was unselected. 
-- Dumping structure for table open_fixture.teams 
CREATE TABLE IF NOT EXISTS `teams` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `title` varchar(45) DEFAULT NULL, 
  `short_name` varchar(45) DEFAULT NULL, 
  `group_id` int(11) NOT NULL, 
  `created` datetime DEFAULT now(), 
  `modified` datetime DEFAULT now(), 
  `deleted` int(1) DEFAULT 0, 
  PRIMARY KEY (`id`), 
  FOREIGN KEY (`group_id`) REFERENCES groups(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de los equipos que participan'; 
 
-- Data exporting was unselected. 
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */; 
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */; 
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */; 
w(), 
  `modified` datetime DEFAULT now(), 
  `deleted` int(1) DEFAULT 0, 
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 MAX_ROWS=4294967295 ROW_FORMAT=DYNAMIC COMMENT='Fase de Partidos entre los equipos. Se dividen en: Fase de Grupos, Fase Octavos, Fase Cuartos, Fase Semifinal, Fase 3ro, Fase final'; 
 
 
-- Data exporting was unselected. 
-- Dumping structure for table open_fixture.scores 
CREATE TABLE IF NOT EXISTS `scores` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `user_id` int(11) DEFAULT NULL, 
  `game_id` int(11) DEFAULT NULL, 
  `goals_team_a` int(2) NOT NULL DEFAULT 0, -- no hace falta indicar el equipo ganador, con los goloes se sabe, ademas que puede no haber ganador 
  `goals_team_b` int(2) NOT NULL DEFAULT 0, 
  `created` datetime DEFAULT now(), 
  `modified` datetime DEFAULT now(), 
  `deleted` int(1) DEFAULT 0, 
  PRIMARY KEY (`id`), 
  FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE NO ACTION ON UPDATE NO ACTION, 
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE NO ACTION ON UPDATE NO ACTION 
 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Información de los puntos obtenidos en cada partido'; 
 
 
 
-- Dumping structure for table open_fixture.teams 
CREATE TABLE IF NOT EXISTS `groups` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `title` varchar(45) DEFAULT NULL, 
  `created` datetime DEFAULT now(), 
  `modified` datetime DEFAULT now(), 
  `deleted` int(1) DEFAULT 0, 
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Organizacion por grupos de los equipos'; 
 
 
 
-- Data exporting was unselected. 
-- Dumping structure for table open_fixture.teams 
CREATE TABLE IF NOT EXISTS `teams` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `title` varchar(45) DEFAULT NULL, 
  `short_name` varchar(45) DEFAULT NULL, 
  `group_id` int(11) NOT NULL, 
  `created` datetime DEFAULT now(), 
  `modified` datetime DEFAULT now(), 
  `deleted` int(1) DEFAULT 0, 
  PRIMARY KEY (`id`), 
  FOREIGN KEY (`group_id`) REFERENCES groups(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion de los equipos que participan'; 
 
-- Data exporting was unselected. 
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */; 
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */; 
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */; 
