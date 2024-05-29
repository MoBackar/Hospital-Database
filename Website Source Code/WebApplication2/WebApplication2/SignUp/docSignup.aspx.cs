using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.Services.Discovery;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.SignUp
{
    public partial class docSignup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(DID.Text);
            String name = N.Text;
            String Hospital = H.Text;
            String Spec = S.Text;
            String Password = P.Text;

            insert(id, name, Spec, Hospital, Password);
        }

        protected void insert(int id, String name,String Spec,String H_name , String Password)
        {



            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // SQL query to execute the stored procedure
                string query = "DoctorRegister";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;

                    // Add parameters to the stored procedure , , @emergency_num VARCHAR(20), @p_password VARCHAR(20))
                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@d_name", name);
                    command.Parameters.AddWithValue("@specialization", Spec);
                    command.Parameters.AddWithValue("@h_name", H_name);
                    command.Parameters.AddWithValue("@password", Password);

                    try
                    {
                        command.ExecuteNonQuery();
                        string alertMessage = $"alert('Successfuly Registered');";
                        ClientScript.RegisterStartupScript(this.GetType(), "PopupScript", alertMessage, true);
                        l1.Text = "";



                    }
                    catch (Exception ex)
                    {
                        l1.Text = "Error : Please Try Again!";

                    }
                }
            }
        }

    }

}