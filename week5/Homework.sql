-- Part 1
CREATE TABLE games (
	id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	title varchar(50),
	hours_played real,
	release_year integer
);

INSERT INTO games (title, hours_played, release_year)
VALUES
	('Elden Ring', 300.9, 2022),
	('Minecraft', 220.73, 2011),
	('Hades', 20.2, 2020),
	('Ultrakill', 640.8, 2020),
	('Backpack Hero', 40.3, 2021);

-- Part 2
alter table games
add column description text,
add column rating real,
add column purchased timestamp,
add column multiplayer bool;

-- Part 3
update games
set description = 'Open world Soulslike',
	rating = 4.5,
	purchased = '2022-2-25 00:00:00',
	multiplayer = TRUE
WHERE title = 'Elden Ring';

update games
set description = 'Sandbox survival game',
	rating = 3.5,
	purchased = '2019-4-19 00:00:00',
	multiplayer = TRUE
where title = 'Minecraft';

update games
set description = 'Roguelike',
	rating = 4.0,
	purchased = '2024-11-28 00:00:00',
	multiplayer = FALSE
where title = 'Hades';

update games
set description = 'Movement shooter',
	rating = 5.0,
	purchased = '2023-3-21 00:00:00',
	multiplayer = FALSE
where title = 'Ultrakill';

update games
set description = 'Inventory management roguelike RPG',
	rating = 4.0,
	purchased = '2024-8-4 00:00:00',
	multiplayer = FALSE
where title = 'Backpack Hero';

-- Part 4
ALTER TABLE games
RENAME COLUMN purchased TO purchased_at;

-- Part 5
-- 1
SELECT * FROM public.games;
-- 2
SELECT title, rating, release_year FROM public.games;
-- 3
SELECT * FROM public.games
WHERE hours_played > 200;
-- 4
SELECT * FROM public.games
WHERE multiplayer = TRUE;
-- 5
SELECT * FROM public.games
ORDER BY id DESC;

-- Part 6
-- One new concept I learned is operating across columns. A useful feature highlighted in Chapter 5 is the ability to do math with multiple entire columns.
-- A use case for this would be a database containing the income of multiple households, with a column for income and another column for expenses.
-- A third column could be shown with the SELECT function that subtracts the expenses from the income, displaying the net income for each household.

-- Another new concept I learned is joining tables with the JOIN function. Using JOIN, rows from multiple tables can be displayed as one table provided they share some columns.

-- A question I have after skimming the chapter is how the structure of a database might be changed to be more efficient given the ability to combine certain tables when relevant with JOIN.
