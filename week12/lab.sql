-- Why Primary and Foreign Keys matter?
-- In a relational database, data lives in multiple tables. but those tables must be connected somehow.
-- We do this using keys

-- Primary Key(PK): A column or set of columns that uniquely identify a row in a table.
-->	student_id, customer_id, product_id

-- Foreign Key(FK): A column in one table that refers to a PK in another table.
-- A FK is just a PK in another table.

-- PK/FK can be thought of as a parent/child relationship - A parent may have many children, but each child has one parent.

-- Creating the parent table (Customers)
CREATE TABLE customers(
id serial PRIMARY KEY,
name text,
email text,
city text);

-- Serial automatically numbers each new record
-- PRIMARY KEY ensures each id is unique and not null

-- Creating the Child Table (Orders)

create table orders(
id serial PRIMARY KEY,
customer_id int,
product text,
total numeric(10,2),
FOREIGN KEY(customer_id) REFERENCES customers);

-- Customer_id linked each order back to a customer.
-- The FK constraint prevents orphan records
-- You can't create an order for no customer

INSERT INTO customers("name",email,city)
Values
('Alice','alice@gmail.com','Boise'),
('Brian','brian@gmail.com','Twin Falls'),
('Carmen','carmen@gmail.com','Jerome');
INSERT INTO orders (customer_id, product, total)
Values
(1,'Laptop',999.99),
(1,'Mouse',25.50),
(2,'Headphones',89.99),
(3,'Monitor',199.99);

-- Each order's customer_id points to an existing customer in customers.customer_id.
-- Viewing the Relationship with a JOIN
select customers.name, -- Selecting the name column from the customer table
customers.city, -- Selecting the city column from the customer table
--- Want to select the product and total columns from the orders table.
orders.product,
orders.total
FROM orders
join customers; -- JOIN defaults to innner join, only rows matching customers will appear.
ON orders.customer_id=customers_id

-- PK uniquely identifies rows
-- FK links tables together
-- Many Relationship types(1:1, 1:M, M:M)


--Part 4
-- 1. The relationship berween the tables is a one-to-many relationship, since each cutomer has many orders, but each order links back to one customer.
-- 2. The orders would link to a null customer.
-- 3. A foreign key prevents orphan records.
