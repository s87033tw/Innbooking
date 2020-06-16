USE [Reservation]
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE  [dbo].[Ins_Order]
	-- Add the parameters for the stored procedure here
	@Start_Date datetime,
	@End_Date datetime,
	@Customer_ID int,
	@Room_Type nvarchar(20),
	@Food nvarchar(20),
	@Bed nvarchar(20),
	@CreditCard_Number  nvarchar(20),
	@Expiration_Date datetime,
	@Security_Code  nvarchar(20),
	@Name_On_CreditCard nvarchar(20)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	select *
	into #Room
	from [dbo].[Room]
	where Type=@Room_Type

	--判斷是否重複訂單
	declare @Check nvarchar(10)
	--訂單內無資料可以訂
	if not exists(select top 5 * from [dbo].[Order] )
	set @Check='1'
	--訂單內選取時間重疊而且同一間房型不能訂
	else if  exists(select *from [dbo].[Order]  where (((@Start_Date<=Start_Date and (@End_Date>=Start_Date and @End_Date<=End_Date)) or (@Start_Date>Start_Date and @End_Date<=End_Date)) and Room_ID=(select ID	from [dbo].[Room]where Type=@Room_Type)))
	set @Check='0'
	--可以訂
	else
	set @Check='1'

	if @Check='1'
	begin
	--寫進訂單
	insert into [dbo].[Order](
		[Customer_ID]
      ,[Room_ID]
      ,[Order_Date]
      ,[Start_Date]
      ,[End_Date]
      ,[Food]
      ,[Bed]
      ,[Total_Price]
      ,[CreditCard_Number]
      ,[Expiration_Date]
      ,[Security_Code]
      ,[Name_On_CreditCard]
	)
	select 
	@Customer_ID
    ,ID
    ,GETDATE() 
    ,@Start_Date 
    ,@End_Date 
    ,isnull(@Food,0) 
    ,isnull(@Bed,0) 
	--加一餐多100，多一床位多500
    ,Price+isnull(convert(decimal(25,2),@Food),0)*100+isnull(convert(decimal(25,2),@Bed),0)*500
    ,@CreditCard_Number
    ,@Expiration_Date
    ,@Security_Code
    ,@Name_On_CreditCard 
	from #Room
	end
	else if @Check='0'
	select '這個房型已經被訂走了,請選取其他日期或其他房型' as '錯誤訊息'



END
GO
