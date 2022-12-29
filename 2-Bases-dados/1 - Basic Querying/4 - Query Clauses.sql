# Query Clauses in Selects mostly 
# comprise of the following order

# SELECT
# FROM 
# WHERE
# GROUP BY 
# HAVING
# ORDER BY

/* We've already covered SELECT, FROM AND WHERE
 Let's cover GROUP BY - GROUP BY enables you to group data
 by some key. The simpler example is to apply a mean across a column
 grouped by some other column - let's see one example!
 */
 
 select rating, avg(rental_rate) as avg_rental_rate, avg(length) as avg_length
 from sakila.film
 group by rating;
 
/* Notice how we have the values aggregated by the other
column - that may also called key in some contexts */

/* Having can complement the group by information
by filtering based on information created
- it is similar to WHERE but applies AFTER the 
grouped information */

# Notice the following - this will yield in an error:
select rating, avg(rental_rate) as avg_rental_rate
from sakila.film
where avg_rental_rate>3
group by rating;

/* Because the column avg_rental_rate does not exist in the original table
To filter something created during the query, we need to use having */

select rating, avg(rental_rate) as avg_rental_rate
from sakila.film
group by rating
having avg_rental_rate>3;

# This also happens with columns created with alias
select rating, rental_rate as rental_rate_1
from sakila.film
where rental_rate_1 > 3;

select rating, rental_rate as rental_rate_1
from sakila.film
having rental_rate_1 > 3;

/* Order by is another clause that we can use 
after all the other clauses, it sorts 
the resulting table by what we want
*/

select title, description, length 
from sakila.film 
where length > 100
order by length;

# You can also order descendingly with the keyword desc
select title, description, length 
from sakila.film 
where length > 100
order by length desc;

