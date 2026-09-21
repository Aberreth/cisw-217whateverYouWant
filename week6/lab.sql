-- Part A: Importing data
CREATE TABLE product(id integer PRIMARY KEY, product_name varchar(20), brand varchar(20), category text, price numeric(10,2), stock integer);

SELECT * FROM public.product LIMIT 5;
-- Steps to import:
-- Right click on the table > import/export > import, make sure format is correct, header is selected, encoding is UTF8.

-- Part B – Math & Stats Queries
-- SUM
select SUM(price*stock)as total_inventory_value
from product

-- AVG
select AVG(price) as av_price from product

-- Highest and lowest price
select MIN(price), MAX(price) from product

-- COUNT
select COUNT(*) from product
