-- Efetuar pagamento de fatura

DECLARE 
    VALOR_FATURA DECIMAL(10, 2);
    DATA_PAGAMENTO TIMESTAMP;
BEGIN
    DATA_PAGAMENTO := NOW();
    
    IF (
        SELECT STATUS
        FROM FATURA
        WHERE ID_FATURA = ID_FAT
    ) = 'A' THEN
        
        SELECT VALOR INTO VALOR_FATURA
        FROM FATURA
        WHERE ID_FATURA = ID_FAT;
        
        IF VALOR_FATURA <= VALOR_PAGO THEN
            
            UPDATE FATURA
            SET STATUS = 'P'
            WHERE ID_FATURA = ID_FAT;
            
            INSERT INTO PAGAMENTO (
                DATA_PAGAMENTO,
                VALOR,
                ID_FATURA
            ) VALUES (
                DATA_PAGAMENTO,
                VALOR_PAGO,
                ID_FAT
            );
            
            RAISE NOTICE 'Pagamento efetuado com sucesso. Troco: %', VALOR_PAGO - VALOR_FATURA;
            
        ELSE
            RAISE NOTICE 'Valor pago é menor do que o valor da fatura';
        END IF;
        
    ELSE
        RAISE NOTICE 'A fatura já encontra-se paga';
    END IF;
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE NOTICE 'Fatura não encontrada.';
END;