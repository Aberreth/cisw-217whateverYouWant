-- =============================================
-- Week 3 Homework
-- Name: Alek Berreth
-- =============================================


-- Create the table
CREATE TABLE movies (
  id bigserial, 
  title varchar(100), 
  release_year int, 
  genre varchar(50), 
  rating numeric(3,1)
);

-- Insert sample data
INSERT INTO movies (title, genre, release_year, rating)
VALUES
	('The Whisper Man', 'Thriller', '2026', '6.3'),
	('Spider-Man: Brand New Day', 'Action', '2026', '8.0'),
	('No Country for Old Men', 'Thriller', '2007', '8.2'),
	('Dangal', 'Action', '2016', '8.3'),
	('Sunset Boulevard', 'Drama', '1950', '8.4'),
-- I got these by scrolling randomly on IMDB, I have watched 2 of these movies

-- Query 1: Selecting all table data
SELECT * FROM movies;

-- Query 2: Selecting only title and rating
SELECT title, rating
FROM movies;

-- Query 3: Selecting only distinct genres
SELECT DISTINCT genre
FROM movies;

-- Query 4: 
SELECT title, genre, rating
FROM movies
WHERE genre <> 'Thriller'; AND title ILIKE '%e%'

-- Query 5:
SELECT title, genre, rating
FROM movies
WHERE rating > 8.1;

-- Query 6: 
SELECT title, rating
FROM movies
ORDER BY rating DESC;

-- Query 7: 
SELECT title, rating
FROM movies
WHERE rating > 8.1
ORDER BY rating DESC;

-- =============================================
-- Chapter 4 Quick Skim
-- =============================================

-- New Concept:
-- I learned that I can import a column with a delimiting character, such as a comma, by surrounding it in double quotes.

-- Question:
-- I still wonder what the use case for all these data types will be
