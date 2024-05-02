CREATE TABLE team_scores_test.mbb_players_games_sr(
    game_id STRING,
    player_id STRING,
    team_id STRING,
    full_name STRING,
    points INTEGER,
    assists INTEGER,
    rebounds INTEGER,
    steals INTEGER,
    blocks INTEGER,
    turnovers INTEGER,
    personal_fouls INTEGER,
    tech_fouls INTEGER,
    minutes_int64 INTEGER
) AS
SELECT
    pg.game_id,
    pg.player_id,
    pg.team_id,
    pg.full_name,
    pg.points,
    pg.assists,
    pg.rebounds,
    pg.steals,
    pg.blocks,
    pg.turnovers,
    pg.personal_fouls,
    pg.tech_fouls,
    pg.minutes_int64
FROM
    `bigquery-public-data.ncaa_basketball.mbb_players_games_sr` pg;
