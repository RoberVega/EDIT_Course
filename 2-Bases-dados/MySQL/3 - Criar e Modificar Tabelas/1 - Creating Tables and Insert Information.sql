# Podemos criar bancos de dados e tabelas usando código ou a interface do usuário.

create database countries;

# Agora, vamos criar uma tabela dentro do banco de dados / esquema countries.~

create table countries.countries (
	country_id TINYINT AUTO_INCREMENT PRIMARY KEY,
    name varchar(56) NOT NULL,
    foundation_date DATE,
    population SMALLINT UNSIGNED
    );
    
# Vamos ver a nossa tabela vazia
select * from countries.countries;
    
/* Como podemos inserir dados nessa tabela?? 
Temos o comando INSERT INTO */

insert into countries.countries (
	name, foundation_date, population
) values ( 
	'Portugal', 
    '1143-10-05',
    10154934
    );
    
# O que acontece? Não podemos inserir essa linha porque a população
# não se encaixa no intervalo de valores aceites pelo SMALLINT!

# Vamos reconstruir os dados - vamos usar um comando para fazer delete
# do banco de dados.

drop database countries;

# Agora, vou criar a tabela novamente, mas com INT em vez de SMALLINT.

create database countries;
create table countries.countries (
	country_id TINYINT AUTO_INCREMENT PRIMARY KEY,
    name varchar(56) NOT NULL,
    foundation_date DATE,
    population INT UNSIGNED
    );
    
insert into countries.countries (
	name, foundation_date, population
) values ( 
	'Portugal', 
    '1143-10-05',
    10154934
    );
    
# Insert com sucesso!
# Vamos verificar a tabela agora
select * from countries.countries;

/* Posso introduzir dados para algunas colunas apenas - as únicas obrigatórias 
são chaves e NOT NULL*/

insert into countries.countries (
	name, population
) values ( 
	'France', 
    65476395
    );
    
# Vamos ver a tabela novamente
select * from countries.countries;

# Também podemos fazer multiplos inserts 
insert into countries.countries (
	name, population
) values ('Spain', 46780219),
('Canada', 38205830);

# Vamos ver a tabela novamente
select * from countries.countries;

# É importante respeitar as restrições das tabelas!

# Por exemplo, é possível introduzir população negativa?
insert into countries.countries (
	name, population
) values ('United Kingdom', -1000);

# Não! Porque colocamos a coluna como unsigned.
# O que acontece se passarmos texto?
insert into countries.countries (
	name, population
) values ('United Kingdom', "ABC");

# Também teremos um erro - "Incorrect Integer Value"!

# Vamos ver um exemplo de overflow em varchar
create table countries.codes (
	country_code varchar(3) NOT NULL
    );
    
insert into countries.codes (
	country_code
) values ('PRT');

# E se inserirmos algo com 4 letras?
insert into countries.codes (
	country_code
) values ('GERM');

# E se tentarmos inserir um decimal?
insert into countries.codes (
	country_code
) values (1.1);

# MySQL faz uma conversão implícita!
select * from countries.codes;

# Repare que as colunas não mudaram
describe countries.codes;

# Sempre verifique o tipo de dados
# e o comportamento que a tabela espera para cada coluna