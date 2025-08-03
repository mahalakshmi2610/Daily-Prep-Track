CREATE DATABASE cheat_sheet_DB;
USE cheat_sheet_DB;

--  create the customers table
CREATE TABLE customersTable(
  id int not null primary key,
  name varchar(100),
  age int,
  city varchar(100),
  country varchar(100),
  has_subscription BIT
);

-- create the orders table
CREATE TABLE ordersTable (
  order_id int not null primary key,
  cus_id int,
  order_date date,
  cost double,
  discount double,
  status varchar(50),
  foreign key (cus_id) references customersTable(id)
);

-- insert into customers table
INSERT INTO customersTable VALUES
(1, 'Adam', 58, 'New York', 'USA', TRUE),
(2, 'Bella', NULL, 'Tijuana', 'Mexico', FALSE),
(3, 'Chetan', 36, 'New Delhi', 'India', TRUE);

-- insert into orders table
insert into ordersTable values
(101, 1,'2023-04-05', 300.00, 0.00, 'Delivered'),
(102, 2,'2023-10-02', 400.00, 0.00, 'Shipped'),
(103, 2,'2024-11-19', 100.00, 25.35, 'TBD'),
(999, NULL,'2027-06-16', 1200, 0.00, 'TBD');

-- 	QUERYING TABLES WITH "SELECT"
-- fetch all columns from customers table
SELECT * FROM customersTable;

-- fetch name and age for all customers
SELECT name, age
FROM customersTable;

-- find the discount percentage for all orders and 
-- round them to 2 decimal places
SELECT ROUND(discount / cost * 100, 2) FROM ordersTable;



-- SORT OUTPUT USING "ORDER BY"
-- sort customers by age in the default ascending order
SELECT * FROM customersTable
ORDER BY age ASC;

-- sort customers by age in descending order (high to low)
SELECT * FROM customersTable
ORDER BY age DESC;



-- ALIASES
-- AS is used to rename columns
SELECT cost * 0.04 AS sales_tax
FROM ordersTable;

-- AS is also used to rename tables
SELECT cus.name, cus.age
FROM customersTable as cus;



-- FILTERING OUTPUT WITH "WHERE"

-- COMPARISON OPERATORS
-- Fetch customers who are over the age of 35
SELECT * FROM customersTable
WHERE age > 35;

-- fetch customers that live in either  USA or Canada AND 
-- also have a subscription
SELECT * FROM customersTable
WHERE (country = 'USA' OR country = 'Canada') 
AND has_subscription = TRUE;

-- BETWEEN and IN
-- fetch the status of orders that have a cost  between 100-200
SELECT status FROM ordersTable
WHERE cost BETWEEN 100 AND 200;

-- fetch customers that live in North America
SELECT name FROM customersTable
WHERE country IN ('USA', 'Canada', 'Mexico');

