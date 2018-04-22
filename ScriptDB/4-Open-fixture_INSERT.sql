use `nullpoin_open-fixture`;


#############################  TABLES DELETE######################
DELETE FROM configurations;
DELETE FROM games;
DELETE FROM teams;
DELETE FROM stadiums;
DELETE FROM phases;
DELETE FROM groups;
DELETE FROM bets;
DELETE FROM users;

COMMIT;

################ INSERT DE LA TABLA CONFIGURATIONS #######################

INSERT INTO configurations (id,`title`,`short_name`,`url`, `created`, `modified`, `deleted`) VALUES (1,'Team Flags URL','TEAM-FLAGS-URL','/public/assets/images/team-flags/',  sysdate(), sysdate(),0);
INSERT INTO configurations (id,`title`,`short_name`,`url`, `created`, `modified`, `deleted`) VALUES (2,'Backend Root URL','BE-ROOT-URL','http://open-fixture-be.com',  sysdate(), sysdate(),0);
COMMIT;
################ INSERT DE LA TABLA STADIUMS #######################

INSERT INTO stadiums (id,`title`, `created`, `modified`, `deleted`) VALUES (1,'Kaliningrad Stadium',  sysdate(), sysdate(),0);
INSERT INTO stadiums (id,`title`, `created`, `modified`, `deleted`) VALUES (2,'Luzhniki Stadium',  sysdate(), sysdate(),0);
INSERT INTO stadiums (id,`title`, `created`, `modified`, `deleted`) VALUES (3,'Saint Petersburg Stadium',  sysdate(), sysdate(),0);
INSERT INTO stadiums (id,`title`, `created`, `modified`, `deleted`) VALUES (4,'Fisht Stadium ',  sysdate(), sysdate(),0);
INSERT INTO stadiums (id,`title`, `created`, `modified`, `deleted`) VALUES (5,'Ekaterinburg Stadium',  sysdate(), sysdate(),0);
INSERT INTO stadiums (id,`title`, `created`, `modified`, `deleted`) VALUES (6,'Kazan Arena',  sysdate(), sysdate(),0);
INSERT INTO stadiums (id,`title`, `created`, `modified`, `deleted`) VALUES (7,'Nizhny Novgorod Stadium',  sysdate(), sysdate(),0);
INSERT INTO stadiums (id,`title`, `created`, `modified`, `deleted`) VALUES (8,'Rostov-on-Don Stadium',  sysdate(), sysdate(),0);
INSERT INTO stadiums (id,`title`, `created`, `modified`, `deleted`) VALUES (9,'Samara Arena Stadium',  sysdate(), sysdate(),0);
INSERT INTO stadiums (id,`title`, `created`, `modified`, `deleted`) VALUES (10,'Mordovia Arena',  sysdate(), sysdate(),0);
INSERT INTO stadiums (id,`title`, `created`, `modified`, `deleted`) VALUES (11,'Volgograd Stadium',  sysdate(), sysdate(),0);
INSERT INTO stadiums (id,`title`, `created`, `modified`, `deleted`) VALUES (12,'Spartak Stadium',  sysdate(), sysdate(),0);
COMMIT;

################ INSERT DE LA TABLA PHASES #######################

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

INSERT INTO `groups` (id,`title`, `created`, `modified`, `deleted`) VALUES (1,'Grupo A', sysdate(), sysdate(), 0);
INSERT INTO `groups` (id,`title`, `created`, `modified`, `deleted`) VALUES (2,'Grupo B', sysdate(), sysdate(), 0);
INSERT INTO `groups` (id,`title`, `created`, `modified`, `deleted`) VALUES (3,'Grupo C', sysdate(), sysdate(), 0);
INSERT INTO `groups` (id,`title`, `created`, `modified`, `deleted`) VALUES (4,'Grupo D', sysdate(), sysdate(), 0);
INSERT INTO `groups` (id,`title`, `created`, `modified`, `deleted`) VALUES (5,'Grupo E', sysdate(), sysdate(), 0);
INSERT INTO `groups` (id,`title`, `created`, `modified`, `deleted`) VALUES (6,'Grupo F', sysdate(), sysdate(), 0);
INSERT INTO `groups` (id,`title`, `created`, `modified`, `deleted`) VALUES (7,'Grupo G', sysdate(), sysdate(), 0);
INSERT INTO `groups` (id,`title`, `created`, `modified`, `deleted`) VALUES (8,'Grupo H', sysdate(), sysdate(), 0);
COMMIT ;


