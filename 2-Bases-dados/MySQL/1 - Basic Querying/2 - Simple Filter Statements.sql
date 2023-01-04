# Seleccionar com filtros:
select *
from EDIT_DB.GreaterManchesterCrime
where Type = 'Public order';

# Clausula diferente de
select *
from EDIT_DB.GreaterManchesterCrime
where Type != 'Public order';

# Podemos passar multiplos filtros com
# a cláusula IN
select *
from EDIT_DB.GreaterManchesterCrime
where Type IN ('Other theft', 'Burglary','Theft from the person','Shoplifting');

# Podemos usar a condição ou para seleccionar uma clausula ou outra
select *
from EDIT_DB.GreaterManchesterCrime
where Type = 'Shoplifting' OR DATE(CrimeTS) < '2018-08-18';

# Operadores de comparação com colunas numéricas
select *
from EDIT_DB.GreaterManchesterCrime
where DATE(CrimeTS) < '2018-08-18';

# Menor ou igual
select *
from EDIT_DB.GreaterManchesterCrime
where DATE(CrimeTS) <= '2018-08-18';

# Maior que
select *
from EDIT_DB.GreaterManchesterCrime
where DATE(CrimeTS) > '2018-08-18';

# Maior que / igual a
select *
from EDIT_DB.GreaterManchesterCrime
where DATE(CrimeTS) >= '2018-08-18';

