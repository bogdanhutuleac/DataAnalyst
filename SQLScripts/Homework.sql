
# Create the dept table to wich will get the student table foreign refer to
Create table test.dept (dept_id int, dept_name varchar(100), primary key (dept_id));

#Create the table student and foreign key conditioned to dept table trough dept_id
Create table test.student(id int,first_name varchar(100),dept_id int, PRIMARY KEY (id), foreign key(dept_id) references test.dept(dept_id)) ;

# test data insert
insert into test.dept(dept_id, dept_name) values(1, "Python");
insert into test.student(id, first_name, dept_id) values(1, "Nicholas", 1);

#check result
Select * from test.student;

DELETE FROM test.dept WHERE dept_id is null;
Select * from test.dept;

# Choose the names of all the actors; table - actor
Select first_name, last_name from sakila.actor;

# Sort the actors by last name; table - actor(will sort them alphabetically)
Select * from sakila.actor ORDER BY last_name;

# Select all unique store numbers (store_id); from the  table customer
Select DISTINCT store_id from sakila.customer ;

# get the count of distinct values from store_id
SELECT COUNT(DISTINCT store_id) FROM sakila.customer;

# Provide the customer's name (first_name) and email in one column; table customer
# 1 using CONCAT
SELECT CONCAT( first_name, " ", email ) AS first_name_email FROM sakila.customer;
# 2 using CONCAT_WS (as a difference you can define separator)
SELECT CONCAT_WS( " ---- ", first_name, email ) AS first_name_email FROM sakila.customer;

# Calculate the total length of each movie rating; table film
Select rating, sum(length) AS rating_length from sakila.film GROUP BY rating ORDER BY rating_length DESC;
