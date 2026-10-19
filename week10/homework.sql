SELECT category,
CEIL(ROUND(AVG(price),2)) as avg_price
from products
group by category;

SELECT max(price), min(price) FROM products;

SELECT FLOOR(price) AS floored_price FROM products;

Select UPPER(category) AS category FROM products

create view category_overview AS
SELECT category,
ROUND(AVG(price),2),
SUM(stock) AS total_stock
from products
WHERE price>50
group by category;

SELECT * FROM category_overview
