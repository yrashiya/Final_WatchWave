using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;

namespace add_product
{
    public partial class Shop : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        ReportDocument crystalReport = new ReportDocument();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProducts();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void BindProducts(string search = "")
        {
            getcon();
            string query = "SELECT * FROM Watch_Info";

            if (!string.IsNullOrEmpty(search))
            {
                query += " WHERE WatchName LIKE @search OR Brand LIKE @search OR Type LIKE @search";
            }

            da = new SqlDataAdapter(query, con);
            if (!string.IsNullOrEmpty(search))
            {
                da.SelectCommand.Parameters.AddWithValue("@search", "%" + search + "%");
            }

            ds = new DataSet();
            da.Fill(ds);
            dlProducts.DataSource = ds;
            dlProducts.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindProducts(txtSearch.Text.Trim());
        }

        protected void dlProducts_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
        {
            if (e.CommandName == "addtocart")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                // Redirect to AddToCart page with productId in query string
                Response.Redirect("AddToCart.aspx?id=" + productId);
            }
            else if (e.CommandName == "viewdetail")
            {
                Response.Redirect("ViewDetail.aspx?id=" + e.CommandArgument);
            }
        }

        protected void dlProducts_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string sql = "SELECT Id, WatchName, Brand, Type, Price, Quantity, Image FROM watch_info";
                DataSet ds = new DataSet();
                SqlDataAdapter adp = new SqlDataAdapter(sql, con);
                adp.Fill(ds);

                crystalReport.Load(Server.MapPath("~/CRWatchInfo.rpt"));
                crystalReport.SetDataSource(ds.Tables[0]);

                crystalReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Watch_Info_Crystal_Report");
                crystalReport.Close();
                crystalReport.Dispose();
                Response.End();
            }
        }
    }
}
