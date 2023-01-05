/* Um das coisas mais comuns que podemos fazer no SQL
é criar novas colunas - Essas colunas podem ser totalmente
novas ou criadas usando colunas existentes*/

# Vamos ver usando a tabela de atores
# criando uma person_role com o valor 'Police Officer' 

select *, 'Police Officer' as Responsible
from EDIT_DB.GreaterManchesterCrime;

# Vamos aprender coisas mais avançadas usando if else
# mais tarde

# Vamos agora usar uma expressão para criar uma nova coluna
# baseada em colunas existentes
# Observe como estamos a usar uma função aqui pela primeira
# vez

select Location, LSOA, concat(Location, LSOA) as full_address
from EDIT_DB.GreaterManchesterCrime;

# Ainda podemos adicionar uma vírgula e 
# um espaço entre o primeiro e o último nome

select Location, LSOA, concat(Location, ', ', LSOA) as full_address
from EDIT_DB.GreaterManchesterCrime;

# Também podemos criar novas colunas com base em expressões matemáticas
# Adicionamos uma coluna numérica adicional correspondente a um número de crimes

ALTER TABLE EDIT_DB.GreaterManchesterCrime ADD COLUMN CrimeNumber INT UNIQUE NOT NULL AUTO_INCREMENT FIRST;
select * from EDIT_DB.GreaterManchesterCrime;

select * , CrimeNumber * 100
from EDIT_DB.GreaterManchesterCrime;

# A maioria das operações matemáticas funciona da mesma forma
# como eles funcionam no mundo real

select *, (CrimeNumber * 100)+10
from EDIT_DB.GreaterManchesterCrime;

# * : multiplicação
# / : divisão
# + : somar
# - : subtrair

# Exemplo de divisão:
select *, (CrimeNumber/100)+10
from EDIT_DB.GreaterManchesterCrime;

# Também existem outras expressões comumente usadas
# como logaritmos ou exponenciais
# que podemos usar

# Repare que se eu não usar um from, posso avaliar
# a expressão em um único retorno
select log(10);
