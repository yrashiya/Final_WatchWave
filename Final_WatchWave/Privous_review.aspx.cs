using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Final_WatchWave
{
    public partial class Privous_review : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadReviews();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        void loadReviews()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM review ORDER BY ReviewDate DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            rptReviews.DataSource = ds;
            rptReviews.DataBind();
            con.Close();
        }

        void delete(int id)
        {
            getcon();
            da = new SqlDataAdapter("DELETE FROM review WHERE ReviewId = '" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds); // Using your preferred SqlDataAdapter method
            con.Close();
        }

        protected void btnGoToReview_Click(object sender, EventArgs e)
        {
            Response.Redirect("Review.aspx");
        }

        protected void rptReviews_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteReview")
            {
                int reviewId = Convert.ToInt32(e.CommandArgument);
                delete(reviewId);
                loadReviews(); // Refresh the list
            }
        }
    }
}