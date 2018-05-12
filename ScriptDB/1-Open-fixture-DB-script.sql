
# DROP DATABASE IF EXISTS `open_fixture`;
# -- Dumping database structure for open_fixture
# CREATE DATABASE IF NOT EXISTS `open_fixture` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `nullpoin_open-fixture`;

DROP TABLE IF EXISTS configurations;
DROP TABLE IF EXISTS bets;
DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS stadiums;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS phases;
DROP TABLE IF EXISTS users;

create table configurations
(
	id int primary key auto_increment NOT NULL ,
	title varchar(45) NOT NULL,
  short_name varchar(15) not null ,
  value varchar(2000) not null,
	created datetime default CURRENT_TIMESTAMP NOT NULL,
	modified datetime default CURRENT_TIMESTAMP NOT NULL ON UPDATE NOW(),
	deleted int(1) default '0' NOT NULL
);
CREATE UNIQUE INDEX
	configurations__index_SHORT_NAME ON configurations (short_name);

create table stadiums
(
	id int primary key auto_increment NOT NULL ,
	title varchar(45) NOT NULL,
	created datetime default CURRENT_TIMESTAMP NOT NULL,
	modified datetime default CURRENT_TIMESTAMP NOT NULL ON UPDATE NOW(),
	deleted int(1) default '0' NOT NULL
)engine=InnoDB charset=utf8;

create table groups
(
	id int primary key auto_increment NOT NULL ,
	title varchar(45) NOT NULL,
	created datetime default CURRENT_TIMESTAMP NOT NULL,
	modified datetime default CURRENT_TIMESTAMP NOT NULL ON UPDATE NOW(),
	deleted int(1) default '0' NOT NULL
)engine=InnoDB charset=utf8
comment 'Organizacion por grupos de los equipos' engine=InnoDB charset=utf8;

create table phases
(
	id int not null	primary key auto_increment,
	title varchar(45) NOT NULL,
	start_date datetime NOT NULL,
	end_date datetime NOT NULL,
	created datetime default CURRENT_TIMESTAMP NOT NULL,
	modified datetime default CURRENT_TIMESTAMP NOT NULL ON UPDATE NOW(),
	deleted int(1) default '0' NOT NULL
)engine=InnoDB charset=utf8
comment 'Fase de Partidos entre los equipos. Se dividen en: Fase de Grupos, Fase Octavos, Fase Cuartos, Fase Semifinal, Fase 3ro, Fase final' engine=InnoDB charset=utf8;

create table teams
(
	id int primary key auto_increment NOT NULL,
	title varchar(45) NOT NULL,
	short_name varchar(45) NOT NULL,
	group_id int NOT NULL,
	created datetime default CURRENT_TIMESTAMP NOT NULL,
	modified datetime default CURRENT_TIMESTAMP NOT NULL ON UPDATE NOW(),
	deleted int(1) default '0' NOT NULL,
	constraint teams_ibfk_1
		foreign key (group_id) references groups (id)
)engine=InnoDB charset=utf8
comment 'Informacion de los equipos que participan' engine=InnoDB charset=utf8;

DROP TABLE IF EXISTS games;
create table games
(
	id int primary key auto_increment NOT NULL,
	phase_id int NOT NULL,
	team_a_id int NOT NULL,
	team_b_id int NOT NULL,
	date_up datetime NOT NULL,
	goals_team_a int default '0' NOT NULL,
	goals_team_b int default '0' NOT NULL,
  stadium_id int NOT NULL,
  finished int(1) default '0' NOT NULL,
	created datetime default CURRENT_TIMESTAMP NOT NULL ,
	modified datetime default CURRENT_TIMESTAMP NOT NULL ON UPDATE NOW(),
	deleted int(1) default '0' NOT NULL,
	constraint games_ibfk_3	foreign key (phase_id) references phases (id),
 	constraint games_ibfk_1 foreign key (team_a_id) references teams (id),
  constraint games_ibfk_2 foreign key (team_b_id) references teams (id),
  constraint games_ibfk_4 foreign key (stadium_id) references stadiums (id)
  )engine=InnoDB charset=utf8;


create table users
(
	id int primary key auto_increment NOT NULL,
	title varchar(45) NULL,
	alias varchar(45) NULL,
	username varchar(45) NOT NULL,
	picture_url varchar(2000) NULL,
	password varchar(300) NULL,
	approved int(1) default '0' NOT NULL,
	admin    int(1) default '0' NOT NULL,
	created datetime default CURRENT_TIMESTAMP NOT NULL,
	modified datetime default CURRENT_TIMESTAMP NOT NULL ON UPDATE NOW(),
	deleted int(1) default '0' NOT NULL
)
engine=InnoDB charset=utf8;

CREATE UNIQUE INDEX unique_username
ON users (username);



#
# create index phase_id
# 	on games (phase_id);
#
# create index team_a_id
# 	on games (team_a_id);
#
# create index team_b_id
# 	on games (team_b_id);
#
# create index group_id
# 	on teams (group_id);

create table bets
(
	id int	primary key auto_increment NOT NULL,
	user_id int NOT NULL,
	game_id int NOT NULL,
	goals_team_a int(2) default '0' NOT NULL,
	goals_team_b int(2) default '0' NOT NULL,
	created datetime default CURRENT_TIMESTAMP NOT NULL,
	modified datetime default CURRENT_TIMESTAMP NOT NULL ON UPDATE NOW(),
	deleted int(1) default '0' NOT NULL,
	constraint scores_ibfk_2
		foreign key (user_id) references users (id),
	constraint scores_ibfk_1
		foreign key (game_id) references games (id)
)
comment 'Información de los puntos obtenidos en cada partido' engine=InnoDB charset=utf8;

# create index game_id
# 	on bets (game_id);
#
# create index user_id
# 	on bets (user_id);

