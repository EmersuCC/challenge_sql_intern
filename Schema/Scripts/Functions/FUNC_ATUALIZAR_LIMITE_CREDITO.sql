-- Function para atualizar o limite de crédito do cliente 
-- quando a fatura estiver vencida há mais de 3 dias

CREATE OR REPLACE FUNCTION ATUALIZAR_LIMITE_CREDITO()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE CLIENTE 
    SET LIMITE_CREDITO = 0 
    WHERE CLIENTE.ID_CLIENTE IN (
        SELECT FATURA.ID_CLIENTE 
        FROM FATURA 
        JOIN CLIENTE ON CLIENTE.ID_CLIENTE = FATURA.ID_CLIENTE 
        WHERE FATURA.DATA_VENCIMENTO < (NOW() - INTERVAL '3 days') 
        AND FATURA.STATUS = 'A'
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

