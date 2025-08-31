-- ============================================
-- functions
-- ============================================
-- Subtotal
SELECT CalcularSubtotal(25.00, 3) Subtotal;

-- Aplicar desconto
SELECT AplicarDesconto(250.00) ValorComDesconto;
SELECT AplicarDesconto(80.00) ValorSemDesconto;

-- ============================================
-- Procedures
-- ============================================

-- Aumenta o estoque do produto 1 em 20 unidades
CALL AumentarEstoque(1, 20);
SELECT ID_Produto, Nome, Quantidade_Disponivel FROM Produto WHERE ID_Produto = 1;

-- Registrar compra
CALL RegistrarCompra(1, 1, 1, 5);

-- Verificar a venda criada (pegar a venda mais recente)
SELECT * FROM CompraVenda ORDER BY ID_Venda DESC LIMIT 1;

-- Verificar itens da venda (ID_Compra = id da venda criada)
SELECT * FROM ItemCompra WHERE ID_Compra = (SELECT MAX(ID_Venda) FROM CompraVenda);

-- ============================================
-- Triggers
-- ============================================

-- trigger descontar estoque
-- Verificar estoque do produto 1 (deve ter diminuído em 5)
SELECT ID_Produto, Nome, Quantidade_Disponivel FROM Produto WHERE ID_Produto = 1;

-- trigger cpf duplicado
INSERT INTO Cliente (Nome, CPF, Endereco, Telefone)
VALUES ('Pedro Teste', '12345678901', 'Rua X, 10', '85900000000');
