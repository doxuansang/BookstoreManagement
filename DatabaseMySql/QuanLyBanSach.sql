use sys;
drop database if exists QuanLyBanSach;
create database QuanLyBanSach;
use QuanLyBanSach;

create table Sach
(
	MaSach char(5),
    TenSach nvarchar(50),
    LoaiSach nvarchar(30),
    TacGia nvarchar(30),
    Gia double,
    SoLuong int,
    
    constraint PK_Sach primary key (MaSach)
);

create table NhanVien
(
	MaNV varchar(5),
    TenNV nvarchar(30),
    DienThoai varchar(100),
    DiaChi nvarchar(50),
    Email varchar(50),
    MatKhau varchar(255),
    VaiTro nvarchar(100),
    
    constraint PK_NhanVien primary key (MaNV)
);

create table KhachHang
(
	MaKH char(5),
    TenKH nvarchar(30),
    DienThoai char(10),
    DiaChi nvarchar(50),
    Email varchar(50),
    TienNo double,
    
    constraint PK_KhachHang primary key (MaKH)
);

create table HoaDon
(
	MaHD char(5),
    NgayLap date,
    MaKH char(5),
    TongTien int,
    ThanhToan int,
    TienNo int,
    
    constraint PK_HoaDon primary key (MaHD)
);

create table HoaDon_Sach
(
	MaHD char(5),
    MaSach char(5),
    SoLuong int,
    
    constraint PK_HoaDon_Sach primary key (MaHD, MaSach)
);

create table PhieuNhapSach
(
	MaPNS char(5),
    NgayLap date,
    
    constraint PK_PhieuNhapSach primary key (MaPNS)
);

create table PhieuNhapSach_Sach
(
	MaPNS char(5),
    MaSach char(5),
    SoLuong int,
    
    constraint PK_PhieuNhapSach_Sach primary key (MaPNS, MaSach)
);

create table PhieuThuTienNo
(
	MaPTTN char(5),
    MaKH char(5),
    NgayLap date,
    TienThu int,
    
    constraint PK_PhieuThuTienNo primary key (MaPTTN)
);

create table BaoCaoTonKho
(
	Thang int,
    Nam int, 
    MaSach char(5),
    TonDau int,
    PhatSinh int,
    
    constraint PK_BaoCaoTonKho primary key (Thang, Nam, MaSach)
);

create table BaoCaoCongNo
(
	Thang int,
    Nam int,
    MaKH char(5),
    NoDau int,
    PhatSinh int,
    
    constraint PK_BaoCaoCongNo primary key (Thang, Nam, MaKH)
);
 
 create table QuyDinh
(
    keyword int,
	SLNhapToiThieu int,
    SLTonToiDa int,
    TienNoToiDa int,
    LuongTonToiThieuSauKhiBan int,
    TienThuKhongVuotQuaTienNo int,
    
    constraint QuyDinh primary key (keyword)
);

alter table HoaDon
    add constraint FK_HoaDon_KhachHang foreign key (MaKH) references KhachHang(MaKH);
    
alter table HoaDon_Sach
	add constraint FK_HoaDon_Sach_HoaDon foreign key (MaHD) references HoaDon(MaHD),
    add constraint FK_HoaDon_Sach_Sach foreign key (MaSach) references Sach(MaSach);
    
alter table PhieuNhapSach_Sach
	add constraint FK_PhieuNhapSach_Sach_PhieuNhapSach foreign key (MaPNS) references PhieuNhapSach(MaPNS),
    add constraint FK_PhieuNhapSach_Sach_Sach foreign key (MaSach) references Sach(MaSach);
    
alter table PhieuThuTienNo
	add constraint FK_PhieuThuTienNo_KhachHang foreign key (MaKH) references KhachHang(MaKH);
    
alter table BaoCaoTonKho
	add constraint FK_BaoCaoTonKho_Sach foreign key (MaSach) references Sach(MaSach);
    
alter table BaoCaoCongNo
	add constraint FK_BaoCaoCongNo_KhachHang foreign key (MaKH) references KhachHang(MaKH);
    
