/* Another common data type is Dates,
these are the ones that help us to understand 
temporal events and they are crucial for 
logging and database creation and updating.
*/
ALTER TABLE EDIT_DB.GreaterManchesterCrime ADD COLUMN CrimeDate DATE
UPDATE EDIT_DB.GreaterManchesterCrime SET CrimeDate = DATE(CrimeTS) WHERE CrimeNumber > 0

describe EDIT_DB.GreaterManchesterCrime;

# In the EDIT_DB.GreaterManchesterCrime we have the CrimeTS, 
# which is a timestamp column and CrimeDate, which is a date column

select CrimeNumber, CrimeID, CrimeDate
from EDIT_DB.GreaterManchesterCrime;

# Commonly used is also the year types,
# which is just a year.

# One of the most common functions that one can use
# with date types is the the datediff to find the 
# difference between two dates

# This returns the resulting days of difference between
# two dates

select datediff("2020-09-01", "2020-10-01");

# Notice that we are using '' to give dates to SQL
# this is one of the rare cases where you pass '' with something
# other than strings

# If I try to do datediff on a pure string, I'll 
# have a NULL as a return

select datediff("A", "B");

# If you use integers - you will also get a NULL
select datediff(150000, 1545222);
