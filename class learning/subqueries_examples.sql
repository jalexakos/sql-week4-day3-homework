SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;

SELECT *
FROM customer;

-- Subquery
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);

SELECT *
FROM film
WHERE language_id IN (
	SELECT language_id
	FROM language
	WHERE name = 'English'
);

SELECT *
FROM city
WHERE country_id IN (
	SELECT country_id
	FROM country
	WHERE country LIKE 'A__%'
); -- All these cities have country_ids where the country name begins with A and is at least 2 characters long

SELECT film_id, title, length
FROM film
WHERE film_id IN (
	SELECT film_id
	FROM customer
	WHERE customer_id > 2
);