CREATE DATABASE employeeDB;
USE employeeDB;

CREATE TABLE employees (
	emp_id INT,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);

INSERT INTO employees VALUES
(1, 'Alice', 'HR', 50000, '2020-01-10'),
(2, 'Bob', 'IT', 60000, '2021-03-15'),
(3, 'Charlie', 'HR', 65000, '2019-07-22'),
(4, 'David', 'Finance', 70000, '2021-06-01'),
(5, 'Eva', 'IT', 55000, '2022-02-10'),
(6, 'Frank', 'Finance', 72000, '2020-08-30');

-- group by department with total salary
SELECT department, SUM(salary) AS total_salary
FROM employees 
GROUP BY department;

-- average salary per department
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- Departments with Average Salary > 60000
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING avg_salary > 60000;

-- count of employees in each department
SELECT department, COUNT(emp_id) AS num_employees
FROM employees
GROUP BY department;

INSERT INTO employees VALUES(7, 'Gayathri', 'HR', 50000, '2025-05-08');


