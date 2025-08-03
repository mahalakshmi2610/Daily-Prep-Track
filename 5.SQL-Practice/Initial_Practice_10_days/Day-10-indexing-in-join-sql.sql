CREATE DATABASE indexingDB2;
USE indexingDB2;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers VALUES
(1, 'Alice'), (2, 'Bob'), (3, 'Charlie');

INSERT INTO orders VALUES
(101, 1, 200.00),
(102, 1, 350.00),
(103, 2, 400.00);

-- a join query (basic)
SELECT c.name, o.amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

EXPLAIN SELECT c.name, o.amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

CREATE INDEX idx_orders_customer_id ON orders(customer_id);

EXPLAIN SELECT c.name, o.amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

CREATE INDEX idx_orders_amount ON orders(amount);

SELECT c.name, o.amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.amount > 300;

EXPLAIN SELECT c.name, o.amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.amount > 300;