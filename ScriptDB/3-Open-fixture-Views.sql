USE `nullpoin_open-fixture`;

# VISTA PARA EL CALENDARIO DE JUEGOS
CREATE OR REPLACE VIEW V_GAMES_CALENDAR AS
SELECT
  g.id as game_id,
  p.id as phase_id,
  p.title as phase,
  g.date_up as date,
  s.title as stadium,
  concat((SELECT c.value FROM configurations c where c.short_name='BE-ROOT-URL'),
         (SELECT c.value FROM configurations c where c.short_name='TEAM-FLAGS-URL'),
         upper(ta.short_name),
         '.png')  AS flag_team_a,
  ta.title as name_team_a,
  ta.id as team_id_a,
  g.goals_team_a as goals_team_a,
concat((SELECT c.value FROM configurations c where c.short_name='BE-ROOT-URL'),
         (SELECT c.value FROM configurations c where c.short_name='TEAM-FLAGS-URL'),
         upper(tb.short_name),
         '.png')  AS flag_team_b,
    tb.title as name_team_b,
  tb.id as team_id_b,
  g.goals_team_b as goals_team_b,
  CASE
         when now() < g.date_up then 0 # POR JUGAR
         when now() >= g.date_up  and now() <= ADDTIME(g.date_up,'1:30:00') then 1 #EN CURSO
         else 2 #OVERTIME - WAITING FOR ADMINISTRATORS TO END THE GAME
       END AS game_status
FROM games g
JOIN teams ta on g.team_a_id = ta.id AND g.deleted=0
JOIN teams tb on g.team_b_id = tb.id AND tb.deleted=0
JOIN stadiums s on g.stadium_id = s.id AND s.deleted=0
JOIN phases p on g.phase_id = p.id  AND p.deleted=0
ORDER BY date ASC;

#VISTA PARA LAS APUESTAS DEL DIA
CREATE OR REPLACE VIEW V_DAILY_BETS AS
SELECT  u.id as user_id,
        u.username,
        u.title as name,
        u.picture_url,
        g.id as game_id,
        (SELECT DATE_FORMAT(g.date_up, '%H:%i') from  dual) as time,
        ta.id as team_a_id,
        ta.title as name_team_a,
        g.goals_team_a,
        concat((SELECT c.value FROM configurations c where c.short_name='BE-ROOT-URL'),
         (SELECT c.value FROM configurations c where c.short_name='TEAM-FLAGS-URL'),
         upper(ta.short_name),
         '.png')  AS flag_team_a,
          ta.id as team_b_id,
        tb.title as name_team_b,
        g.goals_team_b,
        concat((SELECT c.value FROM configurations c where c.short_name='BE-ROOT-URL'),
         (SELECT c.value FROM configurations c where c.short_name='TEAM-FLAGS-URL'),
         upper(tb.short_name),
         '.png')  AS flag_team_b,
        b.goals_team_a as bet_goals_team_a,
        b.goals_team_b as bet_goals_team_b,
        s.title as stadium,
        CASE
           when now() < g.date_up then 0 # POR JUGAR
           when now() >= g.date_up  and now() <= ADDTIME(g.date_up,'1:30:00') then 1 #EN CURSO
           else 2 #OVERTIME - WAITING FOR ADMINISTRATORS TO END THE GAME
        END AS game_status

FROM
  games g
  JOIN teams ta on g.team_a_id = ta.id AND ta.deleted=0
  JOIN teams tb on g.team_b_id = tb.id AND tb.deleted=0
  JOIN stadiums s on g.stadium_id = s.id AND s.deleted=0
  JOIN bets b on g.id = b.game_id AND b.deleted=0
  JOIN users u on b.user_id=u.id AND u.deleted=0
WHERE
  g.date_up >= current_date() AND g.date_up <= DATE_ADD(current_date() , interval 1 day)
  AND g.deleted=0;

# VISTA PARA LA TABLA DE POSICIONES (LISTAR USUARIOS)
CREATE OR REPLACE VIEW V_SCORE_BOARD AS
SELECT  U.username AS username,
        U.title AS name,
        U.alias AS alias,
        U.picture_url as picture_url,
        GET_USER_TOTAL_POINTS(U.id) AS total_points,
        GET_USER_RANK(GET_USER_TOTAL_POINTS(U.id)) as rank
FROM users U
WHERE
  U.deleted=0
  AND U.approved=1;

CREATE OR REPLACE VIEW V_USER_BETS AS
SELECT  C.*,
        B.goals_team_a AS bet_goals_team_a,
        B.goals_team_b AS bet_goals_team_b,
        GET_USER_POINTS_BY_GAME(U.id,C.game_id ) as bet_points,
        U.id AS user_id,
        U.username
FROM V_GAMES_CALENDAR C
left JOIN bets B ON B.game_id=C.game_id
left JOIN users U on B.user_id = U.id
 WHERE
   B.deleted=0 AND U.deleted=0;

#SE CREA VISTA PARA CALCULO DE PTOS DE EQUIPOS
CREATE OR REPLACE
    ALGORITHM = UNDEFINED
    DEFINER = `batman`@`%`
    SQL SECURITY DEFINER
