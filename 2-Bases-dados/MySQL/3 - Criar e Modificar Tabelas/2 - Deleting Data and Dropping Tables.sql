/* Assim como podemos criar e inserir dados em tabelas,
também podemos excluir dados de tabelas e excluir tabelas inteiras.*/

select * 
from countries.countries;

# Vamos apagar o registo com o nome 'Canada'
delete from countries.countries
where name = 'Canada';

/*  Note que o mysql está em modo seguro, impedindo-nos
de excluir a linha porque não estamos a usar a chave
para excluir - nas preferências
podemos remover essa opção*/

/* Depois de alterar, podemos remover o registo*/

# Vamos ver a nossa tabela agora
select * 
from countries.countries;

# Como podemos apagar umat abela inteira?

drop table countries.countries;

# O objecto SQL já não existe, vamos confirmar
select * from countries.countries;