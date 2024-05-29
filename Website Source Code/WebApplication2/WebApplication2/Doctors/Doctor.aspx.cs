using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    
    public partial class Doctor : System.Web.UI.Page
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

        protected void INFO_Click(object sender, EventArgs e)
        {
            String Uid = ViewState["id"] as String;
            Response.Redirect("Doctor_View_My_Profile.aspx?data=" + Server.UrlEncode(Uid));
        }

        protected void Patient_Click(object sender, EventArgs e)
        {
            String Uid = ViewState["id"] as String;
            Response.Redirect("Patients_Records.aspx?data=" + Server.UrlEncode(Uid));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String Uid = ViewState["id"] as String;
            Response.Redirect("Request_Lab_Test.aspx?data=" + Server.UrlEncode(Uid));
        }

        protected void Pres_Click(object sender, EventArgs e)
        {
            String Uid = ViewState["id"] as String;
            Response.Redirect("Write_Presc.aspx?data=" + Server.UrlEncode(Uid));
        }

        protected void Phone_Click(object sender, EventArgs e)
        {
            String Uid = ViewState["id"] as String;
            Response.Redirect("Phones.aspx?data=" + Server.UrlEncode(Uid));
        }
    }
}