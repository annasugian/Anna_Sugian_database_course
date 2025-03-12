CREATE DATABASE kinopisk;
USE kinopisk;

CREATE TABLE genres (
genre_id int PRIMARY KEY NOT NULL,
genre_title varchar(255));

CREATE TABLE episodes (
episode_id int PRIMARY KEY NOT NULL,
episode_title varchar(255),
episode_annotation varchar(255));

CREATE TABLE movie_people (
person_id int PRIMARY KEY NOT NULL,
name varchar(255),
age int,
filmography int);

CREATE TABLE movies (
movie_id int PRIMARY KEY NOT NULL,
movie_title varchar(255),
movie_annotation varchar(255),
country varchar(255),
genres int,
pubyear timestamp,
movie_crew int);

ALTER TABLE movies RENAME COLUMN genres TO genre;

CREATE TABLE series (
series_id int PRIMARY KEY NOT NULL,
series_title varchar(255),
series_annotation varchar(255),
country varchar(255),
genre int,
pubyear timestamp,
movie_crew int,
episodes int);

INSERT INTO genres VALUES 
('0', 'romcom'), 
('1', 'horror'), 
('2', 'documentary');

INSERT INTO episodes VALUES 
('0', 'something went wrong', 'Jess and Stiven are at home...'), 
('1', 'we are back!', 'Family members get back together...'), 
('2', 'I am your nightmare', 'A group of people are found dead...');

INSERT INTO movie_people VALUES 
('0', 'R. Pattinson', '32', '1'), 
('1', 'E. Stone', '35', '2'), 
('2', 'S. Carell', '49', '0');

ALTER TABLE movies DROP COLUMN pubyear;

INSERT INTO movies VALUES 
('0', 'Poor little things', 'In late-Victorian London, the medical student Max...', 'UK', '1', '1'), 
('1', 'The Lighthouse', 'Two lighthouse keepers try to maintain their sanity...', 'USA', '1', '0'), 
('2', 'Twilight', 'When Bella Swan moves to a small town...', 'USA', '2', '0');

INSERT INTO series VALUES 
('0', 'the Office', 'A mockumentary on a group of typical office workers', 'USA', '0', '2', '2');

ALTER TABLE movie_people ADD FOREIGN KEY (filmography) REFERENCES movies(movie_id);
ALTER TABLE movies ADD FOREIGN KEY (movie_crew) REFERENCES movie_people(person_id);
ALTER TABLE movies ADD FOREIGN KEY (genre) REFERENCES genres(genre_id);
ALTER TABLE series ADD FOREIGN KEY (episodes) REFERENCES episodes(episode_id);
ALTER TABLE series ADD FOREIGN KEY (movie_crew) REFERENCES movie_people(person_id);
ALTER TABLE series ADD FOREIGN KEY (genre) REFERENCES genres(genre_id);

SELECT movie_title FROM movies WHERE country='USA' AND genre='2'; # must show Twilight
SELECT name FROM movie_people WHERE age >= '35'; # must show E. Stone and S. Carell

ALTER TABLE episodes ADD COLUMN duration int;
UPDATE episodes SET duration='50' WHERE episode_id='2'; 
UPDATE episodes SET duration='20' WHERE episode_id='0';
UPDATE episodes SET duration='30' WHERE episode_id='1';

SELECT episode_annotation FROM episodes WHERE duration <= '30'; # must be 'Jess and Stiven are at home...' and 'Family members get back together...'

