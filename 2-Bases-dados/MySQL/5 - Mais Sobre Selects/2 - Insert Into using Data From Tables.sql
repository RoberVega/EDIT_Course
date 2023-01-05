# Another cool thing we can do is that
# we can do insert into statements using data 
# from other tables.

# In this bit, we will also learn the distinct command

# Let's start by looking at the actor table

select * from EDIT_DB.Staff
order by name;

# As expected, we have repeated names from Police officers.
# Imagine that we would like to have 
# only the distinct values from this column - we can
# use a new clause in the select - select distinct

SELECT DISTINCT name
from EDIT_DB.Staff
order by name;

# This functions similarly to the UNION operator
# without UNION ALL - it collapses all equal first_names
# into a single row

# Now - do we have an easy way to insert this into a table? 

# Yes we do! 

# Let's create a sakila.first_names table 

create table EDIT_DB.first_names (
	first_name varchar(20)
    );
    
# First Names table is now empty 
select * from EDIT_DB.first_names;

# We can use the query as instead of the values!
insert into EDIT_DB.first_names (
	first_name
    ) SELECT DISTINCT name
			  from EDIT_DB.Staff
			  order by name;

# Now let's check our table: 
select * from EDIT_DB.first_names;

# We can do this with more columns, of course! 
# Let's create a table that will contain only the 
# burglaries

create table EDIT_DB.burglaries (
	CrimeID varchar(20),
    Location text,
    LSOA text,
    CrimeDate date,
    PoliceOfficerID INT
    )


# We can filter burglaries using a where clause
select * from 
EDIT_DB.GreaterManchesterCrime 
where Type = 'Burglary';


insert into EDIT_DB.burglaries (
	CrimeID, Location, LSOA, CrimeDate, PoliceOfficerID
    ) select CrimeID, Location, LSOA, CrimeDate, PoliceOfficerID from 
	EDIT_DB.GreaterManchesterCrime 
	where Type = 'Burglary';
    
# Now we have all our burglaries in this table!
select * from EDIT_DB.burglaries;

# This usage of select into is probably more relevant than
# the values one. Although the VALUES are easier to understand,
# there are more use cases where you want to use data from
# other tables to input in new tables.
