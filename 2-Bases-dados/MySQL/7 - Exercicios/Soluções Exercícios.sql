# Exercício 1: Crie uma tabela chamada "produtos" com as seguintes colunas: id, nome, preço e quantidade. Use os tipos de dados mais apropriados

# Solução:
CREATE TABLE produtos (
  id INTEGER PRIMARY KEY,
  nome VARCHAR(255),
  preco FLOAT,
  quantidade INTEGER
);

# Exercício 2: Insira os seguintes dados na tabela produtos: (1, 'caderno', 2.5, 10), (2, 'caneta', 0.5, 50), (3, 'lapis', 1, 30).

# Solução:
INSERT INTO produtos (id, nome, preco, quantidade)
VALUES (1, 'caderno', 2.5, 10), (2, 'caneta', 0.5, 50), (3, 'lapis', 1, 30);

# Exercício 3: Selecione o nome e o preço de todos os produtos com quantidade maior que 10.

# Solução:
SELECT nome, preco FROM produtos WHERE quantidade > 10;

# Exercício 4: Atualize o preço do produto com id = 2 para 0.7.

# Solução:
UPDATE produtos SET preco = 0.7 WHERE id = 2;


# Exercício 5: Remova o produto com id = 3.

# Solução:
DELETE FROM produtos WHERE id = 3;

# Exercício 6: Exercício: Crie uma tabela chamada "clientes" com as seguintes colunas: id, nome, endereco e telefone.

# Solução:
CREATE TABLE clientes (
  id INTEGER PRIMARY KEY,
  nome VARCHAR(255),
  endereco VARCHAR(255),
  telefone VARCHAR(255)
);

# Exercício 7: Insira os seguintes dados na tabela clientes: (1, 'João da Silva', 'Rua das Flores, 123', '11-2233-4444'), (2, 'Maria Santos', 'Avenida dos Pássaros, 456', '11-5566-7777'), (3, 'Carlos Ferreira', 'Rua dos Coqueiros, 789', '11-8899-0000').

# Solução: 
INSERT INTO clientes (id, nome, endereco, telefone)
VALUES (1, 'João da Silva', 'Rua das Flores, 123', '11-2233-4444'), (2, 'Maria Santos', 'Avenida dos Pássaros, 456', '11-5566-7777'), (3, 'Carlos Ferreira', 'Rua dos Coqueiros, 789', '11-8899-0000');

# Exercício 8: Selecione todos os clientes com nome começando com a letra 'M'.

# Solução:
SELECT * FROM clientes WHERE nome LIKE 'M%';

# Nos próximos exercícios vamos usar a estrutura de tabelas abaixo:

CREATE TABLE customers_1 (
  customer_id INTEGER PRIMARY KEY,
  customer_name VARCHAR(255) NOT NULL,
  contact_last_name VARCHAR(255) NOT NULL,
  contact_first_name VARCHAR(255) NOT NULL,
  phone VARCHAR(255) NOT NULL,
  address_line_1 VARCHAR(255) NOT NULL,
  address_line_2 VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  state VARCHAR(255) NOT NULL,
  postal_code VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  salesrep_employee_id INTEGER NOT NULL,
  credit_limit DECIMAL(10,2) NOT NULL
);

INSERT INTO customers_1 (customer_id, customer_name, contact_last_name, contact_first_name, phone, address_line_1, address_line_2, city, state, postal_code, country, salesrep_employee_id, credit_limit) VALUES
  (1, 'Tech Aid', 'Smith', 'John', '123-456-7890', '123 Main St', 'Suite 100', 'New York', 'NY', '12345', 'USA', 1, 10000.00),
  (2, 'Acme Co', 'Johnson', 'Jane', '123-456-7891', '456 Market St', 'Suite 200', 'San Francisco', 'CA', '54321', 'USA', 2, 20000.00),
  (3, 'Super Mart', 'Williams', 'Bob', '123-456-7892', '789 Park Ave', 'Suite 300', 'Chicago', 'IL', '67890', 'USA', 3, 30000.00);

CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  order_date DATE NOT NULL,
  product_code VARCHAR(255) NOT NULL,
  quantity INTEGER NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  discount DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers_1(customer_id),
  employee_id INTEGER
);

INSERT INTO orders (order_id, customer_id, order_date, product_code, quantity, price, discount, employee_id) VALUES
  (1, 1, '2022-01-01', 'p1', 2, 100.00, 0.10, 1),
  (2, 1, '2022-01-02', 'p2', 3, 200.00, 0.20, 3),
  (3, 2, '2022-01-03', 'p3', 4, 300.00, 0.30, 3),
  (4, 2, '2022-01-04', 'p4', 5, 400.00, 0.40, 3),
  (5, 3, '2022-01-05', 'p5', 6, 500.00, 0.50, 2);

CREATE TABLE employees (
  employee_id INTEGER PRIMARY KEY,
  last_name VARCHAR(255) NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  extension VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  office_code INTEGER NOT NULL,
  reports_to INTEGER NOT NULL,
  job_title VARCHAR(255) NOT NULL
);

