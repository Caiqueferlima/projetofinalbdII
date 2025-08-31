-- ===================================
-- PROCEDURES
-- ===================================

-- 1. RegistrarCompra: cria venda e item, atualiza total
DELIMITER //
CREATE PROCEDURE RegistrarCompra(
    IN p_id_cliente INT,
    IN p_id_funcionario INT,
    IN p_id_produto INT,
    IN p_quantidade INT
)
BEGIN
    DECLARE v_preco DECIMAL(10,2);
    DECLARE v_subtotal DECIMAL(10,2);
    DECLARE v_venda_id INT;

    -- Pegar preço do produto
    SELECT Preco INTO v_preco FROM Produto WHERE ID_Produto = p_id_produto;

    -- Calcular subtotal usando a function
    SET v_subtotal = CalcularSubtotal(v_preco, p_quantidade);

    -- Criar venda
    INSERT INTO CompraVenda (ID_Cliente, ID_Funcionario, Data, Valor_Total)
    VALUES (p_id_cliente, p_id_funcionario, CURDATE(), 0);

    -- Pegar ID da venda criada
    SET v_venda_id = LAST_INSERT_ID();

    -- Inserir item da compra
    INSERT INTO ItemCompra (ID_Compra, ID_Produto, Quantidade, Subtotal)
    VALUES (v_venda_id, p_id_produto, p_quantidade, v_subtotal);

    -- Atualizar valor total com desconto
    UPDATE CompraVenda
    SET Valor_Total = AplicarDesconto(v_subtotal)
    WHERE ID_Venda = v_venda_id;
END //
DELIMITER ;

-- 2. Aumentar estoque manualmente
DELIMITER //
CREATE PROCEDURE AumentarEstoque(
    IN p_id_produto INT,
    IN p_quantidade INT
)
BEGIN
    UPDATE Produto
    SET Quantidade_Disponivel = Quantidade_Disponivel + p_quantidade
    WHERE ID_Produto = p_id_produto;
END //
DELIMITER ;
