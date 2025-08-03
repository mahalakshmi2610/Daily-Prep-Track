CREATE DATABASE SalesDB;
USE SalesDB;

CREATE TABLE Products (
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE Transaction (
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity INT,
    transaction_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products (name, category, price) VALUES 
('Laptop', 'Electronics', 60000),
('Phone', 'Electronics', 25000),
('Shirt', 'Clothing', 1000),
('Jeans', 'Clothing', 2000);

INSERT INTO Transaction (product_id, quantity, transaction_date) VALUES 
(1, 2, '2024-05-01'),
(2, 3, '2024-05-01'),
(3, 5, '2024-05-02'),
(4, 4, '2024-05-03'),
(1, 1, '2024-05-04');

SELECT COUNT(*) AS total_transactions FROM Transaction;

SELECT SUM(price*quantity) AS total_revenue
FROM Transaction t
JOIN Products p
ON t.product_id = p.product_id;

SELECT AVG(quantity) AS avg_quantity_sold FROM Transaction;

SELECT category, SUM(price*quantity) AS category_revenue
FROM Transaction t
JOIN Products p
ON t.product_id = p.product_id
GROUP BY category;

SELECT transaction_id, name, (price*quantity) AS sale_amount
FROM Transaction t
JOIN Products p ON t.product_id = p.product_id
ORDER BY sale_amount DESC
LIMIT 1;

