CREATE DATABASE library;
USE library;
CREATE TABLE books (
book_id INT NOT NULL PRIMARY KEY, 
title VARCHAR (255) NOT NULL UNIQUE, 
author VARCHAR (255) NOT NULL, 
genre VARCHAR (20), CHECK (genre IN ('realism', 'romanticism', 'non-fiction')), 
available_copies INT);
CREATE TABLE users (
user_id INT NOT NULL PRIMARY KEY, 
name VARCHAR (20) UNIQUE, 
email VARCHAR (55) UNIQUE, 
phone VARCHAR (15) UNIQUE, 
gender VARCHAR (20), CHECK (gender IN ('F', 'M')));

SELECT * FROM books;
SELECT * FROM users;

INSERT INTO books VALUES ('0', 'Frankenstein', 'M. Schelly', 'romanticism', '34'); # все сработало
UPDATE books SET genre= 'mystery' WHERE book_id = 0; # ошибка, такой жанр ставить нельзя

INSERT INTO users VALUES ('0', 'Anna', 'email@gmail.com', '+7982547492', 'F'); # все сработало
INSERT INTO users VALUES ('0', 'Anna', 'email@gmail.com', '+7982547492', 'F'); # ошибка, почти все значения должны быть уникальными