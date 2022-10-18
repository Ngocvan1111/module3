create database QuanLyBanHang;
use QuanLyBanHang;
create table customer(
id varchar(25) primary key,
name varchar(25),
age int
);
create table the_order(
id varchar(25) primary key,
customer_id varchar(25),
foreign key(customer_id) references customer(id),
date_order date,
total_price double
);
create table product(
id varchar(25) primary key,
name varchar(25),
price double
);
create table order_detail(
order_id varchar(25),
product_id varchar(25),
primary key(order_id,product_id),
foreign key (order_id) references the_order(id),
foreign key (product_id) references product(id),
quantity int
);
---------------------------------
use QuanLyBanHang;
insert into customer(id,name,age)
values
(1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',10);

insert into the_order(id,customer_id,date_order,total_price)
values
(1, 1, '2006-03-21', null),
(2, 2, '2006-03-23', null),
(3, 1, '2006-03-16', null);
SET SQL_SAFE_UPDATES = 0;
		update the_order
        set date_order = '2006-03-16'
        where id = 3;
insert into product value
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

insert into order_detail value 
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);        
------------------------------------
-- Hiện thị các thông tin gồm oId, odate, oprice của tất cả các hóa đơn trong bảng Order--
select id,date_order,total_price
from the_order;
-- Hiện thị danh sách các khách hàng đã mua hàng và danh sách sản phẩm được mua bởi các khách--
select customer.name as khach_hang, product.name as san_pham
from customer
join the_order on customer.id = the_order.customer_id
join order_detail on the_order.id = order_detail.order_id
join product on order_detail.product_id = product.id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào --
select customer.name as khach_hang
from customer
left join the_order on customer.id = the_order.customer_id
where the_order.customer_id is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)--
select the_order.id,the_order.date_order,product.price*order_detail.quantity as gia_tien
from the_order
join order_detail on the_order.id = order_detail.order_id
join product on order_detail.product_id = product.id