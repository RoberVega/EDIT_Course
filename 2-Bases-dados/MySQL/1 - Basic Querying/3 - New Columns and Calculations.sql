/* One of the most common things we can do in SQL 
is create new columns - These columns can be totally
new or created using existing columns*/

# Let's check using the actor table
# Creating a person_role with the value 'actor' 

select *, 'Police Officer' as Responsible
from EDIT_DB.GreaterManchesterCrime;

# We will learn more advanced stuff using if else
# later

# Let's now use an expression to build a new column
# based on existing ones

# Notice how we are using a function here for the first
# time
select Location, LSOA, concat(Location, LSOA) as full_address
from EDIT_DB.GreaterManchesterCrime;

# Something's odd! We can still add a comma and a space between the first and last name
select Location, LSOA, concat(Location, ', ', LSOA) as full_address
from EDIT_DB.GreaterManchesterCrime;

# We can also create new columns based on mathematical
# expressions
# We add an extra numerical column corresponding to a Crime number
ALTER TABLE EDIT_DB.GreaterManchesterCrime ADD COLUMN CrimeNumber INT UNIQUE NOT NULL AUTO_INCREMENT FIRST;
select * from EDIT_DB.GreaterManchesterCrime;

  
select * , CrimeNumber * 100
from EDIT_DB.GreaterManchesterCrime;

# Most mathematical operations work the same way
# as they do in the real world
select *, (CrimeNumber * 100)+10
from EDIT_DB.GreaterManchesterCrime;

# * is for multiplication
# / is for division
# + is for adding
# - is for subtracting

# Example of division:
select *, (CrimeNumber/100)+10
from EDIT_DB.GreaterManchesterCrime;

# There are also other commonly used expressions
# such as logarithms or exponentials
# that we can use

# Notice that if I don't use a from I can evaluate
# the expression in a single return
select log(10);
