create table sakila.students (name varchar(100), students_id int, sub_id int, primary key(students_id)), foreign key (sub_id) reference to sakila.subjects(subjects_id);

create table sakila.subjects(name varchar(100), subjects_id int, primary key(subjects_id)); 

Select * from sakila.actor where first_name="ED";

select * from sakila.actor order by first_name asc, last_name desc; # will get 


select * from sakila.city;
select * from sakila.country where country_id=101;

#joining tables
select city, country from sakila.city as C, sakila.country as CT where C.country_id = CT.country_id;

-- join using JOIN sintax
select city, country from sakila.city as C JOIN sakila.country as CT ON C.country_id = CT.country_id;

-- rt
select count(*) from sakila.city as C JOIN sakila.country as CT ON C.country_id = CT.country_id;

-- Agregation functiun, count based on a group by aplied to a column
select country, count(*) from sakila.city as C JOIN sakila.country as CT ON C.country_id = CT.country_id group by country;

-- Concat
Select concat(first_name," ", last_name) as full_name from sakila.actor;

-- Choose all the names of the actors.
Select first_name, last_name from sakila.actor;    

-- Write an SQL query that extracts all columns from the actor table, sorted by first_name in descending order
Select * from sakila.actor order by first_name desc;

-- Provide the FIRST NAMES AND LAST NAMES of the actors in one column (HINT: CONCAT())
select concat(first_name," ", last_name) as full_name from sakila.actor; 

-- Select all unique store numbers (store_id); from the  table customer
Select distinct(store_id) from sakila.customer;

-- Provide the customer's name (first_name) and email in one column table customer
select concat(first_name, " ", email) as name_email from sakila.customer;

-- In one column, give the names of the actors in lower case and name the column "Names of the actors" (HINT: LOWER())
select lower(first_name) as Names_of_the_actors from sakila.actor;

-- Which actors ’ first names are repeated most often and how many times? (Count(), Group by())
select first_name, count(*) as repeated_times from sakila.actor group by first_name order by repeated_times desc;

-- Which is the longest film in the table: film?
select * from sakila.film where length = ( select max( length  ) from sakila.film);

















