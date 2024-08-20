create database demo_2;
use demo_2;
-- drop database demo_2;

create table Products (
Id int auto_increment primary key,
productCode varchar(50) not null,
productName varchar(100),
productPrice DECIMAL(10, 2),
    productAmount INT,
    productDescription TEXT,
productStatus varchar(50)
);

insert into Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
values 
('P001', 'Product 1', 100, 50, 'Description for product 1', 'Available'),
('P002', 'Product 2', 150, 30, 'Description for product 2', 'Out of Stock'),
('P003', 'Product 3', 200, 20, 'Description for product 3', 'Available'),
('P004', 'Product 4', 250, 10, 'Description for product 4', 'Discontinued');


EXPLAIN SELECT * FROM Products WHERE productCode = 'P001';

CREATE UNIQUE INDEX idx_productCode ON Products(productCode);
CREATE INDEX idx_productNamePrice ON Products(productName, productPrice);
EXPLAIN SELECT * FROM Products WHERE productCode = 'P001';

create view ProductView as
select productCode, productName, productPrice, productStatus
from Products;

create or replace view ProductView as
select productCode, productName, productPrice, productStatus, productDescription
from Products;

select * from ProductView;

drop view ProductView;

delimiter //
create procedure addProduct(
IN p_productCode VARCHAR(50),
    IN p_productName VARCHAR(100),
    IN p_productPrice DECIMAL(10, 2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus VARCHAR(50)
    )
begin 
insert into Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
values (p_productCode, p_productName, p_productPrice, p_productAmount, p_productDescription, p_productStatus);
end //
delimiter ;

delimiter //
create procedure getAllProduct()
begin
select*from Products;
end // 
delimiter ;

delimiter //
create procedure updateProduct(
IN p_Id INT,
    IN p_productCode VARCHAR(50),
    IN p_productName VARCHAR(100),
    IN p_productPrice DECIMAL(10, 2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus VARCHAR(50)
)
begin 
update Products
set 
productCode = p_productCode,
        productName = p_productName,
        productPrice = p_productPrice,
        productAmount = p_productAmount,
        productDescription = p_productDescription,
        productStatus = p_productStatus
    WHERE Id = p_Id;
    end // 
    delimiter ;
    
    delimiter //
    create procedure deleteProduct(
    in p_Id int
    )
    begin
    delete from Products where Id = p_Id;
    end //
    delimiter ;

