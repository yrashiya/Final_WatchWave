using System;
using System.Collections.Generic;
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
    public partial class ContactUs : System.Web.UI.Page
    {
        String s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;       // Connection
        SqlCommand cmd;
        ReportDocument crystalReport = new ReportDocument();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Text = "";
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
            txtEmail.Text = "";
            txtSubject.Text = "";
            txtMessage.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                getcon();
                cmd = new SqlCommand("insert into ContactMessages(Name, Email, Subject, Message, DateSent) " + "values('" + txtName.Text + "','" + txtEmail.Text + "','" + txtSubject.Text + "','" + txtMessage.Text + "', getdate())", con);
                cmd.ExecuteNonQuery();
                clear();

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Thank you for contacting us! We will get back to you soon.";

                con.Close();
            }
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
            //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(constr))
            //{
            //    string sql = "SELECT Id, Name, Email, Subject, Message, DateSent FROM ContactMessages";
            //    DataSet ds = new DataSet();
            //    SqlDataAdapter adp = new SqlDataAdapter(sql, con);
            //    adp.Fill(ds);

            //    crystalReport.Load(Server.MapPath("~/CRContactMessages.rpt"));
            //    crystalReport.SetDataSource(ds.Tables[0]);

            //    crystalReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Contact_Messages_Crystal_Report");
            //    crystalReport.Close();
            //    crystalReport.Dispose();
            //    Response.End();
            //}
        //}

        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        string sql = "SELECT Id, Name, Email, Subject, Message, DateSent FROM ContactMessages";
        //        DataSet ds = new DataSet();
        //        SqlDataAdapter adp = new SqlDataAdapter(sql, con);
        //        adp.Fill(ds);

        //        crystalReport.Load(Server.MapPath("~/CRContactMessages.rpt"));
        //        crystalReport.SetDataSource(ds.Tables[0]);

        //        crystalReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Contact_Messages_Crystal_Report");
        //        crystalReport.Close();
        //        crystalReport.Dispose();
        //        Response.End();
        //    }
        //}
    }
}
