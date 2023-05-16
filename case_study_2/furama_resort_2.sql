create database furama_management_2;
use furama_management_2;


create table position (
id int primary key auto_increment,
name varchar(45)
);

create table education_degree (
id int primary key auto_increment,
name varchar(45)
);

create table division (
id int primary key auto_increment,
name varchar(45)
);

create table employee (
id int primary key auto_increment,
name varchar(45),
date_of_birth date,
id_card varchar(45),
salary double,
phone_number varchar(45),
email varchar(45),
address varchar(45),
position_id int,
foreign key (position_id) references position (id) on delete set null,
education_degree_id int,
foreign key (education_degree_id) references education_degree(id),
division_id int,
foreign key (division_id) references division (id)
);

update employee set name='Tien',date_of_birth='1994-01-01',id_card='1312433423',salary=300000000,phone_number='01233434234',
email='232334234234',address='fsdfsdf',position_id=1,education_degree_id=2,division_id=3 where id=3;

insert into employee (name,date_of_birth,id_card,salary,phone_number,
email,address,position_id,education_degree_id,division_id)
values ('Tien','1994-01-01','21312123',12312321,'123123213','123123','123213',1,1,1);


create table customer_type (
id int primary key auto_increment,
name varchar(45)
);

create table customer (
id int primary key auto_increment,
customer_type_id int,
foreign key (customer_type_id) references customer_type (id),
name varchar(45),
date_of_birth date,
gender bit(1),
id_card varchar(45),
phone_number varchar(45),
email varchar(45),
address varchar(45)
);

create table facility_type (
id int primary key auto_increment,
name varchar(45)
);

create table rent_type (
id int primary key auto_increment,
name varchar(45)
);

create table facility (
id int primary key auto_increment,
name varchar(45),
area int,
cost double,
max_people int,
rent_type_id int,
facility_type_id int,
foreign key (rent_type_id) references rent_type(id),
foreign key (facility_type_id) references facility_type(id),
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int,
facility_free text
);

create table contract (
id int primary key auto_increment,
start_date datetime,
end_date datetime,
deposit double,
employee_id int,
customer_id int,
facility_id int,
foreign key (employee_id) references employee(id),
foreign key (customer_id) references customer(id),
foreign key (facility_id) references facility(id)
);

create table attach_facility (
id int primary key auto_increment,
name varchar(45),
cost double,
unit varchar(10),
status varchar(45)
);

create table contract_detail (
id int primary key auto_increment,
contract_id int,
attach_facility_id int,
foreign key (contract_id) references contract(id),
foreign key (attach_facility_id) references attach_facility(id),
quantity int
);

select * from customer_type;
select * from customer;

select c.*, ct.id as customer_type_id, ct.name from customer c
join customer_type ct on c.customer_type_id=ct.id;

insert into customer ( customer_type_id,name ,date_of_birth ,gender ,id_card ,phone_number ,email ,address)
values (1,'Sy', '1994-01-01',1,'02222334445','0383561453','phatien@gmail.com','Da nang');

select * from customer c;



delete from customer where id=11;

select * from customer where id=2 and name like '%The%';

select * from facility_type;

insert into facility (name ,area ,cost,max_people ,standard_room ,
description_other_convenience ,pool_area ,number_of_floors ,facility_free ,rent_type_id ,facility_type_id)
values 
  (
    'Villa Beach Front', 25000, 1000000, 
    10, 'vip', 'Có hồ bơi', 500, 4, 
    null, 3, 1
  ), 
  (
    'House Princess 01', 14000, 5000000, 
    7, 'vip', 'Có thêm bếp nướng', 
    null, 3, null, 2, 2
  ), 
  (
    'Room Twin 01', 5000, 1000000, 2, 
    'normal', 'Có tivi', null, null, 
    '1 Xe máy, 1 Xe đạp', 4, 3
  ), 
  (
   'Villa No Beach Front', 22000, 
    9000000, 8, 'normal', 'Có hồ bơi', 
    300, 3, null, 3, 1
  ), 
  (
    'House Princess 02', 10000, 4000000, 
    5, 'normal', 'Có thêm bếp nướng', 
    null, 2, null, 3, 2
  ), 
  (
    'Room Twin 02', 3000, 900000, 2, 
    'normal', 'Có tivi', null, null, 
    '1 Xe máy', 4, 3
  );

