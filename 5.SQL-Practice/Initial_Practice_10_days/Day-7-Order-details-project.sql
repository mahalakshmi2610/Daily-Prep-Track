CREATE DATABASE ordersDB;
USE ordersDB;

-- TITLE: SUBQUERIES (Part-1)


CREATE TABLE orders (
	order_id INT,
    customer_name VARCHAR(100),
    order_date DATE
);

CREATE TABLE order_items (
	item_id INT,
    order_id INT,
    product_name VARCHAR(50),
    quantity INT,
    price DECIMAL(10, 2)
);

INSERT INTO orders VALUES
(1, 'Alice', '2024-06-01'),
(2, 'Bob', '2024-06-02'),
(3, 'Charlie', '2024-06-03');

INSERT INTO order_items VALUES
(1, 1, 'Keyboard', 2, 100.00),
(2, 1, 'Mouse', 1, 50.00),
(3, 2, 'Monitor', 1, 200.00),
(4, 3, 'Chair', 2, 150.00),
(5, 3, 'Desk', 1, 300.00);

SELECT * FROM orders o 
LEFT JOIN order_items oi
ON o.order_id = oi.order_id;


-- Total Order Amount per Order (Subquery in SELECT)
SELECT o.order_id, o.customer_name,
	(SELECT SUM(price*quantity) FROM order_items oi
    WHERE oi.order_id = o.order_id) AS total_amount
FROM orders o;

SELECT order_id, (price*quantity) FROM order_items oi;

-- Orders with Total > 250 (Subquery in WHERE)
SELECT order_id, customer_name 
FROM orders
WHERE (SELECT SUM(quantity * price) 
	   FROM order_items
	   WHERE order_items.order_id = orders.order_id) > 250;
       
-- Average Order Amount Using Subquery in FROM
SELECT order_id, AVG(quantity * price) FROM order_items
GROUP BY order_id;

SELECT AVG(total_amount) AS avg_order_amount
FROM (
	SELECT order_id, SUM(quantity * price) AS total_amount
    FROM order_items
    GROUP BY order_id
) AS order_totals;

SELECT order_id, SUM(quantity * price) AS total_amount
FROM order_items
GROUP BY order_id;


-- Highest Value Order
SELECT order_id, customer_name
FROM orders
WHERE order_id = (
	SELECT order_id
    FROM order_items
    GROUP BY order_id
    ORDER BY SUM(quantity * price) DESC
    LIMIT 1
);

SELECT order_id, SUM(quantity * price) as total_amount
FROM order_items
GROUP BY order_id
ORDER BY total_amount DESC;