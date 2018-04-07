INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES  ('Rusia','RUS',1, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Arabia Saudi','KSA',1, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Egipto','EGY',1, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Uruguay','URU',1, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Portugal','POR',2, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Marruecos','MAR',2, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('España','ESP',2, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Iran','IRN',2, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Francia','FRA',3, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Australia','AUS',3, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Peru','PER',3, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Dinamarca','DEN',3, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Argentina','ARG',4, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Islandia','ISL',4, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Croacia','CRO',4, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Nigeria','NGA',4, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Brasil','BRA',5, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Suiza','SUI',5, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Costa Rica','CRC',5, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Serbia','SRB',5, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Alemania','GER',6, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Mexico','MEX',6, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Suecia','SWE',6, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Corea del Sur','KOR',6, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Belgica','BEL',7, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Panama','PAN',7, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Tunez','TUN',7, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Inglaterra','ENG',7, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Polonia','POL',8, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Senegal','SEN',8, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Colombia','COL',8, SYSDATE(),SYSDATE());

INSERT INTO teams (`title`,`short_name`, `group_id`, `created`,`modified`) VALUES ('Japon','JPN',8, SYSDATE(),SYSDATE());


################   INSERT DE LA TABLA PHASES   #######################


INSERT INTO phases (`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES ('Fase de Grupos', '2018-06-14', '2018-06-28', sysdate(), sysdate(),0);
INSERT INTO phases (`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES ('Fase Octavos', '2018-06-30', '2018-07-03', sysdate(), sysdate(),0);
INSERT INTO phases (`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES ('Fase de Cuartos', '2018-07-06', '2018-07-07', sysdate(), sysdate(),0);
INSERT INTO phases (`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES ('Fase de Semifinal', '2018-07-10', '2018-07-11', sysdate(), sysdate(),0);
INSERT INTO phases (`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES ('Fase de 3ro', '2018-07-14', '2018-07-14', sysdate(), sysdate(),0);
INSERT INTO phases (`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES ('Fase Final', '2018-07-15', '2018-07-15', sysdate(), sysdate(),0);

##############################  INSERT DE LA TABLA GROUPS   ###############


INSERT INTO `groups` (`title`, `created`, `modified`, `deleted`) VALUES ('Grupo A', '2018-03-29 19:14:32', '2018-03-29 19:14:32', 0);
INSERT INTO `groups` (`title`, `created`, `modified`, `deleted`) VALUES ('Grupo B', '2018-03-29 19:16:13', '2018-03-29 19:16:13', 0);
INSERT INTO `groups` (`title`, `created`, `modified`, `deleted`) VALUES ('Grupo C', '2018-03-29 19:16:13', '2018-03-29 19:16:13', 0);
INSERT INTO `groups` (`title`, `created`, `modified`, `deleted`) VALUES ('Grupo D', '2018-03-29 19:16:13', '2018-03-29 19:16:13', 0);
INSERT INTO `groups` (`title`, `created`, `modified`, `deleted`) VALUES ('Grupo E', '2018-03-29 19:16:13', '2018-03-29 19:16:13', 0);
INSERT INTO `groups` (`title`, `created`, `modified`, `deleted`) VALUES ('Grupo F', '2018-03-29 19:16:13', '2018-03-29 19:16:13', 0);
INSERT INTO `groups` (`title`, `created`, `modified`, `deleted`) VALUES ('Grupo G', '2018-03-29 19:16:13', '2018-03-29 19:16:13', 0);
INSERT INTO `groups` (`title`, `created`, `modified`, `deleted`) VALUES ('Grupo H', '2018-03-29 19:16:13', '2018-03-29 19:16:13', 0);


#############################  INSERT DE LOS PARTIDOS ######################

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



