/* Outro tipo de dado comum é Date,
estes são os que nos ajudam a entender
eventos temporais e são cruciais para
registro e criação e atualização de banco de dados.
*/

ALTER TABLE EDIT_DB.GreaterManchesterCrime ADD COLUMN CrimeDate DATE
UPDATE EDIT_DB.GreaterManchesterCrime SET CrimeDate = DATE(CrimeTS) WHERE CrimeNumber > 0

describe EDIT_DB.GreaterManchesterCrime;

# Na tabela EDIT_DB.GreaterManchesterCrime temos a coluna CrimeTS,
# que é uma coluna timestamp e CrimeDate, que é uma coluna data.

select CrimeNumber, CrimeID, CrimeDate
from EDIT_DB.GreaterManchesterCrime;

# Também é comumente usado o tipo ano,
# que é apenas um ano.

# Uma das funções mais comuns que se pode usar
# com tipos de data é o datediff para encontrar a
# diferença entre duas datas.

# Isso retorna os dias de diferença resultantes entre
# duas datas.

select datediff("2020-09-01", "2020-10-01");

# Observe que estamos usando '' para fornecer datas ao SQL
# este é um dos raros casos em que você passa '' com algo
# outro que não seja strings.

# Se eu tentar fazer datediff em uma string pura, terei
# um NULL como retorno.

select datediff("A", "B");

# Se usar inteiros - também obterá um NULL
select datediff(150000, 1545222);"
