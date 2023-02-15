INSERT INTO CLIENTE (nome, idade, status_bloqueio, limite_credito)
VALUES 
	('Emerson Santos Barbosa', 18, 'A', 1500),
	('Ester R.L. Santos', 19, 'A', 2500),
	('Elainy', 20, 'A', 5500),
	('Ednaldo', 21, 'B', 1500),
	('Maria do Socorro', 57, 'A', 8500),
	('Keyla Silva', 29, 'B', 500),
	('Mércia Silva', 26, 'A', 1000),
	('Eliseu R.L. Santos', 19, 'A', 550),
	('Juliana Cabral', 31, 'A', 15000),
	('Maicosuel Lurdes', 19, 'A', 10);
	
SELECT * FROM CLIENTE;

INSERT INTO FATURA (data_vencimento, valor, status, id_cliente)
VALUES
	('13-02-2023', 1328.50, 'P', 1),
	('10-02-2023', 18.50, 'A', 2),
	('02-02-2023', 328.00, 'A', 3),
	('13-02-2023', 1328.50, 'P', 4),
	('05-02-2023', 8000, 'P', 5),
	('11-02-2023', 13, 'A', 6),
	('13-02-2023', 892, 'P', 7),
	('13-02-2023', 52.50, 'P', 8),
	('13-02-2023', 138.50, 'P', 9),
	('20-02-2023', 1328.50, 'P', 10);
	
	
SELECT * FROM FATURA;


INSERT INTO PAGAMENTO (DATA_PAGAMENTO, VALOR, ID_FATURA)
VALUES 
	('13-02-2023', 1328.50, 1),
	('11-02-2023', 18.50, 2),
	('25-01-2023', 328.00, 3),
	('12-02-2023', 1328.50, 4),
	('13-02-2023', 8000, 5),
	('08-02-2023', 13, 6),
	('12-02-2023', 892, 7),
	('13-02-2023', 52.50, 8),
	('12-02-2023', 138.50, 9),
	('13-02-2023', 1328.50, 10);
	
SELECT * FROM PAGAMENTO;