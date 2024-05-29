using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.Patients
{
    public partial class chkhospitals : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            fillTable();
        }

        protected void fillTable()
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewhosp = new SqlCommand("PatCheckHos", conn);
            viewhosp.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(viewhosp);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            hospitals.DataSource = dataTable;
            hospitals.DataBind();
        }
    }
}