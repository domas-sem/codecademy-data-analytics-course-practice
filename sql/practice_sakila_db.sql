
SELECT * FROM sakila.film;

-- 1. Susumuoti filmų nuomos trukmes.

SELECT
SUM(rental_duration) as nuomos_trukme
FROM sakila.film;

-- 2. Suskaičiuoti, kiek yra skirtingu rating reikšmių.

SELECT
distinct rating as reitingu_reiksmes
FROM sakila.film;

SELECT
count(distinct rating) as reitingu_reiksmes
FROM sakila.film;

-- 3. Išrinkti unikalias rating reikšmes.

SELECT
distinct rating as reitingu_reiksmes
FROM sakila.film;

-- 4. Susumuoti filmų nuomos trukmes pagal rating dimensiją.

SELECT rating, 
SUM(rental_duration) as nuomos_trukme
FROM sakila.film
Group by rating
Order by nuomos_trukme desc;

-- 5. Pateikti trumpiausią ir ilgiausią nuomos trukmes.

SELECT 
MIN(rental_duration) AS trumpiausia_trukme,
MAX(rental_duration) AS ilgiausia_trukme
FROM sakila.film;

-- 6. Išrinkti visus filmus, kurių nuomos trukmė didesnė arba lygi 6.
-- Rezultatas: film_id, title, description.

SELECT
film_id, title, description
FROM sakila.film
WHERE rental_duration >= 6;

-- 7. Kiek yra tokių filmų, kurių nuomos trukmė didesnė arba lygi 6?

SELECT 
COUNT(*) AS kiekis
FROM sakila.film
WHERE rental_duration >= 6;

SELECT
COUNT(distinct title)  
FROM sakila.film
WHERE rental_duration>=6;

SELECT
Count(film_id) as 'Kiek filmų?'
FROM sakila.FILM
Where rental_duration >=6;

-- 8. Suskaičiuoti vidutinę nuomos trukmę, pagal dimensijas rating ir special_features.

SELECT 
rating,
special_features,
AVG(rental_duration) as avg_rental
FROM sakila.film
group by rating, special_features
order by trim(special_features) asc, rating asc;


-- 9. Susumuoti replacement_cost pagal dimensiją special_features ir rezultatą pateikti mažėjimo
-- tvarka.

SELECT
special_features,
sum(replacement_cost) as total_cost
FROM sakila.film
group by special_features
order by total_cost desc;


-- 10. Išrinkti filmus, kurių pavadinimai prasideda raide 'U'.
-- Rezultatas: film_id, title, description, rating

SELECT
film_id,
title,
description,
rating
FROM sakila.film
WHERE title like "U%";

-- 11. Išrinkti filmus, kur special_features turi reikšmę 'Deleted Scenes'.
-- Rezultatas: title, special_features.

SELECT
title,
special_features
FROM sakila.film
where lower(special_features) like "%Deleted scenes%";

SELECT
title,
special_features
FROM sakila.film
where lower(special_features) like "%deleted scenes%" or
lower(special_features) like "%trailers%";

-- 12. Išrinkti filmus, kai nuomos trukmė yra 3 ir reitingas NC-17.
-- Rezultatas film_id, rental_duration, rating.

SELECT
film_id,
rental_duration,
rating
FROM sakila.film
Where  rental_duration = 3
and rating ="NC-17";

-- 13. Išrinkti filmus, kai nuomos trukmė yra 4 arba 5, ir pavadinimas prasideda raide 'V'.
-- Rezultatas: title, rental_duration.

SELECT
title,
rental_duration
FROM sakila.film
where title like "V%"
and (rental_duration =4 
or rental_duration =5)
Order by rental_duration asc;

SELECT
title,
rental_duration
FROM sakila.film
where title like "V%"
and rental_duration between 4 and 5
Order by rental_duration asc;
