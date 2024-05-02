CREATE TABLE team_scores_test.mbb_teams(
    id STRING,
    name STRING
) AS
SELECT
    t.id,
    t.name
FROM
    `bigquery-public-data.ncaa_basketball.mbb_teams` t;