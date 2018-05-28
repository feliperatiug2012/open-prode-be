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
         when now() < g.date_up
           then 0 # POR JUGAR
         when now() >= g.date_up  and now() <= ADDTIME(g.date_up,'1:30:00')
           then 1 #EN CURSO
         else 2 #OVERTIME - WAITING FOR ADMINISTRATORS TO END THE GAME
       END AS game_status,
  case
    when ADDTIME(now(),GET_TIME_FORMAT((select value from configurations c where c.short_name='LOCK-BETS-MINS'))) > g.date_up
      then false  #lock bets=TRUE
    else true    #lock bets=FALSE
  end AS bets_open
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
#         (SELECT DATE_FORMAT(g.date_up, '%H:%i') from  dual) as time,
        g.date_up as date_up,
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
SELECT  U.id as user_id,
        U.username AS username,
        U.title AS name,
        U.alias AS alias,
        U.picture_url as picture_url,
        U.approved AS approved,
        U.date_approved as date_approved,
        U.approver_id as approver_id,
        GET_USER_TOTAL_POINTS(U.id) AS total_points,
        GET_USER_RANK(GET_USER_TOTAL_POINTS(U.id)) as rank,
        CASE WHEN U.admin = 1 THEN true
          ELSE false
        END as admin
FROM users U
WHERE
  U.deleted=0;

CREATE OR REPLACE VIEW V_USER_BETS AS
SELECT  C.*,
        B.goals_team_a AS bet_goals_team_a,
        B.goals_team_b AS bet_goals_team_b,
        GET_USER_POINTS_BY_GAME(U.id,C.game_id ) as bet_points,
        U.id AS user_id,
        U.username as username,
        U.title as name,
        U.alias as alias
FROM V_GAMES_CALENDAR C
left JOIN bets B ON B.game_id=C.game_id
left JOIN users U on B.user_id = U.id
 WHERE
   B.deleted=0 AND U.deleted=0;

#SE CREA VISTA PARA CALCULO DE PTOS DE EQUIPOS

CREATE OR REPLACE VIEW V_INTERNAL_SCORE_BOARD AS
  SELECT
    g.team_a_id    AS team_id,
    SUM(g.goals_team_a) AS gf,
    SUM(g.goals_team_b) AS gc,
    SUM(CASE WHEN (g.finished = 1) THEN
      1 ELSE 0
    END) AS pj,
    SUM(CASE WHEN (g.goals_team_a > g.goals_team_b AND g.finished = 1 ) THEN
      1  ELSE 0
    END) AS pg,
    SUM(CASE WHEN (g.goals_team_a < g.goals_team_b AND g.finished = 1) THEN
      1  ELSE 0
    END) AS pp,
    SUM(CASE WHEN (g.goals_team_a = g.goals_team_b AND g.finished = 1) THEN
      1  ELSE 0
    END) AS pe,
    /*SUM(
        CASE WHEN (g.goals_team_a > g.goals_team_b AND g.finished = 1 ) THEN 3 ELSE
          CASE WHEN (g.goals_team_a = g.goals_team_b AND g.finished = 1 ) THEN 1 ELSE 0 END
        END)AS pts,*/
    SUM(g.goals_team_a) - SUM(g.goals_team_b) AS dg
  FROM games g
WHERE g.deleted = 0
group by g.team_a_id
UNION ALL
  SELECT
    g.team_b_id    AS team_id,
    SUM(g.goals_team_b) AS gf,
    SUM(g.goals_team_a) AS gc,
    SUM(CASE WHEN (g.finished = 1) THEN
      1 ELSE 0
    END) AS pj,
    SUM(CASE WHEN (g.goals_team_b > g.goals_team_a AND g.finished = 1 ) THEN
      1  ELSE 0
    END) AS pg,
    SUM(CASE WHEN (g.goals_team_b < g.goals_team_a AND g.finished = 1) THEN
      1  ELSE 0
    END) AS pp,
    SUM(CASE WHEN (g.goals_team_b = g.goals_team_a AND g.finished = 1) THEN
      1  ELSE 0
    END) AS pe,
    /*SUM(
        CASE WHEN (g.goals_team_a > g.goals_team_b AND g.finished = 1 ) THEN 3 ELSE
          CASE WHEN (g.goals_team_a = g.goals_team_b AND g.finished = 1 ) THEN 1 ELSE 0 END
        END)AS pts,*/
    SUM(g.goals_team_b) - SUM(g.goals_team_a) AS dg
  FROM games g
WHERE g.deleted = 0
group by g.team_b_id;

CREATE OR REPLACE VIEW V_POSICION_EQUIPO AS 
SELECT
--  INTERNAL.*,
  team_id AS team_id,
  sum(pj) as pj,
  sum(pg) as pg,
  sum(pp) as pp,
  sum(pe) as pe,
  sum(gf) as gf,
  sum(gc) as gc,
  sum(dg) as dg,
  SUM(INTERNAL.pg * 3 + INTERNAL.pe) AS pts,
  t.title as title_team,
  CONCAT((SELECT
                        c.value
                    FROM
                        configurations c
                    WHERE
                        c.short_name = 'BE-ROOT-URL'),
                (SELECT
                        c.value
                    FROM
                        configurations c
                    WHERE
                        c.short_name = 'TEAM-FLAGS-URL'),
                UPPER(t.short_name),
                '.png') AS team_flag,
                g.id as group_id,
                g.title as group_title


FROM V_INTERNAL_SCORE_BOARD INTERNAL
  JOIN teams t ON t.id=INTERNAL.team_id AND t.deleted = 0
  JOIN groups g on t.group_id = g.id
GROUP BY INTERNAL.team_id,team_flag,group_id,group_title,title_team;


