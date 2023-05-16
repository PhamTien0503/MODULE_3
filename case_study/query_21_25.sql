use furama_management;

-- 21.  Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Đà Nẵng” 
--      và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với năm lập hợp đồng là “2020, 2021”.
create view nhan_vien_view as (
  select 
    nv.* 
  from 
    nhan_vien nv 
    join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien 
  where 
    nv.dia_chi like "%Đà Nẵng" 
    and year(hd.ngay_lam_hop_dong) in (2020, 2021)
);

-- 22.  Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
update 
  nhan_vien_view nvv 
set 
  nvv.dia_chi = 'Liên Chiểu';
  
-- 23.  Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với 
-- ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
delimiter //
 create procedure sp_xoa_khach_hang (ma_khach_hang int)
begin 
delete from 
  khach_hang 
where 
  khach_hang.ma_khach_hang = ma_khach_hang;
end;
// delimiter ;

select 
  * 
from 
  khach_hang;
  
call sp_xoa_khach_hang(1);

-- 24.  Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải 
-- thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn
--  tham chiếu đến các bảng liên quan.
delimiter // 
create procedure sp_them_moi_hop_dong (
  ma_hop_dong int, ngay_lam_hop_dong datetime, 
  ngay_ket_thuc datetime, tien_dat_coc double, 
  ma_nhan_vien int, ma_khach_hang int, 
  ma_dich_vu int
) begin
 if (
  ma_hop_dong not in (
    select 
      hd.ma_hop_dong 
    from 
      hop_dong hd
  ) 
  and ma_nhan_vien in (
    select 
      nv.ma_nhan_vien 
    from 
      nhan_vien nv
  ) 
  and ma_khach_hang in (
    select 
      kh.ma_khach_hang 
    from 
      khach_hang kh
  ) 
  and ma_dich_vu in (
    select 
      dv.ma_dich_vu 
    from 
      dich_vu dv
  )
) then 
insert into hop_dong 
values 
  (
    ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, 
    tien_dat_coc, ma_nhan_vien, ma_khach_hang, 
    ma_dich_vu
  );
else signal sqlstate "50000" 
set 
  message_text = "Id hợp đồng đã tồn tại hoặc
 mã nhân viên, mã khách hàng, mã dịch vụ nhập vào chưa có dữ liệu để đảm bảo ràng buộc foreign key ";
end if;
end;
// delimiter ;

call sp_them_moi_hop_dong (
  1, '2020-12-08', '2020-12-08', 0, 3, 
  1, 3
);

--  25.  Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị 
-- tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
-- Tạo bảng ghi log
create table lich_su_xoa_hop_dong(
  id int auto_increment primary key, ma_hop_dong_xoa int, 
  ngay_xoa datetime, so_luong_hop_dong_con_lai int
);

-- Tạo trigger
delimiter // 
create trigger tr_xoa_hop_dong 
after delete on hop_dong 
for each row 
begin
insert into lich_su_xoa_hop_dong (
    ma_hop_dong_xoa, ngay_xoa, so_luong_hop_dong_con_lai
  ) 
values 
  (
    old.ma_hop_dong, 
    now(), 
    (
      select 
        count(*) 
      from 
        hop_dong
    )
  );
end;
// delimiter ;

select 
  * 
from 
  hop_dong;
  
drop 
  trigger tr_xoa_hop_dong;
  
delete from 
  hop_dong hd 
where 
  hd.ma_hop_dong = 14;
  
select 
  * 
from 
  lich_su_xoa_hop_dong;




 
