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
ALTER TABLE EDIT_DB.GreaterManchesterCrime ADD CriminalNumber Int;
UPDATE EDIT_DB.GreaterManchesterCrime SET CriminalNumber = FLOOR(RAND()*(4-1)+1) WHERE CrimeNumber > 1;

select * 
from EDIT_DB.GreaterManchesterCrime;

select Type, avg(CriminalNumber) as avg_number_of_criminals
from EDIT_DB.GreaterManchesterCrime
group by Type;
 
/* Notice how we have the values aggregated by the other
column - that may also called key in some contexts */

/* Having can complement the group by information
by filtering based on information created
- it is similar to WHERE but applies AFTER the 
grouped information */

# Notice the following - this will yield in an error:
select Type, avg(CriminalNumber) as avg_number_of_criminals
from EDIT_DB.GreaterManchesterCrime
where avg_number_of_criminals>2
group by Type;

/* Because the column avg_rental_rate does not exist in the original table
To filter something created during the query, we need to use having */

select Type, avg(CriminalNumber) as avg_number_of_criminals
from EDIT_DB.GreaterManchesterCrime
group by Type
having avg_number_of_criminals>2;

# This also happens with columns created with alias
select Type, CriminalNumber as number_of_criminals
from EDIT_DB.GreaterManchesterCrime
where number_of_criminals > 2;


/* Order by is another clause that we can use 
after all the other clauses, it sorts 
the resulting table by what we want
*/

select Type, CriminalNumber, LSOA 
from EDIT_DB.GreaterManchesterCrime
where CriminalNumber > 2
order by LSOA;

# You can also order descendingly with the keyword desc
select Type, CriminalNumber, LSOA 
from EDIT_DB.GreaterManchesterCrime
where CriminalNumber > 2
order by LSOA desc;

