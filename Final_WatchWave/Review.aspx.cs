using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;
using System.Data;

using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;

namespace Final_WatchWave
{
    public partial class Review : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        ReportDocument crystalReport = new ReportDocument();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getcon();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            txtName.Text = "";
            txtReview.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtName.Text) && !string.IsNullOrWhiteSpace(txtReview.Text))
            {
                getcon();

                // Use parameters to prevent SQL injection
                cmd = new SqlCommand("INSERT INTO review(Name, ReviewText) VALUES(@Name, @ReviewText)", con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@ReviewText", txtReview.Text);
                cmd.ExecuteNonQuery();

                clear();

                // Show success message
                lblMessage.Text = "Review submitted successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMessage.Text = "Please fill in both fields.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string sql = "SELECT ReviewId, Name, ReviewText, ReviewDate FROM review";
                DataSet ds = new DataSet();
                SqlDataAdapter adp = new SqlDataAdapter(sql, con);
                adp.Fill(ds);

                crystalReport.Load(Server.MapPath("~/CRReview.rpt"));
                crystalReport.SetDataSource(ds.Tables[0]);

                crystalReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Review_Crystal_Report");
                crystalReport.Close();
                crystalReport.Dispose();
                Response.End();
            }
        }
    }
}