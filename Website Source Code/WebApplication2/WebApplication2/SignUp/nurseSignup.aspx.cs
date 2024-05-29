using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.SignUp
{
    public partial class nurseSignup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Sub_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ND.Text);
            String fn = f_name.Text;
            String mn = m_name.Text;
            String ln = l_name.Text;
            String pass = Password.Text;

            insert(id, fn, mn, ln, pass);
        }
        protected void insert(int id, String f_name, String m_name, String l_name, String Password)
        {



            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // SQL query to execute the stored procedure
                string query = "NurseRegister";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;

                    // Add parameters to the stored procedure , , @emergency_num VARCHAR(20), @p_password VARCHAR(20))
                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@f_name", f_name);
                    command.Parameters.AddWithValue("@m_name", m_name);
                    command.Parameters.AddWithValue("@l_name", l_name);
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