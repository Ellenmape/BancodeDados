CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);
ALTER TABLE tb_classes MODIFY descricao VARCHAR(255);

INSERT INTO tb_classes (tipo, descricao) 
VALUES
("Guerreiro", "Resistênte em combate corpo a corpo, baixa agilidade."),
("Feiticeiro", "Ataque e defesa com poder mágico, longo alcance, sem habilidade de luta corpo a corpo"),
("Arqueiro", "Foco em ataques à distância com arco e flechas, alta precisão e agilidade."),
("Goblin", "Perpicaz e inteligente, possui grande agilidade mas baixo nível de defesa."),
("Assassino", "Ataques furtivos e dano crítico, com alta velocidade e agilidade.");

CREATE TABLE tb_personagens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    nivel INT NOT NULL,
    classes_id BIGINT,
    CONSTRAINT fk_classes_id
    FOREIGN KEY(classes_id) REFERENCES tb_classes(id)
 );

INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, nivel, classes_id) 
VALUES
("Magot", 2500, 1500, 22, 2),
("Leoncio", 3000, 800, 27, 5),
("Chrono", 2200, 1200, 40, 1),
("Viserion", 1800, 2000, 33, 3),
("Rhaegal", 2800, 900, 29, 2),
("Obi", 1900, 1600, 36, 2),
("Draco", 3100, 700, 32, 4),
("Laenor", 2300, 1100, 38, 1);

SELECT * FROM tb_personagens;

SELECT * FROM tb_classes;

SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome LIKE "%c%";

SELECT nome, poder_ataque, poder_defesa, nivel, tb_classes.tipo, tb_classes.descricao
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classes_id = tb_classes.id;

SELECT nome, poder_ataque, poder_defesa, nivel, tb_classes.tipo, tb_classes.descricao
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classes_id = tb_classes.id
WHERE classes_id = 2;







