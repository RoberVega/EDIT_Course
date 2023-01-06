# Criar uma nova tabela chamada estudantes 
# e adicionar alguns estudantes:

create table sandbox.students (
	student_id integer,
    student_full_name varchar(40) not null,
    birth_date date,
    favorite_class varchar(40)
    );
    
insert into sandbox.students (
	student_id, student_full_name, birth_date, favorite_class
    ) values (1, 'Joe Doe', '2000-04-03', 'History'),
             (2, 'Mary Doe', '2000-06-02', 'Mathematics'),
             (3, 'John Smith', '2000-02-10', 'English'),
             (4, 'Anne Smith', '2000-01-02', 'Mathematics'),
             (5, 'May John', '2000-06-06', 'History');

# Atualizando informações em tabelas
# Vamos imaginar que temos informações sobre estudantes, 
# mas acabamos por errar a matéria favorita de May John - ela gosta de Matemática!

# Como podemos atualizar esta tabela sem recriá-la ou excluir a linha?

# Temos a combinação UPDATE -> SET -> WHERE

# Precisamos desativar o modo de atualização segura:
SET SQL_SAFE_UPDATES = 0;

update sandbox.students
set favorite_class = "Mathematics"
where student_id = 5;

# Vamos agora ver a nossa tabela
select * from sandbox.students;

# Acabamos de mudar a matéria favorita de May John!

# Tudo o que aprendemos com o where se aplica aqui, por exemplo, usando múltiplas condições.

# Imaginando que gostaríamos de alterar a favorite_class de múltiplos estudantes ao mesmo tempo.
update sandbox.students
set favorite_class = "Arts"
where student_full_name = 'Joe Doe' or student_full_name = 'John Smith';

select * from sandbox.students;

# Claro, a atualização desses valores também está restrita.
# No nosso caso, não podemos definir o nome do estudante como null 
# devido às propriedades da tabela.

update sandbox.students
set student_full_name = NULL
where student_id = 1;

# Também podemos actualizar várias tabelas ao mesmo tempo:
update sandbox.students
set student_full_name = "John", favorite_class = "Mathematics"
where student_id = 1;

select * from sandbox.students;

# Tenha muita atenção em ter uma cláusula where
# se não a utilizar pode acabar por actualizar a tabela inteira.
update sandbox.students
set student_full_name = "John";

select * from sandbox.students;