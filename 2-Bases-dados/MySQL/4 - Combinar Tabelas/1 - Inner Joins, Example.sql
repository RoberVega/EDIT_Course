/* 
Um das coisas mais comuns que fazemos em SQL é combinar tabelas.
O conceito de combinar tabelas é chamado de "join".
Há vários tipos de join que pode verificar neste recurso:
https://www.w3schools.com/sql/sql_join.asp
*/

# Vamos ver um INNER JOIN primeiro

# Vamos primeiro construir duas tabelas exemplo
CREATE TEMPORARY TABLE sandbox.customers(
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_name varchar(255) NOT NULL
    );
    
CREATE TEMPORARY TABLE sandbox.customer_country(
	customer_id INT PRIMARY KEY,
	customer_country varchar(255) NOT NULL
    );

insert into sandbox.customers (
	customer_name
) values ('John'), ('Adam'), ('Anne'), ('May');

insert into sandbox.customer_country (
	customer_id, customer_country
) values (1, 'USA'), (3, 'USA'), (4, 'UK'), (5, 'UK');

# Se eu quero perceber de que país é cada cliente, como posso
# combinar isso numa tabela?

# Vamos ver:
select cust.customer_id, cust.customer_name, country.customer_country
from sandbox.customers as cust
inner join sandbox.customer_country as country
on cust.customer_id = country.customer_id;

/*
Referenciamos a tabela da esquerda antes da palavra-chave
"inner join" e a tabela da direita depois da palavra-chave.

Na cláusula "on", inserimos a chave de união - pode ser uma única coluna ou múltiplas.
Inner joins combina apenas tudo que tem correspondência entre as duas tabelas.
Repare que "Adam" não está na saída da query. Porquê? Porque não temos a chave
"Adam" - neste caso customer_id = 2 - na tabela customer_country.
*/

