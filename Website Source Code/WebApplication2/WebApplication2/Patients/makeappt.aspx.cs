using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.Patients
{
    public partial class makeappt : System.Web.UI.Page
    {
        private String id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                id = Request.QueryString["data"];
                ViewState["id"] = id;
                fillDocs();
            }
        }

        protected void fillDocs()
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            string query = "SELECT d_name FROM Doctor";

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand gethosps = new SqlCommand(query, conn);

            conn.Open();
            SqlDataReader reader = gethosps.ExecuteReader();
            doctors.DataSource = reader;
            doctors.DataTextField = "d_name";
            doctors.DataBind();
            conn.Close();
        }

        protected void confirm(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand makeapt = new SqlCommand("MakeAppointment", conn);
            makeapt.CommandType = System.Data.CommandType.StoredProcedure;
            String did = doctors.SelectedItem.Text;

            SqlCommand getid = new SqlCommand("getDocID", conn);
            getid.CommandType = System.Data.CommandType.StoredProcedure;
            getid.Parameters.Add(new SqlParameter("@name", did));
            SqlParameter id = getid.Parameters.Add("@id", System.Data.SqlDbType.Int);
            id.Direction = System.Data.ParameterDirection.Output;
            conn.Open();
            getid.ExecuteNonQuery();
            conn.Close();

            makeapt.Parameters.Add(new SqlParameter("@DoctorID", id));
            String pid = ViewState["id"] as String;
            makeapt.Parameters.Add(new SqlParameter("@PatientID", Int16.Parse(pid)));
            SqlParameter succ = makeapt.Parameters.Add("@succ", System.Data.SqlDbType.Int);
            succ.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            makeapt.ExecuteNonQuery();
            conn.Close();

            if (succ.Value.ToString() == "1")
            {
                Label2.Visible = true;
                Label2.Text = "Confirmed!";
            }
            else
            {
                Label2.Visible = true;
                Label2.Text = "Cannot make the appointment!";
            }
        }
    }
}