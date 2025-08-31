CREATE DATABASE MercadoCuel;
USE MercadoCuel;

CREATE TABLE Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF CHAR(11) UNIQUE NOT NULL,
    Endereco VARCHAR(150),
    Telefone VARCHAR(15)
);


CREATE TABLE Funcionario (
    ID_Funcionario INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50),
    Telefone VARCHAR(15),
    Salario DECIMAL(10,2)
);


CREATE TABLE Produto (
    ID_Produto INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    Quantidade_Disponivel INT NOT NULL,
    Data_Validade DATE
);


CREATE TABLE CompraVenda (
    ID_Venda INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    ID_Funcionario INT NOT NULL,
    Data DATE NOT NULL,
    Valor_Total DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario)
);


CREATE TABLE ItemCompra (
    ID_Compra INT,
    ID_Produto INT,
    Quantidade INT NOT NULL,
    Subtotal DECIMAL(10,2),
    PRIMARY KEY (ID_Compra, ID_Produto),
    FOREIGN KEY (ID_Compra) REFERENCES CompraVenda(ID_Venda),
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto)
);

-- ===================================
-- DADOS INICIAIS
-- ===================================


INSERT INTO Cliente (Nome, CPF, Endereco, Telefone) VALUES
('João Silva', '12345678901', 'Rua A, 123', '85999990001'),
('Maria Oliveira', '98765432100', 'Rua B, 456', '85999990002');


INSERT INTO Funcionario (Nome, Cargo, Telefone, Salario) VALUES
('Carlos Souza', 'Caixa', '85999990003', 2000.00),
('Ana Lima', 'Atendente', '85999990004', 1800.00);


INSERT INTO Produto (Nome, Preco, Quantidade_Disponivel, Data_Validade) VALUES
('Arroz 5kg', 25.00, 100, '2025-12-31'),
('Feijão 1kg', 8.50, 200, '2025-11-30'),
('Macarrão 500g', 4.20, 150, '2025-10-15');
