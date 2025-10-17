using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_WatchWave.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardCounts();
            }
        }

        private void LoadDashboardCounts()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                // Customers
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM register", con))
                    lblUsers.Text = cmd.ExecuteScalar().ToString();

                // Watches
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM watch_info", con))
                    lblProducts.Text = cmd.ExecuteScalar().ToString();

                // Total Stock
                using (SqlCommand cmd = new SqlCommand("SELECT ISNULL(SUM(Quantity),0) FROM watch_info", con))
                    lblStock.Text = cmd.ExecuteScalar().ToString();

                // Recent 5 Customers
                using (SqlCommand cmd = new SqlCommand("SELECT TOP 5 Id, Username, Email FROM register ORDER BY Id DESC", con))
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    gvCustomers.DataSource = dr;
                    gvCustomers.DataBind();
                    dr.Close();
                }

                // Recent 5 Watches
                using (SqlCommand cmd = new SqlCommand("SELECT TOP 5 Id, WatchName, Brand, Price FROM watch_info ORDER BY Id DESC", con))
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    gvWatches.DataSource = dr;
                    gvWatches.DataBind();
                    dr.Close();
                }
            }
        }

    }
}