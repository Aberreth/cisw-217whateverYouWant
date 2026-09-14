-- Part 1
CREATE TABLE products (
	id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	product_name varchar(100),
	quantity integer);

-- Part 2
INSERT INTO products (product_name, quantity)
VALUES
    ('Gaming Mouse', 10),
    ('Mechanical Keyboard', 8),
    ('Monitor', 5),
    ('Headset', 12);

-- Part 3
alter table products
add column description text,
add column price numeric(7,2),
add column rating real,
add column last_updated timestamp with time zone,
add column in_stock bool;

-- Part 4
UPDATE products
SET description = 'Wireless laser mouse.',
	price = 19.99,
    rating = 4.7,
    last_updated = now(),
    in_stock = TRUE
WHERE product_name = 'Gaming Mouse';

UPDATE products
SET description = '88 key USB keyboard.',
	price = 12.99,
    rating = 4.1,
    last_updated = now(),
    in_stock = TRUE
WHERE product_name = 'Mechanical Keyboard';

UPDATE products
SET description = '120hz 1080P monitor.',
	price = 55.99,
    rating = 4.5,
    last_updated = now(),
    in_stock = TRUE
WHERE product_name = 'Monitor';

UPDATE products
SET description = 'Surround sound HQ headset',
	price = 24.99,
    rating = 4.8,
    last_updated = now(),
    in_stock = TRUE
WHERE product_name = 'Headset';

-- Part 5
Update products
SET price = 24.995
WHERE product_name = 'Headset';
-- The extra decimal is rounded up, and the price listed on the table is 25 exactly.

-- Part 6
-- 1
SELECT * FROM public.products;
-- 2
SELECT product_name, rating, price FROM public.products;
-- 3
SELECT * FROM public.products
WHERE price > 20;
-- 4
SELECT * FROM public.products
WHERE in_stock = TRUE;
-- 5
SELECT * FROM public.products
ORDER BY price DESC;
