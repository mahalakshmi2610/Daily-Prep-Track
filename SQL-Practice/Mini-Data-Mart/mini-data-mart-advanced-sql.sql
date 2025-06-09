CREATE DATABASE datamart;
USE datamart;

CREATE TABLE customers (
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE products (
	product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
	order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_id, customer_name, region) VALUES
(1, 'Alice Johnson', 'North'),
(2, 'Bob Smith', 'South'),
(3, 'Charlie Davis', 'East'),
(4, 'Diana Evans', 'West'),
(5, 'Ethan Miller', 'North');

INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Laptop', 'Electronics', 800.00),
(2, 'Smartphone', 'Electronics', 500.00),
(3, 'Office Chair', 'Furniture', 150.00),
(4, 'Desk Lamp', 'Furniture', 40.00),
(5, 'Wireless Mouse', 'Accessories', 25.00);

INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 1, '2025-06-01', 1300.00),
(2, 2, '2025-06-02', 525.00),
(3, 3, '2025-06-03', 190.00),
(4, 1, '2025-06-04', 850.00),
(5, 4, '2025-06-05', 65.00);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 5, 2),

(2, 2, 1),
(2, 5, 1),

(3, 3, 1),
(3, 4, 1),

(4, 1, 1),
(4, 5, 2),

(5, 5, 1),
(5, 4, 1);

-- Top 3 customers by total spend
SELECT c.customer_name, SUM(o.total_amount) as total_spend 
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY o.customer_id
ORDER BY total_spend DESC
LIMIT 3;
 
