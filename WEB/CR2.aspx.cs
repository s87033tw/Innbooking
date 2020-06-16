using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebF
{
    public partial class CR2 : System.Web.UI.Page
    {
		string data;
		string sql;
		protected void Page_Load(object sender, EventArgs e)
		{
			//Label8.Text = Session["Start_Date"].ToString();
			//Label9.Text = Session["End_Date"].ToString();
			//Label11.Text = Session["Room_Type"].ToString();
			Session["Enter"] = 'N';//User還沒按確認建
			data = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ReservationConnectionString"].ConnectionString;//從config找到資料庫位置[]內放的是Web.config的connectionStrings的name
		}

		protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
		{
			Session["Food"] = DropDownList1.SelectedValue.ToString();
		}

		protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
		{
			Session["Bed"] = DropDownList2.SelectedValue.ToString();
		}

		protected void TextBox1_TextChanged(object sender, EventArgs e)
		{
			Session["CriditCard_Number"] = TextBox1.Text.ToString();
		}

		protected void Calendar1_SelectionChanged(object sender, EventArgs e)
		{
			Session["Expiration_Date"] = Calendar1.SelectedDate.ToShortDateString();
		}

		protected void TextBox2_TextChanged(object sender, EventArgs e)
		{
			Session["Security_Code"] = TextBox2.Text.ToString();
		}

		protected void TextBox3_TextChanged(object sender, EventArgs e)
		{
			Session["Name_On_CriditCard"] = TextBox3.Text.ToString();
		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			Session["Enter"] = 'Y';//User按下確認建
			SqlConnection connection = new SqlConnection(data);//建立與資料庫建立起連接的通道
															   //EXEC [Reservation].[dbo].[Ins_Order] '入住日期','退房日期','客戶ID','房間ID','Food','Bed','信用卡號','信用卡到期日','安全碼','持卡人姓名'
			sql = "EXEC [Reservation].[dbo].[Ins_Order] '" + Session["Start_Date"] + "','" + Session["End_Date"] + "','" + (int)Session["ID"] + "','" + Session["Room_Type"] + "','" + Session["Food"] + "','" + Session["Bed"] + "','" + Session["CriditCard_Number"] + "','" + Session["Expiration_Date"] + "','" + Session["Security_Code"] + "','" + Session["Name_On_CriditCard"] + "'";
			SqlCommand command = new SqlCommand(sql, connection);//要對SQL Server下什麼SQL指令。
			connection.Open();
			command.ExecuteNonQuery();
			connection.Close();
		}

		protected void Button2_Click(object sender, EventArgs e)
		{
			Response.Redirect("Index.aspx");
		}
	}
}