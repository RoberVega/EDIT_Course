# Simple select statement
select *
from EDIT_DB.GreaterManchesterCrime;

# Subset some columns
select Type, Outcome
from EDIT_DB.GreaterManchesterCrime;

# You can also use alias to rename columns
select Type as crime_type, Outcome as sentence
from EDIT_DB.GreaterManchesterCrime;

# These are comments
/* These are also more complex multi-line
comments */

# You can also use alias in table names
select crime_table.Type
from EDIT_DB.GreaterManchesterCrime as crime_table;