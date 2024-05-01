SELECT
    RANK() OVER (ORDER BY ROUND(ps.score + ts.score,2) DESC) as rank,
        ps.full_name,
    ps.season,
    ps.tournament,
    ts.team_id AS team_id,
    ts.name AS team_name,
    ps.score AS player_contribution,
    ts.score AS team_contribution,
    ROUND(ps.score + ts.score,2) AS total_score,
FROM
    player_scores ps
        INNER JOIN team_scores ts ON ps.team_id = ts.team_id
ORDER BY total_score DESC
    LIMIT 50;