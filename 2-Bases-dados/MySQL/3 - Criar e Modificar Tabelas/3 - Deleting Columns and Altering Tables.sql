/* Depois de definir e escrever uma tabela, 
podemos modificá-la com declarações simples baseadas no comando ALTER TABLE.*/

# Vamos ver como apagar uma coluna

ALTER TABLE countries.countries 
	DROP COLUMN foundation_date;
    
/* Repare que a coluna desapareceu do statement SQL abaixo
*/
select * from countries.countries;

# Como podemos apagar coluns, também podemos
# mudar o seu data type 

# Let's see what happens when we change 
# population to SMALLINT
ALTER TABLE countries.countries 
	MODIFY population SMALLINT;
    
# Não podemos! Porquê? Porque já temos valores na coluna
# que ultrapassam o range

ALTER TABLE countries.countries 
	MODIFY population BIGINT;
    
# Agora conseguimos - vamos ver a metadata da tabela:
DESCRIBE countries.countries;

# Também podemos convertê-la de volta
ALTER TABLE countries.countries 
	MODIFY population INT;
    
# Vamos ver o impacto de mudar colunas de caracter:
ALTER TABLE countries.countries
	MODIFY name varchar(4);
    
# Mesmo problema! Estamos a tentar alterar uma coluna
# com dados que não fazem fit à nova coluna

# Também podemos renomear colunas
ALTER TABLE countries.countries 
	CHANGE COLUMN name country_name
    varchar(60);
    
select * from countries.countries;

# Também podemos renomear tabelas
ALTER TABLE countries.countries
	rename to countries.country_summary;
