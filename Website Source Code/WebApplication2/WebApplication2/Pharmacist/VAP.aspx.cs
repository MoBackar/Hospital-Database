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
    public partial class VAP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewProfile = new SqlCommand("SELECT P.p_name, P.pharmacy_name, C.p_date FROM Pharmacist P INNER JOIN Prec_Check C ON C.pharma_id = P.id", conn);
            viewProfile.CommandType = CommandType.Text;
            conn.Open();
            SqlDataReader reader = viewProfile.ExecuteReader();

            if (reader.HasRows)
            {
                viewProfilelist.Text = "<table border='3'> " + "<tr><th>Pharmacist Name</th><th>Pharmacy Name</th><th>Prescription Date</th></tr>";

                while (reader.Read())
                {
                    viewProfilelist.Text += "<tr>";
                    viewProfilelist.Text += "<td>" + reader["p_name"] + "</td>";
                    viewProfilelist.Text += "<td>" + reader["pharmacy_name"] + "</td>";
                    viewProfilelist.Text += "<td>" + reader["p_date"] + "</td>";
                    viewProfilelist.Text += "</tr>";
                }

                viewProfilelist.Text += "</table>";
            }
            else
            {
                // Format the message to be bigger, bold, and positioned lower on the page
                viewProfilelist.Text = "<div class='message' style='color: red; font-size: 24px; font-weight: bold; text-align: center; margin-top: 50px;'>No Records Found</div>";
            }

            conn.Close();
        }
    }
}