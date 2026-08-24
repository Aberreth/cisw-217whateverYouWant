-- Query 1, creating the practice database
CREATE DATABASE PracticeDB
-- Query 2, creating the video_games table, with 4 columns
CREATE TABLE videoGames(game_id bigserial Primary Key, game_name varchar(50), date_published varchar(20), hours_played decimal)
-- Query 3, inserting data
INSERT INTO videogames(game_name, date_published, hours_played)
VALUES ('Ultrakill', '10-03-2020', 700.3), ('Terraria', '05-16-2011', 230.7), ('Tunic', '03-16-2022', 76.7)
-- Query 4, testing an incorrect query. returned a syntax error
INSERT INTO videogames(game_name, date_published, hours_played)
VALUES ('Ultrakill', '10-03-2020' 700.3), ('Terraria', '05-16-2011', 230.7), ('Tunic', '03-16-2022', 76.7)
