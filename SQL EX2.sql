CREATE DATABASE db_lojaversatil;

USE db_lojaversatil;

CREATE TABLE tb_produtos (
id BIGINT AUTO_INCREMENT,
produto VARCHAR(50) NOT NULL,
preco DECIMAL (6, 2) NOT NULL,
estoque INT,
tamanho VARCHAR(10),
cor VARCHAR(50) NOT NULL,
PRIMARY KEY (id)
);

SELECT * FROM tb_produtos;

INSERT INTO tb_produtos (produto, preco, estoque, tamanho, cor) 
VALUES 
("Camiseta Viscose", 619.99, 7, "M", "OffWhite"),
("Bermuda Algodão", 579.99, 12, "G", "Mescla"),
("Touca", 119.99, 5, "Unico", "Mostarda"),
("Camiseta Algodão", 589.99, 3, "GG", "Preto"),
("Meia Cano Alto", 119.99, 6, "P", "Rose"),
("Camisa Viscolinho", 519.99, 4, "G", "Verde Musgo"),
("Calça Jogger", 639.99, 2, "M", "Azul"),
("Boné", 119.99, 9, "Unico", "Marrom"),
("Short Biker", 429.99, 5, "P", "Preto");

SELECT * FROM tb_produtos WHERE preco > 500.00; 

SELECT * FROM tb_produtos WHERE preco < 500.00; 




