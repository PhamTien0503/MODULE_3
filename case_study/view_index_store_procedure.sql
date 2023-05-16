create database demo;
use demo;

-- Tạo bảng Products với các trường dữ liệu sau:Id, productCode, productName, productPrice, productAmount, productDescription,, productStatus;
create table products (
  id int primary key, 
  product_code varchar(50), 
  product_name varchar(50), 
  product_price int, 
  product_amount int, 
  product_description varchar(50), 
  product_status bit
);
select 
  * 
from 
  products;
insert into products 
VALUES 
  (
    1, 'Y1', 'exciter', 40000000, 5, 'fast', 1
  ), 
  (
    2, 'Y2', 'sirius', 20000000, 10, 'slow', 1
  ), 
  (
    3, 'Y3', 'liux', 12000000, 3, 'perfect', 1
  ), 
  (
    4, 'H1', 'air black', 45000000, 2, 'beautiful', 1
  ), 
  (
    5, 'H2', 'wave', 12000000, 14, 'bad', 1
  );
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index

-- Unique index được sử dụng không chỉ để tăng hiệu suất, mà còn cho mục đích toàn vẹn dữ liệu.
-- Một Unique index không cho phép bất kỳ bản sao giá trị nào được chèn vào trong bảng.
create unique index i_product_code on products (product_code);
create index i_product_name_price on products(product_name, product_price);

explain 
select 
  * 
from 
  products 
where 
  products.product_code = 'Y3';
  
explain 
select 
  * 
from 
  products 
where 
  products.product_name = 'wave' 
  and product_price = 12000000;
  
drop 
  index i_product_code on products;
  
insert into products 
values 
  (
    6, 'Y3', 'liux', 12000000, 3, 'perfect', 1
  );
  
delete from 
  products 
where 
  products.id = 6;
  
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
-- Tiến hành sửa đổi view
-- Tiến hành xoá view
create view product_view as 
select 
  product_code, 
  product_name, 
  product_price, 
  product_status 
from 
  products;
  
select 
  * 
from 
  product_view;
  
update 
  product_view 
set 
  product_price = 40000000 
where 
  product_code = "Y2";
  
drop 
  view product_view;
  
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
-- Tạo store procedure thêm một sản phẩm mới
-- Tạo store procedure sửa thông tin sản phẩm theo id
-- Tạo store procedure xoá sản phẩm theo id
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter // 
create procedure infor_product () 
begin 
select 
  * 
from 
  products;
end;
// delimiter ;

call infor_product ();

-- Tạo store procedure thêm một sản phẩm mới
delimiter // 
create procedure insert_product(
  id int, 
  product_code varchar(50), 
  product_name varchar(50), 
  product_price int, 
  product_amount int, 
  product_description varchar(50), 
  product_status bit
) begin insert into products 
values 
  (
    id, product_code, product_name, product_price, 
    product_amount, product_description, 
    product_status
  );
end;
// delimiter ;

call insert_product (
  6, 'Y4', 'Exciter2', 30000000, 12, "good", 1
);

--  Tạo store procedure sửa thông tin sản phẩm theo id
delimiter // 
create procedure edit_product (
  id int, 
  product_code varchar(50), 
  product_name varchar(50), 
  product_price int, 
  product_amount int, 
  product_description varchar(50), 
  product_status bit
) begin 
update 
  products p 
set 
  p.product_code = product_code, 
  p.product_name = product_name, 
  p.product_price = product_price, 
  p.product_amount = product_amount, 
  p.product_description = product_description, 
  p.product_status = product_status 
where 
  p.id = id;
end;
// delimiter ;

call edit_product (
  2, 'Y5', 'Dream', 19000000, 0, "slow", 0
);

-- Tạo store procedure xoá sản phẩm theo id
delimiter // 
create procedure delete_product (id int) 
begin 
delete from 
  products p 
where 
  p.id = id;
end;
// delimiter ;
drop procedure delete_product;
call delete_product (6);
