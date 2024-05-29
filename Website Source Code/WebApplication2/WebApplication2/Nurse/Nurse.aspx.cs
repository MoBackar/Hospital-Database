using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.Nurse
{
    public partial class Nurse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void View_Click(object sender, EventArgs e)
        {
            Response.Redirect("Nurse_pt1/ViewPatients.aspx");
        }

        protected void PatView_Click(object sender, EventArgs e)
        {
            Response.Redirect("Nurse_pt1/VFP.aspx");
        }

        protected void DHPCLick(object sender, EventArgs e)
        {
            Response.Redirect("Nurse_pt1/ViewDPH.aspx");
        }

        protected void TC_Click(object sender, EventArgs e)
        {
            Response.Redirect("Nurse_pt1/TC.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Nurse_pt1/EM.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Nursept2/ListDoctors.aspx");
        }

        protected void UP_Click(object sender, EventArgs e)
        {
            Response.Redirect("Nursept2/Up.aspx");
        }

        protected void TT_Click(object sender, EventArgs e)
        {
            Response.Redirect("Nursept2/Takes.aspx");
        }

        protected void PA_Click(object sender, EventArgs e)
        {
            Response.Redirect("Nursept2/Amb.aspx");
        }

        protected void sc_Click(object sender, EventArgs e)
        {
            Response.Redirect("Nursept2/sc.aspx");
        }
    }
}