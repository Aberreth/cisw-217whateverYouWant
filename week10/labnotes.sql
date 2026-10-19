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

-- What are functions in SQL?
-- Functions = Built-in operations that perform a specific task inside a query

-- Common Built-in functions
-- ROUND(), round a number to n decimals
-- Ex. SELECT ROUND(3.14159,2) -> 3.14
-- The 2 is how many decimal places are left.

-- CEIL()/FLOOR(), Round up or down,
-- SELECT CEIL(2,1) -> 3

-- Text Functions
-- UPPER(text) converts text to uppercase.
-- Ex. SELECT UPPER(category)

-- LOWER(text) converts text to lowercase.
-- Ex. SELECT LOWER(product_name)

-- LENGTH(text), returns the character count
-- Ex. SELECT LENGTH(product_name)

-- DATE FUNCTIONS
-- NOW(), current timestamp
-- SELECT NOW()

-- CURRENT_DATE, Today's date
-- Ex. SELECT CURRENT_DATE

-- AGE(), returns the difference between 2 dates. Newest date MUST come first or it will return negatives.
-- Ex. SELECT AGE('2025-10-20', '2000-05-15') -> 25 yrs 5 months 5 days
-- Date functions are often used for reports or logs

-- Average price by category
SELECT category,
-- Want to find the average price, but I want it to be rounded
ROUND(AVG(price),2) as avg_price
from products
group by category
order by avg_price DESC;

-- VIEWS
-- View is a saved SQL Query that acts like a virtual table
-- It doesn't store new data, it just stores a query definition

create view product_summary AS
SELECT category,
ROUND(AVG(price),2) as avg_price,
SUM(stock) AS total_stock
from products
group by category;

-- Views just create a shortcut, we can use it later by calling the view
SELECT * from product_summary;
-- To update the view;
-- REPLACE VIEW product_summary
-- AS
-- New definition here
