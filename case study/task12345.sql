-- task 2:
use furama_database ;
SELECT 
    *
FROM
    nhan_vien
WHERE
    ((ho_ten LIKE 'H%') OR (ho_ten LIKE 'T%')
        OR (ho_ten LIKE 'K%'))
        AND (CHAR_LENGTH(ho_ten) <= 15);

-- task3----
use furama_database;
SELECT 
    *
FROM
    khach_hang
WHERE
    (((YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))) >= 18
        && ((YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))) <= 50
        && (dia_chi LIKE '%Đà Nẵng%'
        OR dia_chi LIKE '%Quảng trị%'));

-- task4--
SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    COUNT(hd.ma_khach_hang) AS so_lan_dat_phong
FROM
    khach_hang kh
        JOIN
    hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
        JOIN
    loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
WHERE
    lk.ten_loai_khach = 'Diamond'
GROUP BY hd.ma_khach_hang
ORDER BY COUNT(hd.ma_khach_hang);

-- task 5--
SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    (dv.chi_phi_thue + SUM(dvdk.gia * hdct.so_luong)) AS tong_tien
FROM
    hop_dong hd
        LEFT JOIN
    khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
        LEFT JOIN
    loai_khach lk ON kh.ma_loai_khach = kh.ma_loai_khach
        LEFT JOIN
    dich_vu dv ON hd.ma_dich_vu = hd.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY hd.ma_hop_dong;
 
 -- task 6 --
SELECT 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        LEFT JOIN
    hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
WHERE
    dv.ma_dich_vu NOT IN (SELECT 
            hd.ma_dich_vu
        FROM
            hop_dong hd
        WHERE
            (YEAR(hd.ngay_lam_hop_dong) = 2021
                AND MONTH(hd.ngay_lam_hop_dong) BETWEEN 1 AND 3)
        GROUP BY hd.ma_dich_vu)
GROUP BY hd.ma_dich_vu;
 
 -- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.--
SELECT 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.so_nguoi_toi_da
FROM
    dich_vu dv
        JOIN
    hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
        JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE
    dv.ma_dich_vu IN (SELECT 
            dv.ma_dich_vu
        FROM
            dich_vu dv
                JOIN
            hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2020
        GROUP BY hd.ma_dich_vu)
        AND dv.ma_dich_vu NOT IN (SELECT 
            dv.ma_dich_vu
        FROM
            dich_vu dv
                JOIN
            hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2021
        GROUP BY hd.ma_dich_vu)
GROUP BY hd.ma_dich_vu
;

-- task8 --
SELECT 
    khach_hang.ho_ten
FROM
    khach_hang
GROUP BY khach_hang.ho_ten;

-- task8_2--
SELECT DISTINCT
    khach_hang.ho_ten
FROM
    khach_hang;

-- task8_3 --
SELECT 
    khach_hang.ho_ten
FROM
    khach_hang 
UNION SELECT 
    khach_hang.ho_ten
FROM
    khach_hang;

-- task 9 --
SELECT 
    MONTH(hop_dong.ngay_lam_hop_dong) AS thang,
    COUNT(hop_dong.ma_khach_hang) AS so_luong_nguoi_dat_dich_vu
FROM
    hop_dong
WHERE
    YEAR(hop_dong.ngay_lam_hop_dong) = 2021
GROUP BY MONTH(hop_dong.ngay_lam_hop_dong)
ORDER BY MONTH(hop_dong.ngay_lam_hop_dong);
 
 -- task 10 --
SELECT 
    hd.ma_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    hd.tien_dat_coc,
    IFNULL(SUM(hdct.so_luong), 0) AS so_luong_dich_vu_di_kem
FROM
    hop_dong hd
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY hd.ma_hop_dong;
 -- task 11--
SELECT 
    hdct.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
FROM
    khach_hang kh
        JOIN
    loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
        JOIN
    hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
WHERE
    lk.ten_loai_khach LIKE 'Diamond'
        AND kh.dia_chi LIKE '%Vinh'
        OR kh.dia_chi LIKE '%Quảng Ngãi';
 
 -- task 12 --
SELECT 
    hd.ma_hop_dong,
    nv.ho_ten,
    kh.ho_ten,
    kh.so_dien_thoai,
    dv.ten_dich_vu,
    IFNULL(SUM(hdct.so_luong), 0) AS so_luong_dich_vu_di_kem,
    hd.tien_dat_coc
FROM
    hop_dong hd
        LEFT JOIN
    nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
        LEFT JOIN
    khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
        LEFT JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
