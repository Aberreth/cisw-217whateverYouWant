-- Creating the table.

CREATE TABLE products_raw(id integer PRIMARY KEY, product_name varchar(20), brand varchar(20), category text, price numeric(10,2), stock integer);

SELECT * FROM public.products_raw LIMIT 5;
-- Steps to import:
-- Right click on the table > import/export > import, make sure format is correct, header is selected, encoding is UTF8.

-- Built in functions of Postgre
-- SUM
select SUM(price*stock)as total_inventory_value
from products_raw

-- AVG
select AVG(price) as av_price from products_raw

select MIN(price), MAX(price) from products_raw

-- COUNT
select COUNT(*) from products_raw
