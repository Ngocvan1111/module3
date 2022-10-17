create database in_out_materials;
use in_out_materials;
create table export_bill(
id int primary key,
date_export date
);
create table materials(
id varchar(10) primary key,
material_name varchar(25)
);
create table export_bill_materials_bridge(
export_id int,
meterials_id varchar(10),
primary key(export_id,meterials_id),
export_price float,
export_volume int,
foreign key(export_id)references export_bill(id),
foreign key(meterials_id) references materials(id)
);
create table import_bill(
id int primary key,
date_import date
);
create table import_bill_materials_bridge(
import_id int,
meterials_id varchar(10),
primary key(import_id,meterials_id),
import_price float,
import_volume int,
foreign key(import_id)references import_bill(id),
foreign key(meterials_id) references materials(id)
);
create table supplier(
supplier_code varchar(20) primary key,
supplier_name varchar(20),
address varchar(45)
);
create table the_order(
supplier_code1 varchar(20),
foreign key(supplier_code1) references supplier(supplier_code),
id int primary key,
date_order date
);
create table order_materials_bridge(
materials_id varchar(10),
order_id int,
primary key(materials_id,order_id),
foreign key(order_id) references the_order(id),
foreign key(materials_id) references materials(id)
);

create table phone_number(
phone_number int primary key,
supplier_code varchar(20),
foreign key(supplier_code) references supplier(supplier_code)
);
