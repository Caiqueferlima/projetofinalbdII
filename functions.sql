-- ===================================
-- FUNCTIONS
-- ===================================

-- 1. Calcular subtotal (preco * quantidade)
DELIMITER //
CREATE FUNCTION CalcularSubtotal(preco DECIMAL(10,2), qtd INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN preco * qtd;
END //
DELIMITER ;

-- 2. Aplicar desconto (10% se valor total > 200)
DELIMITER //
CREATE FUNCTION AplicarDesconto(total DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    IF total > 200 THEN
        RETURN total * 0.9; -- 10% de desconto
    ELSE
        RETURN total;
    END IF;
END //
DELIMITER ;


