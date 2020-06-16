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
    public partial class Reg2 : System.Web.UI.Page
    {
        protected void LoginPage_b_Click1(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void Submit_b_Click1(object sender, EventArgs e)
        {
            //SQL指令:利用玩家輸入的帳號去資料庫搜尋會員密碼,以進行比對

            this.vid = account.Text;
            this.vp = passwd.Text;
            this.vn = name.Text;
            this.vc = cell.Text;

            check_DB();
            if (this.vid.Length > 2 && this.vp.Length > 2 && this.vn.Length > 2 && this.vc.Length > 9 && dbv == true)
            {
                string s_data = System.Web.Configuration.WebConfigurationManager.ConnectionStrings[MvcApplication.ConnectionString].ConnectionString;
                SqlConnection conn = new SqlConnection(s_data);
                conn.Open(); //開啟資料庫
                SqlCommand cmd = new SqlCommand("insert into [Customer] (Account, Password, Name, Phone) values (@ID, @PD, @NA, @CE)", conn);
                cmd.Parameters.Add("@ID", SqlDbType.NVarChar).Value = id;
                cmd.Parameters.Add("@PD", SqlDbType.NVarChar).Value = p;
                cmd.Parameters.Add("@NA", SqlDbType.NVarChar).Value = n;
                cmd.Parameters.Add("@CE", SqlDbType.NVarChar).Value = c;
                SqlDataReader dr = cmd.ExecuteReader();

                dr.Dispose();
                cmd.Dispose();
                conn.Close();
                conn.Dispose();

                Response.Write("<Script language='JavaScript'>alert('Register Complete\\r Return to Login');window.location = 'login.aspx';</Script>");
                //Response.Redirect("login.aspx");
            }

        }
        bool dbv = true;
        private string id;
        private string p;
        private string n;
        private string c;
        public string vid
        {
            get { return id; }
            set
            {
                if ((Regex.IsMatch(value, @"[A-z]{1}")) && value.Length > 2)
                {
                    id = value;
                    al.Text = "[OK]";
                    dbv = true;
                }


                else
                {
                    al.Text = "[wrong format]";
                    id = "";
                }

            }
        }

        public string vp
        {
            get { return p; }
            set
            {
                if (value.Length > 5)
                {
                    p = value;
                    al2.Text = "[OK]";
                }
                else
                {
                    al2.Text = "[wrong format]";
                    p = "";
                }
            }
        }

        public string vn
        {
            get { return n; }
            set
            {
                if ((Regex.IsMatch(value, @"[A-z]{1}")) && value.Length > 2)
                {
                    n = value;
                    al3.Text = "[OK]";
                }
                else
                {
                    al3.Text = "[wrong format]";
                    n = "";
                }

            }
        }


        public string vc
        {
            get { return c; }
            set
            {
                if ((Regex.IsMatch(value, @"[0]{1}[9]{1}")) && value.Length == 10)
                {
                    c = value;
                    al4.Text = "[OK]";
                }
                else
                {
                    al4.Text = "[wrong format]";
                    c = "";
                }

            }
        }

        public void check_DB()
        {
            string c_data = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ReservationConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(c_data);
            conn.Open(); //開啟資料庫
            SqlCommand cmd = new SqlCommand("select Name from [Customer] where Account=@ID", conn);

            cmd.Parameters.Add("@ID", SqlDbType.NVarChar).Value = account.Text;
            //cmd.Parameters.Add("@PD", SqlDbType.NVarChar).Value = passwd.Text;
            SqlDataReader d = cmd.ExecuteReader();

            if (d.HasRows) //如果有抓到資料
            {
                if (d.Read())
                {
                    al.Text = "Account have exist";
                    dbv = false;
                }
            }


            d.Dispose();
            cmd.Dispose();
            conn.Close();
            conn.Dispose();
        }


    }
}