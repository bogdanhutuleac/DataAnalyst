-- 1. Provide the payment amount from payment table where the payment amount is greater than 2
SELECT amount FROM payment WHERE amount > 2;

-- 2. Provide film titles and the replacement_cost where the rating is PG and the replacement cost is less than 10
SELECT title, replacement_cost FROM film
WHERE rating = "PG" AND replacement_cost < 10;

-- 3. Calculate the average rental price (rental_rate) for the movies in each rating, provide the answer with only 1 decimal place. Use table film. 
SELECT rating, ROUND(AVG(rental_rate),1) AS avg_rental_price FROM film
GROUP BY rating ;

-- 4. Print the names of all the customers (first_name) and count the length of each name (how many letters there are in the name) next to the names column. Use the customer table. 
SELECT first_name, length(first_name) AS name_length FROM customer;

-- 5. Locate the position of the first "e" in the description of each movie. Use table film. 
SELECT title, description, instr(description, "e") AS e_postion FROM film;

-- 6.   Add up the total length of the films for each rating. Print only ratings with a total movie length longer than 22000. Use the film table.
SELECT rating, SUM(length) AS rating_length FROM film
GROUP BY rating
HAVING rating_length > 22000;

-- 7. Print the descriptions of all the movies, a second column with the length of the description, and then a third column where its the description again but replacing all the letters "a" with "OO". 
-- replace all the "a", even the uppercase ones
SELECT description, length(description) AS length, replace(lower(description), "a", "OO") AS replace_a FROM film;
-- replace just lowercase "a"
SELECT description, length(description) AS length, replace(description, "a", "OO") AS replace_a FROM film;

-- 8. Write an SQL query that would classify movies according to their ratings into the following categories: 
-- If the rating is "PG" or "G" then "PG_G"
-- If the rating is NC-17 or PG-13 then “NC-17-PG-13”
-- Assign all other ratings to "Not important"
-- Display categories in a column called Rating_Group
-- Use table film. 

SELECT rating,
CASE 
	WHEN rating = "PG" OR rating = "G" THEN "PG_G"
    WHEN rating = "NC-17" OR rating = "PG-13" THEN "NC-17-PG-13"
    ELSE "Not important"
    END AS Rating_Group
FROM film;


-- 9. Add up the rental duration (rental_duration) for each movie category (use the category name, not just the category id). 
-- Print only those categories with a rental_duration greater than 300. Use the tables film, film_category, category. 
SELECT * FROM film; -- rental_duration
SELECT * FROM film_category;
SELECT * FROM category; -- category name

SELECT c.name, SUM(f.rental_duration) AS sum_rental_duration
FROM category AS c
JOIN film_category AS fc ON fc.category_id = c.category_id
JOIN film AS f ON fc.film_id = f.film_id
GROUP BY c.name
HAVING sum_rental_duration > 300;

-- 10. Provide the names (first_name) and surnames (last_name) of the customers who rented the movie "AGENT TRUMAN". Use tables for customer, rental, inventory, film. 
SELECT * FROM film WHERE title = "AGENT TRUMAN"; -- film_id = 6
SELECT * FROM inventory WHERE film_id = 6; -- film_id, inventory_id = (26, 27, 28, 29, 30, 31)
SELECT * FROM rental WHERE inventory_id IN (26, 27, 28, 29, 30, 31); -- customer_id, inventory_id (21 rows)
SELECT * FROM customer; -- customer_id, first_name and last_name





SELECT c.first_name, c.last_name, f.title
FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
JOIN customer AS c ON r.customer_id = c.customer_id
WHERE title = "AGENT TRUMAN";

-- 11. Use `JOIN` to display the first and last names, as well as the address, of each staff member. Use the tables `staff` and ‘address'
SELECT * FROM staff; -- address_id
SELECT * FROM address;

SELECT s.first_name, s.last_name, a.address
FROM staff AS s
JOIN address AS a ON s.address_id = a.address_id;
 
 -- 12. Use `JOIN` to display the total amount rung up by each staff member in August of 2005. Use tables `staff` and `payment`.
SELECT * FROM staff;
SELECT * FROM payment; -- staff_id

SELECT s.first_name, s.last_name, SUM(p.amount) AS amount_rung
FROM staff AS s
JOIN payment AS p
WHERE year(p.payment_date) = 2005 AND month(p.payment_date) = 8
GROUP BY s.staff_id;

-- 13. List each film and the number of actors who are listed for that film. Use tables `film_actor` and `film`. Use inner join.
SELECT * FROM film;

-- Will return the result we need but there are only 997 rows instead of 1000 so there are missing 3 film_id from film_actor
SELECT title, count(fa.actor_id) AS actors_per_film
FROM film AS f
INNER JOIN film_actor AS fa on f.film_id = fa.film_id
GROUP BY f.title;

-- Finding missing film_id from film_actor
WITH cte AS
(SELECT f.film_id
FROM film AS f
INNER JOIN film_actor AS fa on f.film_id = fa.film_id
GROUP BY f.film_id)
SELECT f.film_id from film as f
WHERE f.film_id not in ( SELECT c.film_id from cte as c); -- missing ID films (257, 323, 803)

-- 14. How many copies of the film `Hunchback Impossible` exist in the inventory system?
-- using substring
SELECT COUNT(*) AS Copies FROM inventory WHERE film_id = (SELECT film_id FROM film WHERE title = "Hunchback Impossible");

-- Using JOIN
SELECT f.title, COUNT(i.inventory_id) AS copies
FROM inventory AS i
JOIN film AS f ON f.film_id = i.film_id
GROUP BY f.title
HAVING title = "Hunchback Impossible";

-- 15. Using the tables ‘payment’ and ‘customer’ and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.first_name, c.last_name, SUM(p.amount) AS paid_per_customer
FROM payment as p
JOIN customer as c ON p.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name;

-- 16. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. Use joins to retrieve this information.
SELECT * FROM country; -- country_id
SELECT * FROM city; -- country_id, city_id
SELECT * FROM address; -- city_id, address_id
SELECT * FROM customer; -- customer_id, address_id

SELECT c.first_name, c.last_name, email
FROM country AS co
JOIN city AS ci ON co.country_id = ci.country_id
JOIN address AS a ON ci.city_id = a.city_id
JOIN customer AS c ON a.address_id = c.address_id
WHERE co.country = "Canada";

-- 17. Write a query to display how much business, in dollars, each store brought in.
SELECT * FROM store; -- store_id
SELECT * FROM payment; -- customer_id
SELECT * FROM customer; -- store_id

SELECT s.store_id, SUM(p.amount) AS amount_per_store
FROM store AS s
JOIN customer AS c ON s.store_id = c.store_id
JOIN payment AS p ON c.customer_id = p.customer_id
GROUP BY s.store_id;


