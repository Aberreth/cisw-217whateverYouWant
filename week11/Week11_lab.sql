select * from products limit 10;

select count(*) from products;

SELECT * FROM products WHERE category = 'Skincare'; 
EXPLAIN ANALYZE SELECT * FROM products WHERE category = 'Skincare'; 

CREATE INDEX idx_category ON products(category); 
EXPLAIN ANALYZE SELECT * FROM products WHERE category = 'Skincare';

SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYZE SELECT * FROM products WHERE category = 'Skincare';
