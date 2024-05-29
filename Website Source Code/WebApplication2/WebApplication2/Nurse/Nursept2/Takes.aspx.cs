using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.Nurse.Nurse_pt1
{
    public partial class Takes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                SqlCommand viewTakes = new SqlCommand("SELECT * FROM Takes", conn);
                viewTakes.CommandType = CommandType.Text;

                using (SqlDataReader reader = viewTakes.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        l1.Text = "<table border='3'> " +
                                  "<tr><th>Treatment ID</th><th>Patient ID</th></tr>";

                        while (reader.Read())
                        {
                            l1.Text += "<tr>";
                            l1.Text += "<td>" + reader["treatment_id"] + "</td>";
                            l1.Text += "<td>" + reader["pat_id"] + "</td>";
                            l1.Text += "</tr>";
                        }

                        l1.Text += "</table>";
                    }
                    else
                    {
                        // Display a message if there are no records in the 'Takes' table
                        l1.Text = "<div class='message' style='color: red; font-size: 24px; font-weight: bold; text-align: center; margin-top: 50px;'>No records found in the 'Takes' table</div>";
                    }
                }
            }

        }
    }
}