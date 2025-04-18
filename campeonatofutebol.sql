-- CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE IF NOT EXISTS futebol;
USE futebol;

-- CRIAÇÃO DAS TABELAS
CREATE TABLE IF NOT EXISTS times (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS jogadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    time_id INT,
    FOREIGN KEY (time_id) REFERENCES times(id)
);

CREATE TABLE IF NOT EXISTS partidas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    time_casa INT,
    time_fora INT,
    gols_casa INT,
    gols_fora INT,
    FOREIGN KEY (time_casa) REFERENCES times(id),
    FOREIGN KEY (time_fora) REFERENCES times(id)
);

-- INSERINDO DADOS
INSERT INTO times (nome, cidade) VALUES 
('Palmeiras', 'São Paulo'),
('Flamengo', 'Rio de Janeiro'),
('Atlético-MG', 'Belo Horizonte');

INSERT INTO jogadores (nome, idade, time_id) VALUES 
('Dudu', 32, 1),
('Gabigol', 28, 2),
('Hulk', 35, 3),
('Veiga', 28, 1),
('Pedro', 26, 2);

INSERT INTO partidas (time_casa, time_fora, gols_casa, gols_fora) VALUES 
(1, 2, 2, 1),
(2, 3, 3, 2),
(3, 1, 1, 1);

-- CONSULTAS PARA PRATICAR
-- 1. Ver todos os times
SELECT * FROM times;

-- 2. Ver todos os jogadores e o time que eles jogam
SELECT jogadores.nome AS jogador, jogadores.idade, times.nome AS time
FROM jogadores
JOIN times ON jogadores.time_id = times.id;

-- 3. Ver todas as partidas com nomes dos times e placar
SELECT 
    t1.nome AS time_casa,
    t2.nome AS time_fora,
    p.gols_casa,
    p.gols_fora
FROM partidas p
JOIN times t1 ON p.time_casa = t1.id
JOIN times t2 ON p.time_fora = t2.id;

-- 4. Ver os jogadores com mais de 30 anos
SELECT nome, idade FROM jogadores WHERE idade > 30;
