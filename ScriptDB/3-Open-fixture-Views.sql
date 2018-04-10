

CREATE OR REPLACE VIEW V_GAMES_CALENDAR AS
SELECT
  p.id as phase_id,
  p.title as Phase,
  g.date_up as Date,
  s.title as Stadium,
  concat((SELECT c.url FROM configurations c where c.short_name='BE-ROOT-URL'),
         (SELECT c.url FROM configurations c where c.short_name='TEAM-FLAGS-URL'),
         upper(ta.short_name),
         '.png')  AS FlagTeamA,
  ta.title as NameTeamA,
  g.goals_team_a as GoalsTeamA,
concat((SELECT c.url FROM configurations c where c.short_name='BE-ROOT-URL'),
         (SELECT c.url FROM configurations c where c.short_name='TEAM-FLAGS-URL'),
         upper(tb.short_name),
         '.png')  AS FlagTeamB,
    tb.title as NameTeamB,
  g.goals_team_b as GoalsTeamB,
  CASE
         when now() < g.date_up then 0 # PPOR JUGAR
         when now() >= g.date_up  and now() <= ADDTIME(g.date_up,'1:30:00') then 1 #EN CURSO
         else 2 #OVERTIME - WAITING FOR ADMINISTRATORS TO END THE GAME
       END AS Status
FROM games g
JOIN teams ta on g.team_a_id = ta.id
JOIN teams tb on g.team_b_id = tb.id
JOIN stadiums s on g.stadium_id = s.id
JOIN phases p on g.phase_id = p.id
ORDER BY date ASC

