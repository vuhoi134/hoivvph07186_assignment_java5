DeUSE master
GO
--Tạo CSDL Personel
CREATE DATABASE Assignment
GO
--Chọn CSDL làm việc
USE Assignment
GO
--Tạo bảng User lưu thông tin người sử dụng
drop table Users
CREATE TABLE Users(
	Username nvarchar(50) NOT NULL,
	Password nvarchar(50)  NULL,
	Fullname nvarchar(50) NULL,
	PRIMARY KEY(Username)
)
GO
--Tạo bảng Departs lưu thông tin phòng ban
drop table Departs
CREATE TABLE Departs(
	Id nvarchar(10) NOT NULL,
	Name nvarchar(50)  NULL,
	PRIMARY KEY(Id)
)
GO
--Tạo bảng Staffs lưu thông tin nhân viên
drop table Staffs
CREATE TABLE Staffs(
	Id bigint IDENTITY(1,1) NOT NULL,
	Name nvarchar(50) NOT NULL,
	Gender nvarchar(10)  NULL,
	Birthday date  NULL,
	Photo nvarchar(max)  NULL,
	Email nvarchar(50)  NULL,
	Phone nvarchar(25)  NULL,
	Salary float  NULL,
	Level int null,
	Notes nvarchar(500) NULL,
	DepartId nvarchar(10)  NULL,
	PRIMARY KEY(Id),
	FOREIGN KEY(DepartId) REFERENCES Departs(Id) ON DELETE CASCADE ON UPDATE CASCADE
)
GO
--Tạo bảng Records lưu thông tin thành tích và kỷ luật của nhân viên
Drop table Records
CREATE TABLE Records(
	Id bigint IDENTITY(1,1) NOT NULL,
	Type int  NULL,
	Reason nvarchar(200)  NULL,
	Date date NULL,
	StaffId bigint not null,
	PRIMARY KEY(Id),
	FOREIGN KEY(StaffId) REFERENCES Staffs(Id) ON DELETE NO ACTION ON UPDATE CASCADE
 )
 insert into Users values('PH1','123',N'Vũ Văn Hội')
 insert into Users values('PH2','123',N'Vũ QUốc Trung')
 insert into Users values('PH3','123',N'Vũ Thu Thủy')
  insert into Users values('PH4','123',N'Phan Tiến Đạt')
   insert into Users values('PH5','123',N'Nguyễn Văn Tùng')
    insert into Users values('PH6','123',N'Võ Tá Dũng')

--

--
insert into Departs values('IT',N'Công nghệ thông tin')
insert into Departs values('KD',N'Kinh doanh')
insert into Departs values('NS',N'Nhân sự')
insert into Departs values('KT',N'Kế Toán')
---

insert into Staffs values(N'Vũ Văn Hội',N'Nam','1997-08-07','/Assignment_war_exploded/images/avatar.jpg','vuhoi134@gmail.com','03664167896','100',1,N'Đang học bài','IT')
insert into Staffs values(N'Nguyễn Đạt',N'Nam','1997-02-07','','dat@gmail.com','03664167896','10000',1,N'Tốt','IT')
insert into Staffs values(N'Nguyễn Thị Trà',N'Nữ','1996-1-08','','tra12@gmail.com','03664167896','1000',1,N'Tốt','KD')
insert into Staffs values(N'Nguyễn Thu Thủy',N'Nữ','1997-08-08','','thuy@gmail.com','03664167896','1000',1,N'Tốt','KD')
insert into Staffs values(N'Phạm Thu Hằng',N'Nữ','1987-08-04','','hang12@gmail.com','03664167896','1000',1,N'Tốt','KD')
insert into Staffs values(N'Vũ Hùng',N'Nam','1977-08-08','','hung@gmail.com','03664167896','10000000',1,N'Đang đánh giá','NS')
insert into Staffs values(N'Nguyễn Tiến Đức',N'Nam','1992-08-22','','duc@gmail.com','03664167896','50000',1,N'Hay đi làm muộn','KT')
insert into Staffs values(N'Võ Tá Dũng',N'Nam','1999-08-08','','hung@gmail.com','03664167896','40000',1,N'Hay đi làm muộn','NS')
insert into Staffs values(N'Nguyễn Hồng Sơn',N'Nam','1994-08-04','','sonhq12@gmail.com','03664167896',1,'23000',N'Tốt','KT')
insert into Staffs values(N'Bồ Anh Hải',N'Nam','1999-08-08','','hai63@gmail.com','03664167896','5000',1,N'Đang đánh giá','NS')
insert into Staffs values(N'Vũ Văn Tuân','Nam','1993-08-08','','tuan12@gmail.com','03664167896','23000',1,N'Tốt','IT')
insert into Staffs values(N'Phan Ngọc Thành',N'Nam','1997-08-08','','thanh88@gmail.com','03664167896',1,'1100',N'Chưa tốt','IT')
---
select * from Departs
select * from Staffs
select * from Records
select * from Staffs
