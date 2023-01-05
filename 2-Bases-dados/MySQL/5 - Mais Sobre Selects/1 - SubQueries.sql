# Subqueries são um conceito realmente poderoso em
# SQL - elas permitem que você componha várias instruções complexas:

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

	
# Vamos começar por fazer um join em EDIT_DB.GreaterManchesterCrime
# com EDIT_DB.Staff para obter o nome do policia
# responsável pelo caso, em vez do ID do policia.

select a.CrimeID, a.PoliceOfficerID, b.Name, b.Surname
from EDIT_DB.GreaterManchesterCrime as a 
inner join 
EDIT_DB.Staff as b 
on a.PoliceOfficerID = b.PoliceOfficerID;

# isto vai-me retornar o officer id, name and surname 
# para cada crime.
# Posso tratar tudo isto como uma tabela, tal como fizemos até aqui

# Como? Envolvendo esta expressão em parentesis e usando um alias!

select my_query.* from 
(select a.PoliceOfficerID, b.Name, b.Surname
from EDIT_DB.GreaterManchesterCrime as a 
inner join 
EDIT_DB.Staff as b 
on a.PoliceOfficerID = b.PoliceOfficerID) as my_query
;

# Posso até fazer um group by em cima desta query:
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

# Vamos ver outro exemplo, com um duplo group by:

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

# Sempre refira às chaves primárias da tabela
# quando tiver dúvidas. 
# Neste caso, seria fácil entender o que fazer vendo a estrutura
# da tabela e verificando que a chave primária é um rental_id que identifica
# a linha.