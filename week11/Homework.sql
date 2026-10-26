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

SELECT COUNT(*) FROM products;

SELECT * FROM products LIMIT 5;

EXPLAIN ANALYZE SELECT * FROM products WHERE category = 'Skincare'; 

-- "Seq Scan on products  (cost=0.00..3698.00 rows=3073 width=156) (actual time=0.013..11.256 rows=3019.00 loops=1)"
-- "  Filter: ((category)::text = 'Skincare'::text)"
-- "  Rows Removed by Filter: 96981"
-- "  Buffers: shared hit=2448"
-- "Planning Time: 0.093 ms"
-- "Execution Time: 11.345 ms"

CREATE INDEX idx_big_category ON products(category); 
EXPLAIN ANALYZE SELECT * FROM products WHERE category = 'Skincare'; 

-- Yes, it switched to an index scan, and the execution time sped up by almost 10 seconds.
-- Planning time was a couple ms longer, however.

CREATE INDEX idx_big_cat_price ON products(category, price); 
EXPLAIN ANALYZE SELECT * FROM products WHERE category = 'Skincare' AND price > 200; 

-- "Bitmap Heap Scan on products  (cost=77.61..2646.53 rows=2458 width=156) (actual time=0.605..1.474 rows=2434.00 loops=1)"
--"  Recheck Cond: (((category)::text = 'Skincare'::text) AND (price > '200'::numeric))"
--"  Heap Blocks: exact=1545"
--"  Buffers: shared hit=1545 read=12"
--"  ->  Bitmap Index Scan on idx_big_cat_price  (cost=0.00..77.00 rows=2458 width=0) (actual time=0.422..0.422 rows=2434.00 loops=1)"
--"        Index Cond: (((category)::text = 'Skincare'::text) AND (price > '200'::numeric))"
--"        Index Searches: 1"
--"        Buffers: shared read=12"

-- Reflection:
-- 1. When Postgre used an Index scan, it created a bitmap heap and index. Without the index, these were not created.
--	  The scan using an index was significantly faster to execute, and negligibly longer to plan.
-- 2. When the query selected for both price and category, increasing the amount of data that needed to be parsed.
-- 3. Larger tables benefit greatly from using indexes, while smaller tables barely benefit, or can even be worse for using them.
