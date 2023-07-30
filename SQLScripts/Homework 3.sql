-- Pull the length of the shortest film from table  film.
select * from sakila.film order by length limit 1;
select min(length) from sakila.film;
SELECT * FROM sakila.film where length = (SELECT MIN(length) from sakila.film);

-- Extract all the information about the films with a rental period of 5, order the results by the price of the film (rental_rate) in ascending order from table film.
select * from sakila.film where rental_duration = 5 order by rental_rate asc;

-- Write a query where you would sum rental_rate grouped by film rating.  Show only when the rental_rate amount is greater than 600  hint: “having”
select rating, sum(rental_rate) as sum_rental from sakila.film group by rating having sum_rental > 600;

-- Pull the films ACE GOLDFINGER, ADAPTATION HOLES, AFFAIR PREJUDICE and their length
select title, length from sakila.film where title in ("ACE GOLDFINGER", "ADAPTATION HOLES","AFFAIR PREJUDICE");

-- Calculate the number of films that have trailers in the special features and the price (rental_rate) is 2.99
select * from sakila.film where special_features like ("Trailers%") AND rental_rate = 2.99;