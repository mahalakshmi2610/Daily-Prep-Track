CREATE DATABASE online_orders;

USE online_orders;

CREATE TABLE orders (
	OrderID INT,
    Product VARCHAR(50),
    DeliveryStatus VARCHAR(20),
    CustomerName VARCHAR(100),
    Amount INT
);

INSERT INTO orders VALUES
(1001, 'Wireless Mouse', 'Delivered', 'Arjun', 599),
(1002, 'Laptop Sleeve', 'Pending', 'Mahima', 899),
(1003, 'USB Cable', 'Delivered', 'John', 199),
(1004, 'Bluetooth Speaker', 'Cancelled', 'Shreya', 1299),
(1005, 'Webcam', 'Delivered', 'Anil', 1799),
(1006, 'Laptop Stand', 'Pending', 'Sneha' ,1099),
(1007, 'Wired Headphone', 'Pending', 'Mahalakshmi', 299);

#Select all delivered orders
SELECT * FROM orders
WHERE DeliveryStatus = 'Delivered';

#Total amount collected from delivered orders
SELECT SUM(Amount) FROM orders
WHERE DeliveryStatus = 'Delivered';

#List unique delivery statuses available
SELECT DISTINCT(DeliveryStatus) FROM orders;

#Show customer names and products for orders above Rs.1000
SELECT CustomerName, Product FROM orders
WHERE Amount > 1000;

#count how many orders are in each delivery status
SELECT DeliveryStatus, COUNT(*) FROM orders
GROUP BY DeliveryStatus;

#Top 2 Highest-value orders
SELECT * FROM orders
ORDER BY Amount DESC
LIMIT 2;

# create a non-clustered index(secondary indexing - index table is created using candidate keys) on DeliveryStatus
CREATE INDEX idx_status ON orders(DeliveryStatus);

# running a query to observe result after indexing
SELECT * FROM orders WHERE DeliveryStatus = 'Pending';