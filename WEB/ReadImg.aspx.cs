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
    public partial class ReadImg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        public void ReadDB()
        {
            int ImgID = Convert.ToInt32(Request.QueryString["ImgID"]); //ImgID為圖片ID
            //建立資料庫連結
            string c_data = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ReservationConnectionString"].ConnectionString;
            SqlConnection Con = new SqlConnection(c_data);
            String SqlCmd = "SELECT* FROM Images WHERE id = @ImageID";
            SqlCommand Cmd = new SqlCommand(SqlCmd, Con);
            Cmd.Parameters.Add("@ImageID", SqlDbType.Int).Value = ImgID;
            Con.Open();
            SqlDataReader SqlReader = Cmd.ExecuteReader();
            SqlReader.Read();
/*            Response.ContentType = (string)SqlReader["ImageContentType"];//設定輸出檔案型別
                                                                         //輸出圖象檔案二進位制數制
            Response.OutputStream.Write((byte[])SqlReader["ImageData”], 0,
            (int)SqlReader[“ImageSize”]);*/
            Response.End();
            Con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ReadDB();
        }
    }
}