VIEW `V_POSICION_EQUIPO` AS
    SELECT DISTINCT
        `g`.`team_id` AS `team_id`,
        `ta`.`title` AS `title_team`,
        `g`.`PG` AS `PG`,
        `g`.`PE` AS `PE`,
        `g`.`PP` AS `PP`,
        `g`.`GF` AS `GF`,
        `g`.`GC` AS `GC`,
        `g`.`DG` AS `DG`,
        `g`.`PTS` AS `PTS`,
        `g`.`PJ` AS `PJ`,
        `j`.`id` AS `group_id`,
        `j`.`title` AS `group_title`,
        CONCAT(CONVERT( (SELECT
                        `c`.`value`
                    FROM
                        `nullpoin_open-fixture`.`configurations` `c`
                    WHERE
                        (`c`.`short_name` = 'BE-ROOT-URL')) USING UTF8),
                CONVERT( (SELECT
                        `c`.`value`
                    FROM
                        `nullpoin_open-fixture`.`configurations` `c`
                    WHERE
                        (`c`.`short_name` = 'TEAM-FLAGS-URL')) USING UTF8),
                UPPER(`ta`.`short_name`),
                '.png') AS `flag_team_a`
    FROM
        (((((SELECT
            `c`.`team_id` AS `team_id`,
                SUM((CASE
                    WHEN
                        ((`c`.`goals_team_a` > `c`.`goals_team_b`)
                            AND (`c`.`finished` = 1))
                    THEN
                        1
                    ELSE 0
                END)) AS `PG`,
                SUM((CASE
                    WHEN
                        ((`c`.`goals_team_a` < `c`.`goals_team_b`)
                            AND (`c`.`finished` = 1))
                    THEN
                        1
                    ELSE 0
                END)) AS `PP`,
                SUM((CASE
                    WHEN
                        ((`c`.`goals_team_a` = `c`.`goals_team_b`)
                            AND (`c`.`finished` = 1))
                    THEN
                        1
                    ELSE 0
                END)) AS `PE`,
                SUM((CASE
                    WHEN (`c`.`finished` = 1) THEN `c`.`goals_team_a`
                    ELSE 0
                END)) AS `GF`,
                SUM((CASE
                    WHEN (`c`.`finished` = 1) THEN `c`.`goals_team_b`
                    ELSE 0
                END)) AS `GC`,
                (SUM((CASE
                    WHEN (`c`.`finished` = 1) THEN `c`.`goals_team_a`
                    ELSE 0
                END)) - SUM((CASE
                    WHEN (`c`.`finished` = 1) THEN `c`.`goals_team_b`
                    ELSE 0
                END))) AS `DG`,
                SUM((CASE
                    WHEN
                        ((`c`.`goals_team_a` > `c`.`goals_team_b`)
                            AND (`c`.`finished` = 1))
                    THEN
                        3
                    WHEN
                        ((`c`.`goals_team_a` = `c`.`goals_team_b`)
                            AND (`c`.`finished` = 1))
                    THEN
                        1
                    ELSE 0
                END)) AS `PTS`,
                SUM((CASE
                    WHEN (`c`.`finished` = 1) THEN 1
                    ELSE 0
                END)) AS `PJ`
        FROM
            (SELECT
            `nullpoin_open-fixture`.`games`.`team_a_id` AS `team_id`,
                `nullpoin_open-fixture`.`games`.`goals_team_a` AS `goals_team_a`,
                `nullpoin_open-fixture`.`games`.`goals_team_b` AS `goals_team_b`,
                `nullpoin_open-fixture`.`games`.`finished` AS `finished`
        FROM
            `nullpoin_open-fixture`.`games`
        WHERE
            (`nullpoin_open-fixture`.`games`.`finished` IN (1 , 0)) UNION ALL SELECT
            `nullpoin_open-fixture`.`games`.`team_b_id` AS `team_id`,
                `nullpoin_open-fixture`.`games`.`goals_team_b` AS `goals_team_b`,
                `nullpoin_open-fixture`.`games`.`goals_team_a` AS `goals_team_a`,
                `nullpoin_open-fixture`.`games`.`finished` AS `finished`
        FROM
            `nullpoin_open-fixture`.`games`
        WHERE
            (`nullpoin_open-fixture`.`games`.`finished` IN (1 , 0))) `c`
        GROUP BY `c`.`team_id`)) `g`
        JOIN (SELECT
            `ga`.`team_a_id` AS `team_id`, `ga`.`phase_id` AS `phase_id`
        FROM
            `nullpoin_open-fixture`.`games` `ga` UNION ALL SELECT
            `gb`.`team_a_id` AS `team_id`, `gb`.`phase_id` AS `phase_id`
        FROM
            `nullpoin_open-fixture`.`games` `gb`) `h`)
        JOIN `nullpoin_open-fixture`.`groups` `j`)
        JOIN `nullpoin_open-fixture`.`teams` `ta`)
    WHERE
        ((`g`.`team_id` = `h`.`team_id`)
            AND (`ta`.`group_id` = `j`.`id`)
            AND (`g`.`team_id` = `ta`.`id`))
    ORDER BY `g`.`team_id`