WHERE
    hd.ma_hop_dong IN (SELECT 
            hd.ma_hop_dong
        FROM
            hop_dong hd
        WHERE
            (MONTH(hd.ngay_lam_hop_dong) BETWEEN 10 AND 12)
                AND (YEAR(hd.ngay_lam_hop_dong) = 2020))
        AND hd.ma_hop_dong NOT IN (SELECT 
            hd.ma_hop_dong
        FROM
            hop_dong hd
        WHERE
            (MONTH(hd.ngay_lam_hop_dong) BETWEEN 01 AND 06)
                AND (YEAR(hd.ngay_lam_hop_dong) = 2021))
GROUP BY hdct.ma_hop_dong;
 
 -- task 13	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).--

CREATE VIEW sum_view AS
    SELECT 
        hdct.ma_dich_vu_di_kem AS ma_dich_vu_di_kem,
        SUM(hdct.so_luong) AS tong_lan_dung
    FROM
        hop_dong_chi_tiet hdct
    GROUP BY hdct.ma_dich_vu_di_kem;

SELECT 
    *
FROM
    dich_vu_di_kem
        JOIN
    sum_view ON dich_vu_di_kem.ma_dich_vu_di_kem = sum_view.ma_dich_vu_di_kem
WHERE
    dich_vu_di_kem.ma_dich_vu_di_kem IN (SELECT 
            sum_view.ma_dich_vu_di_kem
        FROM
            sum_view
        WHERE
            sum_view.tong_lan_dung IN (SELECT 
                    MAX(sum_view.tong_lan_dung)
                FROM
                    sum_view));

-- 14 Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem)--
 
SELECT 
    hdct.ma_hop_dong,
    hdct.ma_dich_vu_di_kem,
    ldv.ten_loai_dich_vu,
    dvdk.ten_dich_vu_di_kem,
    COUNT(hdct.ma_dich_vu_di_kem)
FROM
    hop_dong_chi_tiet hdct
        JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        JOIN
    hop_dong hd ON hdct.ma_hop_dong = hd.ma_hop_dong
        JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
GROUP BY dvdk.ma_dich_vu_di_kem
HAVING COUNT(hdct.ma_dich_vu_di_kem) = 1
ORDER BY hd.ma_hop_dong;
 
 -- 15-- 
SELECT 
    nv.ma_nhan_vien,
    nv.ho_ten,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi
FROM
    nhan_vien nv
        JOIN
    hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
        JOIN
    trinh_do td ON nv.ma_trinh_do = td.ma_trinh_do
        JOIN
    bo_phan bp ON nv.ma_bo_phan = bp.ma_bo_phan
WHERE
    YEAR(hd.ngay_lam_hop_dong) BETWEEN 2020 AND 2021
GROUP BY hd.ma_nhan_vien
HAVING (COUNT(hd.ma_nhan_vien) BETWEEN 1 AND 3);
 
 -- 16 Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021 --
 SET SQL_SAFE_UPDATES =0; 
 delete from  nhan_vien nv
	 where nv.ma_nhan_vien not in (select hop_dong.ma_nhan_vien
	 from hop_dong
	 where year(hop_dong.ngay_lam_hop_dong) in(2019,2020,2021))
	 ;
SELECT 
    *
FROM
    nhan_vien;
 
-- 17 Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ--
 


CREATE VIEW tong_view AS
    SELECT 
        ma_khach, tong_tien
    FROM
        (SELECT 
            hd.ma_khach_hang AS ma_khach,
                IFNULL(dv.chi_phi_thue, 0) + IFNULL(SUM(hdct.so_luong) * dvdk.gia, 0) AS tong_tien
        FROM
            hop_dong hd
        LEFT JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        LEFT JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
        LEFT JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = '2021'
        GROUP BY hd.ma_hop_dong
        ORDER BY hd.ma_hop_dong) AS a;

SELECT 
    *
FROM
    tong_view;
------------------- ================ ---------------
UPDATE khach_hang kh 
SET 
    kh.ma_loai_khach = 1
WHERE
    kh.ma_khach_hang IN (SELECT 
            *
        FROM
            (SELECT 
                kh.ma_khach_hang
            FROM
                khach_hang kh
            JOIN tong_view tv ON kh.ma_khach_hang = tv.ma_khach
            WHERE
                kh.ma_khach_hang IN (SELECT 
                        tv.ma_khach
                    FROM
                        tong_view)
                    AND tv.tong_tien > 1000000
                    AND kh.ma_loai_khach = 2) abc)
;

