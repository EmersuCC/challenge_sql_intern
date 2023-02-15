
-- View para verificar clientes com idade entre 18 e 21 anos que possuem limite de crédito maior ou igual a 1000 reais.   

CREATE OR REPLACE VIEW V_CLIENTE_LIM_GE_1000 AS
	SELECT
		COUNT(*) AS TOTAL_CLIENTES
	FROM
		CLIENTE
	WHERE
		(IDADE BETWEEN 18
		AND 21)
		AND LIMITE_CREDITO >= 1000
		AND STATUS_BLOQUEIO = 'A';