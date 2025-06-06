CREATE DATABASE LibraryBooksDB;
USE LibraryBooksDB;

CREATE TABLE Books (
  book_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(150),
  author VARCHAR(100),
  published_year INT,
  price DECIMAL(6,2),
  is_available BOOLEAN
);

INSERT INTO Books (title, author, published_year, price, is_available) VALUES
('The Silent Patient', 'Alex Michaelides', 2019, 14.99, TRUE),
('Atomic Habits', 'James Clear', 2018, 16.00, TRUE),
('1984', 'George Orwell', 1949, 12.49, FALSE),
('To Kill a Mockingbird', 'Harper Lee', 1960, 10.00, TRUE);

SELECT * FROM Books;

SELECT title, price FROM Books
WHERE price > 13;

SELECT title, published_year FROM Books
WHERE published_year < 2000;

SELECT title FROM Books 
WHERE is_available = TRUE;