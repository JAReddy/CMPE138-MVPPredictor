SELECT
    pg.full_name,
    t.id as team_id,
    g.season,
    g.tournament,
    ROUND(
            (
                SUM(pg.points) * 0.3 +                      --w1 for points - 0.3
                SUM(pg.assists) * 0.2+                      --w2 for assists - 0.2
                SUM(pg.rebounds) * 0.2 +                    --w3 for rebounds - 0.2
                SUM(pg.steals) * 0.1 +                      --w4 for steals - 0.1
                SUM(pg.blocks) * 0.2 +                      --w5 for blocks - 0.1
                SUM(pg.turnovers) * -0.1+                   --w6 for turnovers - (-0.1)
                SUM(pg.personal_fouls) * -0.1 +             --w7 for personal_fouls - (-0.1)
                SUM(pg.tech_fouls)  * -0.05                 --w8 for technical_fouls - (-0.05)
                ) / COUNT(DISTINCT pg.game_id) +
            SUM(
                    (SELECT
                         (
                             SUM(tg.points) * 0.2 +               -- w9 for Team Points
                             SUM(tg.assists) * 0.15 +             -- w10 for Team Assists
                             SUM(tg.team_rebounds) * 0.15 +       -- w11 for Team Rebounds
                             SUM(tg.steals) * 0.1 +               -- w12 for Team Steals
                             SUM(tg.blocks) * 0.1 -               -- w13 for Team Blocks
                             SUM(tg.turnovers) * -0.1 -           -- w14 for Team Turnovers
                             SUM(tg.personal_fouls) * -0.1 -      -- w15 for Team Personal Fouls
                             SUM(tg.team_tech_fouls) * -0.05      -- w16 for Team Technical Fouls
                             )
                     FROM `cmpe-138-amar.team_scores_test.mbb_teams_games_sr` tg
                     WHERE
                         tg.team_id = t.id
                       AND tg.game_id = pg.game_id)
            )/ COUNT(DISTINCT pg.game_id)
        , 2) AS total_score,
FROM
    `cmpe-138-amar.team_scores_test.mbb_players_games_sr` pg
        INNER JOIN `cmpe-138-amar.team_scores_test.mbb_teams` t ON  pg.team_id = t.id
        INNER JOIN `cmpe-138-amar.team_scores_test.mbb_games_sr` g ON pg.game_id = g.game_id
WHERE
    g.season = 2016
  AND g.tournament = 'NCAA'
  AND pg.minutes_int64 > 0
  AND pg.game_id is NOT NULL
  AND t.id is NOT NULL
  AND g.season is NOT NULL
  AND g.tournament is NOT NULL
GROUP BY
    pg.full_name,
    t.id,
    g.season,
    g.tournament
ORDER BY total_score DESC;