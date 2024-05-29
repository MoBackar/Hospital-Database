using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.Nurse.Nurse_pt1
{
    public partial class TC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            var TreatmentId = Convert.ToInt32(ID.Text);
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                SqlCommand viewPatients = new SqlCommand("SELECT * FROM Treatment where id=@id and insured= '1'", conn);
                viewPatients.Parameters.AddWithValue("@id", TreatmentId);
                viewPatients.CommandType = CommandType.Text;

                using (SqlDataReader reader = viewPatients.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        l1.Text = "<div class='message' style='color: green; font-size: 24px; font-weight: bold; text-align: center; margin-top: 50px;'>Treatment Is Insured</div>";
                    }
                    else
                    {
                        // Display a message if there are no patients
                        l1.Text = "<div class='message' style='color: red; font-size: 24px; font-weight: bold; text-align: center; margin-top: 50px;'>Treatment Not Insured</div>";
                    }

                }
            }
        }
    }
}