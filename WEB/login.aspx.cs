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
    public partial class log2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_b_Click1(object sender, EventArgs e)
        {

            string s_data = System.Web.Configuration.WebConfigurationManager.ConnectionStrings[MvcApplication.ConnectionString].ConnectionString;
            SqlConnection conn = new SqlConnection(s_data);
            conn.Open(); //開啟資料庫
            SqlCommand cmd = new SqlCommand("select Account, Password, ID from [Customer] where Account=@ACC and Password =@PD", conn);

            cmd.Parameters.Add("@ACC", SqlDbType.NVarChar).Value = account.Text;
            cmd.Parameters.Add("@PD", SqlDbType.NVarChar).Value = passwd.Text;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows) //如果有抓到資料
            {
                if (dr.Read())
                {
                    Session["Account"] = account.Text;
                    Session["ID"] = dr["ID"];
                    Response.Redirect("Index.aspx");
                }
            }
            else
                al.Text = "No User data";

            dr.Dispose();
            cmd.Dispose();
            conn.Close();
            conn.Dispose();
        }

        protected void Register_b_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

    }
}