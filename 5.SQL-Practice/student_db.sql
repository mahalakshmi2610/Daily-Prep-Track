CREATE DATABASE student_db;
USE student_db;

CREATE TABLE students (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(50),
    phone VARCHAR(20),
    address VARCHAR(200)
);

SELECT * FROM students;
