using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.Pharmacist
{
    public partial class Up : System.Web.UI.Page
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

        protected void Updated_Click(object sender, EventArgs e)
        {
            String Uid = ViewState["id"] as String;
            int id = Convert.ToInt32(Uid);
            String date = Date.Text;
            String nameP = name.Text;
            String PharName= Pname.Text;
            String Password=password.Text;

            Update(id, date, nameP, PharName, Password);
        }
        protected void Update(int id, String date, String name,String Pharname,String Pass)
        {



            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // SQL query to execute the stored procedure
                string query = "UpdatePharProfile";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;

                    // Add parameters to the stored procedure
                    command.Parameters.AddWithValue("@ID", id);
                    command.Parameters.AddWithValue("@Started", date);
                    command.Parameters.AddWithValue("@name", name);
                    command.Parameters.AddWithValue("@Phar_name", Pharname);
                    command.Parameters.AddWithValue("@password", Pass);

                    try
                    {
                        command.ExecuteNonQuery();
                        string alertMessage = $"alert('Successfuly Registered');";
                        ClientScript.RegisterStartupScript(this.GetType(), "PopupScript", alertMessage, true);
                        l1.Text = "";


                    }
                    catch (Exception ex)
                    {
                        l1.Text = "Error: Try Again With Diffrent Inputs";

                    }
                }
            }
        }

    }
}