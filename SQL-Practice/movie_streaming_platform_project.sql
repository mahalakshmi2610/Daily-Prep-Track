CREATE DATABASE MOVIE_STREAMING_PLATFORM_DB;

USE MOVIE_STREAMING_PLATFORM_DB;

-- One to store movies (title, release year, genre)

CREATE TABLE Movies (
	movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    release_year INT, 
    genre VARCHAR(50)
);

-- One to store users (name, email, subscription start date)

CREATE TABLE Users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(50),
    subscription_start_date DATE
);

-- One to track viewing history (user id, movie id, watch date)

CREATE TABLE ViewingHistory (
	user_id INT,
    movie_id INT,
    watch_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id), 
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

INSERT INTO Movies (title, release_year, genre) VALUES
('Inception', 2010, 'Sci-Fi'),
('The Dark Knight', 2008, 'Action'),
('Interstellar', 2014, 'Sci-Fi'),
('Mad Max: Fury Road', 2015, 'Action'),
('The Pursuit of Happyness', 2006, 'Drama');

INSERT INTO Users (name, email, subscription_start_date) VALUES
('Alice', 'alice@example.com', '2024-01-10'),
('Bob', 'bob@example.com', '2024-02-15'),
('Charlie', 'charlie@example.com', '2024-03-05'),
('Diana', 'diana@example.com', '2024-04-01');

INSERT INTO ViewingHistory (user_id, movie_id, watch_date) VALUES
(1, 1, '2024-04-15'),  -- Alice watched Inception
(1, 2, '2024-04-17'),  -- Alice watched The Dark Knight
(2, 2, '2024-04-18'),  -- Bob watched The Dark Knight
(2, 4, '2024-04-20'),  -- Bob watched Mad Max
(3, 3, '2024-04-19'),  -- Charlie watched Interstellar
(3, 1, '2024-04-22');  -- Charlie watched Inception

SELECT Users.user_id FROM Users
WHERE Users.name = 'Alice';

SELECT ViewingHistory.movie_id FROM ViewingHistory
WHERE ViewingHistory.user_id = (SELECT Users.user_id FROM Users
WHERE Users.name = 'Alice');

SELECT Movies.movie_id, Movies.title FROM Movies
WHERE movie_id IN (SELECT ViewingHistory.movie_id FROM ViewingHistory
WHERE ViewingHistory.user_id = (SELECT Users.user_id FROM Users
WHERE Users.name = 'Alice'));

SELECT * FROM Movies
WHERE genre = 'Action';

SELECT ViewingHistory.user_id FROM ViewingHistory
WHERE ViewingHistory.movie_id IN (SELECT Movies.movie_id FROM Movies
WHERE genre = 'Action');

SELECT * FROM Users
WHERE Users.user_id IN (SELECT ViewingHistory.user_id FROM ViewingHistory
WHERE ViewingHistory.movie_id IN (SELECT Movies.movie_id FROM Movies
WHERE genre = 'Action'));

SELECT DISTINCT u.* FROM Users u
JOIN ViewingHistory vh ON vh.user_id = u.user_id
JOIN Movies m ON vh.movie_id = m.movie_id
WHERE m.genre = 'Action';

SELECT u.user_id, u.name, m.title, vh.watch_date
FROM ViewingHistory vh
JOIN (
	SELECT user_id, MAX(watch_date) as latest_watch
    FROM ViewingHistory
    GROUP BY user_id
) latest ON vh.user_id = latest.user_id AND vh.watch_date = latest.latest_watch
JOIN Users u ON vh.user_id = u.user_id
JOIN Movies m ON vh.movie_id = m.movie_id;


SELECT 
    u.user_id,
    u.name,
    COUNT(vh.movie_id) AS total_movies_watched,
    GROUP_CONCAT(DISTINCT m.genre ORDER BY m.genre SEPARATOR ', ') AS genres_watched
FROM Users u
JOIN ViewingHistory vh ON u.user_id = vh.user_id
JOIN Movies m ON vh.movie_id = m.movie_id
GROUP BY u.user_id, u.name;

SELECT DISTINCT user_id FROM ViewingHistory;

SELECT user_id, name FROM Users
WHERE user_id NOT IN (SELECT DISTINCT user_id FROM ViewingHistory);

SELECT u.user_id, u.name 
FROM Users u
LEFT JOIN ViewingHistory vh ON u.user_id = vh.user_id
WHERE vh.user_id IS NULL;

SELECT user_id, COUNT(movie_id) 
FROM ViewingHistory
GROUP BY user_id;

SELECT u.user_id, u.name, COUNT(vh.movie_id) AS movies_watched
FROM Users u
LEFT JOIN ViewingHistory vh ON u.user_id=vh.user_id
GROUP BY u.user_id, u.name;