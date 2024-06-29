USE ecommerce;

-- Verificar quantidade de clientes
select count(*) from clients;
-- Ver o preço total de compras no Cartão de Credito
select sum(price_total) from payments p where typepayment = 'Cartao de Credito';
-- Ver situação dos pedidos dos clientes
select * from clients c, orders o where c.idClient = o.idOrderClient;

select concat(FName," ", Lname) as Client, idOrder, orderStatus Name 
from clients c, orders o where c.idClient = o.idOrderClient;

-- Adicionar novo pedido
INSERT INTO Orders (idOrderClient, orderStatus, orderDescription, sendValue, idPayment, PaymentBolet, PaymentPix, PaymentCard)
VALUES
(5, default, 'Order for electronics', 10.00, 1, 0, 1, 0);
select * from orders;


select count(*) from clients c, orders o
where c.idClient = o.idOrderClient

-- recuperação de pedido com produto associado
select * from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
                inner join productOrder p on p.idPOorder = o.idOrder
		group by idClient; 
        
-- Recuperar quantos pedidos foram realizados pelos clientes?
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
		group by idClient; 
		
-- Verificar cliente que fez mais pedido, ordenados pela quantidade de pedidos:
SELECT CONCAT(Fname, ' ', Lname) AS Client, COUNT(o.idOrder) AS NumberOfOrders
FROM Clients c
JOIN Orders o ON c.idClient = o.idOrderClient
GROUP BY Client
HAVING NumberOfOrders > 1
ORDER BY NumberOfOrders DESC;

-- Verificar produtos com revisão maior que 4.0, ordenados pela revisão
SELECT Pname, review
FROM Product
WHERE review > 4.0
ORDER BY review DESC;

-- Verificar fornecedores com mais de 10 produtos fornecidos
SELECT s.SocialName, SUM(ps.quantity) AS TotalProducts
FROM Supplier s
JOIN ProductSupplier ps ON s.idSupplier = ps.idPsSupplier
GROUP BY s.SocialName
HAVING TotalProducts > 10;



