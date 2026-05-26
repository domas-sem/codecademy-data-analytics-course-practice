SELECT * FROM sakila.film;

-- 1. Sum the total rental duration for all films.

SELECT
    SUM(rental_duration) AS rental_duration_total
FROM sakila.film;

-- 2. Count how many distinct rating values exist.

SELECT
    DISTINCT rating AS rating_values
FROM sakila.film;

SELECT
    COUNT(DISTINCT rating) AS rating_values_count
FROM sakila.film;

-- 3. Retrieve the unique rating values.

SELECT
    DISTINCT rating AS rating_values
FROM sakila.film;

-- 4. Sum the rental duration grouped by rating.

SELECT
    rating,
    SUM(rental_duration) AS rental_duration_total
FROM sakila.film
GROUP BY rating
ORDER BY rental_duration_total DESC;

-- 5. Return the shortest and longest rental duration.

SELECT 
    MIN(rental_duration) AS shortest_duration,
    MAX(rental_duration) AS longest_duration
FROM sakila.film;

-- 6. Select all films where rental duration is greater than or equal to 6.
-- Result: film_id, title, description.

SELECT
    film_id,
    title,
    description
FROM sakila.film
WHERE rental_duration >= 6;

-- 7. Count how many films have rental duration greater than or equal to 6.

SELECT 
    COUNT(*) AS film_count
FROM sakila.film
WHERE rental_duration >= 6;

SELECT
    COUNT(DISTINCT title) AS distinct_title_count
FROM sakila.film
WHERE rental_duration >= 6;

SELECT
    COUNT(film_id) AS film_count
FROM sakila.film
WHERE rental_duration >= 6;

-- 8. Calculate the average rental duration grouped by rating and special_features.

SELECT 
    rating,
    special_features,
    AVG(rental_duration) AS avg_rental_duration
FROM sakila.film
GROUP BY rating, special_features
ORDER BY TRIM(special_features) ASC, rating ASC;

-- 9. Sum the replacement_cost grouped by special_features and sort in descending order.

SELECT
    special_features,
    SUM(replacement_cost) AS total_replacement_cost
FROM sakila.film
GROUP BY special_features
ORDER BY total_replacement_cost DESC;

-- 10. Select films where the title starts with the letter 'U'.
-- Result: film_id, title, description, rating.

SELECT
    film_id,
    title,
    description,
    rating
FROM sakila.film
WHERE title LIKE 'U%';

-- 11. Select films where special_features contains 'Deleted Scenes'.
-- Result: title, special_features.

SELECT
    title,
    special_features
FROM sakila.film
WHERE LOWER(special_features) LIKE '%deleted scenes%';

SELECT
    title,
    special_features
FROM sakila.film
WHERE LOWER(special_features) LIKE '%deleted scenes%'
   OR LOWER(special_features) LIKE '%trailers%';

-- 12. Select films where rental duration is 3 and rating is 'NC-17'.
-- Result: film_id, rental_duration, rating.

SELECT
    film_id,
    rental_duration,
    rating
FROM sakila.film
WHERE rental_duration = 3
  AND rating = 'NC-17';

-- 13. Select films where rental duration is 4 or 5 and the title starts with 'V'.
-- Result: title, rental_duration.

SELECT
    title,
    rental_duration
FROM sakila.film
WHERE title LIKE 'V%'
  AND (rental_duration = 4 OR rental_duration = 5)
ORDER BY rental_duration ASC;
-- 2nd option. 
SELECT
    title,
    rental_duration
FROM sakila.film
WHERE title LIKE 'V%'
  AND rental_duration BETWEEN 4 AND 5
ORDER BY rental_duration ASC;
