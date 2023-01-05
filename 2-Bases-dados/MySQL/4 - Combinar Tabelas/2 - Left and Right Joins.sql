# Agora vamos verificar um LEFT JOIN

# Usando as duas tabelas temporárias que vimos há pouco:
CREATE TEMPORARY TABLE sandbox.customers_right_left(
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_name varchar(255) NOT NULL
    );
    
CREATE TEMPORARY TABLE sandbox.customer_country_right_left(
	customer_id INT PRIMARY KEY,
	customer_country varchar(255) NOT NULL
    );

insert into sandbox.customers_right_left (
	customer_name
) values ('John'), ('Adam'), ('Anne'), ('May'), ('Susan'), ('Joe');

insert into sandbox.customer_country_right_left (
	customer_id, customer_country
) values (1, 'USA'), (3, 'USA'), (4, 'UK'), (5, 'UK'), (7, 'UK');


# Confirmando:
select cust.customer_id, cust.customer_name, country.customer_country
from sandbox.customers_right_left as cust
left join sandbox.customer_country_right_left as country
on cust.customer_id = country.customer_id;

# E com o right join?
select cust.customer_id, cust.customer_name, country.customer_country
from sandbox.customers_right_left as cust
right join sandbox.customer_country_right_left as country
on cust.customer_id = country.customer_id;

# Repare como quando não temos uma "chave" correspondente na tabela oposta
# o resto dos campos são nulos.
# Se eu usar o ID vindo da "tabela principal", será possível
# vê-lo agora nesta consulta - embora o nome seja NULL porque
# não sabemos o nome deste cliente.

select country.customer_id, cust.customer_name, country.customer_country
from sandbox.customers_right_left as cust
right join sandbox.customer_country_right_left as country
on cust.customer_id = country.customer_id;