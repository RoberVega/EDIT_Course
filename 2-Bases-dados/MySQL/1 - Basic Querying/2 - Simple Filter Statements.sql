# Select with filters  where title = 'BULL SHAWSHANK'
select *
from EDIT_DB.GreaterManchesterCrime
where Type = 'Public order';

# Different than clause
select *
from EDIT_DB.GreaterManchesterCrime
where Type != 'Public order';

# Multiple filter statements can be passed
# with IN
select *
from EDIT_DB.GreaterManchesterCrime
where Type IN ('Other theft', 'Burglary','Theft from the person','Shoplifting');

# We can use OR for multiple causes
select *
from EDIT_DB.GreaterManchesterCrime
where Type = 'Shoplifting' OR DATE(CrimeTS) < '2018-08-18';

# Comparison operators with numeric columns
select *
from EDIT_DB.GreaterManchesterCrime
where DATE(CrimeTS) < '2018-08-18';

# Less than / equal
select *
from EDIT_DB.GreaterManchesterCrime
where DATE(CrimeTS) <= '2018-08-18';

# Greater than
select *
from EDIT_DB.GreaterManchesterCrime
where DATE(CrimeTS) > '2018-08-18';

# Greater than / equal to
select *
from EDIT_DB.GreaterManchesterCrime
where DATE(CrimeTS) >= '2018-08-18';

