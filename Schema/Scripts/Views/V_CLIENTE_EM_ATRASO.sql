-- View para verificar clientes que possuem faturas em atraso.

CREATE OR REPLACE VIEW V_CLIENTE_EM_ATRASO AS
	SELECT
		C.ID_CLIENTE,
		C.NOME,
		F.VALOR,
		F.DATA_VENCIMENTO,
		CASE F.STATUS
			WHEN 'P' THEN
				'Pago'
			WHEN 'A' THEN
				'Atraso'
		END                 AS STATUS,
		EXTRACT(DAY
	FROM
		AGE(NOW(),
		F.DATA_VENCIMENTO)) AS DIAS_EM_ATRASO
	FROM
		CLIENTE   C
		JOIN FATURA F
		ON C.ID_CLIENTE = F.ID_CLIENTE LEFT JOIN PAGAMENTO P
		ON F.ID_FATURA = P.ID_FATURA
	WHERE
		F.STATUS IN ('A',
		'P')
		AND (P.DATA_PAGAMENTO IS NULL
		OR P.DATA_PAGAMENTO > F.DATA_VENCIMENTO)
	ORDER BY DIAS_EM_ATRASO DESC;