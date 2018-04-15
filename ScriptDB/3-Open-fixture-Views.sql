USE `nullpoin_open-fixture`;

# VISTA PARA EL CALENDARIO DE JUEGOS
CREATE OR REPLACE VIEW V_GAMES_CALENDAR AS
SELECT
  p.id as phase_id,
  p.title as phase,
  g.date_up as date,
  s.title as stadium,
  concat((SELECT c.url FROM configurations c where c.short_name='BE-ROOT-URL'),
         (SELECT c.url FROM configurations c where c.short_name='TEAM-FLAGS-URL'),
         upper(ta.short_name),
         '.png')  AS flag_team_a,
  ta.title as name_team_a,
  g.goals_team_a as goals_team_a,
concat((SELECT c.url FROM configurations c where c.short_name='BE-ROOT-URL'),
         (SELECT c.url FROM configurations c where c.short_name='TEAM-FLAGS-URL'),
         upper(tb.short_name),
         '.png')  AS flag_team_b,
    tb.title as name_team_b,
  g.goals_team_b as goals_team_b,
  CASE
         when now() < g.date_up then 0 # POR JUGAR
         when now() >= g.date_up  and now() <= ADDTIME(g.date_up,'1:30:00') then 1 #EN CURSO
         else 2 #OVERTIME - WAITING FOR ADMINISTRATORS TO END THE GAME
       END AS Status
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
        g.id as game_id,
        g.date_up,
        ta.id as team_a_id,
        ta.title as name_team_a,
        concat((SELECT c.url FROM configurations c where c.short_name='BE-ROOT-URL'),
         (SELECT c.url FROM configurations c where c.short_name='TEAM-FLAGS-URL'),
         upper(ta.short_name),
         '.png')  AS flag_team_a,
          ta.id as team_b_id,
        tb.title as name_team_b,
        concat((SELECT c.url FROM configurations c where c.short_name='BE-ROOT-URL'),
         (SELECT c.url FROM configurations c where c.short_name='TEAM-FLAGS-URL'),
         upper(tb.short_name),
         '.png')  AS flag_team_b,
        b.goals_team_a as bet_goals_team_a,
        b.goals_team_b as bet_goals_team_b

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
