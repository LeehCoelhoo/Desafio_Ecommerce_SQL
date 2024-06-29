-- Usar o banco de dados ecommerce
USE ecommerce;

-- Inserir valores na tabela Clients
INSERT INTO Clients (Fname, Minit, Lname, CPF, CEP, Rua, Bairro, Cidade, Estado)
VALUES
('João', 'A', 'Silva', '12345678901', '12345678', 'Rua das Flores', 'Centro', 'São Paulo', 'SP'),
('Maria', 'B', 'Oliveira', '23456789012', '23456789', 'Avenida Atlântica', 'Copacabana', 'Rio de Janeiro', 'RJ'),
('Pedro', 'C', 'Santos', '34567890123', '34567890', 'Rua da Liberdade', 'Savassi', 'Belo Horizonte', 'MG'),
('Ana', 'D', 'Costa', '45678901234', '45678901', 'Avenida Ipiranga', 'Centro Histórico', 'Porto Alegre', 'RS'),
('Carlos', 'E', 'Pereira', '56789012345', '56789012', 'Rua Chile', 'Comércio', 'Salvador', 'BA');

-- Inserir valores na tabela Product
INSERT INTO Product (Pname, description, classification_kids, category, review, Psize, price)
VALUES
('Smartphone', 'Latest model smartphone', 0, 'Electronics', 4.5, 'Medium', 1500.00),
('Sofa', 'Comfortable 3-seater sofa', 0, 'Furniture', 4.2, 'Large', 2000.00),
('T-shirt', 'Cotton T-shirt', 1, 'Clothing', 4.0, 'Medium', 50.00),
('Laptop', 'High performance laptop', 0, 'Electronics', 4.7, 'Medium', 3000.00),
('Sneakers', 'Running sneakers', 1, 'Footwear', 4.3, '10', 200.00);

-- Inserir valores na tabela Orders
INSERT INTO Orders (idOrderClient, orderStatus, orderDescription, sendValue, idPayment, PaymentBolet, PaymentPix, PaymentCard)
VALUES
(1, 'Confirmado', 'Order for electronics', 10.00, 1, 0, 0, 1),
(2, 'Cancelado', 'Order for furniture', 10.00, 2, 1, 0, 0),
(3, 'Em processamento', 'Order for clothing', 10.00, 3, 0, 1, 0),
(4, 'Confirmado', 'Order for laptop', 10.00, 4, 0, 0, 1),
(5, 'Confirmado', 'Order for sneakers', 10.00, 5, 0, 1, 0);

-- Inserir valores na tabela ProductStorage
INSERT INTO ProductStorage (storageLocation, quantity)
VALUES
('São Paulo', 100),
('Rio de Janeiro', 50),
('Minas Gerais', 200),
('Rio Grande do Sul', 30),
('Bahia', 75);

-- Inserir valores na tabela Supplier
INSERT INTO Supplier (SocialName, CNPJ, contact)
VALUES
('Tech Supplies Ltda', '12345678000199', '11987654321'),
('Home Goods Corp', '23456789000188', '21987654321'),
('Fashion Trends SA', '34567890000177', '31987654321'),
('Sports Gear Co', '45678901000166', '41987654321'),
('Beauty Essentials Ltd', '56789012000155', '51987654321');

-- Inserir valores na tabela Seller
INSERT INTO Seller (SocialName, AbstName, CNPJ, CPF, location, contact)
VALUES
('Alpha Tech Solutions Ltda', 'Alpha Tech', '12345678000199', NULL, 'São Paulo', '11987654321'),
('Green House Furnishings Ltda', 'Green House', '23456789000188', NULL, 'Rio de Janeiro', '21987654321'),
('Pedro da Silva', 'Pedro', NULL, '123456789', 'Minas Gerais', '31987654321'),
('Ana Costa', 'Ana', NULL, '234567890', 'Rio Grande do Sul', '41987654321'),
('Carlos Pereira', 'Carlos', NULL, '345678901', 'Bahia', '51987654321');

-- Inserir valores na tabela ProductSeller
INSERT INTO ProductSeller (idPseller, idPproduct, prodQuantity)
VALUES
(1, 1, 10),
(2, 2, 5),
(3, 3, 20),
(4, 4, 8),
(5, 5, 15);

-- Inserir valores na tabela ProductOrder
INSERT INTO ProductOrder (idPOproduct, idPOorder, poQuantity, poStatus)
VALUES
(1, 1, 2, 'Disponível'),
(2, 2, 0, 'Sem estoque'),
(3, 3, 3, 'Disponível'),
(4, 4, 1, 'Disponível'),
(5, 5, 2, 'Disponível');

-- Inserir valores na tabela StorageLocation
INSERT INTO StorageLocation (idLproduct, idLstorage, location)
VALUES
(1, 1, 'São Paulo'),
(2, 2, 'Rio de Janeiro'),
(3, 3, 'Minas Gerais'),
(4, 4, 'Rio Grande do Sul'),
(5, 5, 'Bahia');

-- Inserir valores na tabela ProductSupplier
INSERT INTO ProductSupplier (idPsSupplier, idPsProduct, quantity)
VALUES
(1, 1, 100),
(2, 2, 50),
(3, 3, 200),
(4, 4, 30),
(5, 5, 75);

-- Inserir valores na tabela Payments
INSERT INTO Payments (idOrder, typePayment, price_total)
VALUES
(1, 'Cartao de Credito', 1510.00),
(2, 'Boleto', 2010.00),
(3, 'Pix', 60.00),
(4, 'Cartao de Credito', 3010.00),
(5, 'Pix', 210.00);

-- Inserir valores na tabela CardPayments
INSERT INTO CardPayments (idCardPayment, idPayment, cardHolderName, cardExpiryDate, cardLimit)
VALUES
(1, 1, 'João Silva', '2025-12-31', 5000.00),
(2, 2, 'Maria Oliveira', '2024-11-30', 3000.00),
(3, 4, 'Ana Costa', '2025-10-31', 4000.00),
(4, 5, 'Carlos Pereira', '2023-09-30', 2000.00),
(5, 3, 'Pedro Santos', '2023-12-31', 3000.00);


