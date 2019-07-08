--1.管理员表
create table [admin](
uname varchar(100) null,
upwd varchar(100) null
)
go
insert into admin values('admin','admin')
go
--2.商品类别表
create table class(
cid int identity(1,1) primary key,
cname varchar(100) not null,
)
go

--3.商品表：商品号、商品名、图片、简述、详细描述、价格、类别号、录入时间日
CREATE TABLE fruits
(
fId int IDENTITY(1,1)primary key,
fClassId int foreign key references[class](cId),
fName varchar(100)NULL,
fImage varchar(100)NULL,
fDescr varchar(200)NULL,--简述
fDescr1 varchar(Max)NULL,
fColor varchar(100) null,
fTag varchar(100) null,
fPrice decimal(18,2)NULL,
fStock int, 
fTime datetime default getdate()
)
Go

--4.用户表
create table Customer
(
   UserId varchar(100) primary key,   
   UserName varchar(100) not null,
   UserPwd varchar(100) not null,
   Balance decimal(18,2) default 0, 
 )
 go

--5.购物车表：用户名、商品号、数量
create table shoppingcart
(
uname varchar(100) foreign key references users(uname),
fid int foreign key references fruits(fid),
num int null,
CONSTRAINT [PK_shoppingcart]PRIMARY KEY(uname ASC,fid ASC)
)

GO
--6.订单表：订单号、用户名、下单日期、总价、订单状态
CREATE TABLE orders(
[orderId] varchar(100)primary key,
[uname] varchar(100)foreign key references[users](uname),
[date] datetime NULL,
[totalprice] numeric(18,2)NULL,
[status] varchar(100)NULL 
)
GO
--7.订单详情表：订单号、商品号、数量、小计总价
CREATE TABLE orderDetails
(
[orderid] varchar(100) foreign key references[orders](orderId),
[fid] int NOT NULL foreign key references[fruits](fid),
[number] int NULL,
[totalprice] decimal(18,2) NULL,
CONSTRAINT[PK_orderDetails]
PRIMARY KEY CLUSTERED([orderid]ASC,[fid]ASC)
)
go
--8.库存表：商品号、库存量
create table stock
(
fid int foreign key references[fruits](fid),
num int,
CONSTRAINT PK_stock PRIMARY KEY CLUSTERED(fid)
)
go
--9.顾客银行余额表：用户名、余额
create table bank
(
uname varchar(100)foreign key references[users](uname),
balance decimal(18,2)not null,
CONSTRAINT[PK bank]PRIMARY KEY CLUSTERED(uname)
)
go
--10.评价表
create table feel
(
[orderid] varchar(100) foreign key references[orders](orderId),
[fid] int NOT NULL foreign key references[fruits](fid),
score int null check(score between 1 and 5),
[date] datetime null,
CONSTRAINT[PK_feel]
PRIMARY KEY CLUSTERED([orderid]ASC,[fid]ASC)
)
go

--11.收藏表
create table [like]
(
uname varchar(100) foreign key references users(uname),
fid int foreign key references fruits(fid),
CONSTRAINT [PK_likecart]PRIMARY KEY(uname ASC,fid ASC)
)
go
--
--
--
drop table orders
drop table orderDetails
--5.订单表：订单号(自动编号)、用户号、下单日期、总价、订单状态
CREATE TABLE orders(
	orderId int identity(1,1) primary key,
	userid [varchar](100) foreign key references Customer(UserId),
	[date] [datetime] NULL,
	[totalprice] [numeric](18, 2) NULL,
	[status] [varchar](100) NULL
)

GO
--6.订单详情表：订单号、商品号、数量、小计总价
CREATE TABLE orderDetails(
	orderId int foreign key references [orders]([orderId]),
	[fid] [int] NOT NULL foreign key references [fruits](fid),
	[number] [int] NULL,
	[totalprice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_orderDetails] PRIMARY KEY CLUSTERED ([orderid] ASC,[fid] ASC)
) 
go
select * from [orders]
select * from [orderDetails]


insert into class(cname) values('瓜果类')
insert into class(cname) values('柑桔类')
insert into class(cname) values('热带水果类')
insert into class(cname) values('核果类')
insert into class(cname) values('浆果类')
insert into class(cname) values('干货类')
