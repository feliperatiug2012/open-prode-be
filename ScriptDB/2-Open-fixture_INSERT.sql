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
COMMIT;



