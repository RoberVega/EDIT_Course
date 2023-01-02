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
we have the following text columns:
- text
- varchar
but these are not unique, we could also have:
- enum
- set

Each data type describes what data the column can contain
- text columns hold free text up until 65535 bytes
- VARCHAR - similar to text and can be used as index.
- set and enum are similar to each other and allows you
to use pre-defined values to fill the column. Set allows multiple 
values, enum allows only 1.
*/

# There are certain functions only used by strings:
select Location, concat(Location, Location) as calc
from EDIT_DB.GreaterManchesterCrime;

# What if we try with a integer column?
# We end up doing an "implicit" conversion
# SQL automatically converts the column CrimeNumber to
# text before doing the calculation
select CrimeNumber, concat(CrimeNumber, CrimeNumber) as calc
from EDIT_DB.GreaterManchesterCrime;

# Let's just create a temporary table to see the type
# of the calc column - we'll study how to create tables next

CREATE TEMPORARY TABLE EDIT_DB.temp_table as
select Location, concat(CrimeNumber, CrimeNumber) as calc
from EDIT_DB.GreaterManchesterCrime;

# As you can check the calc is a varchar(22) column
# 22 because that was the maximum length created by the 
# concat(CrimeNumber, CrimeNumber) expression
describe EDIT_DB.temp_table;

