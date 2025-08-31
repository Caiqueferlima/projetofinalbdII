-- ===================================
-- TRIGGERS
-- ===================================

-- 1. Atualizar estoque após nova venda (ItemCompra)
DELIMITER //
CREATE TRIGGER trg_atualiza_estoque
AFTER INSERT ON ItemCompra
FOR EACH ROW
BEGIN
    UPDATE Produto
    SET Quantidade_Disponivel = Quantidade_Disponivel - NEW.Quantidade
    WHERE ID_Produto = NEW.ID_Produto;
END //
DELIMITER ;

-- 2. Impedir cadastro de CPF duplicado em Cliente
DELIMITER //
CREATE TRIGGER trg_valida_cpf
BEFORE INSERT ON Cliente
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM Cliente WHERE CPF = NEW.CPF) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'CPF já cadastrado no sistema!';
    END IF;
END //
DELIMITER ;
