using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.Doctors
{
    public partial class Phones : System.Web.UI.Page
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

        protected void ADD_Click(object sender, EventArgs e)
        {
            String Uid = ViewState["id"] as String;
            int Docid = Convert.ToInt32(Uid);
            var Mobile= Convert.ToInt32(PhoneNum.Text);
            AddPhone(Docid, Mobile);
        }

        protected void AddPhone(int DocId, int PhoneNum)
        {



            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // SQL query to execute the stored procedure
                string query = "addMobile";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;

                    // Add parameters to the stored procedure
                    command.Parameters.AddWithValue("@id", DocId);
                    command.Parameters.AddWithValue("@mobile", PhoneNum);
                    

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