# Outra coisa interessante que podemos fazer é
# podermos fazer instruções insert into usando dados
# de outras tabelas.
# Nesta parte, vamos também aprender o comando distinct

# Vamos começar a olhar para a tabela staff

select * from EDIT_DB.Staff
order by name;

# Como esperado, temos nomes repetidos de policias.
# Imagine que gostaríamos de ter
# apenas os valores distintos desta coluna - podemos
# usar uma nova cláusula no select - select distinct

SELECT DISTINCT name
from EDIT_DB.Staff
order by name;

# Esta função funciona de maneira similar ao operador UNION
# sem UNION ALL - ele colapsa todos os primeiros_nomes iguais
# em uma única linha
# Agora, temos uma maneira fácil de inserir isto em uma tabela?
# Sim, temos!
# Vamos criar uma tabela EDIT_DB.first_names

create table EDIT_DB.first_names (
	first_name varchar(20)
    );
    
# First Names table está vazia
select * from EDIT_DB.first_names;

insert into EDIT_DB.first_names (
	first_name
    ) SELECT DISTINCT name
			  from EDIT_DB.Staff
			  order by name;

# Vamos agora ver a tabela:
select * from EDIT_DB.first_names;

# Podemos fazer isto com mais colunas! 
# Vamos criar uma tabela que contém
# burglaries

create table EDIT_DB.burglaries (
	CrimeID varchar(20),
    Location text,
    LSOA text,
    CrimeDate date,
    PoliceOfficerID INT
    )


# Podemos filtrar bulgraries usando um filtro
select * from 
EDIT_DB.GreaterManchesterCrime 
where Type = 'Burglary';


insert into EDIT_DB.burglaries (
	CrimeID, Location, LSOA, CrimeDate, PoliceOfficerID
    ) select CrimeID, Location, LSOA, CrimeDate, PoliceOfficerID from 
	EDIT_DB.GreaterManchesterCrime 
	where Type = 'Burglary';
    
# Agora temos todas os burglaries nesta tabela!
select * from EDIT_DB.burglaries;

# Este uso de select into é provavelmente mais relevante do que
# o uso de VALUES. Embora os VALUES sejam mais fáceis de entender,
# há mais casos de uso em que podemos usar dados de
# outras tabelas para inserir em novas tabelas.
