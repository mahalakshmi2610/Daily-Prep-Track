CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Authors (
	author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50), 
    birth_year INT, 
    nationality VARCHAR(50)
);

CREATE TABLE Books(
	book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150),
    author_id INT,
    publication_year INT,
    genre VARCHAR(50),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)	
);

INSERT INTO Authors (name, birth_year, nationality)
VALUES ('J.K. Rowling', 1965, 'British'),
	   ('George Orwell', 1903, 'British');
       
INSERT INTO Books (title, author_id, publication_year, genre)
VALUES ('Harry Potter and the Sorcerer\'s Stone', 1, 1997, 'Fantasy'),
	   ('1984', 2, 1949, 'Dystopian');
       
SELECT * FROM Books;
SELECT * FROM Authors;

SELECT Books.title FROM Books
JOIN Authors ON Books.author_id = Authors.author_id
WHERE Authors.name = 'J.K. Rowling';

SELECT * FROM Books ORDER BY publication_year DESC;

SELECT * FROM Books WHERE genre = 'Fantasy';