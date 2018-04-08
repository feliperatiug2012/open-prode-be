

CREATE OR REPLACE VIEW V_GAMES_CALENDAR AS
SELECT
  g.date_up as date,
  s.title as stadium,
  concat((SELECT c.url FROM configurations c where c.short_name='TFURL') ,upper(ta.short_name),'.png')  AS flagTeamA,
  ta.title as NameTeamA,
  g.goals_team_a as goalsteamA,
  concat((SELECT c.url FROM configurations c where c.short_name='TFURL') ,upper(tb.short_name),'.png')  AS flagTeamB,
  tb.title as NameTeamB,
  g.goals_team_b as goalsteamB,
  CASE
         when now() < g.date_up then 0 # PPOR JUGAR
         when now() >= g.date_up  and now() <= ADDTIME(g.date_up,'1:30:00') then 1 #EN CURSO
         else 2 #OVERTIME - WAITING FOR ADMINISTRATORS TO END THE GAME
       END AS status
FROM games g
JOIN teams ta on g.team_a_id = ta.id
JOIN teams tb on g.team_b_id = tb.id
JOIN stadiums s on g.stadium_id = s.id
ORDER BY date ASC

