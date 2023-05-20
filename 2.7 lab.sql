Lab | SQL Join (Part I)
In this lab, you will be using the Sakila database of movie rentals.

Instructions
#How many films are there for each of the categories in the category table. Use appropriate join to write this query. works

USE SAKILA;
SELECT c.name as category_name, count(fc.film_id) as number_of_films
from category c
join film_category fc
using (category_id)
group by category_name; 


#this was just to practice and we changed the order of how we wanted it to come out. If we wanna know the least number of films per category. works  
SELECT c.name as category_name, count(fc.film_id) as number
from category c
join film_category fc
using (category_id)
group by c.name
order by number; #add "desc" if we wanted to change the order from highest to lowest

#Display the total amount rung up by each staff member in August of 2005. Including staff name. works
select staff.first_name as name, sum(payment.amount) as rung_up
from staff
join payment
using (staff_id)
where date(payment.payment_date) like '2005-08-%'
group by staff.first_name; 
 
#Which actor has appeared in the most films?  I had problems joining with the actor table for the first_name. Works
select actor_id, count(film_id)
from film_actor
group by actor_id
order by count(film_id) desc
limit 1;

#Most active customer (the customer that has rented the most number of films). Same problem. works
select customer_id, count(rental_id)
from rental
group by customer_id
order by count(rental_id) desc
limit 1;

#Display the first and last names, as well as the address, of each staff member. works

SELECT f.first_name, f.last_name, a.address 
from sakila.staff f
join sakila.address a
ON a.address_id = f.address_id;

#List each film and the number of actors who are listed for that film.
SELECT film_id

#Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.customer_id, c.last_name, sum(p.amount)
from sakila.customer c
join sakila.payment p
on c.customer_id=p.customer_id
order by c.last_name desc;

#List number of films per category. works
SELECT name as category_name, count(film_id) 
from category
join film_category
using (category_id)
group by category_name;  