INSERT INTO employees (employee_id, last_name, first_name, extension, email, office_code, reports_to, job_title) VALUES
  (1, 'Doe', 'John', '123', 'john.doe@company.com', 1, 2, 'Sales Rep'),
  (2, 'Smith', 'Jane', '456', 'jane.smith@company.com', 1, 3, 'Manager'),
  (3, 'Johnson', 'Bob', '789', 'bob.johnson@company.com', 1, 4, 'President');

CREATE TABLE offices (
  office_code INTEGER PRIMARY KEY,
  city VARCHAR(255) NOT NULL,
  phone VARCHAR(255) NOT NULL,
  address_line_1 VARCHAR(255) NOT NULL,
  address_line_2 VARCHAR(255) NOT NULL,
  state VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  postal_code VARCHAR(255) NOT NULL,
  territory VARCHAR(255) NOT NULL
);

INSERT INTO offices (office_code, city, phone, address_line_1, address_line_2, state, country, postal_code, territory) VALUES
  (1, 'New York', '123-456-7890', '123 Main St', 'Suite 100', 'NY', 'USA', '12345', 'East'),
  (2, 'San Francisco', '123-456-7891', '456 Market St', 'Suite 200', 'CA', 'USA', '54321', 'West'),
  (3, 'Chicago', '123-456-7892', '789 Park Ave', 'Suite 300', 'IL', 'USA', '67890', 'Central');

CREATE TABLE products (
  product_code VARCHAR(255) PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL,
  product_line VARCHAR(255) NOT NULL,
  product_scale VARCHAR(255) NOT NULL,
  product_vendor VARCHAR(255) NOT NULL,
  product_description TEXT NOT NULL,
  quantity_in_stock INTEGER NOT NULL,
  buy_price DECIMAL(10,2) NOT NULL,
  MSRP DECIMAL(10,2) NOT NULL,
  category_id INTEGER
);

INSERT INTO products (product_code, product_name, product_line, product_scale, product_vendor, product_description, quantity_in_stock, buy_price, MSRP, category_id) VALUES
  ('p1', 'Product 1', 'Line 1', 'Scale 1', 'Vendor 1', 'Description 1', 10, 50.00, 100.00, 1),
  ('p2', 'Product 2', 'Line 2', 'Scale 2', 'Vendor 2', 'Description 2', 20, 60.00, 120.00, 2),
  ('p3', 'Product 3', 'Line 3', 'Scale 3', 'Vendor 3', 'Description 3', 30, 70.00, 140.00, 2),
  ('p4', 'Product 4', 'Line 4', 'Scale 4', 'Vendor 4', 'Description 4', 40, 80.00, 160.00, 1),
  ('p5', 'Product 5', 'Line 5', 'Scale 5', 'Vendor 5', 'Description 5', 50, 90.00, 180.00, 2);

CREATE TABLE categories (
  category_id INTEGER PRIMARY KEY,
  category_name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL
);

INSERT INTO categories (category_id, category_name, description) VALUES
  (1, 'Category 1', 'Description 1'),
  (2, 'Category 2', 'Description 2'),
  (3, 'Category 3', 'Description 3'),
  (4, 'Category 4', 'Description 4'),
  (5, 'Category 5', 'Description 5');


# Exercício 9: Escreva uma query para recuperar todos os pedidos e as informações correspondentes do cliente para esses pedidos. Vai precisar de usar um INNER JOIN para juntar as tabelas de pedidos e clientes na coluna customer_id.
# Tabelas: orders, customers_1

# Solução:
SELECT * FROM orders INNER JOIN customers_1 ON orders.customer_id = customers_1.customer_id;

# Exercício 10: Escreva uma query para recuperar todos os produtos e os nomes de categorias correspondentes. Vai precisar de usar um INNER JOIN para juntar as tabelas de produtos e categorias na coluna category_id.
# Tabelas: products, categories

# Solução:
SELECT products.*, categories.category_name FROM products INNER JOIN categories ON products.category_id = categories.category_id;

# Exercício 11: Escreva uma query para recuperar todos os pedidos e as informações correspondentes do funcionário para esses pedidos. Vai precisar de usar um INNER JOIN para juntar as tabelas de pedidos e funcionários na coluna employee_id. Além disso, você precisará usar um LEFT JOIN para juntar as tabelas de funcionários e escritórios na coluna office_code.
# Tabelas: orders, employees, offices

# Solução:
SELECT orders.*, employees.*, offices.* FROM orders INNER JOIN employees ON orders.employee_id = employees.employee_id LEFT JOIN offices ON employees.office_code = offices.office_code;

# Exercício 12: Escreva uma consulta para recuperar todos os clientes e as informações correspondentes do representante de vendas. Você precisará usar um INNER JOIN para juntar as tabelas de clientes e funcionários na coluna salesrep_employee_id. Além disso, você precisará usar um LEFT JOIN para juntar as tabelas de funcionários e escritórios na coluna office_code.

# Solução: 
SELECT customers_1.*, employees.*, offices.* FROM customers_1 INNER JOIN employees ON customers_1.salesrep_employee_id = employees.employee_id LEFT JOIN offices ON employees.office_code = offices.office_code;