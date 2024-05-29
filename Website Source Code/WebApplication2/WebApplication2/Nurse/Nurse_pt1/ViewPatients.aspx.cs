using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.Nurse.Nurse_pt1
{
    public partial class ViewPatients : System.Web.UI.Page
    {
        public void Page_Load(object sender, EventArgs e)
        {
            
                String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    SqlCommand viewPatients = new SqlCommand("SELECT * FROM Patient", conn);
                    viewPatients.CommandType = CommandType.Text;

                    using (SqlDataReader reader = viewPatients.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            l1.Text = "<table border='3'> " +
                                      "<tr><th>ID</th><th>Name</th><th>Age</th><th>Diet</th><th>Exercise</th><th>Emergency Name</th><th>Emergency Number</th></tr>";

                            while (reader.Read())
                            {
                                l1.Text += "<tr>";
                                l1.Text += "<td>" + reader["id"] + "</td>";
                                l1.Text += "<td>" + reader["p_name"] + "</td>";
                                l1.Text += "<td>" + reader["age"] + "</td>";
                                l1.Text += "<td>" + reader["diet"] + "</td>";
                                l1.Text += "<td>" + reader["exercise"] + "</td>";
                                l1.Text += "<td>" + reader["emergency_name"] + "</td>";
                                l1.Text += "<td>" + reader["emergency_num"] + "</td>";
                                l1.Text += "</tr>";
                            }

                            l1.Text += "</table>";
                        }
                        else
                        {
                            // Display a message if there are no patients
                            l1.Text = "<div class='message' style='color: red; font-size: 24px; font-weight: bold; text-align: center; margin-top: 50px;'>There are no patients</div>";
                        }
                    
                }
            }
           
        }
    }
}