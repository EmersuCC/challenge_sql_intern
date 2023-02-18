
-- Exclui clientes que não possuem faturas

DECLARE 
    CLIENTE_ID INTEGER;
    TOTAL_EXCLUIDOS INTEGER := 0;
    CUR CURSOR FOR (
        SELECT ID_CLIENTE
        FROM CLIENTE
        WHERE NOT EXISTS (
            SELECT 1
            FROM FATURA
            WHERE FATURA.ID_CLIENTE = CLIENTE.ID_CLIENTE
        )
    );
BEGIN
    OPEN CUR;
    LOOP
        FETCH CUR INTO CLIENTE_ID;
        EXIT WHEN NOT FOUND;
        DELETE FROM CLIENTE
        WHERE ID_CLIENTE = CLIENTE_ID;
        TOTAL_EXCLUIDOS := TOTAL_EXCLUIDOS + 1;
        RAISE NOTICE 'Cliente ID % excluído', CLIENTE_ID;
    END LOOP;
    CLOSE CUR;
    RAISE NOTICE 'Total de clientes excluídos: %', TOTAL_EXCLUIDOS;
END;
