-- task3----
use furama_database;
select*FROM khach_hang where (((YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))) >= 18 && ((YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))) <= 50 && (dia_chi like "%Đà Nẵng%" or dia_chi like "%Quảng trị%" ));
-- task3--
