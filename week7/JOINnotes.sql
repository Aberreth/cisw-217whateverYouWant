-- Create a table that stores information about video games
CREATE TABLE games (
    -- Automatically generates a unique ID for each game
    game_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    -- Stores the name of the game
    title varchar(100) NOT NULL,

    -- Stores the genre of the game
    genre varchar(50),

    -- Stores the price with 2 decimal places
    price numeric(6,2)
);

-- Add three games to the games table
INSERT INTO games (title, genre, price)
VALUES
    ('Elden Ring', 'RPG', 59.99),
    ('Minecraft', 'Sandbox', 29.99),
    ('Helldivers 2', 'Shooter', 39.99);

-- Create a second table that stores game reviews
CREATE TABLE reviews (
    -- Automatically generates a unique ID for each review
    review_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    -- Connects each review to a game in the games table
    game_id integer REFERENCES games(game_id),

    -- Stores the review score
    score integer
);

-- Add reviews and connect them to games using game_id
INSERT INTO reviews (game_id, score)
VALUES
    (1, 10), -- Elden Ring
    (2, 9),  -- Minecraft
    (1, 8);  -- Elden Ring
	
-- How are these 2 tables connected
-- These are connected by games.game_id <---> reviews.game_id
-- Primary Key uniquely identifies row
-- A Foreign Key references a row in another table


-- Why use JOINS?
-- A JOIN allows our program to combine related information for us.
select * from reviews

-- Join methods
-- INNER JOIN-Give rows that have a match in both tables
select games.title, reviews.score --tableName.columnName
-- A column from games was given first, so use from games first.
from games
-- Connect the reviews table to the games table
INNER JOIN reviews
-- Match rows where both tables have the same game_id
ON games.game_id = reviews.game_id;
-- ^ This line tells Postgre how the tables are connected

-- LEFT JOIN-Keeps everything from the left table.
select games.title, reviews.score
-- the table after "from" is the left table.
from games
LEFT JOIN reviews	
ON games.game_id = reviews.game_id;

-- Helldivers appears because LEFT JOIN keeps everything from the left table.
-- NULL means there was no matching review.

--Table ALIASES
-- Typing full table names hard :(
-- We can create aliases for table names.

-- g should alias for games
-- r should alias for reviews
select g.title, r.score 
from games as g
inner join reviews as r
on g.game_id=r.game_id
