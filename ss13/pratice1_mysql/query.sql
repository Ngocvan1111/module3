use demo;
DELIMITER //
CREATE PROCEDURE get_user_by_id(in user_id int)
begin
select users.name, users.email, users.country
from users
where users.id = user_id;
end //
delimiter ;

delimiter //
create procedure insert_user(
	in user_name varchar(45),
    in user_email varchar(45),
    in user_country varchar(45)
)
begin
insert into users(name,email,country)values(user_name,user_email, user_country);
end//
delimiter ;

delimiter //
create procedure select_all()
begin
select* from users;
end //
delimiter ;

call select_all();

delimiter //
create procedure update_user(in user_id int, in user_name varchar(45),in user_email varchar(45), in user_country varchar(45))
begin
update users set name = user_name, email = user_email, country = user_country where id = user_id;
end //
delimiter ;

call update_user(7, "cam van","vn@gmail.com","Viet nam");

delimiter //
create procedure delete_user(in user_id int)
begin
delete from users where id = user_id;
end //
delimiter  ;

call delete_user(7);
