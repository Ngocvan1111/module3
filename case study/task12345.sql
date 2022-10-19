-- task 2:
use furama_database ;
select *from nhan_vien where ((ho_ten like "H%") or (ho_ten like "T%") or (ho_ten like "K%")) and (char_length(ho_ten) <=15) ;

-- task3----
use furama_database;
select*FROM khach_hang where (((YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))) >= 18 && ((YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))) <= 50 && (dia_chi like "%Đà Nẵng%" or dia_chi like "%Quảng trị%" ));

-- task4--
select kh.ma_khach_hang,kh.ho_ten,count(hd.ma_khach_hang) as so_lan_dat_phong
from  khach_hang kh
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = "Diamond"
group by hd.ma_khach_hang
order by count(hd.ma_khach_hang) ;

-- task 5--
 select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong,hd.ngay_ket_thuc, (dv.chi_phi_thue +sum(dvdk.gia*hdct.so_luong)) as tong_tien
from hop_dong hd
left join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
left join loai_khach lk on kh.ma_loai_khach = kh.ma_loai_khach
left join dich_vu dv on hd.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hd.ma_hop_dong;
 
 -- task 6 --
 -- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).--
 select dv.ma_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,ldv.ten_loai_dich_vu
 from dich_vu dv
 join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
 left join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
 where dv.ma_dich_vu not in (  select hd.ma_dich_vu
 from hop_dong hd
 where (year(hd.ngay_lam_hop_dong) = 2021 and month(hd.ngay_lam_hop_dong) between 1 and 3)
 group by hd.ma_dich_vu) 
 group by hd.ma_dich_vu;
 
 -- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.--
 select dv.ma_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.so_nguoi_toi_da
 from dich_vu dv
 join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
 join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
 where dv.ma_dich_vu in (select dv.ma_dich_vu
from dich_vu dv
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2020
group by hd.ma_dich_vu)
 and dv.ma_dich_vu not in (select dv.ma_dich_vu
from dich_vu dv
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2021
group by hd.ma_dich_vu)
group by hd.ma_dich_vu
;

-- task8 --
select khach_hang.ho_ten
from khach_hang
group by khach_hang.ho_ten;

-- task8_2--
select distinct khach_hang.ho_ten
from khach_hang;  

-- task8_3 --
select khach_hang.ho_ten
from khach_hang
union
select khach_hang.ho_ten
from khach_hang;

-- task 9 --
select month(hop_dong.ngay_lam_hop_dong) as thang, count(hop_dong.ma_khach_hang) as so_luong_nguoi_dat_dich_vu
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2021
group by month(hop_dong.ngay_lam_hop_dong)
order by month(hop_dong.ngay_lam_hop_dong);
 
 -- task 10 --
select hd.ma_hop_dong,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,hd.tien_dat_coc, ifnull(sum(hdct.so_luong), 0) as so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hd.ma_hop_dong;
 -- task 11--
 select hdct.ma_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem
 from khach_hang kh
 join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
 join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
 join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
 join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
 where lk.ten_loai_khach like 'Diamond' and kh.dia_chi like '%Vinh' or kh.dia_chi like '%Quảng Ngãi';
 
 -- task 12 --
 

 

 







