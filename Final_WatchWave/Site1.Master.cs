using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_WatchWave
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null)
                {
                    string fullname = Session["user"].ToString();  // e.g. "Harshil Gondaliya"

                    // Split by space and take first letters
                    string[] parts = fullname.Split(' ');
                    string initials = string.Join("", parts.Select(p => p[0])).ToUpper();

                    lblInitials.Text = initials;

                    // Show initials + logout
                    lblInitials.Visible = true;
                    btnLogout.Visible = true;

                    // Hide profile icon
                    //imgProfile.Visible = false;
                }
                else
                {
                    // Show profile icon
                    //imgProfile.Visible = true;

                    // Hide initials + logout
                    lblInitials.Visible = false;
                    btnLogout.Visible = false;
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear session and redirect to login
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}