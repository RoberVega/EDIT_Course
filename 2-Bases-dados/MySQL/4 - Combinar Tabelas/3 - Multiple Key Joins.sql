/*
Outra coisa comum em código SQL é ter
joins por duas colunas. 

Isso é extremamente
útil quando temos chaves compostas (mais de uma coluna)
Vamos ver um exemplo:

*/

CREATE TEMPORARY TABLE sandbox.customer_month(
	customer_id INT,
    month INT,
	customer_name varchar(255) NOT NULL,
    PRIMARY KEY (customer_id, month)
    );
    
CREATE TEMPORARY TABLE sandbox.customer_balance(
	customer_id INT,
	month INT,
    balance numeric(10,2),
    PRIMARY KEY (customer_id, month)
    );

insert into sandbox.customer_month (
	customer_id, month, customer_name
) values (1, 201903, 'John'), (1, 201904, 'John'), (1, 201905, 'John'), 
(2, 201903, 'May'), (2, 201904, 'May'), (2, 201905, 'May'), (2, 201906, 'May');

insert into sandbox.customer_balance (
	customer_id, month, balance
) values (1, 201903, 10.00), (1, 201904, 15.00),
 (2, 201903, 1524.00), (2, 201904, 225.00), (3, 201905, 360.00);

# devemos apenas fazer o join pelo ID do cliente?
# Verificando:

select a.customer_id, a.customer_name, b.month, b.balance
from sandbox.customer_month as a
inner join sandbox.customer_balance as b
on a.customer_id = b.customer_id;

# Porque temos tanto registos?
# Porque produzimos duplicados!

# Dupplicados são um dos erros mais comuns
# que iniciantes cometem ao fazer queries
# em sql
# Às vezes queremos fazer duplicados de propósito
# por exemplo, se tivéssemos apenas um único customer_id
# na tabela customer_month. como temos várias linhas
# para o mesmo cliente, essas serão duplicadas porque
# cada linha terá 2 correspondências com a tabela correta para customer_id = 1
# e três vezes para customer_id = 2

# Um exemplo:
select customer_id 
from sandbox.customer_month;

# customer ID_1 está repetido 3 vezes
# customer ID_2 is repetido 4 vezes
# na customer_month

# Na tabela da direito temos dois registos: customer_id 1 and 2:
select customer_id from 
sandbox.customer_balance;

# O resultado será a multiplicação destas "chaves" 
# 3 * 2, 6 registos para customer id 1
# 4 * 2, 8 registos para customer id 2
select a.customer_id, b.month, b.balance
from sandbox.customer_month as a
inner join sandbox.customer_balance as b
on a.customer_id = b.customer_id;

# Como resolver isso? As chaves primárias de nossa tabela
# são Customer ID + Month, então podemos usar um join de múltiplas colunas!

select a.customer_id, a.customer_name, b.month, b.balance
from sandbox.customer_month as a
inner join sandbox.customer_balance as b
on a.customer_id = b.customer_id and
a.month = b.month;

# Repare que agora temos o inner join correto. Como só
# temos dois saldos para março e abril na tabela de saldos
# esses são os únicos que foram mantidos na tabela unida sem mais linhas duplicadas, 
# pois cada chave de join é única (par Customer_Id + Month).

# Às vezes você pode querer produzir duplicados de propósito - imaginando
# que tinhamos algo assim:

CREATE TEMPORARY TABLE sandbox.unique_customer(
	customer_id INT,
    PRIMARY KEY (customer_id)
    );
    
insert into sandbox.unique_customer (
	customer_id
) values (1), (2), (3);    
    
    
select * from sandbox.unique_customer;

# Como temos IDs de clientes únicos na tabela da esquerda
# podemos querer obter o saldo para diferentes meses
# neste caso, podemos fazer um join apenas com o ID do cliente
# pois os meses gerarão uma linha por cada mês de saldo.

select a.customer_id, b.month, b.balance
from sandbox.unique_customer as a
inner join sandbox.customer_balance as b
on a.customer_id = b.customer_id;

