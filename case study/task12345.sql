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
 select hd.ma_hop_dong ,nv.ho_ten,kh.ho_ten,kh.so_dien_thoai,dv.ten_dich_vu,ifnull(sum(hdct.so_luong),0)  as so_luong_dich_vu_di_kem,hd.tien_dat_coc
	 from hop_dong hd
	 left join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
	 left join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
	 left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
	 left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
	 where hd.ma_hop_dong in ( select hd.ma_hop_dong
	 from hop_dong hd
	 where (month(hd.ngay_lam_hop_dong) between 10 and 12) and (year(hd.ngay_lam_hop_dong) = 2020)) and hd.ma_hop_dong not in ( 
	  select hd.ma_hop_dong
	 from hop_dong hd
	 where (month(hd.ngay_lam_hop_dong) between 01 and 06) and (year(hd.ngay_lam_hop_dong) = 2021))
	 group by hdct.ma_hop_dong;
 
 -- task 13	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).--

create view sum_view as
	select hdct.ma_dich_vu_di_kem as ma_dich_vu_di_kem, sum(hdct.so_luong) as tong_lan_dung
	from hop_dong_chi_tiet hdct
	group by hdct.ma_dich_vu_di_kem;

select * 
	from dich_vu_di_kem 
	join sum_view on dich_vu_di_kem.ma_dich_vu_di_kem = sum_view.ma_dich_vu_di_kem
	where dich_vu_di_kem.ma_dich_vu_di_kem in (select sum_view.ma_dich_vu_di_kem
	from sum_view
	where sum_view.tong_lan_dung in  (select max(sum_view.tong_lan_dung) from sum_view));

-- 14 Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem)--
 
 select hdct.ma_hop_dong,hdct.ma_dich_vu_di_kem,ldv.ten_loai_dich_vu,dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem)
 from hop_dong_chi_tiet hdct
 join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
 join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
 join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
 join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
 group by dvdk.ma_dich_vu_di_kem
 having count(hdct.ma_dich_vu_di_kem) = 1
 order by hd.ma_hop_dong;
 
 -- 15-- 
 select nv.ma_nhan_vien,nv.ho_ten,td.ten_trinh_do,bp.ten_bo_phan,nv.so_dien_thoai,nv.dia_chi
 from nhan_vien nv
 join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
 join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
 join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
 where year(hd.ngay_lam_hop_dong ) between 2020 and 2021
  group by hd.ma_nhan_vien
 having (count(hd.ma_nhan_vien) between 1 and 3);

 







