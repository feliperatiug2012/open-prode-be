---------INSERT TABLA DE GROUPS

INSERT INTO `groups` (`title`, `created`, `modified`, `deleted`) VALUES ('Grupo A', '2018-03-29 19:14:32', '2018-03-29 19:14:32', 0);
INSERT INTO `groups` (`title`, `created`, `modified`, `deleted`) VALUES ('Grupo B', '2018-03-29 19:16:13', '2018-03-29 19:16:13', 0);
INSERT INTO `groups` (`title`, `created`, `modified`, `deleted`) VALUES ('Grupo C', '2018-03-29 19:16:13', '2018-03-29 19:16:13', 0);
INSERT INTO `groups` (`title`, `created`, `modified`, `deleted`) VALUES ('Grupo D', '2018-03-29 19:16:13', '2018-03-29 19:16:13', 0);
INSERT INTO `groups` (`title`, `created`, `modified`, `deleted`) VALUES ('Grupo E', '2018-03-29 19:16:13', '2018-03-29 19:16:13', 0);
INSERT INTO `groups` (`title`, `created`, `modified`, `deleted`) VALUES ('Grupo F', '2018-03-29 19:16:13', '2018-03-29 19:16:13', 0);
INSERT INTO `groups` (`title`, `created`, `modified`, `deleted`) VALUES ('Grupo G', '2018-03-29 19:16:13', '2018-03-29 19:16:13', 0);
INSERT INTO `groups` (`title`, `created`, `modified`, `deleted`) VALUES ('Grupo H', '2018-03-29 19:16:13', '2018-03-29 19:16:13', 0);



-------- INSERT TABLA DE PHASES   

INSERT INTO phases (`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES ('Fase de Grupos', '2018-06-14', '2018-06-28', sysdate(), sysdate(),0);
INSERT INTO phases (`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES ('Fase Octavos', '2018-06-30', '2018-07-03', sysdate(), sysdate(),0);
INSERT INTO phases (`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES ('Fase de Cuartos', '2018-07-06', '2018-07-07', sysdate(), sysdate(),0);
INSERT INTO phases (`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES ('Fase de Semifinal', '2018-07-10', '2018-07-11', sysdate(), sysdate(),0);
INSERT INTO phases (`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES ('Fase de 3ro', '2018-07-14', '2018-07-14', sysdate(), sysdate(),0);
INSERT INTO phases (`title`, `start_date`, `end_date`, `created`, `modified`, `deleted`) VALUES ('Fase Final', '2018-07-15', '2018-07-15', sysdate(), sysdate(),0);


----- INSERT DE TABLAS DE  TEAMS

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


