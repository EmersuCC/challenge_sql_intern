# Controle de Faturas
## Estrutura do banco de dados
#### Este é um banco de dados que permite o gerenciamento de clientes, faturas e pagamentos. 
Ele é composto por três tabelas principais: cliente, fatura e pagamento. O detalhamento
das tabelas encontra-se no diagrama entidade relacionamento abaixo, juntamente com suas views:

![MODEL_ERD](https://user-images.githubusercontent.com/62714085/219845559-9db8d5d8-3dea-49db-9235-36f5e7bc1efb.png)



## **Cliente**:

Campo	| Tipo |	Descrição
------|------|------------
id_cliente | INTEGER	| Identificador único do cliente
nome	| VARCHAR(50)	| Nome do cliente
idade	| VARCHAR(100) |	Idade do cliente
status_bloqueio	| CHAR(1)	| Status cliente ('A' para ativo e 'B' para bloqueado)
limite_credito | DECIMAL(10,2) | Limite de crédito disponível para o cliente



## **Fatura**

Campo |	Tipo |	Descrição
------|------|-------------
id_fatura |	INTEGER	| Identificador único da fatura
data_vencimento | DATE	| Data de vencimento da fatura
valor	| DECIMAL(10,2)	| Valor da fatura
status	| CHAR(1)	| Status da fatura ('P' para paga, 'A' para em atraso)
id_cliente | INTEGER | Identificador do cliente associado



## **Pagamento**:
A tabela pagamento armazena informações sobre os pagamentos recebidos dos clientes. Cada pagamento é associado a uma fatura por meio do ID da fatura. A tabela contém informações como a data do pagamento e o valor pago.

Campo	| Tipo |	Descrição
------|-----| ------------
id_pagamento	| INTEGER	|Identificador único do pagamento
data_pagamento | DATE	| Data do pagamento
valor	| DECIMAL(10,2)	| Valor pago
id_fatura	| INTEGER	| Identificador da fatura associada


## O banco possui as seguintes funcionalidades:

- Registro de clientes, incluindo nome, idade status e limite de crédito.
- Registro de faturas, incluindo o cliente associado, o valor da fatura, a data de vencimento e o status (pago ou em atraso).
- Registro de pagamentos, incluindo a fatura associada, o valor pago e a data do pagamento.
## Os scrips de inserção e testes estão localizados no [diretório](https://github.com/EmersuCC/challenge_sql_intern/tree/main/Schema/Scripts/Teste)


- Visualização de clientes com idade entre 18 e 21 anos que possuem limite de crédito maior ou igual a 1.000
reais
  - Para visualização dos dados desta **VIEW** execute:
  ```sql
  SELECT * FROM V_CLIENTE_LIM_GE_1000;

- Visualização de clientes que efetuaram pagamento da fatura com 1 dia de antecedência
  - Execute este script para visualização dos dados desta **VIEW** 
  ```plpgsql
  SELECT * FROM V_PAGAMENTOS_DIA_ANTERIOR;
  
- Visualização de clientes que efetuaram pagamento da fatura no dia do vencimento
  - Execute este script para visualização desses dados através da **VIEW**
  ```plpgsql
  SELECT * FROM V_PAGAMENTOS_DIA_VENCIMENTO;

- Visualização de clientes em atraso, com informações como nome, valor em aberto, dias em atraso e status de bloqueio.
  - Para execução dessa **VIEW** execute: 
  ```plpgsql
  SELECT * FROM V_CLIENTE_EM_ATRASO;
  
  
- Visualização de clientes em atraso de pagamento maior que 3 dias, com informações como nome, status, id e valor da fatura
  - Para execução dessa **VIEW** execute: 
  ```plpgsql 
  SELECT * FROM V_ATRASO_PAGAMENTO_3DIAS;
  
  
- Pagamento de faturas
  - Para efetuar o pagamento de uma fatura será necessário chamar a execução da procedure:
  ```plpgsql
  -- Onde id_fat corresponde ao id da fatura que deseja pagar, e o valor corresponde ao valor da fatura
     
     PROC_EFETUAR_PAGAMENTO(id_fat, valor);
     
  -- O pagamento será realizado com sucesso se o valor a ser pago for maior ou igual ao valor da fatura pendente
  ```
  

- Atualização do limite de crédito do cliente em caso de bloqueio
  - Aqui temos um trigger que é executado baseado em eventos ocorridos na tabela FATURA
    ```plpgsql
    CREATE TRIGGER TRG_ATUALIZAR_LIMITE_CREDITO
    AFTER INSERT OR UPDATE ON FATURA
    FOR EACH ROW
    EXECUTE FUNCTION ATUALIZAR_LIMITE_CREDITO();
    ```
 
- Bloqueamento de clientes que estiverem em atraso de pagamento > 3 dias.
    - `
    ```plpgsql
      CREATE TRIGGER TRG_BLOQUEAR_CLIENTES 
      AFTER INSERT OR UPDATE 
      ON FATURA 
      FOR EACH ROW 
      EXECUTE FUNCTION BLOQUEAR_CLIENTES();
      ```
- Desbloqueamento de clientes que efetuarem pagamento de faturas atrasadas.
  ```plpgsql
  CREATE TRIGGER TRG_DESBLOQUEAR_CLIENTES 
  AFTER INSERT OR UPDATE 
  ON FATURA 
  FOR EACH ROW 
  EXECUTE FUNCTION DESBLOQUEAR_CLIENTES();
  ```
- Exclusão de clientes sem faturas associadas.
  - Rotina associada: 
  ```plpgsql
  -- Procedure
  CALL EXCLUIR_CLIENTES_SEM_FATURAS();
  
  -- Função
  SELECT EXCLUIR_CLIENTES_SEM_FATURA();
  ```
  
  A função **EXCLUIR_CLIENTES_SEM_FATURA** pode ser agendada para execução
  automatica dentro de um periodo determinado por diferentes meios, a depender do sistema operacional.
