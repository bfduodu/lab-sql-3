SELECT * FROM sakila.actor;

SELECT * FROM sakila.actor
WHERE first_name = 'Scarlett';

SELECT * FROM sakila.actor
WHERE last_name = 'Johansson';

SELECT COUNT(*) AS total_films_available_for_rent
FROM sakila.film;

SELECT COUNT(*) AS total_rented_films
FROM sakila.rental;

SELECT MIN(last_update) AS shortest_rental_duration
FROM sakila.rental;

SELECT MAX(last_update) AS longest_rental_duration
FROM sakila.rental;

SELECT MIN(last_update) AS min_duration
FROM sakila.film;

SELECT MAX(last_update) AS max_duration
FROM sakila.film;

SELECT AVG(last_update) AS average_duration
FROM sakila.film;

SELECT 
  FLOOR(AVG(length) / 60) AS average_hours,
  AVG(length) % 60 AS average_minutes
FROM sakila.film;

SELECT COUNT(*) AS movies_longer_than_3_hours
FROM sakila.film
WHERE length > 180; 

SELECT 
  CONCAT(first_name, ' ', last_name) AS formatted_name,
  CONCAT(LOWER(first_name), '.', LOWER(last_name), '@sakilacustomer.org') AS formatted_email
FROM sakila.customer;

SELECT MAX(CHAR_LENGTH(title)) AS max_title_length
FROM sakila.film;



# next lab
SELECT COUNT(DISTINCT last_name) AS distinct_last_names
FROM sakila.actor;

SELECT COUNT(DISTINCT language_id) AS distinct_languages
FROM sakila.film;

SELECT COUNT(*) AS pg13_movies
FROM sakila.film
WHERE rating = 'PG-13';

SELECT film_id, title, length
FROM sakila.film
WHERE release_year = 2006
ORDER BY length DESC
LIMIT 10;

SELECT DATEDIFF(CURDATE(), last_update) AS days_operating
FROM sakila.film;

SELECT rental_id, rental_date, return_date, 
       MONTH(rental_date) AS rental_month, 
       DAYOFWEEK(rental_date) AS rental_weekday
FROM sakila.rental
LIMIT 20;

SELECT rental_id, rental_date, return_date, 
       MONTH(rental_date) AS rental_month, 
       DAYOFWEEK(rental_date) AS rental_weekday,
       CASE WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend' ELSE 'workday' END AS day_type
FROM sakila.rental
LIMIT 20;

SELECT COUNT(*) AS rentals_last_month
FROM sakila.rental
WHERE MONTH(rental_date) = MONTH(CURDATE()) AND YEAR(rental_date) = YEAR(CURDATE());

