using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_WatchWave.Admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            if (txtunm.Text != null && txtpass.Text != null)
            {
                if (txtunm.Text == "hgondaliya000@rku.ac.in" && txtpass.Text == "7920")
                {
                    Session["username"] = txtunm.Text;
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    Response.Write("<script> alert('enter valid value') </script>");
                }
            }
        }
    }
}