select * from rent_type;

select * from facility;

insert into facility (name ,area ,cost,max_people ,standard_room ,
description_other_convenience ,pool_area ,number_of_floors ,facility_free ,rent_type_id ,facility_type_id)
values 
  (
    'Villa Beach Front', 25000, 1000000, 
    10, 'vip', 'Có hồ bơi', 500, 4, 
    null, 3, 1
  ); 
  
  update facility f set f.name='room 100' ,f.area=500,f.cost=400000000 ,f.max_people=4 ,f.standard_room='vip' ,
  f.description_other_convenience='perfect' ,f.pool_area=300 ,f.number_of_floors=5 ,f.facility_free='wifi' ,
  f.rent_type_id=2 ,f.facility_type_id=2 where f.id=3;

delete from facility where id=6;

select * from facility where id like '%2%' and name like'%%';

insert into position 
values 
  (1, 'Quản Lý'), 
  (2, 'Nhân Viên');
  
  insert into education_degree 
values 
  (1, 'Trung Cấp'), 
  (2, 'Cao Đẳng'), 
  (3, 'Đại Học'), 
  (4, 'Sau Đại Học');
  
  insert into division 
values 
  (1, 'Sale-Marketing'), 
  (2, 'Hành chính'), 
  (3, 'Phục vụ'), 
  (4, 'Quản lý');
  
  INSERT INTO employee 
VALUES 
  (
    1, 'Nguyễn Văn An', '1970-11-07', 
    '456231786', 10000000, '0901234121', 
    'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 
    1, 3, 1
  ), 
  (
    2, 'Lê Văn Bình', '1997-04-09', 
    '654231234', 7000000, '0934212314', 
    'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 
    1, 2, 2
  ), 
  (
    3, 'Hồ Thị Yến', '1995-12-12', 
    '999231723', 14000000, '0412352315', 
    'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 
    1, 3, 2
  ), 
  (
    4, 'Võ Công Toản', '1980-04-04', 
    '123231365', 17000000, '0374443232', 
    'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 
    1, 4, 4
  ), 
  (
    5, 'Nguyễn Bỉnh Phát', '1999-12-09', 
    '454363232', 6000000, '0902341231', 
    'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', 
    2, 1, 1
  ), 
  (
    6, 'Khúc Nguyễn An Nghi', '2000-11-08', 
    '964542311', 7000000, '0978653213', 
    'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', 
    2, 2, 3
  ), 
  (
    7, 'Nguyễn Hữu Hà', '1993-01-01', 
    '534323231', 8000000, '0941234553', 
    'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', 
    2, 3, 2
  ), 
  (
    8, 'Nguyễn Hà Đông', '1989-09-03', 
    '234414123', 9000000, '0642123111', 
    'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', 
    2, 4, 4
  ), 
  (
    9, 'Tòng Hoang', '1982-09-03', '256781231', 
    6000000, '0245144444', 'hoangtong@gmail.com', 
    '213 Hàm Nghi, Đà Nẵng', 2, 
    4, 4
  ), 
  (
    10, 'Nguyễn Công Đạo', '1994-01-08', 
    755434343, 8000000, '0988767111', 
    'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', 
    2, 3, 2
  );
  
  select * from employee;
  
  delete from employee where id=5;
  
  select * from employee where name like '%%' and position_id like '%2%';
    
  update customer c set c.customer_type_id=2, c.name='The', c.date_of_birth='1994-02-01', c.gender=1, c.id_card='03203023', c.phone_number='123123213',c.email='12321312',c.address='fasfadfsdaf'where c.id=2;


  
  





