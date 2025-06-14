CREATE DATABASE sales_emp;
USE sales_emp;

CREATE TABLE Sales (
	date DATE,
    emp_id VARCHAR(10),
    amount INT
);

INSERT INTO Sales VALUES
('2023-01-01', 'E101', 2000),
('2023-01-02', 'E101', 1800),
('2023-01-01', 'E102', 2200),
('2023-01-03', 'E101', 2500),
('2023-01-02', 'E102', 2000);

-- Window Functions
-- Running total of sales by employee
SELECT 
	emp_id,
    date, 
    amount,
    SUM(amount) OVER (
		PARTITION BY emp_id
        ORDER BY date
        ROWS BETWEEN  UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM Sales;


-- Rank of sales amount within employee
SELECT 
	emp_id,
    date,
    amount,
    RANK() OVER(
		PARTITION BY emp_id
        ORDER BY amount DESC
    ) AS rank_within_employee
FROM Sales;