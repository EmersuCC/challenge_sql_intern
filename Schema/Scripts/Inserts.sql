
-- Rode os 3 DELETES abaixo na ordem em que está para limpar todas as tabelas e reiniciar os IDs. 

DELETE FROM FATURA;
ALTER SEQUENCE fatura_id_fatura_seq
RESTART WITH 1;

DELETE FROM PAGAMENTO; 
ALTER SEQUENCE pagamento_id_pagamento_seq
RESTART WITH 1;

DELETE FROM CLIENTE;
ALTER SEQUENCE cliente_id_cliente_seq 
RESTART WITH 1;

-- Rode os scripts abaixo para inserir os dados iniciais.

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




-- Rode os scripts abaixo para inserir os dados iniciais de Fatura.
-- Antes de rodar o script de inserção, poderá chamar a função "FUNC_EXCLUIR_CLIENTES_SEM_FATURA"
-- para visualizar seu funcionamento


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


-- Rode os scripts abaixo para inserir os dados iniciais de Pagamento.
-- Após inserção poderá chamar a procedure "EFETUAR_PAGAMENTO" para visualizar seu funcionamento
-- Os parâmetros são: ID_FAT=ID da fatura, VALOR_PAG=Valor do pagamento.

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