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
select kh.ma_khach_hang , kh.ho_ten,lk.ten_loai_khach ,hd.ma_hop_dong , dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, (dv.chi_phi_thue+dvdk.gia*hdct.so_luong) as tong_tien
from  khach_hang kh
 left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
 left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
 left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
 left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
 left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem







