CREATE TABLE team_scores_test.mbb_teams_games_sr(
    game_id STRING,
    team_id STRING,
    points INTEGER,
    assists INTEGER,
    team_rebounds INTEGER,
    steals INTEGER,
    blocks INTEGER,
    turnovers INTEGER,
    personal_fouls INTEGER,
    team_tech_fouls INTEGER
) AS
SELECT
    tg.game_id,
    tg.team_id,
    tg.points,
    tg.assists,
    tg.team_rebounds,
    tg.steals,
    tg.blocks,
    tg.turnovers,
    tg.personal_fouls,
    tg.team_tech_fouls
FROM
    `bigquery-public-data.ncaa_basketball.mbb_teams_games_sr` tg;
