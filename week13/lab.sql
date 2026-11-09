CREATE TABLE publishers (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL
);

CREATE TABLE games (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    publisher_id INTEGER REFERENCES publishers(id),
    price NUMERIC(6,2)
);

CREATE TABLE sales (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    game_id INTEGER REFERENCES games(id),
    quantity INTEGER NOT NULL,
    sale_date DATE NOT NULL
);

INSERT INTO publishers (publisher_name)
VALUES
    ('Nintendo'),
    ('Electronic Arts'),
    ('Ubisoft'),
    ('Capcom');

INSERT INTO games (title, publisher_id, price)
VALUES
    ('Mario Kart 8 Deluxe', 1, 59.99),
    ('Super Smash Bros Ultimate', 1, 59.99),
    ('EA Sports FC 25', 2, 69.99),
    ('Assassins Creed Mirage', 3, 49.99),
    ('Street Fighter 6', 4, 59.99),
    ('Resident Evil 4', 4, 39.99),
    ('Indie Adventure', NULL, 19.99),
    ('Upcoming Racing Game', 2, 49.99);

INSERT INTO sales (game_id, quantity, sale_date)
VALUES
    (1, 5, '2025-10-01'),
    (1, 3, '2025-10-05'),
    (2, 4, '2025-10-03'),
    (3, 2, '2025-10-07'),
    (4, 3, '2025-10-09'),
    (5, 6, '2025-10-10'),
    (5, 2, '2025-10-12'),
    (6, 1, '2025-10-15');

SELECT * FROM public.games
ORDER BY id ASC;

SELECT * FROM public.sales
ORDER BY id ASC;

SELECT * FROM public.publishers
ORDER BY id ASC;

SELECT
    games.title,
    publishers.publisher_name,
	games.price
FROM games
INNER JOIN publishers
    ON games.publisher_id = publishers.id
ORDER BY games.title ASC;

-- Indie Adventure does not appear in the results, because its publisher_id value is NULL.
-- So, it can't be joined on publsisher_id with an Inner Join.

SELECT
    games.title,
    publishers.publisher_name,
	games.price
FROM games
LEFT JOIN publishers
    ON games.publisher_id = publishers.id
ORDER BY games.price ASC;

-- One more, because Indie Adventure is now included.

SELECT
    games.title,
    sum(sales.quantity) AS copies_sold,
	count(sales.id) AS total_sales
FROM games
INNER JOIN sales
    ON games.id = sales.game_id
	GROUP BY games.title
ORDER BY copies_sold ASC;

SELECT
    publishers.publisher_name,
	count(games.id) AS game_count,
	avg(games.price) AS avg_game_price
FROM games
INNER JOIN publishers
    ON games.publisher_id = publishers.id
	GROUP BY publishers.publisher_name
ORDER BY avg_game_price ASC;