insert NhanVien values
('US001', N'Jade Trần', '010101', N'123 Nguyễn Văn Cừ', 'jade@gmail.com', '3724923114850596956133245243127987711', N'Quản lý'),
('US002', N'Jonh Nguyễn', '010101', N'123 Nguyễn Văn Cừ', 'jonh@gmail.com', '3724923114850596956133245243127987711', N'Nhân viên'),
('US003', N'Tim Trần', '010101', N'123 Nguyễn Văn Cừ', 'tim@gmail.com', '3724923114850596956133245243127987711', N'Nhân viên'),
('US004', N'Kim Nguyễn', '010101', N'123 Nguyễn Văn Cừ', 'kim@gmail.com', '3724923114850596956133245243127987711', N'Nhân viên'),
('US005', N'Tuấn Trần', '010101', N'123 Nguyễn Văn Cừ', 'tuan@gmail.com', '3724923114850596956133245243127987711', N'Nhân viên'),
('US006', N'Xuân Phạm', '010101', N'123 Nguyễn Văn Cừ', 'xuan@gmail.com', '3724923114850596956133245243127987711', N'Nhân viên'),
('US007', N'Khánh Trần', '010101', N'123 Nguyễn Văn Cừ', 'khanh@gmail.com', '3724923114850596956133245243127987711', N'Nhân viên'),
('US008', 'Văn Nguyễn', '010101', N'123 Nguyễn Văn Cừ', 'van@gmail.com', '3724923114850596956133245243127987711', N'Nhân viên'),
('US009', N'Tính Trần', '010101', N'123 Nguyễn Văn Cừ', 'tinh@gmail.com', '3724923114850596956133245243127987711', N'Nhân viên'),
('US010', N'Hoàng Nguyễn', '010101', N'123 Nguyễn Văn Cừ', 'hoang@gmail.com', '3724923114850596956133245243127987711', N'Quản lý');

insert Sach values
('S0001', N'Số đỏ', N'Tiểu thuyết', N'Vũ Trọng Phụng', 100000, 100),
('S0002', N'Tắt đèn', N'Tiểu thuyết', N'Ngô Tất Tố', 100000, 100),
('S0003', N'Chí Phèo', N'Tiểu thuyết', N'Nam Cao', 100000, 100),
('S0004', N'Lão Hạc', N'Truyện ngắn', N'Nam Cao', 100000, 100),
('S0005', N'Bước đường cùng', N'Truyện ngăn', N'Nguyễn Công Hoan', 100000, 100),
('S0006', N'Ông bà già và biến cả', N'Truyện ngắn', N'Nguyễn Công Hoan', 100000, 100),
('S0007', N'Sống mòn', N'Tiểu thuyết', N'Nam cao', 100000, 100),
('S0008', N'Trăm năm cô đơn', N'Truyện ngắn', N'Nguyễn Công Hoan', 100000, 100),
('S0009', N'Bắt trẻ đồng xanh', N'Truyện ngắn', N'Ngô Tất Tố', 100000, 100),
('S0010', N'Rừng Na uy', N'Truyện ngăn', N'Ngô Tất Tố', 100000, 100),
('S0011', N'Suối nguồn', N'Tiểu thuyết', N'Nguyễn Công Hoan', 100000, 100),
('S0012', N'Doraemon tập 1', N'Truyện hoạt hình', N'Fujiko Fujio', 100000, 400),
('S0013', N'Doraemon tập 2', N'Truyện hoạt hình', N'Fujiko Fujio', 100000, 100),
('S0014', N'Doraemon tâp 3', N'Truyện hoạt hình', N'Fujiko Fujio', 100000, 100),
('S0015', N'Doraemon tập 4', N'Truyện hoạt hình', N'Fujiko Fujio', 100000, 100);

insert KhachHang values
('KH001', N'Nguyễn Lan Phương', '010101', N'123 Nguyễn Văn Cừ', 'phuong@gmail.com', 200000),
('KH002', N'Mạnh Tiễn Dũng', '010101', N'123 Nguyễn Văn Cừ', 'dung@gmail.com', 300000),
('KH003', N'Nguyễn Tuấn Anh', '010101', N'123 Nguyễn Văn Cừ', 'anh@gmail.com', 400000),
('KH004', N'Lê Ngọc Liên', '010101', N'123 Nguyễn Văn Cừ', 'lien@gmail.com', 500000),
('KH005', N'Trần Vũ Tiến', '010101', N'123 Nguyễn Văn Cừ', 'tien@gmail.com', 100000),
('KH006', N'Phan Ngọc Tiến', '010101', N'123 Nguyễn Văn Cừ', 'tien@gmail.com', 300000),
('KH007', N'Võ Mạnh Quân', '010101', N'123 Nguyễn Văn Cừ', 'quan@gmail.com', 100000),
('KH008', N'Trần Đức Huy', '010101', N'123 Nguyễn Văn Cừ', 'huy@gmail.com', 500000),
('KH009', N'Võ Văn Toàn', '010101', N'123 Nguyễn Văn Cừ', 'toan@gmail.com', 900000);

