CREATE DATABASE db_recursosrh;

USE db_recursosrh;

CREATE TABLE tb_colaboradores (
id BIGINT AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
datanascimento DATE,
departamento VARCHAR(50),
cargo VARCHAR(50) NOT NULL,
salario DECIMAL (10, 2) NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO tb_colaboradores (nome, datanascimento, departamento, cargo, salario) 
VALUES 
('Lara Silva', '1995-06-16', 'TI', 'Desenvolvedor', 3000.00),
('Maria Joaquina', '1985-08-20', 'Recursos Humanos', 'Assistente de RH', 1800.00),
('Juliano Henrico', '1993-11-12', 'Vendas', 'Vendedor', 1700.00),
('Ana Catarina', '1986-07-15', 'Financeiro', 'Analista Financeiro', 4000.00),
('Jorel Vieira', '1995-09-05', 'Marketing', 'Analista de Marketing', 3500.00);

SELECT * FROM tb_colaboradores;

SELECT * FROM tb_colaboradores WHERE salario > 2000.00;

SELECT * FROM tb_colaboradores WHERE salario < 2000.00;

UPDATE tb_colaboradores SET salario = 1900.00 WHERE id = 2;

SELECT * FROM tb_colaboradores;



