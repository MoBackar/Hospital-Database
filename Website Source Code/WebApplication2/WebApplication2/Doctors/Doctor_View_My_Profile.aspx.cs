using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication2
{
    public partial class Doctor_View_My_Profile : System.Web.UI.Page
    {
        private String id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                id = Request.QueryString["data"];
                ViewState["id"] = id;
            }
            String Uid = ViewState["id"] as String;
            int DocId = Convert.ToInt32(Uid);
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewProfile = new SqlCommand("Select * From Doctor Where id=@Doctorid", conn);
            viewProfile.Parameters.AddWithValue("@doctorid", DocId);
            viewProfile.CommandType = CommandType.Text;
            conn.Open();
            SqlDataReader reader = viewProfile.ExecuteReader();
            if (reader.HasRows)
            {
                viewProfilelist.Text = "<table border='3'> " +"<tr><th>ID</th><th>Name</th><th>Specialization</th><th>Hospital Name</th></tr>";

                while (reader.Read())
                {
                    viewProfilelist.Text += "<tr>";
                    viewProfilelist.Text += "<td>" + reader["id"] + "</td>";
                    viewProfilelist.Text += "<td>" + reader["d_name"] + "</td>";
                    viewProfilelist.Text += "<td>" + reader["specialization"] + "</td>";
                    viewProfilelist.Text += "<td>" + reader["hospital_name"] + "</td>";
                    viewProfilelist.Text += "</tr>";
                }

                viewProfilelist.Text += "</table>";
            }
            else
            {
                // Format the message to be bigger, bold, and positioned lower on the page
                viewProfilelist.Text = "<div class='message' style='color: red; font-size: 24px; font-weight: bold; text-align: center; margin-top: 50px;'>No Doctor Found</div>";
            }

            conn.Close();
        }
    }
}