use furama_management;

-- 16.  Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SET 
  SQL_SAFE_UPDATES = 0;

delete from 
  nhan_vien nv 
where 
  nv.ma_nhan_vien not in (
    select 
      hd.ma_nhan_vien 
    from 
      hop_dong hd 
    where 
      year(hd.ngay_lam_hop_dong) in (2019, 2020, 2021)
  );
  
--  17.  Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
--  chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
update 
  khach_hang 
set 
  khach_hang.ma_loai_khach = 1 
where 
  khach_hang.ma_khach_hang in (
    select 
      bang_tong_chi_phi.ma_khach_hang 
    from 
      (
        select 
          chi_phi_dvdk.ma_khach_hang, 
          sum(
            chi_phi_dvdk.chi_phi_thue + chi_phi_dvdk.tong_dich_vu_di_kem
          ) as tong_chi_phi 
        from 
          (
            select 
              kh.ma_khach_hang, 
              dv.chi_phi_thue, 
              sum(hdct.so_luong * dvdk.gia) as tong_dich_vu_di_kem 
            from 
              khach_hang kh 
              left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach 
              left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang 
              left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu 
              left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
              left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
            where 
              year(hd.ngay_lam_hop_dong)= 2021 
              and lk.ten_loai_khach = "Platinium" 
            group by 
              hd.ma_hop_dong
          ) as chi_phi_dvdk 
        group by 
          chi_phi_dvdk.ma_khach_hang 
        having 
          tong_chi_phi >= 1000000
      ) as bang_tong_chi_phi
  );
  
-- 18.  Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
delete from 
  khach_hang 
where 
  khach_hang.ma_khach_hang in (
    select 
      hd.ma_khach_hang 
    from 
      hop_dong hd 
    where 
      year(hd.ngay_lam_hop_dong) < 2021
  );
  
-- 19.  Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update 
  dich_vu_di_kem dvdk 
set 
  dvdk.gia = 2 * dvdk.gia 
where 
  dvdk.ma_dich_vu_di_kem in (
    select 
      bang1.ma_dich_vu_di_kem 
    from 
      (
        select 
          dvdk.ma_dich_vu_di_kem, 
          dvdk.ten_dich_vu_di_kem, 
          hdct.ma_hop_dong, 
          sum(hdct.so_luong) as so_lan_su_dung 
        from 
          hop_dong_chi_tiet hdct 
          join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
          join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong 
        where 
          year(hd.ngay_lam_hop_dong)= 2020 
        group by 
          dvdk.ma_dich_vu_di_kem 
        having 
          so_lan_su_dung > 10
      ) bang1
  );
  
-- 20.  Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), 
-- ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select 
  ma_nhan_vien as id, 
  ho_ten, 
  email, 
  so_dien_thoai, 
  ngay_sinh, 
  dia_chi 
from 
  nhan_vien 
union all 
select 
  ma_khach_hang, 
  ho_ten, 
  email, 
  so_dien_thoai, 
  ngay_sinh, 
  dia_chi 
from 
  khach_hang;
