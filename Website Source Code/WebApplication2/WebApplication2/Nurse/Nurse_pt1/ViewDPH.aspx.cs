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
    public partial class ViewDPH : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                SqlCommand viewAppointments = new SqlCommand("SELECT d_name AS DOCTOR_NAME, p_name AS PATIENT_NAME, D.hospital_name AS HOSPITAL_NAME FROM Doctor D LEFT OUTER JOIN Make_appointment M ON M.doc_id = D.id LEFT OUTER JOIN Patient P ON P.id = M.pat_id", conn);
                viewAppointments.CommandType = CommandType.Text;

                using (SqlDataReader reader = viewAppointments.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        l1.Text = "<table border='3'> " +
                                  "<tr><th>Doctor Name</th><th>Patient Name</th><th>Hospital Name</th></tr>";

                        while (reader.Read())
                        {
                            l1.Text += "<tr>";
                            l1.Text += "<td>" + reader["DOCTOR_NAME"] + "</td>";
                            l1.Text += "<td>" + reader["PATIENT_NAME"] + "</td>";
                            l1.Text += "<td>" + reader["HOSPITAL_NAME"] + "</td>";
                            l1.Text += "</tr>";
                        }

                        l1.Text += "</table>";
                    }
                    else
                    {
                        // Display a message if there are no appointments
                        l1.Text = "<div class='message' style='color: red; font-size: 24px; font-weight: bold; text-align: center; margin-top: 50px;'>There are no appointments</div>";
                    }
                }
            }
        }
    }
}