CREATE DATABASE user_transactions;
SHOW databases;
USE user_transactions;

CREATE TABLE users (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(30)
);

INSERT INTO users (id, name, email) VALUES 
(1, 'Maha', 'maha@gmail.com'),
(2, 'Mohan', 'mohan@gmail.com'),
(3, 'Neha', 'neha@gmail.com'),
(4, 'Raji', 'raji@gmail.com'),
(5, 'Chandru', 'chandru@gmail.com'),
(6, 'Divya', 'divya@gmail.com'),
(7, 'Priyanga', 'priyanga@gmail.com');

CREATE TABLE transactions (
	id INT PRIMARY KEY,
	user_id INT,
    amount REAL,
    date TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO transactions (id, user_id, amount, date) VALUES
(1, 1, 3500, '2024-05-01'),
(2, 1, 2000, '2024-05-10'),
(3, 2, 1000, '2024-05-15'),
(4, 4, 4500, '2024-06-01'),
(5, 6, 3800, '2024-06-05');

-- Join users and transactions → Show user name + total amount
SELECT u.name, IFNULL(SUM(t.amount), 0) AS total_amount 
FROM users u
LEFT JOIN transactions t ON u.id = t.user_id
GROUP BY u.id;

-- Classify users based on amount
SELECT 
	u.name,
	IFNULL(SUM(t.amount), 0) AS total_amount,
	CASE
		WHEN SUM(t.amount) >= 3000 THEN 'Active'
        WHEN SUM(t.amount) IS NULL THEN 'Dormant'
        ELSE 'Low'
	END AS status
FROM users u
LEFT JOIN transactions t ON u.id = t.user_id
GROUP BY u.id; 
