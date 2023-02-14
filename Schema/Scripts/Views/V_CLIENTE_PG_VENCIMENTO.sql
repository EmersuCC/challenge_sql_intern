CREATE VIEW V_CLIENTE_PG_VENCIMENTO AS
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