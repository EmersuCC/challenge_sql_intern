CREATE TABLE IF NOT EXISTS CLIENTE (
    ID_CLIENTE SERIAL PRIMARY KEY,
    NOME VARCHAR ( 50 ) NOT NULL,
    IDADE INTEGER NOT NULL,
    STATUS_BLOQUEIO CHAR(1) NOT NULL DEFAULT 'A',
    LIMITE_CREDITO DECIMAL(10, 2) NOT NULL
);

INSERT INTO CLIENTE (NOME, IDADE, STATUS_BLOQUEIO, LIMITE_CREDITO)
VALUES 
	('Emerson Santos Barbosa', 18, 'A', 1500),
	('Ester R.L. Santos', 18, 'A', 2500),
	('Elainy', 37, 'A', 5500),
	('Ednaldo', 60, 'B', 1500),
	('Maria do Socorro', '57', 'A', 8500),
	('Keyla Silva', 21, 'B', 500),
	('Mércia Silva', 20, 'A', 1000),
	('Eliseu R.L. Santos', 21, 'A', 550),
	('Juliana Cabral', 31, 'A', 15000),
	('Maicosuel Lurdes', 19, 'A', 10);