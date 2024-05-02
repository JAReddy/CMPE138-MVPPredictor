CREATE TABLE team_scores_test.mbb_games_sr(
    game_id STRING,
    season INTEGER,
    tournament STRING
) AS

SELECT
    g.game_id,
    g.season,
    g.tournament
FROM
    `bigquery-public-data.ncaa_basketball.mbb_games_sr` g;