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
    public partial class CheckPres : System.Web.UI.Page
    {
        private String p1 = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                p1 = Request.QueryString["data"];
                ViewState["id"] = p1;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String Uid = ViewState["id"] as String;
            int PharID = Convert.ToInt32(Uid);
            String Date = PID.Text;
            int DocID = Convert.ToInt32(DID.Text);
            int patID = Convert.ToInt32(ID.Text);

            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewProfile = new SqlCommand("SELECT P.p_date, P.doc_id, patient_id, pharma_id FROM prescription P INNER JOIN Prec_Check PC ON P.p_date = PC.p_date AND P.doc_id = PC.doc_id INNER JOIN presc_for PF ON P.p_date = PF.p_date AND P.doc_id = PF.doc_id WHERE P.p_date = @Date AND P.doc_id = @DoctorID AND PF.patient_id = @PatientID AND PC.pharma_id = @PharmacistID", conn);
            viewProfile.Parameters.AddWithValue("@Date", Date);
            viewProfile.Parameters.AddWithValue("@DoctorID", DocID);
            viewProfile.Parameters.AddWithValue("@PatientID", patID);
            viewProfile.Parameters.AddWithValue("@PharmacistID", PharID);
            viewProfile.CommandType = CommandType.Text;
            conn.Open();
            SqlDataReader reader = viewProfile.ExecuteReader();

            if (reader.HasRows)
            {
                viewProfilelist.Text = "<table border='3'> " + "<tr><th>Prescription Date</th><th>Doctor ID</th><th>Patient ID</th><th>Pharmacist ID</th></tr>";

                while (reader.Read())
                {
                    viewProfilelist.Text += "<tr>";
                    viewProfilelist.Text += "<td>" + reader["p_date"] + "</td>";
                    viewProfilelist.Text += "<td>" + reader["doc_id"] + "</td>";
                    viewProfilelist.Text += "<td>" + reader["patient_id"] + "</td>";
                    viewProfilelist.Text += "<td>" + reader["pharma_id"] + "</td>";
                    viewProfilelist.Text += "</tr>";
                }

                viewProfilelist.Text += "</table>";
            }
            else
            {
                // Format the message to be bigger, bold, and positioned lower on the page
                viewProfilelist.Text = "<div class='message' style='color: red; font-size: 24px; font-weight: bold; text-align: center; margin-top: 50px;'>No Prescription Found</div>";
            }

            conn.Close();
        }
    }
}