insert BaoCaoCongNo values
(1, 2019, 'KH001', 100000, 200000),
(2, 2019, 'KH005', 100000, 200000),
(3, 2019, 'KH006', 100000, 200000),
(5, 2019, 'KH008', 100000, 200000),
(7, 2019, 'KH003', 100000, 200000),
(9, 2019, 'KH002', 100000, 200000),
(1, 2020, 'KH002', 100000, 200000),
(2, 2020, 'KH002', 500000, 100000),
(3, 2020, 'KH001', 900000, 80000),
(3, 2020, 'KH005', 100000, 700000),
(1, 2021, 'KH006', 200000, 600000),
(2, 2021, 'KH007', 500000, 100000),
(2, 2021, 'KH008', 400000, 200000),
(3, 2021, 'KH008', 100000, 500000),
(3, 2021, 'KH009', 100000, 400000),
(12, 2021, 'KH001', 800000, 700000);

insert BaoCaoTonKho values
(1, 2019, 'S0001', 100, 200),
(2, 2019, 'S0003', 100, 200),
(3, 2019, 'S0004', 20, 300),
(5, 2019, 'S0005', 10, 200),
(7, 2019, 'S0007', 20, 200),
(9, 2019, 'S0008', 100, 200),
(1, 2020, 'S0002', 50, 200),
(2, 2020, 'S0002', 40, 100),
(3, 2020, 'S0001', 90, 80),
(3, 2020, 'S0005', 100, 200),
(1, 2021, 'S0006', 100, 60),
(2, 2021, 'S0007', 50, 100),
(2, 2021, 'S0008', 200, 100),
(3, 2021, 'S0008', 100, 50),
(3, 2021, 'S0009', 100, 40),
(12, 2021, 'S0001', 80, 70);

insert into PhieuNhapSach values
('PN001', '2021-10-10');

insert into PhieuNhapSach_Sach values
('PN001', 'S0001', 100),
('PN001', 'S0002', 100),
('PN001', 'S0003', 100),
('PN001', 'S0004', 100),
('PN001', 'S0005', 100);

insert into HoaDon values
('HD001', '2021-12-12', 'KH001', 500000, 450000, 50000),
('HD002', '2021-12-13', 'KH001', 500000, 400000, 100000);

insert into HoaDon_Sach values
('HD001', 'S0001', 1),
('HD001', 'S0002', 2),
('HD001', 'S0003', 2),
('HD002', 'S0005', 1),
('HD002', 'S0002', 2),
('HD002', 'S0003', 2);

insert into PhieuThuTienNo values
('PT001', 'KH007', '2021-12-30', 150000),
('PT002', 'KH006', '2021-11-30', 100000),
('PT003', 'KH005', '2021-10-30', 50000),
('PT004', 'KH004', '2021-09-30', 75000),
('PT005', 'KH003', '2021-08-30', 450000);

insert into QuyDinh values
(1, 150, 300, 20000, 20, 0);

drop procedure if exists sp_addid;
DELIMITER //
create procedure sp_addid(in prefix varchar(3))
begin
	set @ID = concat(prefix, '001');
	set @ID_I = 1;
	myloop: while @ID <> 'US000' do
				if (not exists(select * from NhanVien where MaNV = @ID)) then
					insert NhanVien(MaNV) values(@ID);
					leave myloop;
				else
					set @ID_I = @ID_I + 1;
                    if @ID_I > 99 then
						set @ID = concat(prefix, convert(@ID_I, char(3)));
					elseif @ID_I > 9 then
						set @ID = concat(prefix, '0', convert(@ID_I, char(2)));
					else
						set @ID = concat(prefix, '00', convert(@ID_I, char(1)));
                    end if;
                end if;
	end while;
