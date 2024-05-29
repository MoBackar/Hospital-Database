using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.Doctors
{
    public partial class Request_Lab_Test : System.Web.UI.Page
    {
        private String id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                id = Request.QueryString["data"];
                ViewState["id"] = id;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            String Uid = ViewState["id"] as String;
            int DocID = Convert.ToInt32(Uid);
            var patientId = Convert.ToInt32(PID.Text);
            var TestID= Convert.ToInt32(LID.Text);

            ReqLab(DocID, TestID, patientId);
        }

        protected void ReqLab(int DocId, int testID, int PatID)
        {



            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // SQL query to execute the stored procedure
                string query = "ReqLab";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;

                    // Add parameters to the stored procedure
                    command.Parameters.AddWithValue("@DoctorId", DocId);
                    command.Parameters.AddWithValue("@PatientID", PatID);
                    command.Parameters.AddWithValue("@labID", testID);

                    try
                    {
                        command.ExecuteNonQuery();
                        string alertMessage = $"alert('Successfuly Registered');";
                        ClientScript.RegisterStartupScript(this.GetType(), "PopupScript", alertMessage, true);
                        lbl1.Text = "";


                    }
                    catch (Exception ex)
                    {
                        lbl1.Text = "Error: Try Again With Diffrent Inputs";

                    }
                }
            }
        }

    }
    
}