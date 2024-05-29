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
    public partial class patientSignup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void w_Click(object sender, EventArgs e)
        {
            var id = Convert.ToInt32(Id.Text);
            var rname = name.Text;
            var rage = Convert.ToInt32(age.Text);
            var d = Diet.Text;
            var er = Excercise.Text;
            var emna = E_Name.Text;
            var emn = E_num.Text;
            var pas = password.Text;

            insert(id, rname, rage, d, er, emna, emn, pas);
        }
        protected void insert(int id, String name, int age, String diet, String execrcise, String EM_name, String EM_Num, String Password)
        {



            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // SQL query to execute the stored procedure
                string query = "PatientRegister";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;

                    // Add parameters to the stored procedure , , @emergency_num VARCHAR(20), @p_password VARCHAR(20))
                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@p_name", name);
                    command.Parameters.AddWithValue("@age", age);
                    command.Parameters.AddWithValue("@diet", diet);
                    command.Parameters.AddWithValue("@exercise", execrcise);
                    command.Parameters.AddWithValue("@emergency_name", EM_name);
                    command.Parameters.AddWithValue("@emergency_number", EM_Num);
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
                        l1.Text = "Error: Please Try Again!";

                    }
                }
            }
        }
    }
}