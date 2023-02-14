CREATE TABLE IF NOT EXISTS PAGAMENTO (
    ID_PAGAMENTO SERIAL PRIMARY KEY,
    DATA_PAGAMENTO DATE,
    VALOR DECIMAL(10, 2),
    ID_FATURA INTEGER REFERENCES FATURA(ID_FATURA)
);

INSERT INTO PAGAMENTO (DATA_PAGAMENTO, VALOR, ID_FATURA)
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