using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebF
{
    public partial class RSession : System.Web.UI.Page
    {
        string data;
        string sql;
        protected void Page_Load(object sender, EventArgs e)
        {
            // data = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ReservationConnectionString"].ConnectionString;//從config找到資料庫位置[]內放的是Web.config的connectionStrings的name
            //Session["Sort"] = 'A';
        }


        protected void Hello()
        {
            /* if (Convert.ToString(Session["Account"] == "ddd")
             {

             }*/
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            //Session["Start_Date"] = Calendar1.SelectedDate.ToShortDateString();
        }

        protected void Calendar2_SelectionChanged1(object sender, EventArgs e)
        {
            //Session["End_Date"] = Calendar2.SelectedDate.ToShortDateString();
        }


        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Session["Room"] = RadioButtonList1.SelectedIndex + 1;
            Session["Room_Type"] = RadioButtonList1.SelectedValue;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Session["Start_Date"] == null)
            {
                Label5.Text = ("請選擇訂房日期");
            }
            else if (Session["End_Date"] == null)
            {
                Label5.Text = ("請選擇退房日期");
            }
            else if (Session["Room_Type"] == null)
            {
                Label5.Text = ("請選擇預定房型");
            }
            else
            {
                Response.Redirect("Check_Room.aspx");
            }
        }


    }
}