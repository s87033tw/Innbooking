using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebF
{
	public partial class TableTry: System.Web.UI.Page
	{
		string data;
		string sql;
		protected void Page_Load(object sender, EventArgs e)
		{
			Session["ID"] = "1";
			Session["Enter"] = 'N';//User還沒按確認建
			data = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ReservationConnectionString"].ConnectionString;//從config找到資料庫位置[]內放的是Web.config的connectionStrings的name

		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			Session["Count"] = "Y";
		}

		protected void Button2_Click(object sender, EventArgs e)
		{
			Session["Count"] = "N";
		}
		protected void Calendar1_SelectionChanged(object sender, EventArgs e)
{
			Session["Start_Date"] = Calendar1.SelectedDate.ToShortDateString();
		}

		protected void Calendar2_SelectionChanged(object sender, EventArgs e)
{
			Session["End_Date"] = Calendar2.SelectedDate.ToShortDateString();
		}

		protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
		{
			//Session["Room"] = RadioButtonList1.SelectedIndex + 1;
			Session["Room_Type"] = RadioButtonList1.SelectedValue;
		}

		protected void Button3_Click(object sender, EventArgs e)
		{
			Session["Enter"] = 'Y';//User按下確認建
			SqlConnection connection = new SqlConnection(data);//建立與資料庫建立起連接的通道
															   //EXEC[Reservation].[dbo].[Del_Order] '入住日期','退房日期','客戶ID','房間ID'
			sql = "EXEC [Reservation].[dbo].[Del_Order] '" + Session["Start_Date"] + "','" + Session["End_Date"] + "','" + Session["ID"] + "','" + Session["Room"] + "'";
			SqlCommand command = new SqlCommand(sql, connection);//要對SQL Server下什麼SQL指令。
			connection.Open();
			command.ExecuteNonQuery();
			connection.Close();
		}


	}
}