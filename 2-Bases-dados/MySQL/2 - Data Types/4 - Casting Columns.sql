/* Uma operação comum é converter colunas de
um tipo para outro.

Por exemplo, números que são armazenados como strings
e que desejamos converter para um inteiro.

Para converter de colunas de texto, podemos
usar CONVERT ou CAST.
*/

select "123";

select CONVERT("2017",SIGNED INTEGER);

select CAST("2017" AS SIGNED INTEGER);

# Converter um numérico para caracter

select CONVERT(2017, CHAR);

select CAST(2017 AS CHAR);

# Alguns tipos não podem ser convertidos - como varchar,
# bigint, etc.

# Nesses casos, temos de alterar fisicamente uma tabela para fazer isso, como
# veremos a seguir.

# Os únicos tipos suportados para conversão são:
# BINARY, CHAR, DATE, DATETIME, TIME,DECIMAL, INTEGER