-- task 18 --
SET SQL_SAFE_UPDATES =0;
DELETE FROM khach_hang 
WHERE
    khach_hang.ma_khach_hang IN (SELECT 
        *
    FROM
        (SELECT 
            khach_hang.ma_khach_hang
        FROM
            khach_hang
        JOIN hop_dong ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
        
        WHERE
            YEAR(hop_dong.ngay_lam_hop_dong) < 2021) AS abc);

-- task 19 Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi--
UPDATE dich_vu_di_kem 
SET 
    gia = gia * 2
WHERE
    dich_vu_di_kem.ma_dich_vu_di_kem IN (SELECT 
            hop_dong_chi_tiet.ma_dich_vu_di_kem
        FROM
            hop_dong_chi_tiet
                JOIN
            hop_dong ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
        WHERE
            YEAR(hop_dong.ngay_lam_hop_dong) = 2020
        GROUP BY ma_dich_vu_di_kem
        HAVING SUM(so_luong) > 10);
-- task 20 Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi. -- 

SELECT 
    nv.ma_nhan_vien AS '#id',
    nv.ho_ten,
    nv.email,
    nv.so_dien_thoai,
    nv.ngay_sinh,
    nv.dia_chi
FROM
    nhan_vien nv 
UNION SELECT 
    kh.ma_khach_hang AS '#id',
    kh.ho_ten,
    kh.email,
    kh.so_dien_thoai,
    kh.ngay_sinh,
    kh.dia_chi
FROM
    khach_hang kh;

-- task 21	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”--

CREATE VIEW v_nhan_vien AS
    SELECT 
        *
    FROM
        nhan_vien
    WHERE
        nhan_vien.ma_nhan_vien IN (SELECT 
                *
            FROM
                (SELECT 
                    nhan_vien.ma_nhan_vien
                FROM
                    nhan_vien
                JOIN hop_dong ON hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
                WHERE
                    nhan_vien.dia_chi LIKE '% Hải Châu%'
                        AND hop_dong.ngay_lam_hop_dong = '2019-12-12') AS dbc);

SELECT 
    *
FROM
    v_nhan_vien;


-- task 22 Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này--
CREATE VIEW l_nhan_vien AS
    SELECT 
        *
    FROM
        v_nhan_vien;

UPDATE l_nhan_vien 
SET 
    l_nhan_vien.dia_chi = 'Liên Chiểu'
;
SELECT 
    *
FROM
    l_nhan_vien; 

-- task 23	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang--

DELIMITER //
CREATE PROCEDURE sp_xoa_khach_hang(IN ma_khach_hang_in int)
BEGIN
delete from khach_hang
where khach_hang.ma_khach_hang = ma_khach_hang_in;
END;
//DELIMITER ;

call sp_xoa_khach_hang(1);

-- task 24 Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.--

DELIMITER //
CREATE PROCEDURE sp_them_moi_hop_dong(in ma_hop_dong int ,
in ngay_lam_hop_dong datetime,
in ngay_ket_thuc datetime,
in tien_dat_coc double, 
in ma_nhan_vien int,
in ma_khach_hang int,
in ma_dich_vu int)
BEGIN
insert into hop_dong(ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
values
(ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu);
END;
//DELIMITER ;
call sp_them_moi_hop_dong(15,'2020-12-08','2020-12-08','0',3,1,3);

-- task 25 Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database --

CREATE TABLE data_history (
    tong_so_luong_ban_ghi_con_lai INT
);
delimiter //
create function abc ()
returns int
deterministic
begin
declare tong int default 0;
select count(hop_dong.ma_hop_dong) into tong from hop_dong;
return tong;
end //
delimiter ;
-- - --
delimiter //
create function abd ()
returns int
deterministic
begin
declare tong1 int default 0;
select count(data_history.tong_so_luong_ban_ghi_con_lai) into tong1 from data_history;
return tong1;
end //
delimiter ;

-- ---

drop table data_history;
DELIMITER //
CREATE trigger tr_xoa_hop_dong
  after delete on hop_dong 
  for each row
BEGIN
if abd() = 0 then 
insert into data_history(tong_so_luong_ban_ghi_con_lai) values (abc());
else 
SET SQL_SAFE_UPDATES =0; 
update data_history
set data_history.tong_so_luong_ban_ghi_con_lai = abc();
end if;
END;
//DELIMITER ;
drop trigger tr_xoa_hop_dong;

DELETE FROM hop_dong 
WHERE
    hop_dong.ma_hop_dong = 10;

SELECT 
    COUNT(ma_hop_dong) AS so_luong
FROM
    hop_dong;