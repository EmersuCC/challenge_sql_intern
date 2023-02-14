CREATE TABLE IF NOT EXISTS CLIENTE (
	ID_CLIENTE SERIAL PRIMARY KEY,
	NOME VARCHAR ( 50 ) NOT NULL,
	IDADE INTEGER NOT NULL,
	STATUS_BLOQUEIO CHAR(1) NOT NULL DEFAULT 'A',
	LIMITE_CREDITO DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS FATURA (
	ID_FATURA SERIAL PRIMARY KEY,
	DATA_VENCIMENTO DATE NOT NULL,
	VALOR DECIMAL(10, 2) NOT NULL,
	STATUS CHAR(1) NOT NULL,
	ID_CLIENTE INTEGER REFERENCES CLIENTE(ID_CLIENTE)
);

CREATE TABLE IF NOT EXISTS PAGAMENTO (
	ID_PAGAMENTO SERIAL PRIMARY KEY,
	DATA_PAGAMENTO DATE,
	VALOR DECIMAL(10, 2),
	ID_FATURA INTEGER REFERENCES FATURA(ID_FATURA)
);

INSERT INTO CLIENTE (nome, idade, status_bloqueio, limite_credito)
VALUES 
	('Emerson Santos Barbosa', 22, 'A', 1500),
	('Ester R.L. Santos', 22, 'A', 2500),
	('Elainy', 37, 'A', 5500),
	('Ednaldo', 60, 'B', 1500),
	('Maria do Socorro', '57', 'A', 8500),
	('Keyla Silva', 29, 'B', 500),
	('Mércia Silva', 26, 'A', 1000),
	('Eliseu R.L. Santos', 19, 'A', 550),
	('Juliana Cabral', 31, 'A', 15000),
	('Maicosuel Lurdes', 19, 'A', 10);
	
SELECT * FROM CLIENTE;

INSERT INTO FATURA (data_vencimento, valor, status, id_cliente)
VALUES
	('13-02-2023', 1328.50, 'P', 1),
	('13-02-2023', 18.50, 'A', 2),
	('13-02-2023', 328.00, 'A', 3),
	('13-02-2023', 1328.50, 'P', 4),
	('13-02-2023', 8000, 'P', 5),
	('13-02-2023', 13, 'A', 6),
	('13-02-2023', 892, 'P', 7),
	('13-02-2023', 52.50, 'P', 8),
	('13-02-2023', 138.50, 'P', 9),
	('13-02-2023', 1328.50, 'P', 10);
	
	
SELECT * FROM FATURA;


INSERT INTO PAGAMENTO (data_pagamento, valor, id_fatura)
VALUES 
	('13-02-2023', 1328.50, 1),
	('13-02-2023', 18.50, 2),
	('13-02-2023', 328.00, 3),
	('13-02-2023', 1328.50, 4),
	('13-02-2023', 8000, 5),
	('13-02-2023', 13, 6),
	('13-02-2023', 892, 7),
	('13-02-2023', 52.50, 8),
	('13-02-2023', 138.50, 9),
	('13-02-2023', 1328.50, 10);
	
SELECT * FROM PAGAMENTO;


/* View para verificar clientes com idade entre 18 e 21 anos que possuem limite de crédito
*  maior ou igual a 1000 reais.   
*/

SELECT
	COUNT(*) AS CLIENTE_1K_18_21
FROM
	CLIENTE
WHERE
	(IDADE BETWEEN 20
	AND 30)
	AND LIMITE_CREDITO >= 1000
	AND STATUS_BLOQUEIO = 'A';

-- View para verificar clientes que realizaram pagamento no dia do vencimento da Fatura.

SELECT
	F.DATA_VENCIMENTO,
	COUNT(*) AS QUANTIDADE
FROM
	FATURA    F
	JOIN PAGAMENTO P
	ON F.ID_FATURA = P.ID_FATURA
WHERE
	F.DATA_VENCIMENTO = P.DATA_PAGAMENTO
GROUP BY
	F.DATA_VENCIMENTO;