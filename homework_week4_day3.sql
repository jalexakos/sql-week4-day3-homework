-- Question 1 --
SELECT customer_id, first_name, last_name, ad.address_id
FROM customer AS cust
INNER JOIN address AS ad
ON cust.address_id = ad.address_id
WHERE district = 'Texas'; -- 5 customers

-- Question 2 --
SELECT first_name, last_name, pay.customer_id
FROM payment AS pay
LEFT JOIN customer AS cust
ON cust.customer_id = pay.customer_id
WHERE amount > 6.99; -- 1406 customers

-- Question 3 --
SELECT first_name, last_name, customer_id
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);

-- Question 4 --
SELECT ad.address_id, ci.city_id, cu.first_name, cu.last_name
FROM customer as cu
JOIN address AS ad
ON cu.address_id = ad.address_id
JOIN city as ci
ON ad.city_id = ci.city_id
JOIN country AS co
ON co.country_id = ci.country_id
WHERE country = 'Nepal'; -- There appears to be only one customer, Kevin Schuler 

-- Question 5 --
SELECT *
FROM staff
WHERE staff_id IN (
	SELECT staff_id
	FROM payment
	GROUP BY staff_id
	ORDER BY COUNT(payment_id) DESC
); -- Mike Hillyer, Staff_id 1 (I wanted to practice subqueries because they are less intuitive to me. I am not sure that this is right)

SELECT first_name, last_name, s.staff_id, COUNT(payment_id) AS pi
FROM staff AS s
JOIN payment AS pay
ON s.staff_id = pay.staff_id
GROUP BY s.staff_id; -- This return the same result, Mike Hillyer with a count of 7292 transactions (which I could not figure out how to get with a subquery).

-- Question 6 --
SELECT COUNT(film_id), rating
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;

-- Question 7 --
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY payment.customer_id
	HAVING COUNT(amount) = 1
);

-- Question 8 --
SELECT COUNT(rental_id)
FROM payment
WHERE amount = 0; -- 24 free rentals