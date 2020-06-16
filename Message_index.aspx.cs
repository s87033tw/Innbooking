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
    public partial class Message_index : System.Web.UI.Page
    {
        public string customer_ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Account"] == null)
            {
                Response.Redirect("RdLogin.aspx");
            }
            else
            {
                customer_ID = Convert.ToString(Session["ID"]);

                //Response.Write(customer_ID);

                string getconfig = System.Web.Configuration.WebConfigurationManager.
                    ConnectionStrings[MvcApplication.ConnectionString].ConnectionString;

                SqlConnection connection = new SqlConnection(getconfig);

                SqlCommand command = new SqlCommand($"SELECT ID, Title, (select Account from Customer where ID = @customer_ID) as Customer_Account, Message_Date," +
                    $"(select count(*) from Reply where Message_ID=[Message].id) as 回應 FROM Message where Customer_ID = @customer_ID", connection);

                command.Parameters.Add("@customer_ID", SqlDbType.NVarChar);
                //command.Parameters["@customer_ID"].Value = Request.QueryString["id"];
                command.Parameters["@customer_ID"].Value = Convert.ToInt32(customer_ID);

                SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

                DataSet dataSet = new DataSet();

                dataAdapter.Fill(dataSet);

                GridView1.DataSource = dataSet;

                GridView1.DataBind();
            }
            

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Message_add.aspx?Customer_ID=" + customer_ID);
        }

        protected void BacktoIndex_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}