##############################  INSERTS DE LA TABLA TEAMS ###############

INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (1,  'Rusia','RUS',1, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (2,'Arabia Saudi','KSA',1, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (3,'Egipto','EGY',1, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (4,'Uruguay','URU',1, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (5,'Portugal','POR',2, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (6,'Marruecos','MAR',2, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (7,'España','ESP',2, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (8,'Iran','IRN',2, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (9,'Francia','FRA',3, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (10,'Australia','AUS',3, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (11,'Peru','PER',3, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (12,'Dinamarca','DEN',3, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (13,'Argentina','ARG',4, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (14,'Islandia','ISL',4, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (15,'Croacia','CRO',4, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (16,'Nigeria','NGA',4, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (17,'Brasil','BRA',5, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (18,'Suiza','SUI',5, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (19,'Costa Rica','CRC',5, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (20,'Serbia','SRB',5, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (21,'Alemania','GER',6, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (22,'Mexico','MEX',6, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (23,'Suecia','SWE',6, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (24,'Corea del Sur','KOR',6, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (25,'Belgica','BEL',7, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (26,'Panama','PAN',7, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (27,'Tunez','TUN',7, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (28,'Inglaterra','ENG',7, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (29,'Polonia','POL',8, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (30,'Senegal','SEN',8, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (31,'Colombia','COL',8, sysdate(),sysdate());
INSERT INTO  teams (id, `title`,`short_name`, `group_id`, `created`,`modified`) VALUES (32,'Japon','JPN',8, sysdate(),sysdate());
COMMIT ;

##############################  INSERTS DE LA TABLA GAMES ###############


INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (1, 1, 1, 2, '2018-02-14 12:00:00', 0, 0, 1, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (2, 1, 6, 8, '2018-04-07 17:00:00', 0, 0, 2, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (3, 1, 3, 4, '2018-06-15 09:00:00', 0, 0, 3, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (4, 1, 5, 7, '2018-06-15 15:00:00', 0, 0, 4, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (5, 1, 9, 10, '2018-06-16 07:00:00', 0, 0, 5, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (6, 1, 13, 14, '2018-06-16 10:00:00', 0, 0, 6, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (7, 1, 11, 12, '2018-06-16 13:00:00', 0, 0, 7, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (8, 1, 15, 16, '2018-06-16 16:00:00', 0, 0, 8, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (9, 1, 19, 20, '2018-06-17 09:00:00', 0, 0, 9, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (10, 1, 21, 22, '2018-06-17 12:00:00', 0, 0, 10, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (11, 1, 17, 18, '2018-06-17 15:00:00', 0, 0, 11, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (12, 1, 23, 24, '2018-06-18 09:00:00', 0, 0, 12, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (13, 1, 25, 26, '2018-06-18 12:00:00', 0, 0, 2, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (14, 1, 27, 28, '2018-06-18 15:00:00', 0, 0, 3, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (15, 1, 31, 32, '2018-06-19 09:00:00', 0, 0, 4, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (16, 1, 29, 30, '2018-06-19 12:00:00', 0, 0, 5, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (17, 2, 1, 3, '2018-06-19 15:00:00', 0, 0, 6, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (18, 2, 5, 6, '2018-06-20 09:00:00', 0, 0, 7, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (19, 2, 2, 4, '2018-06-20 12:00:00', 0, 0, 8, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (20, 2, 8, 7, '2018-06-20 15:00:00', 0, 0, 9, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (21, 2, 12, 10, '2018-06-21 09:00:00', 0, 0, 10, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (22, 2, 9, 11, '2018-06-21 12:00:00', 0, 0, 11, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (23, 2, 13, 15, '2018-06-21 15:00:00', 0, 0, 1, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (24, 2, 17, 19, '2018-06-22 09:00:00', 0, 0, 2, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (25, 2, 16, 14, '2018-06-22 12:00:00', 0, 0, 12, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (26, 2, 20, 18, '2018-06-22 15:00:00', 0, 0, 4, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (27, 2, 25, 27, '2018-06-23 09:00:00', 0, 0, 5, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (28, 2, 24, 22, '2018-06-23 12:00:00', 0, 0, 6, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (29, 2, 21, 23, '2018-06-23 15:00:00', 0, 0, 7, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (30, 2, 28, 26, '2018-06-24 09:00:00', 0, 0, 8, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (31, 2, 32, 30, '2018-06-24 12:00:00', 0, 0, 9, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (32, 2, 29, 31, '2018-06-24 15:00:00', 0, 0, 10, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (33, 3, 2, 3, '2018-06-25 11:00:00', 0, 0, 11, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (34, 3, 4, 1, '2018-06-25 11:00:00', 0, 0, 1, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (35, 3, 8, 5, '2018-06-25 15:00:00', 0, 0, 2, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (36, 3, 7, 6, '2018-06-25 15:00:00', 0, 0, 3, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (37, 3, 10, 11, '2018-06-26 11:00:00', 0, 0, 4, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (38, 3, 16, 13, '2018-06-26 15:00:00', 0, 0, 5, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (39, 3, 12, 9, '2018-06-26 11:00:00', 0, 0, 6, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (40, 3, 15, 14, '2018-06-26 15:00:00', 0, 0, 7, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (41, 3, 24, 21, '2018-06-27 11:00:00', 0, 0, 8, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (42, 3, 22, 23, '2018-06-27 11:00:00', 0, 0, 9, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (43, 3, 18, 19, '2018-06-27 15:00:00', 0, 0, 12, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (44, 3, 20, 17, '2018-06-27 15:00:00', 0, 0, 11, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (45, 3, 30, 31, '2018-06-28 11:00:00', 0, 0, 1, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (46, 3, 32, 29, '2018-06-28 11:00:00', 0, 0, 2, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (47, 3, 28, 25, '2018-06-28 15:00:00', 0, 0, 3, sysdate(), sysdate(), 0);
INSERT INTO games (id, phase_id, team_a_id, team_b_id, date_up, goals_team_a, goals_team_b, stadium_id, created, modified, deleted) VALUES (48, 3, 26, 27, '2018-06-28 15:00:00', 0, 0, 4, sysdate(), sysdate(), 0);
COMMIT;

###################################################
# cambiar la fecha de los primeros  3 juegos a la #
# fecha del dia, solo para DEVELOPMENT MODE       #
# #################################################
UPDATE games set games.date_up=STR_TO_DATE(concat(current_date(),' ','11:15:00'),'%Y-%m-%d %H:%i:%s') where games.id=1;
UPDATE games set games.date_up=STR_TO_DATE(concat(current_date(),' ','14:45:00'),'%Y-%m-%d %H:%i:%s') where games.id=2;
UPDATE games set games.date_up=STR_TO_DATE(concat(current_date(),' ','18:00:00'),'%Y-%m-%d %H:%i:%s')where games.id=3;
COMMIT;

##############################  INSERTS DE LA TABLA USERS ###############
INSERT INTO users (id, title, alias, username, password, approved, created, modified, deleted) VALUES (1, null, null, 'rbenal@gmail.com', null, 0,sysdate(),sysdate(), 0);
INSERT INTO users (id, title, alias, username, password, approved, created, modified, deleted) VALUES (2, null, null, 'rbenal@outlook.com', null, 0,sysdate(),sysdate(), 0);
INSERT INTO users (id, title, alias, username, password, approved, created, modified, deleted) VALUES (3, null, null, 'dlmora91@gmail.com', null, 0, sysdate(), sysdate(), 0);
COMMIT;

##############################  INSERTS DE LA TABLA BETS ###############
#rbenal@gmail.com
delete from bets;
commit;

INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (1, 1, 1, 3, 2, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (2, 1, 2, 5, 7, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (3, 1, 3, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (4, 1, 4, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (5, 1, 5, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (6, 1, 6, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (7, 1, 7, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (8, 1, 8, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (9, 1, 9, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (10, 1, 10, 1, 0, sysdate(), sysdate(), 0);

INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (11, 1, 11, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (12, 1, 12, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (13, 1, 13, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (14, 1, 14, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (15, 1, 15, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (16, 1, 16, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (17, 1, 17, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (18, 1, 18, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (19, 1, 19, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (20, 1, 20, 1, 0, sysdate(), sysdate(), 0);

INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (21, 1, 21, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (22, 1, 22, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (23, 1, 23, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (24, 1, 24, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (25, 1, 25, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (26, 1, 26, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (27, 1, 27, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (28, 1, 28, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (29, 1, 29, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (30, 1, 30, 1, 0, sysdate(), sysdate(), 0);


INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (31, 1, 31, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (32, 1, 32, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (33, 1, 33, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (34, 1, 34, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (35, 1, 35, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (36, 1, 36, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (37, 1, 37, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (38, 1, 38, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (39, 1, 39, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (40, 1, 40, 1, 0, sysdate(), sysdate(), 0);


INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (41, 1, 41, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (42, 1, 42, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (43, 1, 43, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (44, 1, 44, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (45, 1, 45, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (46, 1, 46, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (47, 1, 47, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (48, 1, 48, 1, 0, sysdate(), sysdate(), 0);

############################################################################
######################## INSERT BETS FOR USER 2 ############################
############################################################################



INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (88, 2, 1, 5, 7, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (49, 2, 2, 5, 7, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (50, 2, 3, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (51, 2, 4, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (52, 2, 5, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (53, 2, 6, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (54, 2, 7, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (55, 2, 8, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (56, 2, 9, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (57, 2, 10, 1, 0, sysdate(), sysdate(), 0);

INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (58, 2, 11, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (59, 2, 12, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (60, 2, 13, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (61, 2, 14, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (62, 2, 15, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (63, 2, 16, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (64, 2, 17, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (65, 2, 18, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (66, 2, 19, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (67, 2, 20, 1, 0, sysdate(), sysdate(), 0);

INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (68, 2, 21, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (69, 2, 22, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (70, 2, 23, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (71, 2, 24, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (72, 2, 25, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (73, 2, 26, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (74, 2, 27, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (75, 2, 28, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (76, 2, 29, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (77, 2, 30, 1, 0, sysdate(), sysdate(), 0);


INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (78, 2, 31, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (79, 2, 32, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (80, 2, 33, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (81, 2, 34, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (82, 2, 35, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (83, 2, 36, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (84, 2, 37, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (85, 2, 38, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (86, 2, 39, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (87, 2, 40, 1, 0, sysdate(), sysdate(), 0);


INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (89, 2, 41, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (90, 2, 42, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (91, 2, 43, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (92, 2, 44, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (93, 2, 45, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (94, 2, 46, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (95, 2, 47, 1, 0, sysdate(), sysdate(), 0);
INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (96, 2, 48, 1, 0, sysdate(), sysdate(), 0);
COMMIT;
#
# #rbenal@outlook.com
# INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (4, 2, 1, 3, 7, sysdate(), sysdate(), 0);
# INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (5, 2, 2, 1, 2, sysdate(), sysdate(), 0);
# INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (6, 2, 3, 2, 4, sysdate(), sysdate(), 0);
# COMMIT;
#
# #dlmora91@gmail.com
# INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (7, 3, 1, 1, 0, sysdate(), sysdate(), 0);
# INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (8, 3, 2, 3, 0, sysdate(), sysdate(), 0);
# INSERT INTO `nullpoin_open-fixture`.bets (id, user_id, game_id, goals_team_a, goals_team_b, created, modified, deleted) VALUES (9, 3, 3, 2, 2, sysdate(), sysdate(), 0);
# COMMIT;
