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
    public partial class Amb : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                SqlCommand viewEmergencyServices = new SqlCommand("SELECT EMS.service_id, EMS.EM_name, H.h_name FROM Hospital H LEFT OUTER JOIN Provide_ambulance_service Pro ON Pro.hospital_name = H.h_name LEFT OUTER JOIN Emergency_medical_services EMS ON EMS.service_id = Pro.EM_id", conn);
                viewEmergencyServices.CommandType = CommandType.Text;

                using (SqlDataReader reader = viewEmergencyServices.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        l1.Text = "<table border='3'> " +
                                  "<tr><th>Service ID</th><th>Service Name</th><th>Hospital Name</th></tr>";

                        while (reader.Read())
                        {
                            l1.Text += "<tr>";
                            l1.Text += "<td>" + reader["service_id"] + "</td>";
                            l1.Text += "<td>" + reader["EM_name"] + "</td>";
                            l1.Text += "<td>" + reader["h_name"] + "</td>";
                            l1.Text += "</tr>";
                        }

                        l1.Text += "</table>";
                    }
                    else
                    {
                        // Display a message if there are no emergency services
                        l1.Text = "<div class='message' style='color: red; font-size: 24px; font-weight: bold; text-align: center; margin-top: 50px;'>There are no emergency services</div>";
                    }
                }
            }
        }
    }
}