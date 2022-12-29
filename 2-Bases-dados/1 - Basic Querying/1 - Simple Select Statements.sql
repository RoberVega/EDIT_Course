# Simple select statement
select *
from sakila.film;

# Subset some columns
select title, release_year
from sakila.film;

# You can also use alias to rename columns
select title as movie_title, release_year as year
from sakila.film;

# These are comments
/* These are also more complex multi-line
comments */

# You can also use alias in table names
select movie_table.title
from sakila.film as movie_table;