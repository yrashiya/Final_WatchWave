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
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;


namespace user_re_lo
{
    public partial class Login : System.Web.UI.Page
    {
        String s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;//Connection
        SqlDataAdapter da;//Container
        DataSet ds;//Run time container
        SqlCommand cmd;//insert update delete
        string fnm;
        ReportDocument crystalReport = new ReportDocument();
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (TextBox1.Text != null && TextBox2.Text != null)
            {
                getcon();
                //cmd = new SqlCommand("select count(*) from [Login] where Email='" + TextBox1.Text + "' and Password='" + TextBox2.Text + "'", con);
                cmd = new SqlCommand("select count(*) from register where Username='" + TextBox1.Text + "' and Password='" + TextBox2.Text + "'", con);
                int i = Convert.ToInt32(cmd.ExecuteScalar());
                if (i > 0)
                {
                    Session["user"] = TextBox1.Text;
                    Response.Redirect("Main.aspx");   // go to home page after login
                }
                else
                {
                    Response.Write("<script>alert('Invalid Email or Password');</script>");
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string sql = "SELECT Id, Username, Email, Password FROM register";
                DataSet ds = new DataSet();
                SqlDataAdapter adp = new SqlDataAdapter(sql, con);
                adp.Fill(ds);

                crystalReport.Load(Server.MapPath("~/CRRegister.rpt"));
                crystalReport.SetDataSource(ds.Tables[0]);

                crystalReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Register_Crystal_Report");
                crystalReport.Close();
                crystalReport.Dispose();
                Response.End();
            }
        }
    }
}
