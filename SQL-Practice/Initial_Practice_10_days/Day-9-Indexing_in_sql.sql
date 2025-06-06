CREATE DATABASE indexingDB;
USE indexingDB;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 50000),
(2, 'Smartphone', 'Electronics', 25000),
(3, 'Desk', 'Furniture', 7000),
(4, 'Chair', 'Furniture', 3000),
(5, 'Headphones', 'Electronics', 3000);

-- Simulate a slow query without an index
SELECT * FROM products
WHERE category = 'Electronics';

-- Use EXPLAIN before the query to analyze the execution plan:
EXPLAIN SELECT * FROM products 
WHERE category = 'Electronics';

-- add an index
CREATE INDEX idx_category ON products(category);

EXPLAIN SELECT * FROM products 
WHERE category = 'Electronics';

CREATE INDEX idx_category_price ON products(category, price);

SELECT * FROM products
WHERE category = 'Electronics' AND price < 10000;

SELECT * from products;

select * from products
where name NOT IN ('Laptop', 'Phone', 'Desk');
