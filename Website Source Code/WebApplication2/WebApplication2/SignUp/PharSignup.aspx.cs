using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.SignUp
{
    public partial class PharSignup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Sub_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ND.Text);
            String SA = Date.Text;
            String n = name.Text;
            String pn = pname.Text;
            String pass = Password.Text;

            insert(id, SA, n, pn, pass);
        }
        protected void insert(int id, String Date, String name, String pname, String Password)
        {



            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // SQL query to execute the stored procedure
                string query = "PharmacistRegister";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;

                    // Add parameters to the stored procedure , , @emergency_num VARCHAR(20), @p_password VARCHAR(20))
                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@started_at",Date);
                    command.Parameters.AddWithValue("@p_name", name);
                    command.Parameters.AddWithValue("@ph_name", pname);
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