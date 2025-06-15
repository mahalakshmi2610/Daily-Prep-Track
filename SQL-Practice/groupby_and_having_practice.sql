CREATE DATABASE transactionss;
USE transactionss;

CREATE TABLE transactionsss (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    amount DECIMAL(10,2),
    date DATE
);

INSERT INTO transactionsss (id, name, amount, date) VALUES
(1, 'Maha', 2500.00, '2023-06-01'),
(2, 'Neha', 4000.00, '2023-06-02'),
(3, 'Sita', 1800.00, '2023-06-03'),
(4, 'Ravi', 5200.00, '2023-06-04'),
(5, 'Ramu', 2000.00, '2023-06-05'),
(6, 'Neha', 1500.00, '2023-06-06'),
(7, 'Maha', 1200.00, '2023-06-07'),
(8, 'Ravi', 800.00,  '2023-06-08'),
(9, 'Ramu', 1700.00, '2023-06-09');

-- total amount per person
SELECT name, SUM(amount) AS total_amount
FROM transactionsss
GROUP BY name;

-- people with total amount > 3000 and order by descending
SELECT name, SUM(amount) AS total_amount
FROM transactionsss
GROUP BY name
HAVING total_amount > 3000
ORDER BY total_amount DESC;