-- Trigger para execução da função de verificação de limite de crédito

CREATE TRIGGER TRG_VERIFICAR_LIMITE_CREDITO 
BEFORE INSERT ON FATURA 
FOR EACH ROW 
EXECUTE FUNCTION VERIFICAR_LIMITE_CREDITO();