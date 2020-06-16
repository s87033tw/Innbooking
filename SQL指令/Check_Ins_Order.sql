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
ALTER PROCEDURE  [dbo].[Check_Ins_Order]
	-- Add the parameters for the stored procedure here
	@Start_Date datetime,
	@End_Date datetime,
	@Customer_ID nvarchar(20),
	@Room_Type nvarchar(20)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	declare 
	@Check nvarchar(20)
	--找訂單內選取時間,客戶id,房間id相同
	if  exists(select *from [dbo].[Order]  where (@Start_Date=Start_Date and @End_Date=End_Date and Room_ID=(select id from [dbo].[Room] where Type=@Room_Type) and @Customer_ID=Customer_ID))
	set @Check='1'
	--找不到
	else
	set @Check='0'


	if @Check='1'
	select '訂房成功' as '訂單狀態'
	else if @Check='0' 
	select '訂房失敗' as '訂單狀態'



END
GO
