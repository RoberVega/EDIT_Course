# SubQueries are a really powerful concept in
# SQL - they enable you to compound on several instructions
# Let's check!
ALTER TABLE EDIT_DB.GreaterManchesterCrime ADD COLUMN PoliceOfficerID VARCHAR(3)
UPDATE EDIT_DB.GreaterManchesterCrime SET PoliceOfficerID = floor(rand()*100) WHERE CrimeNumber > 0

select * from EDIT_DB.GreaterManchesterCrime;

CREATE TABLE IF NOT EXISTS EDIT_DB.Staff(
	PoliceOfficerID TINYINT AUTO_INCREMENT PRIMARY KEY,
    Name varchar(15),
    Surname varchar(20)
);
INSERT INTO EDIT_DB.Staff (Name, Surname)
VALUES (
ELT(0.5 + RAND() * 6, 'Mike', 'Laurel', 'George', 'Joe', 'Serena', 'Kim'),
ELT(0.5 + RAND() * 6, 'Schmidt', 'Brown', 'Johnson', 'Garcia', 'Miller', 'Jones')
);

	
# Let's start with a by doing a join on EDIT_DB.GreaterManchesterCrime 
# with EDIT_DB.Staff to obtain the name of the Police Officer
# in charge of the Case, instead of the officer's id

select a.CrimeID, a.PoliceOfficerID, b.Name, b.Surname
from EDIT_DB.GreaterManchesterCrime as a 
inner join 
EDIT_DB.Staff as b 
on a.PoliceOfficerID = b.PoliceOfficerID;

# This will give me the officer id, name and surname 
# for each crime.
# I can treat this as a table and do everything we've learned
# so far with tables 

# How? By enclosing our instruction in parenthesis and giving
# it an alias!


select my_query.* from 
(select a.PoliceOfficerID, b.Name, b.Surname
from EDIT_DB.GreaterManchesterCrime as a 
inner join 
EDIT_DB.Staff as b 
on a.PoliceOfficerID = b.PoliceOfficerID) as my_query
;

# I can do a group by on top of this!
select my_query.Name, my_query.Surname, avg(CriminalNumber) as avg_numb_criminals 
from 
(select a.CriminalNumber, a.PoliceOfficerID, b.Name, b.Surname
from EDIT_DB.GreaterManchesterCrime as a 
inner join 
EDIT_DB.Staff as b 
on a.PoliceOfficerID = b.PoliceOfficerID) as my_query
group by my_query.Name, my_query.Surname
order by my_query.Name, my_query.Surname
;

# Let's see another example - with a double group by:

select my_query.Name, my_query.Surname, sum(CriminalNumber) as total_numb_criminals 
from 
(select a.CriminalNumber, a.PoliceOfficerID, b.Name, b.Surname
from EDIT_DB.GreaterManchesterCrime as a 
inner join 
EDIT_DB.Staff as b 
on a.PoliceOfficerID = b.PoliceOfficerID) as my_query
group by my_query.Name, my_query.Surname
order by my_query.Name, my_query.Surname
;

# Always refer to the primary keys of the table 
# when you have these questions. In this case, this would
# be easy to understand just by visiting the structure
# of the table - as the primary key is a rental_id that identifies
# the row.