end//
DELIMITER ;

drop procedure if exists sp_addidkh;
DELIMITER //
create procedure sp_addidkh(in prefix varchar(3))
begin
	set @ID = concat(prefix, '001');
	set @ID_I = 1;
	myloop: while @ID <> 'KH000' do
				if (not exists(select * from KhachHang where MaKH = @ID)) then
					insert KhachHang(MaKH) values(@ID);
					leave myloop;
				else
					set @ID_I = @ID_I + 1;
                    if @ID_I > 99 then
						set @ID = concat(prefix, convert(@ID_I, char(3)));
					elseif @ID_I > 9 then
						set @ID = concat(prefix, '0', convert(@ID_I, char(2)));
					else
						set @ID = concat(prefix, '00', convert(@ID_I, char(1)));
                    end if;
                end if;
	end while;
end//
DELIMITER ;

drop procedure if exists sp_addIdBill;
DELIMITER //
create procedure sp_addIdBill(in prefix char(2))
begin
	set @ID = concat(prefix, '001');
	set @ID_I = 1;
	myloop: while @ID <> 'HD000' do
				if (not exists(select * from HoaDon where MaHD = @ID)) then
					insert HoaDon(MaHD) values(@ID);
					leave myloop;
				else
					set @ID_I = @ID_I + 1;
                    if @ID_I > 99 then
						set @ID = concat('HD', convert(@ID_I, char(3)));
					elseif @ID_I > 9 then
						set @ID = concat('HD0', convert(@ID_I, char(2)));
					else
						set @ID = concat('HD00', convert(@ID_I, char(1)));
                    end if;
                end if;
	end while;
end//
DELIMITER ;

drop procedure if exists sp_addIdEntry;
DELIMITER //
create procedure sp_addIdEntry(in prefix char(2))
begin
	set @ID = concat(prefix, '001');
	set @ID_I = 1;
	myloop: while @ID <> 'PN000' do
				if (not exists(select * from PhieuNhapSach where MaPNS = @ID)) then
					insert PhieuNhapSach(MaPNS) values(@ID);
					leave myloop;
				else
					set @ID_I = @ID_I + 1;
                    if @ID_I > 99 then
						set @ID = concat('PN', convert(@ID_I, char(3)));
					elseif @ID_I > 9 then
						set @ID = concat('PN0', convert(@ID_I, char(2)));
					else
						set @ID = concat('PN00', convert(@ID_I, char(1)));
                    end if;
                end if;
	end while;
end//
DELIMITER ;

drop procedure if exists sp_addIdBook;
DELIMITER //
create procedure sp_addIdBook(in prefix char(2))
begin
	set @ID = concat(prefix, '001');
	set @ID_I = 1;
	myloop: while @ID <> 'S0000' do
				if (not exists(select * from Sach where MaSach = @ID)) then
					insert Sach(MaSach) values(@ID);
					leave myloop;
				else
					set @ID_I = @ID_I + 1;
                    if @ID_I > 99 then
						set @ID = concat('S0', convert(@ID_I, char(3)));
					elseif @ID_I > 9 then
						set @ID = concat('S00', convert(@ID_I, char(2)));
					else
						set @ID = concat('S000', convert(@ID_I, char(1)));
                    end if;
                end if;
	end while;
end//
DELIMITER ;

drop procedure if exists sp_addIdDebtNote;
DELIMITER //
create procedure sp_addIdDebtNote(in prefix char(2))
begin
	set @ID = concat(prefix, '001');
	set @ID_I = 1;
	myloop: while @ID <> 'PT000' do
				if (not exists(select * from PhieuThuTienNo where MaPTTN = @ID)) then
					insert PhieuThuTienNo(MaPTTN) values(@ID);
					leave myloop;
				else
					set @ID_I = @ID_I + 1;
                    if @ID_I > 99 then
						set @ID = concat('PT', convert(@ID_I, char(3)));
					elseif @ID_I > 9 then
						set @ID = concat('PT0', convert(@ID_I, char(2)));
					else
						set @ID = concat('PT00', convert(@ID_I, char(1)));
                    end if;
                end if;
	end while;
end//
DELIMITER ;