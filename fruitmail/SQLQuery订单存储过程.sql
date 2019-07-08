--存储过程createOrder
--通过存储过程createOrder来向orders表增加某客户的一条订单记录，同时会在[orderDetails]表中为该该订单增加一条或多条详情记录（为每类商品各生成一条详情记录）
drop PROCEDURE createOrder
go
CREATE PROCEDURE createOrder
   @userid varchar(100), --客户ID
   @orderTotalPrice varchar(2000),--订单总金额(也可以不要该参数，改为在存储过程中计算总金额)
   @fid varchar(2000), --购买的商品的ID组成的字符串，用逗号作分隔符。如'1,2,3,4,'表示购买号，号，号，号商品(注意最后一个是逗号)
   @number varchar(2000),--购买的商品的数量组成的字符串，用逗号作分隔符。'10,20,1,2,'
   @detailTotalPrice varchar(2000),--购买的各商品的数量和单价相乘的积组成的字符串，用逗号作分隔符。
   @result int=-1 OUTPUT,--失败返回-1，成功返回
   @orderid int=0 OUTPUT--返回创建的订单的ID号
AS
Begin Transaction
IF @userid IS NULL or @orderTotalPrice is null or @fid is null or @number is null or @detailTotalPrice is null
Begin
   print '错误: 参数不能为空.'
   Set @result=-1
   return
END
--往订单表插入一条记录
insert into [orders](userid,[date],[totalprice],[status]) values(@userid,GETDATE(),@orderTotalPrice,'未付款')
If @@error <> 0
   Begin
     RollBack Transaction    
     Return 
   End
--declare @orderId int
select @orderId=max(orderId) from orders where userid=@userid --查找新插入的订单的ID

--set @fid = @fid+','
--set @number = @number+','
--set @detailTotalPrice = @detailTotalPrice+','
Declare @thisFid varchar(100) --截取后的商品号
Declare @thisNumber varchar(100)--截取后的数量
Declare @thisDTP varchar(100)--详情中的总价
--Declare @newstr varchar(2000) --截取第一个字符串后剩余的字符串

while(len(@fid)>0)
begin
   set @thisFid = left(@fid,charindex(',',@fid)-1)
   set @thisNumber = left(@number,charindex(',',@number)-1)
   set @thisDTP = left(@detailTotalPrice,charindex(',',@detailTotalPrice)-1)
   --往详情表插入记录
   insert into [orderDetails](orderId,[fid],[number],[totalprice]) values(@orderId,@thisFid,@thisNumber,@thisDTP)
   If @@error <> 0
   Begin
     RollBack Transaction        
     Return 
   End
   set @fid = stuff(@fid,1,charindex(',',@fid),'')
   set @number = stuff(@number,1,charindex(',',@number),'')   
   set @detailTotalPrice = stuff(@detailTotalPrice,1,charindex(',',@detailTotalPrice),'')   
end
If @@error = 0
   Begin
     Commit Transaction
     Set @result=0
     Return 
   End
Else
   Begin
     RollBack Transaction
     Set @result=-1
     Return 
   End
go
