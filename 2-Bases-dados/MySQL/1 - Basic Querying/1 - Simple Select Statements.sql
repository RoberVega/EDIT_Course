# Um select simples:
select *
from EDIT_DB.GreaterManchesterCrime;

# Seleccionar algumas colunas:
select Type, Outcome
from EDIT_DB.GreaterManchesterCrime;

# Podemos também usar "alias" para seleccionar colunas com nomes
# mais apropriados:
select Type as crime_type, Outcome as sentence
from EDIT_DB.GreaterManchesterCrime;

# Podemos realizar comentários usando o símbolo #
/* E comentários
multi-linha! */

# Também podemos usar alias em tabelas
select crime_table.Type
from EDIT_DB.GreaterManchesterCrime as crime_table;