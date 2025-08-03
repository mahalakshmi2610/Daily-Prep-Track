CREATE DATABASE bank_db;
USE bank_db;

CREATE TABLE customers (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(200)
);

CREATE TABLE accounts (
	account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    balance DOUBLE,
    account_type VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
USE bank_db;
SELECT * FROM customers;