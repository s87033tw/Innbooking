using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebF
{
	public partial class WebForm1 : System.Web.UI.Page
	{
		string data;
		string sql;
		string CreditCard_Number;
		string Security_Code;
		string Name_On_CreditCard;
		DateTime date1;
		SqlConnection conn;
		protected void Page_Load(object sender, EventArgs e)
		{
			Label8.Text = Session["Start_Date"].ToString();
			Label9.Text = Session["End_Date"].ToString();
			Label11.Text = Session["Room_Type"].ToString();
			//抓現在時間
			date1 = DateTime.Now.Date;
			data = System.Web.Configuration.WebConfigurationManager.ConnectionStrings[MvcApplication.ConnectionString].ConnectionString;//從config找到資料庫位置[]內放的是Web.config的connectionStrings的name
		}

		protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
		{
			Session["Food"] = DropDownList1.SelectedValue.ToString();
		}

		protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
		{
			Session["Bed"] = DropDownList2.SelectedValue.ToString();
		}

		protected void Calendar1_SelectionChanged(object sender, EventArgs e)
		{
			Session["Expiration_Date"] = Calendar1.SelectedDate.ToShortDateString();
		}

		//信用卡卡號驗證
		public bool CreditCard_Number_Check(string CreditCard_Number)
		{
			// 使用「正規表達式」檢驗格式  [0~9] {16}個數字
			bool flag = Regex.IsMatch(CreditCard_Number, @"^[0-9]{16}$");
			return flag;
		}
		//安全碼驗證
		public bool Security_Code_Check(string Security_Code)
		{
			// 使用「正規表達式」檢驗格式  [0~9] {3}個數字
			bool flag = Regex.IsMatch(Security_Code, @"^[0-9]{3}$");
			return flag;
		}
		//持卡人姓名驗證
		public bool Name_On_CreditCard_Check(string Name_On_CreditCard)
		{
			// 使用「正規表達式」檢驗格式 英文字1~30個字
			bool flag = Regex.IsMatch(Name_On_CreditCard, @"^[A-Za-z]{1,30}$");
			return flag;
		}
		protected void Button1_Click(object sender, EventArgs e)
		{
			CreditCard_Number = TextBox1.Text;
			Security_Code = TextBox2.Text;
			Name_On_CreditCard = TextBox3.Text;
			// null 判斷
			if (TextBox1.Text == null)
			{
				Label12.Text = "請輸入信用卡卡號";

			}
			else if (Session["Expiration_Date"] == null)
			{
				Label12.Text = "請選擇信用卡到期日期";
			}
			else if (date1 >=Convert.ToDateTime(Session["Expiration_Date"]))
			{
				Label12.Text = "信用卡到期日期不能早於今天";
			}
			else if (TextBox2.Text == null)
			{
				Label12.Text = "請輸入安全碼";
			}
			else if (TextBox3.Text == null)
			{
				Label12.Text = "請輸入持卡人姓名";
			}
			// 格式錯誤判斷
			else if (CreditCard_Number_Check(CreditCard_Number)==false) 
			{
				Label12.Text = "信用卡卡號格式錯誤,請輸入16位數字";
			}
			else if (Security_Code_Check(Security_Code)== false)
			{
				Label12.Text = "安全碼格式錯誤,請輸入3位數字";
			}
			else if (Name_On_CreditCard_Check(Name_On_CreditCard)== false)
			{
				Label12.Text = "持卡人姓名格式錯誤,請輸入1~30個英文字母";
			}
			else
			{ 
				// 如果沒選預設是0
				if (Session["Food"] == null)
				{
					Session["Food"] = "0";
				}
				if (Session["Bed"] == null)
				{
					Session["Bed"] = "0";
				}
				// 不跳出錯誤訊息
				Label12.Text = null;
				//開啟連線
				SqlConnection conn = new SqlConnection(data);
				conn.Open();
				// 寫進訂單
				SqlCommand cmd = new SqlCommand();
				cmd.Connection = conn;
				cmd.CommandText = "Ins_Order";
				cmd.CommandType = CommandType.StoredProcedure;
				//宣告參數和給值
				cmd.Parameters.Add("@Start_Date", SqlDbType.DateTime);
				cmd.Parameters["@Start_Date"].Value = Session["Start_Date"];
				cmd.Parameters.Add("@End_Date", SqlDbType.DateTime);
				cmd.Parameters["@End_Date"].Value = Session["End_Date"];
				cmd.Parameters.Add("@Customer_ID", SqlDbType.Int);
				cmd.Parameters["@Customer_ID"].Value = Session["ID"];
				cmd.Parameters.Add("@Room_Type", SqlDbType.NVarChar);
				cmd.Parameters["@Room_Type"].Value = Session["Room_Type"];
				cmd.Parameters.Add("@Food", SqlDbType.NVarChar);
				cmd.Parameters["@Food"].Value = Session["Food"];
				cmd.Parameters.Add("@Bed", SqlDbType.NVarChar);
				cmd.Parameters["@Bed"].Value = Session["Bed"];
				cmd.Parameters.Add("@CreditCard_Number", SqlDbType.NVarChar);
				cmd.Parameters["@CreditCard_Number"].Value = TextBox1.Text.ToString();
				cmd.Parameters.Add("@Expiration_Date", SqlDbType.DateTime);
				cmd.Parameters["@Expiration_Date"].Value = Session["Expiration_Date"];
				cmd.Parameters.Add("@Security_Code", SqlDbType.NVarChar);
				cmd.Parameters["@Security_Code"].Value = TextBox2.Text.ToString();
				cmd.Parameters.Add("@Name_On_CreditCard", SqlDbType.NVarChar);
				cmd.Parameters["@Name_On_CreditCard"].Value = TextBox3.Text.ToString();
				cmd.ExecuteNonQuery();
				//確認訂單
				SqlCommand cmd_1 = new SqlCommand();
				cmd_1.Connection = conn;
				cmd_1.CommandText = "Check_Ins_Order";
				cmd_1.CommandType = CommandType.StoredProcedure;
				//宣告參數和給值
				cmd_1.Parameters.Add("@Start_Date", SqlDbType.DateTime);
				cmd_1.Parameters["@Start_Date"].Value = Session["Start_Date"];
				cmd_1.Parameters.Add("@End_Date", SqlDbType.DateTime);
				cmd_1.Parameters["@End_Date"].Value = Session["End_Date"];
				cmd_1.Parameters.Add("@Customer_ID", SqlDbType.Int);
				cmd_1.Parameters["@Customer_ID"].Value = Session["ID"];
				cmd_1.Parameters.Add("@Room_Type", SqlDbType.NVarChar);
				cmd_1.Parameters["@Room_Type"].Value = Session["Room_Type"];
				SqlDataReader dr = cmd_1.ExecuteReader();
				GridView1.DataSource = dr;
				GridView1.DataBind();
				dr.Close();
				conn.Close();
			}
		}

		protected void Button2_Click(object sender, EventArgs e)
		{
			Response.Redirect("Index.aspx");
			//下完訂單清掉 Session
			Session["Start_Date"] = null;
			Session["End_Date"] = null;
		}

	}
	
}