-- New Table

CREATE TABLE movie (
  movie_id SERIAL PRIMARY KEy,
  title VARCHAR(250),
  media_type_id INT REFERENCES media_type(media_type_id)
);

INSERT INTO movie ( 
    title, media_type_id 
    ) 
    VALUES ( 
        'Shrek', 
        3 
        );

SELECT * FROM movie;

-- Existing Table 

ALTER TABLE movie 
ADD COLUMN genre_id INT REFERENCES genre(genre_id);

SELECT * FROM movie;

-- Updating Rows

UPDATE movie 
SET genre_id = 22 
WHERE movie_id = 1;

SELECT * FROM movie;

-- Using Joins

SELECT al.title, ar.name 
FROM album al
JOIN artist ar 
ON al.artist_id = ar.artist_id;

-- Using nested queries/sub-selects

SELECT * FROM track
WHERE genre_id IN ( 
  SELECT genre_id 
  FROM genre 
  WHERE name = 'Jazz' OR name = 'Blues' 
);

-- Setting values to null

UPDATE employee 
SET phone = null 
WHERE employee_id = 1;

SELECT * 
FROM employee;

-- Querying a null value

SELECT * 
FROM customer 
WHERE company IS null;

-- Group by

SELECT ar.artist_id, ar.name, COUNT(*) AS album_count
FROM artist ar
JOIN album al 
ON ar.artist_id = al.artist_id 
GROUP BY ar.artist_id
ORDER BY album_count DESC;

-- Distinct

SELECT DISTINCT country 
FROM customer;

-- Delete Rows

SELECT * 
FROM customer 
WHERE fax IS null;

DELETE FROM customer 
WHERE fax IS null;