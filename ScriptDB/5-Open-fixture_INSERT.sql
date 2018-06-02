LOCK-BETS-MINSuse `nullpoin_open-fixture`;



#############################  TABLES DELETE######################
DELETE FROM configurations;
DELETE FROM bets;
DELETE FROM games;
DELETE FROM phases;
DELETE FROM teams;
DELETE FROM groups;
DELETE FROM stadiums;



DELETE FROM users;

COMMIT;



################ INSERT DE LA TABLA CONFIGURATIONS PRODUCCION #######################

INSERT INTO configurations (id, title, short_name, value, created, modified, deleted) VALUES (1, 'Team Flags URL','TEAM-FLAGS-URL','/public/assets/images/team-flags/',  sysdate(), sysdate(),0);
INSERT INTO configurations (id, title, short_name, value, created, modified, deleted) VALUES (2, 'Backend Root URL','BE-ROOT-URL','http://pyxis-prode.nullpointer13.com',  sysdate(), sysdate(),0);
INSERT INTO configurations (id, title, short_name, value, created, modified, deleted) VALUES (3, 'Contribution Per User','CONT-PER-USER','200',  sysdate(), sysdate(),0);
INSERT INTO configurations (id, title, short_name, value, created, modified, deleted) VALUES (4, 'Prize Currency Symbol','PRIZE-CURRENCY','$',  sysdate(), sysdate(),0);
INSERT INTO configurations (id, title, short_name, value, created, modified, deleted) VALUES (5, 'Minutes to close game''s bets', 'LOCK-BETS-MINS', '120', '2018-05-20 14:32:36', '2018-05-20 14:32:36', 0);
INSERT INTO configurations (id, title, short_name, value, created, modified, deleted) VALUES (6, 'Event Start Date', 'EVENT-START', '2018-06-14 00:00:00', sysdate(), sysdate(),0);
INSERT INTO configurations (id,title, short_name, value, created, modified,deleted) VALUES ( 7,'Points by Team Favarite', 'Pts by Team Fav', '2', now(), now(),0);
INSERT INTO configurations (id,title, short_name, value, created, modified,deleted) VALUES ( 8,'Cat 1 Result Exact', 'Cat Uno', '10', now(), now(),0);
INSERT INTO configurations (id,title, short_name, value, created, modified,deleted) VALUES ( 9,'Cat 2 Win-Goal 1 Team', 'Cat Dos', '6', now(), now(),0);
INSERT INTO configurations (id,title, short_name, value, created, modified,deleted) VALUES ( 10,'Cat 3 Win-Without-Goal', 'Cat Tres', '4', now(), now(),0);
INSERT INTO configurations (id,title, short_name, value, created, modified,deleted) VALUES ( 11,'Cat 4 Goal-1-team', 'Cat Cuatro', '2', now(), now(),0);
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

# UPDATE games set games.date_up=STR_TO_DATE(concat(current_date(),' ','11:15:00'),'%Y-%m-%d %H:%i:%s') where games.id=1;
# UPDATE games set games.date_up=STR_TO_DATE(concat(current_date(),' ','14:45:00'),'%Y-%m-%d %H:%i:%s') where games.id=2;
# UPDATE games set games.date_up=STR_TO_DATE(concat(current_date(),' ','18:00:00'),'%Y-%m-%d %H:%i:%s')where games.id=3;
# UPDATE games set games.date_up=STR_TO_DATE(concat(current_date(),' ','13:51:00'),'%Y-%m-%d %H:%i:%s')where games.id=4;
# UPDATE games set games.date_up=STR_TO_DATE(concat(current_date(),' ','15:58:00'),'%Y-%m-%d %H:%i:%s')where games.id=5;
# UPDATE games set games.date_up=STR_TO_DATE(concat(current_date(),' ','18:00:00'),'%Y-%m-%d %H:%i:%s')where games.id=6;
UPDATE games set games.date_up=STR_TO_DATE(concat(current_date(),' ','1:00:00'),'%Y-%m-%d %H:%i:%s')where games.id=7;
UPDATE games set games.date_up=STR_TO_DATE(concat(current_date(),' ','1:00:00'),'%Y-%m-%d %H:%i:%s')where games.id=8;
UPDATE games set games.date_up=STR_TO_DATE(concat(current_date(),' ','1:00:00'),'%Y-%m-%d %H:%i:%s')where games.id=9;
UPDATE games set games.date_up=STR_TO_DATE(concat(current_date(),' ','1:00:00'),'%Y-%m-%d %H:%i:%s')where games.id=6;
UPDATE games set games.date_up=STR_TO_DATE(concat(current_date(),' ','1:00:00'),'%Y-%m-%d %H:%i:%s')where games.id=41;
COMMIT;

##############################  INSERTS DE LA TABLA USERS ###############

# INSERT INTO `nullpoin_open-fixture`.users (id, title, alias, username, picture_url, password, approved, admin, created, modified, deleted) VALUES (1, 'Roquefelix Benal', 'rbenal', 'rbenal@gmail.com', 'https://lh4.googleusercontent.com/-kVxShPWGf3Y/AAAAAAAAAAI/AAAAAAAAGpE/1zwZEXXsUWk/photo.jpg', null, 1, 1, '2018-05-06 00:33:55', '2018-05-11 01:10:31', 0);
# INSERT INTO `nullpoin_open-fixture`.users (id, title, alias, username, picture_url, password, approved, admin, created, modified, deleted) VALUES (2, 'Lorena Mora', 'dlmora91', 'dlmora91@gmail.com', 'https://lh4.googleusercontent.com/-H6SH17_A6mk/AAAAAAAAAAI/AAAAAAAAJ74/ST5QoKX0oLQ/photo.jpg', null, 0, 0, '2018-05-06 00:39:45', '2018-05-06 00:39:49', 0);
# INSERT INTO `nullpoin_open-fixture`.users (id, title, alias, username, picture_url, password, approved, admin, created, modified, deleted) VALUES (3, 'Lorena Mora Vivas', 'labebe_lorena2_1', 'labebe_lorena2_1@hotmail.com', 'https://lookaside.facebook.com/platform/profilepic/?asid=10214864099691939&height=50&width=50&ext=1525837265&hash=AeTapKgRlrPi2PeO', null, 1, 0, '2018-05-06 00:41:26', '2018-05-06 00:41:35', 0);
# INSERT INTO `nullpoin_open-fixture`.users (id, title, alias, username, picture_url, password, approved, admin, created, modified, deleted) VALUES (4, 'Ana Pinto', 'katoka2612', 'katoka2612@gmail.com', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg', null, 0, 0, '2018-05-06 00:44:54', '2018-05-06 00:45:05', 0);
# INSERT INTO `nullpoin_open-fixture`.users (id, title, alias, username, picture_url, password, approved, admin, created, modified, deleted) VALUES (5, 'Ana Pinto Correia', 'ana2624', 'ana2624@hotmail.com', 'https://lookaside.facebook.com/platform/profilepic/?asid=10215973143351562&height=50&width=50&ext=1525837569&hash=AeRiIC6Nrx_3AuGo', null, 1, 0, '2018-05-06 00:46:33', '2018-05-06 00:47:19', 0);
# INSERT INTO `nullpoin_open-fixture`.users (id, title, alias, username, picture_url, password, approved, admin, created, modified, deleted) VALUES (6, 'Vanessa Virginia Benal Mora', 'vbenal', 'vbenal@gmail.com', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg', null, 0, 0, '2018-05-09 19:34:30', '2018-05-09 19:36:14', 0);
# COMMIT;
