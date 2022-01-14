
#1
USE sakila;

-- a.
SELECT *
FROM actor;

-- b.
SELECT last_name
FROM actor;

-- c.
SELECT film_id, title, release_year
FROM film;


#2a.
SELECT DISTINCT last_name
FROM actor;

-- b.
SELECT DISTINCT postal_code
FROM address;

SELECT DISTINCT rating
FROM film;


#3a.
SELECT title, description, rating, length
FROM film
WHERE length > 180;

-- b.
SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date > '2005-05-27'
ORDER BY payment_date;

-- c.
SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date LIKE '2005-05-27%';

-- d.
SELECT *
FROM customer
WHERE last_name LIKE 's%' AND first_name LIKE '%n';

-- e.
SELECT *
FROM customer
WHERE active = '0' OR last_name LIKE 'M%';

-- f. ******
SELECT *
FROM category AS c;
WHERE category_id > 4 AND c.name LIKE ('C%', 'S%', 'T%');





