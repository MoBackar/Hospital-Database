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
    public partial class patient : System.Web.UI.Page
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
        protected void viewprofile(object sender, EventArgs e)
        {
            DataTable dataTable = fillTable();
            GridView1.DataSource = dataTable;
            GridView1.DataBind();

        }
        protected DataTable fillTable()
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String uid = ViewState["id"] as String;
            SqlCommand viewprof = new SqlCommand("viewMyProfile", conn);
            viewprof.CommandType = System.Data.CommandType.StoredProcedure;
            viewprof.Parameters.Add(new SqlParameter("@id", uid));
            SqlDataAdapter adapter = new SqlDataAdapter(viewprof);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            return dataTable;
        }
        protected void editprofile(object sender, EventArgs e)
        {
            RadioButtonList1.Visible = true;
            TextBox1.Visible = true;
            Button3.Visible = true;
        }
        protected void submitedit(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String uid = ViewState["id"] as String;
            SqlCommand editprof = new SqlCommand("EditMyProfile", conn);
            editprof.CommandType = System.Data.CommandType.StoredProcedure;
            editprof.Parameters.Add(new SqlParameter("@id", uid));

            string selectedValue = RadioButtonList1.SelectedValue;

            switch (selectedValue)
            {
                case "1":
                    editprof.Parameters.Add(new SqlParameter("@p_name", TextBox1.Text));
                    break;

                case "2":
                    editprof.Parameters.Add(new SqlParameter("@age", Int16.Parse(TextBox1.Text)));
                    break;

                case "3":
                    editprof.Parameters.Add(new SqlParameter("@diet", TextBox1.Text));
                    break;

                case "4":
                    editprof.Parameters.Add(new SqlParameter("@excercise", TextBox1.Text));
                    break;

                case "5":
                    editprof.Parameters.Add(new SqlParameter("@E_M", TextBox1.Text));
                    break;

                case "6":
                    editprof.Parameters.Add(new SqlParameter("@E_P", TextBox1.Text));
                    break;

                case "7":
                    editprof.Parameters.Add(new SqlParameter("@password", TextBox1.Text));
                    break;
            }
            conn.Open();
            editprof.ExecuteNonQuery();
            conn.Close();
            DataTable dataTable = fillTable();
            GridView1.DataSource = dataTable;
            GridView1.DataBind();
        }
        protected void chkhospitals(object sender, EventArgs e)
        {
            Response.Redirect("chkhospitals.aspx");
        }

        protected void chkdoctors(object sender, EventArgs e)
        {
            Response.Redirect("chkdoctors.aspx");
        }

        protected void makeappt(object sender, EventArgs e)
        {
            String uid = ViewState["id"] as String;
            Response.Redirect("makeappt.aspx?data=" + Server.UrlEncode(uid));
        }
    }
}