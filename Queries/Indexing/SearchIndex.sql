CREATE SEARCH INDEX team_game
ON `cmpe-138-amar.team_scores_test.mbb_teams_games_sr`(team_id, game_id);

CREATE SEARCH INDEX player_team_game
ON `cmpe-138-amar.team_scores_test.mbb_players_games_sr`(team_id, game_id);

CREATE SEARCH INDEX game_id
ON `cmpe-138-amar.team_scores_test.mbb_games_sr`(game_id);

CREATE SEARCH INDEX team_id
ON `cmpe-138-amar.team_scores_test.mbb_teams`(id);