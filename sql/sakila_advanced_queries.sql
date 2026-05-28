
-- 1.Retrieve a list of films and their actors. Include the title from the film table and first_name, last_name from the actor table.

select
f.title,
a.first_name,
a.last_name
from film_actor fa
left join film f 
on fa.film_id=f.film_id
left join actor a 
on fa.actor_id=a.actor_id;

-- 2.Obtain a list of customers and their respective rentals. Include first_name, last_name from the customer table, and rental_date from the rental table.

SELECT
c.first_name,
c.last_name,
r.rental_date
FROM customer c
left join rental r on c.customer_id=r.customer_id;


-- Complete the tasks described below using the Sakila database.


-- 1. Count how many actors have last names starting with the letters A and B.
-- Result: actor count and the first letter of the last name.

SELECT 
    LEFT(last_name, 1) AS pavardes_pirma_raide,
    COUNT(actor_id) AS aktoriu_skaicius
FROM actor
WHERE last_name LIKE 'A%' OR last_name LIKE 'B%'
GROUP BY LEFT(last_name, 1)
ORDER BY pavardes_pirma_raide;

-- 2. Count how many films each actor has appeared in.
-- Result: film count, actor's first name, and last name.
-- Return the top 10 actors who appeared in the most films.

SELECT 
    COUNT(fa.film_id) AS filmu_skaicius,
    a.first_name AS vardas,
    a.last_name AS pavarde
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY filmu_skaicius DESC
LIMIT 10;

-- 3. Determine the minimum, maximum, and average amount paid for a film.
-- Result: return only the minimum, maximum, and average amounts.

SELECT 
    MIN(amount) AS minimali_kaina,
    MAX(amount) AS maksimali_kaina,
    ROUND(AVG(amount), 2) AS vidutine_kaina
FROM payment;

-- 4. Count how many customers each store has.

SELECT 
    store_id AS parduotuve,
    COUNT(customer_id) AS klientu_skaicius
FROM customer
GROUP BY store_id
ORDER BY store_id;

-- 5. Count how many films belong to each genre.
-- Result: film count and genre name.
-- Sort the result by film count in descending order.

SELECT 
    COUNT(fc.film_id) AS filmu_skaicius,
    c.name AS zanro_pavadinimas
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.category_id, c.name
ORDER BY filmu_skaicius DESC;

-- 6. Find which film had the largest number of actors.
-- Result: film title and actor count.

select
count(fa.actor_id) as aktoriu_skaicius,
f.title as filmo_pavadinimas
from film f
join film_actor fa on f.film_id = fa.film_id
GROUP BY f.film_id, f.title
ORDER BY aktoriu_skaicius DESC
LIMIT 1;

-- 7. Return films and the actors who appeared in them.
-- Result: film title, actor first name, and actor last name.
-- Only include films where film_id is between 1 and 2.
-- Sort the results by film title, actor first name, and actor last name in ascending order.

SELECT 
    f.title AS filmo_pavadinimas,
    a.first_name AS aktoriaus_vardas,
    a.last_name AS aktoriaus_pavarde
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.film_id IN (1, 2)
ORDER BY 
    f.title ASC, 
    a.first_name ASC, 
    a.last_name ASC;

-- 8. Count how many films each actor has appeared in.
-- Result: film count, actor first name, and actor last name.
-- Sort the results by film count in descending order and by actor first name in ascending order.

SELECT 
    COUNT(fa.film_id) AS filmu_skaicius,
    a.first_name AS vardas,
    a.last_name AS pavarde
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY 
    filmu_skaicius DESC, 
    a.first_name ASC;

-- 9. Count how many cities start with the letters A, B, C, and D.
-- Result: city count and the first letter of the city name.

SELECT 
    COUNT(city_id) AS miestu_skaicius,
    LEFT(city, 1) AS pirma_raide
