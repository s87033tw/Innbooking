USE [Reservation]
GO
/****** Object:  StoredProcedure [dbo].[Query_Room]    Script Date: 2020/6/9 上午 09:19:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE  [dbo].[Query_Room_List]
	-- Add the parameters for the stored procedure here
	@Start_Date datetime,
	@End_Date datetime

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if @Start_Date<@End_Date and @Start_Date>getdate()
	begin
		select * into #Room  from [dbo].[Room]
		select * into #Order  from [dbo].[Order]
		where (Start_Date between  @Start_Date and @End_Date) or (End_Date between @Start_Date and @End_Date)

		
		select s1.Type
		,s1.Price
		,s2.Bathroom
		,s2.Bathtub
		,s2.Hair_Dryer
		,s2.Refrigerator
		,s2.Toiletries
		,s2.KTV
		,s2.Security_Box
		,s2.Swimming_Pool
		,Start_Date
		,End_Date
		,case when  Start_Date is null  then 1 
			  when (@Start_Date<Start_Date and @End_Date<=Start_Date) then 1
			  when (@Start_Date>=End_Date and @End_Date>End_Date) then 1
		else 0 end as [Check]
		into #Room_1
		from #Room s1
		left join [dbo].[Equipment] s2 on s1.ID=s2.Room_ID
		left join #Order s3 on s1.ID=s3.Room_ID
		--Check=0不能住，Check=１可以住，
		select  Type,Price,Bathroom,Bathtub,Hair_Dryer,Refrigerator,Toiletries,KTV,Security_Box,Swimming_Pool,min([Check]) as [Check]
		into #Room_2
		from #Room_1
		GROUP BY
		Type,Price,Bathroom,Bathtub,Hair_Dryer,Refrigerator,Toiletries,KTV,Security_Box,Swimming_Pool
		ORDER BY Price
		select Type  from  #Room_2 where [Check]=1 ORDER BY Price ASC
		end
		else if @Start_Date=@End_Date
		select '入住日期和退房日期不能同一天' as Type
		else if @Start_Date>@End_Date
		select '退房日期要大於入住日期' as Type
		else if @Start_Date<getdate()
		select '不能預定早於今天的日期' as Type


END
