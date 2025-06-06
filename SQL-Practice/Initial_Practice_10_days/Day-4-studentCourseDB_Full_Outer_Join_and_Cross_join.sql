CREATE DATABASE StudentCourseDB;
USE StudentCourseDB;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(100)
);

CREATE TABLE Enrollments (
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Students
INSERT INTO Students VALUES (1, 'Alice'), (2, 'Bob'), (3, 'Charlie');

-- Courses
INSERT INTO Courses VALUES (101, 'Math'), (102, 'Science');

-- Faculty
INSERT INTO Faculty VALUES (1, 'Dr. Smith'), (2, 'Prof. John');

-- Enrollments
INSERT INTO Enrollments VALUES (1, 101), (2, 102);

-- SELECT S.name, E.course_id FROM Students S FULL OUTER JOIN Enrollments E ON S.student_id = E.student_id;
-- (Note: MySQL doesn't support FULL OUTER JOIN directly. Use UNION of LEFT JOIN and RIGHT JOIN.)

SELECT S.name, E.course_id
FROM Students S
LEFT JOIN Enrollments E ON S.student_id = E.student_id
UNION
SELECT S.name, E.course_id
FROM Students S
RIGHT JOIN Enrollments E ON S.student_id = E.student_id;

SELECT C.course_name, F.faculty_name
FROM Courses C
CROSS JOIN Faculty F;




