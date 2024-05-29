using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Patients_Records : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            var patient_id = Convert.ToInt32(PID.Text);

            SqlCommand viewHis = new SqlCommand("SELECT Patient.id, EHR.EHR_number, EHR.chronic_disease, EHR.allergy, EHR.vaccine, EHR.prescribed_drugs, EHR.test_result, EHR.examination_result FROM Patient Left OUTER JOIN EHR ON Patient.id = EHR.patient_id WHERE patient.id = @patient_id", conn);

            viewHis.Parameters.AddWithValue("@patient_id", patient_id);
            viewHis.CommandType = CommandType.Text;
            conn.Open();

            SqlDataReader reader = viewHis.ExecuteReader();

            if (reader.HasRows)
            {
                viewProfilelist.Text = "<table border='3'> " + "<tr><th>ID</th><th>EHR Number</th><th>Chronic Disease</th><th>Allergy</th><th>Vaccine</th><th>Prescribed Drugs</th><th>Test Result</th><th>Examination Result</th></tr>";

                while (reader.Read())
                {
                    viewProfilelist.Text += "<tr>";
                    viewProfilelist.Text += "<td>" + reader["id"] + "</td>";
                    viewProfilelist.Text += "<td>" + reader["EHR_number"] + "</td>";
                    viewProfilelist.Text += "<td>" + reader["chronic_disease"] + "</td>";
                    viewProfilelist.Text += "<td>" + reader["allergy"] + "</td>";
                    viewProfilelist.Text += "<td>" + reader["vaccine"] + "</td>";
                    viewProfilelist.Text += "<td>" + reader["prescribed_drugs"] + "</td>";
                    viewProfilelist.Text += "<td>" + reader["test_result"] + "</td>";
                    viewProfilelist.Text += "<td>" + reader["examination_result"] + "</td>";
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