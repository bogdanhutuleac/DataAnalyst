-- Having clouse, and group by need to be before, and you can not use group by and where in the same phrase, but needs to be having 
select country, count(*) from sakila.city as C JOIN sakila.country as CT ON C.country_id = CT.country_id 
group by country 
having count(*) > 2 AND country like "c%"; -- like c% it means it's what it starts with
-- https://dev.mysql.com/doc/refman/8.0/en/string-functions.html

select country, count(*) from sakila.city as C JOIN sakila.country as CT ON C.country_id = CT.country_id 
group by country 
having count(*) > 26 OR country like "ch%"; 

-- NOT - the opposite
select country, count(*) from sakila.city as C JOIN sakila.country as CT ON C.country_id = CT.country_id 
group by country 
having count(*) > 26 OR NOT country like "ch%"; 

-- BETWEEN

select country, count(*) as city_count from sakila.city as C JOIN sakila.country as CT ON C.country_id = CT.country_id 
group by country 
having city_count between 26 AND 30 AND NOT country like "ch%"; 

-- IN
select * from sakila.inventory where film_id IN (2,3,4,5 );

SELECT * FROM sakila.actor WHERE first_name NOT in ("ED", "JHONNY") limit 5;

select 1 from sakila.actor;









