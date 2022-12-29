# Select with filters  where title = 'BULL SHAWSHANK'
select *
from sakila.film
where title = 'BULL SHAWSHANK';

# Different than clause
select *
from sakila.film
where title != 'BULL SHAWSHANK';

# Multiple filter statements can be passed
# with IN
select *
from sakila.film
where title IN ('BULL SHAWSHANK', 'AIRPORT POLLOCK');

# We can use OR for multiple causes
select *
from sakila.film
where title = 'BULL SHAWSHANK' OR rental_rate < 1.99;

# Comparison operators with numeric columns
select *
from sakila.film
where rental_rate < 1.99;

# Less than / equal
select *
from sakila.film
where rental_rate <= 1.99;

# Greater than
select *
from sakila.film
where rental_rate > 1.99;

# Greater than / equal to
select *
from sakila.film
where rental_rate >= 1.99;

