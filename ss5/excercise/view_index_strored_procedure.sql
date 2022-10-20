CREATE DATABASE demo;
USE demo;
CREATE TABLE products(
	id INT,
	product_code VARCHAR(25),
	product_name VARCHAR(45),
	product_price DOUBLE,
	product_amount INT,
	product_description VARCHAR(200),
	product_status VARCHAR(45) 
	);
INSERT INTO demo.products
VALUES   
(1,"p123","chuột",100000,2,"Đây là sản phẩm tốt nhất","Đang còn hàng"), 
(2,"p124","bàn phím",200000,3,"Đây là sản phẩm tốt gần nhất","Đang còn hàng") ,
(3,"p125","laptop",300000,4,"Đây là sản phẩm tốt gần gần nhất","Hết hàng") ,
(4,"p126","bút",400000,5,"Đây là sản phẩm tốt tốt nhất","Đang còn hàng"); 
 
 -- Bước 3--
CREATE UNIQUE INDEX unique1 ON products(product_code);
EXPLAIN SELECT*FROM products WHERE product_code = "p123";
ALTER TABLE products DROP INDEX unique1;
EXPLAIN SELECT*FROM products WHERE product_code = "p123";
-- Bước 4--

CREATE VIEW products_view AS
	SELECT product_code,product_name,product_price,product_status
	FROM products;
SELECT*FROM products_view;
CREATE OR REPLACE VIEW products_view AS
	SELECT product_code,product_name,product_price,product_status,id
		FROM products;
 SELECT*FROM products_view;   
DROP VIEW products_view;

-- Bước 5 --

delimiter //
create procedure products_sp()
begin
select* from products;
end//
delimiter ;

call products_sp();

delimiter //
create procedure add_product()
begin
insert into demo.products(id,product_code,product_name,product_price,product_amount,product_description,product_status)
values
(id,product_code,product_name,product_price,product_amount,product_description,product_status);
end //
delimiter ;
call add_product();
select*from products;

--