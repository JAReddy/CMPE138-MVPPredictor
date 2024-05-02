SELECT
   tg.team_id,
   t.name,
   g.season,
   g.tournament,
   (
     SUM(tg.points) * 0.2 +               -- w9 for Team Points
     SUM(tg.assists) * 0.15 +             -- w10 for Team Assists
     SUM(tg.team_rebounds) * 0.15 +       -- w11 for Team Rebounds
     SUM(tg.steals) * 0.1 +               -- w12 for Team Steals
     SUM(tg.blocks) * 0.1 -               -- w13 for Team Blocks
     SUM(tg.turnovers) * -0.1 -           -- w14 for Team Turnovers
     SUM(tg.personal_fouls) * -0.1 -      -- w15 for Team Personal Fouls
     SUM(tg.team_tech_fouls) * -0.05      -- w16 for Team Technical Fouls
   ) / COUNT(DISTINCT tg.game_id) AS score
 FROM
   `bigquery-public-data.ncaa_basketball.mbb_teams` t
   INNER JOIN `bigquery-public-data.ncaa_basketball.mbb_teams_games_sr` tg ON  tg.team_id = t.id
   INNER JOIN `bigquery-public-data.ncaa_basketball.mbb_games_sr` g ON tg.game_id = g.game_id 
 WHERE
   g.season = 2016
 AND g.tournament = 'NCAA'
 AND g.season is NOT NULL
 AND g.tournament is NOT NULL
 GROUP BY
   tg.team_id,
   t.name,
   g.season,
   g.tournament
