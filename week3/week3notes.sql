-- Create the week 3 database
CREATE database week3lab


-- Create the teachers table using code posted on Canvas
CREATE TABLE teachers (
    id bigserial,
    first_name varchar(25),
    last_name varchar(50),
    school varchar(50),
    hire_date date,
    salary numeric
);

 

INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
VALUES ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
       ('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
       ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
       ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
       ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
       ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);

-- Select statement is used to retrieve data froom a table
-- The * means to select all columns from the table
SELECT * FROM public.teachers;

-- If you only want to show certain columns
-- Select these columns, from this table.
SELECT first_name, school
from teachers

-- Sort by salary
-- Putting the salary first after select means that the select column will be the furthest to the left.
SELECT salary, first_name
from teachers
-- Use ORDER BY to to put it in order, numerical order for numbers, alphabetical for names.
ORDER BY salary
-- Use DESC to put it in descending order (largest to smallest, z to a), or ASC to put it in ascending (Smallest to largest, a to z)
ORDER BY salary DESC

  -- Ordering by multiple columns, even when one is going ASC and another is going DESC
SELECT last_name, school, hire_date
FROM teachers
-- Ordering schhool by asc, hire_date by DESC
ORDER BY school, hire_date DESC

-- Finding distinct values by using DISTINCT after SELECT
SELECT DISTINCT school
from teachers;

-- Using Where  to retrieve only rows that meet a certain condition
SELECT first_name, last_name, school
FROM teachers
WHERE school = 'Myers Middle School'

-- Using comparison operators
-- = Equal to
-- <> or != NOT equal to
-- < and > Greater/Less than
-- <= and >= Greater/Less than or equal to
-- BETWEEN; with a range
-- IN; match one of seceral values
-- % is a wildcard, any number of characters can appear after
-- LIKE is case sensative
-- ILIKE is not case sensative
-- AND can be used to get even more specific, both criteria must be met
-- OR shows anything that meets either criteria
