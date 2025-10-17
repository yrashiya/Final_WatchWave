using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_WatchWave.Admin
{
    public partial class AdminLogout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            // Optional: clear authentication cookie if using Forms Authentication
            if (Request.Cookies[".ASPXAUTH"] != null)
            {
                HttpCookie authCookie = new HttpCookie(".ASPXAUTH");
                authCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(authCookie);
            }

            // Redirect to login page
            Response.Redirect("AdminLogin.aspx");
        }
    }
}