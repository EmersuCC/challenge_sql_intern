/* View para verificar clientes com idade entre 18 e 21 anos que possuem limite de crédito
*  maior ou igual a 1000 reais.   
*/

CREATE VIEW V_CLIENTE_1K_18_21 AS
	SELECT
		COUNT(*) AS CLIENTE_1K_18_21
	FROM
		CLIENTE
	WHERE
		(IDADE BETWEEN 18
		AND 21)
		AND LIMITE_CREDITO >= 1000
		AND STATUS_BLOQUEIO = 'A';