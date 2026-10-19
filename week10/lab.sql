create table products(
  "Index" int PRIMARY KEY, 
  "Name" varchar(100), 
  Description text, 
  Brand text, 
  Category varchar(67), 
  Price numeric(10,2), 
  Currency varchar(5), 
  stock int, 
  EAN text, 
  Color text, 
  "Size" text, 
  Availability 
  text, 
  Internal_ID int);

-- Uses the UPPER() function to show the name and category of each product, with categories in uppercase.
Select "Index", UPPER(category) AS category, "Name" from products
ORDER BY "Index" DESC;

-- Uses the ROUND() function to show the sum of all prices, and round it to 2 decimal places.
select round(sum(price),2) AS total_value from products

-- Simply shows the current timestamp with now(), since there's no variable with a date in the table.
select now()

-- Creates a view named products_summary which displays all products with a price greater than or equal to 200, with the name in uppercase and description in lowercase.
create view products_summary AS
SELECT UPPER("Name") AS "NAME", LOWER(description) AS description, price
from products
WHERE price>=200

SELECT * FROM products_summary
