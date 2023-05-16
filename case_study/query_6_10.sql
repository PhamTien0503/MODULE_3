use furama_management;
-- 6.  Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được 
-- khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select 
  dv.ma_dich_vu, 
  dv.ten_dich_vu, 
  dv.dien_tich, 
  dv.chi_phi_thue, 
  ldv.ten_loai_dich_vu 
from 
  dich_vu dv 
  join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu 
  left join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu 
where 
  dv.ma_dich_vu not in (
    select 
      hd.ma_dich_vu 
    from 
      hop_dong hd 
    where 
      quarter(hd.ngay_lam_hop_dong)= 1 
      and year(hd.ngay_lam_hop_dong)= 2021
  ) 
group by 
  dv.ma_dich_vu;
-- 7.  Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
-- đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select 
  dv.ma_dich_vu, 
  dv.ten_dich_vu, 
  dv.dien_tich, 
  dv.so_nguoi_toi_da, 
  dv.chi_phi_thue, 
  ldv.ten_loai_dich_vu 
from 
  dich_vu dv 
  join loai_dich_vu ldv 
  join hop_dong hd on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu 
  and hd.ma_dich_vu = dv.ma_dich_vu 
where 
  dv.ma_dich_vu not in (
    select 
      dv.ma_dich_vu 
    from 
      dich_vu dv 
      join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu 
    where 
      year(hd.ngay_lam_hop_dong) = 2021
  ) 
  and year(hd.ngay_lam_hop_dong) = 2020 
group by 
  dv.ma_dich_vu;
-- 8.  Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

select 
  distinct kh.ho_ten 
from 
  khach_hang kh;
select 
  kh.ho_ten 
from 
  khach_hang kh;
select 
  kh.ho_ten 
from 
  khach_hang kh 
union 
select 
  kh.ho_ten 
from 
  khach_hang kh;
  
-- 9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select 
  month(hd.ngay_lam_hop_dong) 'thang', 
  count(*) 'luot_dat_phong' 
from 
  hop_dong hd 
group by 
  thang;
  
-- 10.Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong,ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select 
  hd.ma_hop_dong, 
  hd.ngay_lam_hop_dong, 
  hd.ngay_ket_thuc, 
  hd.tien_dat_coc, 
  count(dvdk.ma_dich_vu_di_kem) as 'so_luong_dich_vu_di_kem' 
from 
  hop_dong hd 
  join hop_dong_chi_tiet hdct 
  join dich_vu_di_kem dvdk on hdct.ma_hop_dong = hd.ma_hop_dong 
  and hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
group by 
  ma_hop_dong;
