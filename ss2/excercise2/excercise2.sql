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