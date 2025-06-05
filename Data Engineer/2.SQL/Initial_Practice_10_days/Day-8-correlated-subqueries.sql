CREATE DATABASE customerDB;
USE customerDB;

CREATE TABLE customers (
	customer_id INT,
    customer_name VARCHAR(100)
);

CREATE TABLE orders (
	order_id INT,
    customer_id INT,
    amount DECIMAL(10, 2)
);

INSERT INTO customers VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO orders VALUES
(101, 1, 250),
(102, 1, 300),
(103, 2, 150),
(104, 3, 500),
(105, 3, 100);

-- Nested Subquery — Customers who placed an order over 400
SELECT customer_name 
FROM customers
WHERE customer_id IN (
	SELECT customer_id 
    FROM orders
    WHERE amount > 400
);

SELECT * FROM customers JOIN orders
ON customers.customer_id = orders.customer_id;


-- Correlated Subquery — Orders greater than 
-- customer's average
SELECT o.order_id, o.amount
FROM orders o
WHERE amount > (
	SELECT AVG(amount)
    FROM orders o2
    WHERE o2.customer_id = o.customer_id
);

SELECT customer_id, AVG(amount)
FROM orders o2
GROUP BY customer_id;

-- Nested + Correlated — Customers 
-- whose order count is more than 1
SELECT customer_name
FROM customers c
WHERE (
	SELECT COUNT(*)
    FROM orders o
    WHERE o.customer_id = c.customer_id
) > 1;

SELECT c.customer_id,
COUNT(c.customer_id) FROM orders c
GROUP BY c.customer_id
HAVING COUNT(c.customer_id) > 1;


-- Customers with only the maximum single order amount
SELECT customer_name
FROM customers
WHERE customer_id IN (
	SELECT customer_id 
    FROM orders
    WHERE amount = (
		SELECT MAX(amount)
        FROM orders
    )
);

