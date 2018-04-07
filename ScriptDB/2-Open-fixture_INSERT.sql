use open_fixture;


################ INSERT DE LA TABLA PHASES #######################
DELETE FROM phases;

INSERT INTO phases (id,`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES (1,'Fase de Grupos - Jornada 1', '2018-06-14', '2018-06-28', sysdate(), sysdate(),0);
INSERT INTO phases (id,`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES (2,'Fase de Grupos - jornada 2', '2018-06-14', '2018-06-28', sysdate(), sysdate(),0);
INSERT INTO phases (id,`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES (3,'Fase de Grupos - Jornada 3', '2018-06-14', '2018-06-28', sysdate(), sysdate(),0);
INSERT INTO phases (id,`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES (4,'Fase Octavos', '2018-06-30', '2018-07-03', sysdate(), sysdate(),0);
INSERT INTO phases (id,`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES (5,'Fase de Cuartos', '2018-07-06', '2018-07-07', sysdate(), sysdate(),0);
INSERT INTO phases (id,`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES (6,'Fase de Semifinal', '2018-07-10', '2018-07-11', sysdate(), sysdate(),0);
INSERT INTO phases (id,`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES (7,'Fase de 3ro', '2018-07-14', '2018-07-14', sysdate(), sysdate(),0);
INSERT INTO phases (id,`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES (8,'Fase Final', '2018-07-15', '2018-07-15', sysdate(), sysdate(),0);
COMMIT;
##############################  INSERT DE LA TABLA GROUPS###############
DELETE FROM groups;

INSERT INTO `groups` (id,`title`, `created`, `modified`, `deleted`) VALUES (1,'Grupo A', now(), now(), 0);
INSERT INTO `groups` (id,`title`, `created`, `modified`, `deleted`) VALUES (2,'Grupo B', now(), now(), 0);
INSERT INTO `groups` (id,`title`, `created`, `modified`, `deleted`) VALUES (3,'Grupo C', now(), now(), 0);
INSERT INTO `groups` (id,`title`, `created`, `modified`, `deleted`) VALUES (4,'Grupo D', now(), now(), 0);
INSERT INTO `groups` (id,`title`, `created`, `modified`, `deleted`) VALUES (5,'Grupo E', now(), now(), 0);
INSERT INTO `groups` (id,`title`, `created`, `modified`, `deleted`) VALUES (6,'Grupo F', now(), now(), 0);
INSERT INTO `groups` (id,`title`, `created`, `modified`, `deleted`) VALUES (7,'Grupo G', now(), now(), 0);
INSERT INTO `groups` (id,`title`, `created`, `modified`, `deleted`) VALUES (8,'Grupo H', now(), now(), 0);
COMMIT ;


##############################  INSERTS DE LA TABLA TEAMS ###############
DELETE FROM teams;

INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (1,  'Rusia','RUS',1, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (2,'Arabia Saudi','KSA',1, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (3,'Egipto','EGY',1, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (4,'Uruguay','URU',1, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (5,'Portugal','POR',2, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (6,'Marruecos','MAR',2, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (7,'España','ESP',2, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (8,'Iran','IRN',2, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (9,'Francia','FRA',3, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (10,'Australia','AUS',3, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (11,'Peru','PER',3, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (12,'Dinamarca','DEN',3, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (13,'Argentina','ARG',4, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (14,'Islandia','ISL',4, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (15,'Croacia','CRO',4, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (16,'Nigeria','NGA',4, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (17,'Brasil','BRA',5, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (18,'Suiza','SUI',5, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (19,'Costa Rica','CRC',5, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (20,'Serbia','SRB',5, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (21,'Alemania','GER',6, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (22,'Mexico','MEX',6, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (23,'Suecia','SWE',6, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (24,'Corea del Sur','KOR',6, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (25,'Belgica','BEL',7, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (26,'Panama','PAN',7, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (27,'Tunez','TUN',7, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (28,'Inglaterra','ENG',7, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (29,'Polonia','POL',8, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (30,'Senegal','SEN',8, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (31,'Colombia','COL',8, SYSDATE(),SYSDATE());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (32,'Japon','JPN',8, SYSDATE(),SYSDATE());
COMMIT ;

#############################  INSERT DE LOS PARTIDOS ######################
DELETE FROM games;

INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (1,1, 1, 2, '2018-06-14 12:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (2,1, 6, 8, '2018-06-15 12:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (3,1, 3, 4, '2018-06-15 09:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (4,1, 5, 7, '2018-06-15 15:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (5,1, 9, 10, '2018-06-16 07:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (6,1, 13, 14, '2018-06-16 10:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (7,1, 11, 12, '2018-06-16 13:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (8,1, 15, 16, '2018-06-16 16:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (9,1, 19, 20, '2018-06-17 09:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (10,1, 21, 22, '2018-06-17 12:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (11,1, 17, 18, '2018-06-17 15:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (12,1, 23, 24, '2018-06-18 09:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (13,1, 25, 26, '2018-06-18 12:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (14,1, 27, 28, '2018-06-18 15:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (15,1, 31, 32, '2018-06-19 09:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (16,1, 29, 30, '2018-06-19 12:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (17,1, 1, 3, '2018-06-19 15:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (18,1, 5, 6, '2018-06-20 09:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (19,1, 2, 4, '2018-06-20 12:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (20,1, 8, 7, '2018-06-20 15:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (21,1, 12, 10, '2018-06-21 09:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (22,1, 9, 11, '2018-06-21 12:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (23,1, 13, 15, '2018-06-21 15:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (24,1, 17, 19, '2018-06-22 09:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (25,1, 16, 14, '2018-06-22 12:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (26,1, 20, 18, '2018-06-22 15:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (27,1, 25, 27, '2018-06-23 09:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (28,1, 24, 22, '2018-06-23 12:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (29,1, 21, 23, '2018-06-23 15:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (30,1, 28, 26, '2018-06-24 09:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (31,1, 32, 30, '2018-06-24 12:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (32,1, 29, 31, '2018-06-24 15:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (33,1, 2, 3, '2018-06-25 11:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (34,1, 4, 1, '2018-06-25 11:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (35,1, 8, 5, '2018-06-25 15:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (36,1, 7, 6, '2018-06-25 15:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (37,1, 10, 11, '2018-06-26 11:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (38,1, 16, 13, '2018-06-26 15:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (39,1, 12, 9, '2018-06-26 11:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (40,1, 15, 14, '2018-06-26 15:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (41,1, 24, 21, '2018-06-27 11:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (42,1, 22, 23, '2018-06-27 11:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (43,1, 18, 19, '2018-06-27 15:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (44,1, 20, 17, '2018-06-27 15:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (45,1, 30, 31, '2018-06-28 11:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (46,1, 32, 29, '2018-06-28 11:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (47,1, 28, 25, '2018-06-28 15:00', 0, 0, now(), now());
INSERT INTO `games` (`id`,`phase_id`, `team_a_id`, `team_b_id`, `date_up`, `goals_team_a`, `goals_team_b`, `created`, `modified`) VALUES (48,1, 26, 27, '2018-06-28 15:00', 0, 0, now(), now());

COMMIT;



