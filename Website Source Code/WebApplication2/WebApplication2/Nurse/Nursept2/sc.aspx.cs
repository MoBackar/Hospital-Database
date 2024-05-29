using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;

namespace WebApplication2.Nurse.Nursept2
{
    public partial class sc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand viewEmergencyServices = new SqlCommand("SELECT H.h_name, I.i_name FROM Hospital H INNER JOIN Sign_contract SC ON SC.h_name = H.h_name INNER JOIN Insurance_company I ON I.i_name = SC.i_name", conn);
                viewEmergencyServices.CommandType = CommandType.Text;

                using (SqlDataReader reader = viewEmergencyServices.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        l1.Text = "<table border='3'> " +
                                  "<tr><th>Hospital Name</th><th>Insurance Company Name</th></tr>";

                        while (reader.Read())
                        {
                            l1.Text += "<tr>";
                            l1.Text += "<td>" + reader["h_name"] + "</td>";
                            l1.Text += "<td>" + reader["i_name"] + "</td>";
                            l1.Text += "</tr>";
                        }

                        l1.Text += "</table>";
                    }
                    else
                    {
                        // Display a message if there are no records
                        l1.Text = "<div class='message' style='color: red; font-size: 24px; font-weight: bold; text-align: center; margin-top: 50px;'>There are no records</div>";
                    }
                }
            }

        }
    }
}