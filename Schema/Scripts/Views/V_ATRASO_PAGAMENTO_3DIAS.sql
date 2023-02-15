-- View para listar os clientes que estão com faturas em atraso há mais de 3 dias

CREATE OR REPLACE VIEW V_ATRASO_PAGAMENTO_3DIAS AS
    SELECT
        C.ID_CLIENTE,
        C.NOME,
        CASE
            WHEN EXTRACT(DAY FROM AGE(NOW(), F.DATA_VENCIMENTO)) > 3 THEN
                'Bloqueado'
            ELSE
                'Ativo'
        END                 AS STATUS_BLOQUEIO,
        F.ID_FATURA,
        F.VALOR,
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
        F.STATUS = 'A'
        AND (P.DATA_PAGAMENTO IS NULL
        OR P.DATA_PAGAMENTO > F.DATA_VENCIMENTO)
    ORDER BY
        DIAS_EM_ATRASO