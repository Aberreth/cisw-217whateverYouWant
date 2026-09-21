-- Part A - Independent Practice
CREATE TABLE products-1000(id int PRIMARY KEY, product_name varchar(50), brand varchar(30), category text, price numeric(10,2), stock int);

SELECT * FROM public.products-1000 LIMIT 5;
-- Data imported from the products-1000.csv file hosted on Datablist.

-- Using SUM to display the total inventory value. 
select SUM(price*stock)as total_inventory_value
from products-1000;

-- Using AVG to display the average product price.
select AVG(price) as av_price from products-1000;

-- Listing products where price > 500
select * from products-1000
where price>500;

-- Using COUNT to count how many products belong to the Electronics category.
select COUNT(Electronics) from products-1000;

-- Listing products from cheapest to most expensive.
select * from products-1000
order by price asc;

-- Part B – Quick Skim
-- One new concept I learned was constraints. Constraints are useful qualifiers for variables, which ensure that only proper data can be entered into the table.
-- WIth constraints, tables can be protected from being filled with junk data, or ensure each entry is unique.
-- I found that the chapter explained any questions I had well enough, so I don't think I have any questions to ask here.
