using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace add_product
{
    public partial class ViewDetail : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;      // connection
        SqlDataAdapter da;      // adapter
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fill();
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fill()
        {
            getcon();
            da = new SqlDataAdapter("select * from watch_info where Id='" + Request.QueryString["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblName.Text = ds.Tables[0].Rows[0]["WatchName"].ToString();
                lblBrand.Text = ds.Tables[0].Rows[0]["Brand"].ToString();
                lblType.Text = ds.Tables[0].Rows[0]["Type"].ToString();
                lblPrice.Text = ds.Tables[0].Rows[0]["Price"].ToString();
                lblQty.Text = ds.Tables[0].Rows[0]["Quantity"].ToString();

                // show image
                imgWatch.ImageUrl = ds.Tables[0].Rows[0]["Image"].ToString();
            }
        }
    }
}