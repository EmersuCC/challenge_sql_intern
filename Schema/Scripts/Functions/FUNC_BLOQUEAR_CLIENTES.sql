CREATE OR REPLACE FUNCTION BLOQUEAR_CLIENTES() 
RETURNS TRIGGER AS $$     
    BEGIN UPDATE CLIENTE SET STATUS_BLOQUEIO = 'B' WHERE ID_CLIENTE IN (
        SELECT
            ID_CLIENTE
        FROM
            FATURA
        WHERE
            DATA_VENCIMENTO < (NOW() - INTERVAL '3 days')
            AND STATUS = 'A'
    );
        RETURN NEW;
        END; $$     
        LANGUAGE PLPGSQL;