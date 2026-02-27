CREATE DATABASE cinema;
USE cinema;

CREATE TABLE movie (
    mId INT PRIMARY KEY,
    Title VARCHAR(255),
    Year INT,
    Director VARCHAR(50),
    Rating FLOAT
);

INSERT INTO movie (mId, Title, Year, Director, Rating) VALUES
(1, 'The Shawshank Redemption', 1994, 'Frank Darabont', 9.3),
(2, 'The Godfather', 1972, 'Francis Ford Coppola', 9.2),
(3, 'The Dark Knight', 2008, 'Christopher Nolan', 9.0),
(4, 'Pulp Fiction', 1994, 'Quentin Tarantino', 8.9),
(5, 'Schindler''s List', 1993, 'Steven Spielberg', 9.0),
(6, 'Inception', 2010, 'Christopher Nolan', 8.8),
(7, 'Fight Club', 1999, 'David Fincher', 8.8),
(8, 'Forrest Gump', 1994, 'Robert Zemeckis', 8.8),
(9, 'The Matrix', 1999, 'Lana Wachowski', 8.7),
(10, 'Goodfellas', 1990, 'Martin Scorsese', 8.7),
(11, 'The Silence of the Lambs', 1991, 'Jonathan Demme', 8.6),
(12, 'Interstellar', 2014, 'Christopher Nolan', 8.6),
(13, 'Parasite', 2019, 'Bong Joon-ho', 8.5),
(14, 'The Departed', 2006, 'Martin Scorsese', 8.5),
(15, 'Gladiator', 2000, 'Ridley Scott', 8.5);



#Q1: Find title and year of movies created after year 2000.
SELECT Title, Year 
FROM movie 
WHERE Year > 2000;

#Q2: Find title, mId, and rating of movies created before 2000 with rating > 2.
SELECT Title, mId, Rating 
FROM movie
WHERE Year < 2000 AND Rating > 2;

#Q3: Sort all of the movies by descending Rating.
SELECT Title, mId, Rating 
FROM movie
ORDER BY Rating DESC;



#Q4: Find all movies that have the exact same Rating.
#We use a SELF-JOIN to compare the table against itself.

SELECT m1.Title AS Movie_A, m2.Title AS Movie_B, m1.Rating
FROM movie m1
JOIN movie m2 ON m1.Rating = m2.Rating
WHERE m1.mId < m2.mId;
CREATE DATABASE cinema;
USE cinema;

#5create a query that looks for a movies's ID, title, and director, but only if it has a ratting above 4.
SELECT DISTINCT m.mId, m.title, m.director, r.rating 
FROM movie m 
JOIN rating r ON m.mId = r.mId
WHERE r.rating > 4;







