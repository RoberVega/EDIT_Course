# As cláusulas da consulta na seleção geralmente
# compreendem a seguinte ordem
# SELECT
# FROM
# WHERE
# GROUP BY
# HAVING
# ORDER BY

/* Já cobrimos SELECT, FROM E WHERE
Vamos cobrir GROUP BY - GROUP BY permite agrupar dados
por alguma chave. O exemplo mais simples é aplicar uma média em uma coluna
agrupada por outra coluna - vamos ver um exemplo!*/

ALTER TABLE EDIT_DB.GreaterManchesterCrime ADD CriminalNumber Int;
UPDATE EDIT_DB.GreaterManchesterCrime SET CriminalNumber = FLOOR(RAND()*(4-1)+1) WHERE CrimeNumber > 1;

select * 
from EDIT_DB.GreaterManchesterCrime;

select Type, avg(CriminalNumber) as avg_number_of_criminals
from EDIT_DB.GreaterManchesterCrime
group by Type;
 
/* Repare como temos os valores agregados pela outra
coluna - que também pode ser chamada de chave em alguns contextos

Having pode complementar a informação do group by
filtrando com base em informações criadas

é similar a WHERE mas se aplica DEPOIS da
informação agrupada */

# Repare no seguinte - isso gerará um erro:

select Type, avg(CriminalNumber) as avg_number_of_criminals
from EDIT_DB.GreaterManchesterCrime
where avg_number_of_criminals>2
group by Type;

/* Como a coluna avg_rental_rate não existe na tabela original
para filtrar algo criado durante a consulta, precisamos usar having */

select Type, avg(CriminalNumber) as avg_number_of_criminals
from EDIT_DB.GreaterManchesterCrime
group by Type
having avg_number_of_criminals>2;

# Isso também acontece com colunas criadas com alias
select Type, CriminalNumber as number_of_criminals
from EDIT_DB.GreaterManchesterCrime
where number_of_criminals > 2;


/* Order by é outra cláusula que podemos usar
depois de todas as outras cláusulas, esta cláusula ordena
a tabela resultante pelo que quisermos*/

select Type, CriminalNumber, LSOA 
from EDIT_DB.GreaterManchesterCrime
where CriminalNumber > 2
order by LSOA;

# também podemos ordenar de forma decrescente com a palavra-chave desc
select Type, CriminalNumber, LSOA 
from EDIT_DB.GreaterManchesterCrime
where CriminalNumber > 2
order by LSOA desc;