FROM city
WHERE 
    city LIKE 'A%' OR 
    city LIKE 'B%' OR 
    city LIKE 'C%' OR 
    city LIKE 'D%'
GROUP BY LEFT(city, 1)
ORDER BY pirma_raide;

-- 10. Calculate how much money each customer has paid for film rentals.
-- Result: customer first name, last name, address, district, and total amount paid.
-- Only include customers who have paid 170 or more in total.

select
c.first_name as vardas,
c.last_name as pavarde,
a.address as adresas,
a.district as apygarda,
sum(p.amount) as suma
from payment p
left join customer c on p.customer_id = c.customer_id
left join address a on c.address_id = a.address_id
group by c.customer_id
having suma >= 170
order by suma desc;

-- 11. Calculate how much money customers in each district have paid in total.
-- Result: district and total amount spent.
-- Only include districts that have spent more than 700 in total.
-- Sort the results by district in ascending order.

select 
sum(p.amount) as suma,
a.district as apygarda
from payment p
left join customer c on p.customer_id = c.customer_id
left join address a on c.address_id = a.address_id
group by apygarda
having suma >= 700
order by apygarda asc;

-- 12. Count how many films each actor has appeared in by film genre (category).
-- Result: film count, actor first name, actor last name, and film genre (category).
-- Sort the results by actor first name, actor last name, and film genre in ascending order.

select
a.first_name as vardas,
a.last_name as pavarde,
c.name as kategorija,
count(fa.film_id) as filmu_skaicius
from film_actor fa
left join actor a on fa.actor_id = a.actor_id -- vardas, pavarde  
left join film_category fc on fa.film_id = fc.film_id -- priėjimas prie category id
left join category c on fc.category_id = c.category_id -- istraukiu category_id
group by kategorija,a.actor_id
order by vardas, pavarde, kategorija asc;


-- 13. Count how many films contain the word "drama" in their film description.
-- The number of times the word appears is not important.
-- Result: only film count and film genre.
-- Only include genres that have 7 or more films containing the word "drama".
-- Use the description field from the film_text table.

select 
ft.description as aprasymas,
c.name as zanras,
count(fc.film_id) as filmu_skaicius
from film_category fc
left join category c on fc.category_id = c.category_id    -- išimsiu kategoriją
left join film_text ft on fc.film_id = ft.film_id
where lower(ft.description) like "%drama%"
group by zanras
having count(fc.film_id) >= 7;

-- 14. Count how many customers are in each country.
-- Result: customer count and country.
-- Sort the results by customer count in descending order.
-- Return only the top 5 countries with the most customers.

select
count(c.customer_id) as klientu_skaicius,
co.country as salis
from customer c
left join address a on c.address_id = a.address_id
left join city ct on ct.city_id = a.city_id
left join country co on co.country_id = ct.country_id
group by salis
order by klientu_skaicius desc
limit 5;

-- 15. Calculate the total amount paid by all customers in each store.
-- Result: store_id, store address, city, and country.

select
s.store_id as p_i,
a.address as adresas,
c.city as miestas,
co.country as salis,
sum(p.amount) as suma
from store s
left join staff st on s.store_id = st.store_id
left join payment p on st.staff_id = p.staff_id
left join address a on s.address_id = a.address_id
left join city c on c.city_id = a.city_id
left join country co on co.country_id = c.country_id
group by p_i;

-- alternative solution approach by using customer table

SELECT 
s.store_id, 
a.address, 
ci.city, 
co.country, 
FORMAT(SUM(p.amount), 2) as totalAmount 
FROM sakila.payment p
LEFT JOIN sakila.customer c on p.customer_id = c.customer_id
LEFT JOIN sakila.store s on c.store_id = s.store_id
LEFT JOIN sakila.address a on s.address_id = a.address_id
LEFT JOIN sakila.city ci on a.city_id = ci.city_id
LEFT JOIN sakila.country co on ci.country_id = co.country_id
GROUP BY s.store_id;


