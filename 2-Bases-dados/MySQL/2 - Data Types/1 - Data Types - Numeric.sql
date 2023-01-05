/*
"Um conceito central em SQL são os Tipos de Dados.
Os Tipos de Dados definem como os dados são armazenados na memória e 
também definem quais tipos de funções que se podem aplicar a uma coluna.
Comecemos por estudar os tipos de dados numéricos - existem mais tipos de dados 
que vamos abordar, mas vamos passar pelos mais relevantes.

Podemos obter os tipos de dados de uma tabela específica usando o comando DESCRIBE.
*/ 

DESCRIBE EDIT_DB.GreaterManchesterCrime;


/*Repare que na tabela EDIT_DB.GreaterManchesterCrime temos apenas os tipos numéricos int. 

Há outros tipos como:

smallint
tinyint
decimal

Também temos colunas do tipo date chamadas timestamp e year, e colunas de texto (que discutiremos a seguir).

Cada tipo de dado descreve os dados que a coluna pode conter.

As colunas int só contêm números inteiros
Decimais podem conter números com casas decimais.
Esses tipos de dados são bastante gerais, embora possam ter outros nomes em outras implementações SQL.

Com os tipos numéricos, podemos realizar cálculos numéricos."
*/

select CriminalNumber, CriminalNumber*4 as calc
from EDIT_DB.GreaterManchesterCrime;

select * from EDIT_DB.GreaterManchesterCrime;

# Também podemos fazer isso com colunas datetime 
# embora o resultado seja um pouco sem sentido

select CrimeTS, CrimeTS*4 as calc
from EDIT_DB.GreaterManchesterCrime;

# Não podemos fazer isso com colunas de texto! 
# O resultado será o mesmo para toda a linha

select Location, Location*4 as calc
from EDIT_DB.GreaterManchesterCrime;

# Também não podemos aplicar funções matemáticas a 
# colunas de caracteres, pois isso gera um resultado NULL.

select Location, Log(Location) as calc
from EDIT_DB.GreaterManchesterCrime;


/* Um resumo dos tipos de dados:
- bit (binary or boolean value)
- tinyint: inteiros de 0 até 255
- smallint: -32,768 até 32,767
- int: -2,147,483,648 até 2,147,483,647
- bigint
- decimal/numeric - são equivalentes
- float - menos precisos que os descritos acima, mas mais rápidos
de calcular. */