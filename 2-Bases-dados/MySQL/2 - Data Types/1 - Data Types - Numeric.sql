/* One Central concept in SQL are Data Types
- Data Types define how the data is stored in memory
- Data types also define which types of functions you 
can apply to a column
Let's start by studying numeric data types. There
are actually more types than the ones we will be approaching
but we will go through the most relevant ones.
*/

# We can obtain the data types of a specific table using 
# the command DESCRIBE
DESCRIBE EDIT_DB.GreaterManchesterCrime;

/* Notice that in the EDIT_DB.GreaterManchesterCrime
we have only the numeric int types. There are other ones like:
- smallint
- tinyint
- decimal

We also have a date type columns called timestamp and year
and text columns (that we will discuss next).

Each data type describes what data the column can contain
- int columns only contain integer numbers
- decimals can contain float numbers.

These data types are fairly general although they 
may have other names in other SQL implementations

With numeric types we can perform numerical calculations
*/

select CriminalNumber, CriminalNumber*4 as calc
from EDIT_DB.GreaterManchesterCrime;

select * from EDIT_DB.GreaterManchesterCrime;

# We can also do this with datetime columns
# Although the result is a bit meaningless
select CrimeTS, CrimeTS*4 as calc
from EDIT_DB.GreaterManchesterCrime;

# We can't do this with text columns! the result 
# will be the same for the entire row 
select Location, Location*4 as calc
from EDIT_DB.GreaterManchesterCrime;

# We can't also apply mathematical functions
# to character columns as that throws a NULL result
select Location, Log(Location) as calc
from EDIT_DB.GreaterManchesterCrime;


/* A recap on numeric data types:
- bit (binary or boolean value)
- tinyint: whole numbers from 0 to 255
- smallint: -32,768 to 32,767
- int: -2,147,483,648 to 2,147,483,647
- bigint
- decimal/numeric - they are quite equivalent
- float - less "precise" than the ones above, but faster