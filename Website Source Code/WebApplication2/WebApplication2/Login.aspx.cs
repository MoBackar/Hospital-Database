using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication2.Nurse.Nurse_pt1;

namespace WebApplication2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void login(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int id = Int16.Parse(username.Text);
            String password = password1.Text;

            SqlCommand loginproc = new SqlCommand("userLogin", conn);
            loginproc.CommandType = System.Data.CommandType.StoredProcedure;
            loginproc.Parameters.Add(new SqlParameter("@id", id));
            loginproc.Parameters.Add(new SqlParameter("@password", password));

            SqlParameter succ = loginproc.Parameters.Add("@success", System.Data.SqlDbType.Int);
            succ.Direction = System.Data.ParameterDirection.Output;
            SqlParameter type = loginproc.Parameters.Add("@type", System.Data.SqlDbType.Int);
            type.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            loginproc.ExecuteNonQuery();
            conn.Close();

            if (succ.Value.ToString() == "1")
            {
                Response.Write("Hello");
                if (type.Value.ToString() == "1")
                {
                    Response.Redirect("Doctors/Doctor.aspx?data=" + Server.UrlEncode(username.Text));
                }
                if (type.Value.ToString() == "2")
                {
                    Response.Redirect("Patients/patient.aspx?data=" + Server.UrlEncode(username.Text));
                }
                if (type.Value.ToString() == "3")
                {
                    Response.Redirect("Pharmacist/Pharmacist.aspx?data=" + Server.UrlEncode(username.Text));
                }
                if (type.Value.ToString() == "4")
                {
                    Response.Redirect("Nurse/Nurse.aspx");
                }
            }
            else
            {
                Label1.Visible = true;
            }
        }
    }
}