using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.Pharmacist
{
    public partial class Phar_VMP : System.Web.UI.Page
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
            SqlCommand viewProfile = new SqlCommand("SELECT id, p_name, pharmacy_name, year_of_exp FROM Pharmacist WHERE id = @doctorid", conn);
            viewProfile.Parameters.AddWithValue("@doctorid", DocId);
            viewProfile.CommandType = CommandType.Text;
            conn.Open();
            SqlDataReader reader = viewProfile.ExecuteReader();

            if (reader.HasRows)
            {
                viewProfilelist.Text = "<table border='3'> " + "<tr><th>ID</th><th>Name</th><th>Pharmacy Name</th><th>Years of Experience</th></tr>";

                while (reader.Read())
                {
                    viewProfilelist.Text += "<tr>";
                    viewProfilelist.Text += "<td>" + reader["id"] + "</td>";
                    viewProfilelist.Text += "<td>" + reader["p_name"] + "</td>";
                    viewProfilelist.Text += "<td>" + reader["pharmacy_name"] + "</td>";
                    viewProfilelist.Text += "<td>" + reader["year_of_exp"] + "</td>";
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