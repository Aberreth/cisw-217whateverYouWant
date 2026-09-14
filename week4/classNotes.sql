CREATE TABLE games (
	id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	--"generated always as identity" makes it so the data type always autofills.
	--primary key makes it so each id is unique
	title varchar(100),
	release_year integer,
);

INSERT INTO games (title, release_year)
VALUES
	('Elden Ring', 2022),
	('Minecraft', 2011),
	('Hades', 2020);

-- varchar stores
alter table games
add column game_code varchar(5)

Update games
SET game_code = 'ER001'
WHERE title = 'Elden Ring'

-- text stores variable length without requiring a max length
alter table games
add column description text;

Update games
SET description = 'Open world RPG'
WHERE title = 'Elden Ring'

-- numeric stores exact decimal values
-- Ex. numeric(6,2) means 6 total digits, and 2 of those digits are after the decimal point.
alter table games
add column price numeric(6,2)

Update games
SET price = '59.99'
WHERE title = 'Elden Ring'

Update games
SET price = '24.995'
WHERE title = 'Hades'
-- The extra decimal is rounded up, and the price listed on the table is 25 exactly.
  
-- real stores an approximate floating poat number
alter table games
add column rating real;

Update games
SET rating = '4.7'
WHERE title = 'Elden Ring'	
-- Floating types are approximate, so very precise values may not be stored exactly as entered.

-- double precision is a floating point type, but it supports more precision than real.
alter table games
add column hours_played double precision;

Update games
SET hours_played = '125.75698'
WHERE title = 'Elden Ring'
-- Real and double precision are approximate data types, while numeric is designed for exact decimal values.

-- timestamp stores both date and time
alter table games
add column last_played timestamp;

Update games
SET last_played = '2026-12-01 14:30:00'
WHERE title = 'Elden Ring'
-- YYYY-MM-DD HH:MM:SS

-- Timestamp iwth timezone stoes date and time with time zone info
alter table games
add column created_at timestamp with time zone;

Update games
SET created_at = '2026-12-01 14:30:000-06'
WHERE title = 'Elden Ring'

-- now() is a postgre sql func that returns the current date and time.

-- time stores only a time of day without the date.
-- format is 'HH:MM:SS' using the 24 hour format

-- interval stires an amount of time rather than a specific date or time.
alter table games
add column session_length interval;

Update games
SET session_length = '2 hours 30 minutes'
WHERE title = 'Elden Ring'
-- other valid examples

-- boolean stores a value of either true or fales.

