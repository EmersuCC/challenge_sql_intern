
-- Função que verifica se o limite de crédito do cliente foi excedido

CREATE OR REPLACE FUNCTION verificar_limite_credito()
RETURNS TRIGGER AS $$
DECLARE
  total_faturas_abertas NUMERIC;
BEGIN
  SELECT SUM(valor)
  INTO total_faturas_abertas
  FROM fatura
  WHERE id_cliente = NEW.id_cliente AND status = 'A';
  
  IF total_faturas_abertas + NEW.valor > (SELECT limite_credito FROM cliente WHERE id_cliente = NEW.id_cliente) THEN
    RAISE EXCEPTION 'Limite de crédito do cliente excedido';
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;