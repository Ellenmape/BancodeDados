CREATE DATABASE db_quitanda;
USE db_quitanda;

--  criar tabela no banco de dados que será usado
CREATE TABLE tb_produtos (
id BIGINT AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
quantidade INT,
datavalidade DATE,
preco DECIMAL (6, 2) NOT NULL,
PRIMARY KEY (id)
);

SELECT * FROM tb_produtos;

-- colocando dados na tabele
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) VALUES 
("tomate",100, "2023-12-15", 8.00),
("maçã",20, "2023-12-15", 5.00),
("laranja",50, "2023-12-15", 10.00),
("banana",200, "2023-12-15", 12.00),
("uva",1200, "2023-12-15", 30.00),
("pêra",500, "2023-12-15", 2.99);

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT,
descricao VARCHAR(255) NOT NULL,
PRIMARY KEY(id)
);

INSERT INTO tb_categorias (descricao) VALUES 
("Frutas"),
("Verduras"),
("Legumes"),
("Temperos"),
("Ovos"),
("Outros");

SELECT * FROM tb_categorias;

ALTER TABLE tb_produtos ADD categoriaid BIGINT;
SELECT * FROM tb_produtos;

ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias
FOREIGN KEY (categoriaid) REFERENCES tb_categorias(id);

UPDATE tb_produtos SET categoriaid = 3 WHERE id = 1;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 2;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 3;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 4;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 5;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 6;

SELECT * FROM tb_produtos;

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Batata doce", 2000, "2022-03-09", 10.00, 3);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Alface", 300, "2022-03-10", 7.00, 2);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Cebola", 1020, "2022-03-08", 5.00, 3);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Ovo Branco", 1000, "2022-03-07", 15.00, 5);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Agrião", 1500, "2022-03-06", 3.00, 2);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Cenoura", 1800, "2022-03-09", 3.50, 3);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Pimenta", 1100, "2022-03-15", 10.00, 4);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Alecrim", 130, "2022-03-10", 5.00, 4);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Manga", 200, "2022-03-07", 5.49, 1);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Couve", 100, "2022-03-12", 1.50, 2);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Rabanete", 1200, "2022-03-15", 13.00, 3);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Grapefruit", 3000, "2022-03-13", 50.00, 1);

INSERT INTO tb_produtos (nome, quantidade, preco)
VALUES("Sacola Cinza", 1118, 0.50);

INSERT INTO tb_produtos (nome, quantidade, preco)
VALUES("Sacola Verde", 1118, 0.50);

SELECT * FROM tb_produtos;
-- ordenar em ordem decrescente // ASC ordem crescente
SELECT * FROM tb_produtos ORDER BY preco DESC;

-- calcula média dos preços
SELECT avg(preco) MEDIA FROM tb_produtos;

-- seleciona dentro da tabela produtos que possuem ra no nome
SELECT * FROM tb_produtos WHERE nome LIKE "%ra%";

-- seleciona dentro da tabela produtos que possuem ra, com preco  menor que 10 e em ordem crescente
SELECT * FROM tb_produtos WHERE nome LIKE "%ra%" AND preco < 10 ORDER BY preco ASC;

-- exibe os dados solicitados comparando as duas tabelas para não exibi-las duplicado
-- retorna apenas os registros que têm correspondência em ambas as tabelas
-- retorna o que está em comum das tabelas
SELECT nome, preco, quantidade, tb_categorias.descricao
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoriaid = tb_categorias.id;

--  retorna todos os registros da tabela à esquerda, mesmo que não haja correspondência na tabela à direita.
-- retorna a tabela inteira
SELECT nome, preco, quantidade, tb_categorias.descricao
FROM tb_produtos LEFT JOIN tb_categorias
ON tb_produtos.categoriaid = tb_categorias.id;

-- retorna todos as categorias, mesmo os que não tem produto
SELECT nome, preco, quantidade, tb_categorias.descricao
FROM tb_produtos RIGHT JOIN tb_categorias
ON tb_produtos.categoriaid = tb_categorias.id;

-- calculando a média dos preços dos produtos para cada categoria
SELECT tb_categorias.descricao, AVG(Preco) Preco_Medio
FROM tb_produtos INNER JOIN tb_categorias
ON tb_categorias.id = tb_produtos.CategoriaID
GROUP BY tb_categorias.descricao;