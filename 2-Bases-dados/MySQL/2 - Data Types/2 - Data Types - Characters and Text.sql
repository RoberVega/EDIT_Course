/* Um conceito central em SQL são os Tipos de Dados.
Os Tipos de Dados definem como os dados são armazenados na memória e
também definem quais tipos de funções você pode aplicar a uma coluna.
Comecemos por estar os tipos de dados numéricos. 
Há na verdade mais tipos do que os que vamos abordar, mas vamos passar pelos mais relevantes.

Repare que na tabela EDIT_DB.GreaterManchesterCrime temos as seguintes colunas de texto:

- text
- varchar
mas esses não são únicos, também podemos ter:
- enum
- set

Cada tipo de dado descreve os dados que a coluna pode conter.
As colunas de texto armazenam texto livre até 65535 bytes
VARCHAR - similar ao texto e pode ser usado como índice.
set e enum são similares entre si e permitem que você use valores pré-definidos 
para preencher a coluna. Set permite múltiplos valores, enum permite apenas 1.
*/

# Algumas funções só podem ser usados em campos string (texto):
select Location, concat(Location, Location) as calc
from EDIT_DB.GreaterManchesterCrime;

# E se tentarmos com uma coluna integer?
# Acabamos por fazer uma conversão "implícita".
# O SQL converte automaticamente a coluna CrimeNumber para
# texto antes de realizar o cálculo.

select CrimeNumber, concat(CrimeNumber, CrimeNumber) as calc
from EDIT_DB.GreaterManchesterCrime;

# Vamos criar uma tabela temporária para ver o tipo da coluna calc
# Vamos estudar como criar tabelas de seguida.

CREATE TEMPORARY TABLE EDIT_DB.temp_table as
select Location, concat(CrimeNumber, CrimeNumber) as calc
from EDIT_DB.GreaterManchesterCrime;

# Como pode verificar, calc é uma coluna varchar (22).
# 22 porque esse era o comprimento máximo 
# criado pela expressão concat(CrimeNumber, CrimeNumber)."
describe EDIT_DB.temp_table;

