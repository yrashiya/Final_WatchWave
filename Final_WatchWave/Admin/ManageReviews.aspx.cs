using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Final_WatchWave.Admin
{
    public partial class ManageReviews : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindReviews();
            }
        }

        private void BindReviews()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT ReviewId, Name, ReviewText FROM review ORDER BY ReviewId DESC";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvReviews.DataSource = dt;
                gvReviews.DataBind();
            }
        }

        protected void gvReviews_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvReviews.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "DELETE FROM review WHERE ReviewId = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            BindReviews();
        }
    }
}