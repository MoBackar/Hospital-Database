using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.Patients
{
    public partial class chkdoctors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillHospitals();
            }
        }
        protected void hospitals_SelectedIndexChanged(object sender, EventArgs e)
        {
            String selectedhosp = hospitals.SelectedItem.Text;
            fillTable(selectedhosp);
        }
        protected void fillHospitals()
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            string query = "SELECT h_name FROM Hospital";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand gethosps = new SqlCommand(query, conn);

            conn.Open();
            SqlDataReader reader = gethosps.ExecuteReader();
            hospitals.DataSource = reader;
            hospitals.DataTextField = "h_name";
            hospitals.DataBind();
            conn.Close();
        }

        protected void fillTable(String s)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewdocs = new SqlCommand("PatCheckPerHos", conn);
            viewdocs.CommandType = System.Data.CommandType.StoredProcedure;
            viewdocs.Parameters.Add(new SqlParameter("@name", s));
            SqlDataAdapter adapter = new SqlDataAdapter(viewdocs);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            doctors.DataSource = dataTable;
            doctors.DataBind();
        }
    }
}