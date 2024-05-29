using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.Nurse.Nursept2
{
    public partial class ListDoctors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                SqlCommand viewDoctors = new SqlCommand("SELECT * FROM Doctor", conn);
                viewDoctors.CommandType = CommandType.Text;

                using (SqlDataReader reader = viewDoctors.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        l1.Text = "<table border='3'> " +
                                  "<tr><th>ID</th><th>Name</th><th>Specialization</th><th>Hospital Name</th></tr>";

                        while (reader.Read())
                        {
                            l1.Text += "<tr>";
                            l1.Text += "<td>" + reader["id"] + "</td>";
                            l1.Text += "<td>" + reader["d_name"] + "</td>";
                            l1.Text += "<td>" + reader["specialization"] + "</td>";
                            l1.Text += "<td>" + reader["hospital_name"] + "</td>";
                            l1.Text += "</tr>";
                        }

                        l1.Text += "</table>";
                    }
                    else
                    {
                        // Display a message if there are no doctors
                        l1.Text = "<div class='message' style='color: red; font-size: 24px; font-weight: bold; text-align: center; margin-top: 50px;'>There are no doctors</div>";
                    }
                }
            }

        }
    }
}