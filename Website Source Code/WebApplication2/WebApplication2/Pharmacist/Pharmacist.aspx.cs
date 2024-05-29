using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.Pharmacist
{
    public partial class Pharmacist : System.Web.UI.Page
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

        protected void VMP_Click(object sender, EventArgs e)
        {
            String Uid = ViewState["id"] as String;
            Response.Redirect("Phar_VMP.aspx?data=" + Server.UrlEncode(Uid));
        }

        protected void CP_Click(object sender, EventArgs e)
        {
            String Uid = ViewState["id"] as String;
            Response.Redirect("CheckPres.aspx?data=" + Server.UrlEncode(Uid));
        }

        protected void zew_Click(object sender, EventArgs e)
        {
            Response.Redirect("PDP.aspx");
        }

        protected void VAP_Click(object sender, EventArgs e)
        {
            Response.Redirect("VAP.aspx");
        }

        protected void Up_Click(object sender, EventArgs e)
        {
            String Uid = ViewState["id"] as String;
            Response.Redirect("Up.aspx?data=" + Server.UrlEncode(Uid));
        }
    }
}