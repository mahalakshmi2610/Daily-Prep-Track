USE transactionss;

CREATE TABLE users (
	id INTEGER,
    name VARCHAR(50),
    email VARCHAR(30)
);

INSERT INTO users (id, name, email) VALUES
(1, 'Maha', 'maha@gmail.com'),
(2, 'Priya', 'priya@gmail.com'),
(3, 'Ravi', 'ravi@gmail.com'),
(4, 'Raju', 'raju@gmail.com'),
(5, 'Ramu', 'ramu@gmail.com'),
(6, 'Sita', 'sita@gmail.com'),
(7, 'Neha', 'neha@gmail.com'),
(8, 'Janani', 'janani@gmail.com');


-- users who don't have transactions
SELECT * FROM users
WHERE name NOT IN (SELECT DISTINCT name FROM transactionsss);

# classify users as highor low spender if amount > 3000
SELECT 
	name, 
    SUM(amount) AS total_amount,
    CASE
		WHEN SUM(amount) > 3000 THEN 'High'
        ELSE 'Low'
	END as spending_category
FROM transactionsss
GROUP BY name;

ALTER TABLE users
ADD COLUMN phone VARCHAR(15);

SET SQL_SAFE_UPDATES = 0;

UPDATE users
SET phone = CASE id
    WHEN 1 THEN '+919876543210'
    WHEN 2 THEN '+919812345678'
    WHEN 3 THEN NULL
    WHEN 4 THEN '+917654321098'
    WHEN 5 THEN NULL
    WHEN 6 THEN '+918888777766'
    WHEN 7 THEN '+917003456789'
    WHEN 8 THEN NULL
END;

SET SQL_SAFE_UPDATES = 1;

SELECT name, IFNULL(phone, 'No Number') AS phone_number FROM users;

SELECT name, COALESCE(phone, 'No Number available') AS phone_number FROM users;