SELECT *
FROM film;

SELECT *
FROM actor;

SELECT *
FROM film_actor;

-- MULTI-JOIN TABLE --
SELECT title, release_year, actor.actor_id, first_name, last_name
FROM film
FULL JOIN film_actor
ON film.film_id = film_actor.film_id
FULL JOIN actor
ON film_actor.actor_id = actor.actor_id
WHERE first_name LIKE 'J__%';

-- USING ALIASES to save time -- 
SELECT title, release_year, a.actor_id, first_name, last_name
FROM film AS f
FULL JOIN film_actor AS fa
ON f.film_id = fa.film_id
FULL JOIN actor AS a
ON fa.actor_id = a.actor_id
WHERE first_name LIKE 'J__%';