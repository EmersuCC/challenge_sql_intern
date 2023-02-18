CREATE OR REPLACE FUNCTION DESBLOQUEAR_CLIENTES() 
RETURNS TRIGGER AS $$
BEGIN
    UPDATE CLIENTE 
    SET STATUS_BLOQUEIO = 'A' 
    WHERE ID_CLIENTE IN (
        SELECT
            ID_CLIENTE
        FROM
            FATURA
        WHERE
            DATA_VENCIMENTO >= (NOW() - INTERVAL '3 days')
            AND STATUS = 'B'
    );
    RETURN NEW;
END;
$$     
LANGUAGE PLPGSQL;