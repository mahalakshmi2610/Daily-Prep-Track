CREATE DATABASE StudentEnrollmentDB;
USE StudentEnrollmentDB;

CREATE TABLE Students (
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Courses (
	course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    instructor VARCHAR(100)
);

CREATE TABLE Enrollments (
	enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Students
INSERT INTO Students (name, email) VALUES
('Alice', 'alice@email.com'),
('Bob', 'bob@email.com'),
('Charlie', 'charlie@email.com');

-- Courses
INSERT INTO Courses (course_name, instructor) VALUES
('SQL Basics', 'Dr. Smith'),
('Data Structures', 'Prof. Allen'),
('Web Development', 'Dr. Jones'),
('Data Science', 'Dr. Mahalakshmi K');

-- Enrollments
INSERT INTO Enrollments (student_id, course_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(3, 4);


-- list students and their enrolled courses with instructors. 
SELECT s.name AS student, c.course_name, c.instructor 
FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;

INSERT INTO Students (name, email) 
VALUES('Mary', 'mary@gmail.com');

SELECT * FROM Students;

UPDATE Students
SET email = 'mary@email.com'
WHERE student_id = 4;

SELECT s.name AS student_name, c.course_name, c.instructor
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
LEFT JOIN Courses c ON e.course_id = c.course_id;


SELECT s.name AS student_name, c.course_name, c.instructor
FROM Students s
RIGHT JOIN Enrollments e ON s.student_id = e.student_id
RIGHT JOIN Courses c ON e.course_id = c.course_id;

-- select students who are not enrolled in any of the courses 
SELECT s.name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

SELECT * FROM Students s
LEFT JOIN Enrollments e ON e.student_id = s.student_id;

-- find courses with no students enrolled

INSERT INTO Courses (course_name, instructor)
VALUES ('Programming with Ruby', 'Dr. Smith');

SELECT * FROM Courses;

SELECT c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;