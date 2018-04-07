
DROP DATABASE IF EXISTS `open_fixture`;
-- Dumping database structure for open_fixture
CREATE DATABASE IF NOT EXISTS `open_fixture` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `open_fixture`;

create table groups
(
	id int not null primary key auto_increment,
	title varchar(45) null,
	created datetime default CURRENT_TIMESTAMP null,
	modified datetime default CURRENT_TIMESTAMP null,
	deleted int(1) default '0' null
)
comment 'Organizacion por grupos de los equipos' engine=InnoDB charset=utf8;

create table phases
(
	id int not null	primary key auto_increment,
	title varchar(45) null,
	start_date datetime null,
	end_date datetime null,
	created datetime default CURRENT_TIMESTAMP null,
	modified datetime default CURRENT_TIMESTAMP null,
	deleted int(1) default '0' null
)
comment 'Fase de Partidos entre los equipos. Se dividen en: Fase de Grupos, Fase Octavos, Fase Cuartos, Fase Semifinal, Fase 3ro, Fase final' engine=InnoDB charset=utf8;

create table teams
(
	id int not null	primary key auto_increment,
	title varchar(45) null,
	short_name varchar(45) null,
	group_id int not null,
	created datetime default CURRENT_TIMESTAMP null,
	modified datetime default CURRENT_TIMESTAMP null,
	deleted int(1) default '0' null,
	constraint teams_ibfk_1
		foreign key (group_id) references groups (id)
)
comment 'Informacion de los equipos que participan' engine=InnoDB charset=utf8;

create table games
(
	id int not null	primary key auto_increment,
	phase_id int null,
	team_a_id int not null,
	team_b_id int not null,
	date_up datetime null,
	goals_team_a int default '0' null,
	goals_team_b int default '0' null,
	created datetime default CURRENT_TIMESTAMP null,
	modified datetime default CURRENT_TIMESTAMP null,
	deleted int(1) default '0' null,
	constraint games_ibfk_3
		foreign key (phase_id) references phases (id),
	constraint games_ibfk_1
		foreign key (team_a_id) references teams (id),
	constraint games_ibfk_2
		foreign key (team_b_id) references teams (id)
)
comment 'Información de los partidos con equipos y resultados' engine=InnoDB charset=utf8;

create index phase_id
	on games (phase_id);

create index team_a_id
	on games (team_a_id);

create index team_b_id
	on games (team_b_id);

create index group_id
	on teams (group_id);

create table users
(
	id int not null	primary key auto_increment,
	title varchar(45) null,
	alias varchar(45) null,
	username varchar(45) null,
	password varchar(300) null,
	approved int(1) default '0' null,
	created datetime default CURRENT_TIMESTAMP null,
	modified datetime default CURRENT_TIMESTAMP null,
	deleted int(1) default '0' null
)
engine=InnoDB charset=utf8;

create table bets
(
	id int not null	primary key auto_increment,
	user_id int null,
	game_id int null,
	goals_team_a int(2) default '0' not null,
	goals_team_b int(2) default '0' not null,
	created datetime default CURRENT_TIMESTAMP null,
	modified datetime default CURRENT_TIMESTAMP null,
	deleted int(1) default '0' null,
	constraint scores_ibfk_2
		foreign key (user_id) references users (id),
	constraint scores_ibfk_1
		foreign key (game_id) references games (id)
)
comment 'Información de los puntos obtenidos en cada partido' engine=InnoDB charset=utf8;

create index game_id
	on bets (game_id);

create index user_id
	on bets (user_id);

