create database rooms;
use rooms;
create table room (room_id int auto_increment primary key, name varchar(45), phone_number varchar(45), start_day date, type_pay_id int, note varchar(255));
create table type_pay (id int primary key, name varchar(45));

insert into room (name, phone_number,start_day,type_pay_id,note) values ("Lai van Ngoc","0393090815","1970-11-07",2,"nothing to note"); 

insert into type_pay (id,name) values (1,"Month"),(2,"Precious"),(3,"Year");


delimiter //
create procedure find_all()
begin
select r.*, t.name as type_pay_name from room r join type_pay t on r.type_pay_id = t.id;
end //
delimiter ;

call find_all();