-- Criando banco de dados para um cenário de E-commerce --
create database ecommerce;
use ecommerce;


-- criar tabela cliente
create table Clients(
    idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    CEP char(8),
    Rua varchar(45),
    Bairro varchar(45),
    Cidade varchar(45),
    Estado char(2),
    constraint unique_cpf_client unique(CPF)
);
alter table Clients auto_increment=1;

-- criar view para concatenar o endereço
create view ClientAddress as
select
    idClient,
    Fname,
    Minit,
    Lname,
    CPF,
    concat(Rua, ', ', Bairro, ', ', Cidade, ', ', Estado, ', ', CEP) as Adress
from
    Clients;

-- criar tabela produto
create table Product(
    idProduct int auto_increment primary key,
    Pname varchar(45),
    description varchar(255),
    classification_kids bool default 0,
    category Enum("Electronics","Home Appliances","Furniture","Clothing","Footwear","Toys","Beauty","Sports and Leisure","Others") not null,
    review float default 0,
    Psize varchar(10),
    price float
);
alter table product auto_increment=1;

-- criar tabela pedido
create table orders(
    idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum("Confirmado","Cancelado","Em processamento") default "Em processamento",
    orderDescription varchar(255),
    sendValue float default 10,
    idPayment int not null,
    PaymentBolet boolean default false,
    PaymentPix boolean default false,
    PaymentCard boolean default true,
    constraint fk_orders_client foreign key (idOrderClient) references Clients(idClient) on update cascade
);
alter table orders auto_increment=1;

-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);
desc productstorage;
alter table productStorage auto_increment=1;


-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);
alter table supplier auto_increment=1;

desc supplier;

-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(9),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

alter table seller auto_increment=1;

-- criar tabela de pessoa Juridica e Pessoa Física --



-- tabelas de relacionamentos M:N

create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller) on update cascade,
    constraint fk_product_product foreign key (idPproduct) references product(idProduct) on update cascade
);

desc productSeller;

create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_product foreign key (idPOproduct) references product(idProduct) on update cascade,
    constraint fk_productorder_order foreign key (idPOorder) references orders(idOrder) on update cascade

);

create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct) on update cascade,
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage) on update cascade
);

create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_prodcut foreign key (idPsProduct) references product(idProduct)
);

-- Criando tabela de pagamentos

create table payments(
    idPayment int auto_increment primary key,
    idOrder int,
    typePayment enum("Pix","Boleto","Cartao de Credito","Cartao de Debito"),
    price_total float,
    constraint fk_payments_order foreign key (idOrder) references orders(idOrder) on update cascade
);
alter table payments auto_increment=1;

-- criar tabela de pagamentos com cartão
create table CardPayments(
    idCardPayment int,
    idPayment int,
    cardHolderName varchar(50),
    cardExpiryDate date,
    cardLimit float,
    constraint fk_cardpayments_payment foreign key (idPayment) references payments(idPayment)
);

desc productSupplier;

show tables;

show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';
