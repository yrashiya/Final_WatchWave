// Page name: OrderConfirmed.aspx.cs
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Runtime.Remoting.Messaging;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;
namespace Final_WatchWave
{
    public partial class OrderConfirmed : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        SqlCommand cmd;
        ReportDocument crystalReport = new ReportDocument();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string mobile = Request.QueryString["mobile"];
                if (string.IsNullOrEmpty(mobile))
                {
                    litMessage.Text = "<span style='color:red;font-weight:bold;'>Mobile number is required.</span>";
                    rptOrders.Visible = false;
                    return;
                }

                LoadConfirmedOrders(mobile);
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void LoadConfirmedOrders(string mobile)
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM OrderMaster WHERE Mobile='" + mobile + "' ORDER BY OrderDate DESC", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0)
            {
                litMessage.Text = "<b>No confirmed orders found for this mobile number.</b>";
                rptOrders.Visible = false;
            }
            else
            {
                rptOrders.DataSource = ds;
                rptOrders.DataBind();
                rptOrders.Visible = true;
            }

            con.Close();
        }

        protected void rptOrders_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView orderRow = (DataRowView)e.Item.DataItem;
                int orderId = Convert.ToInt32(orderRow["OrderID"]);

                Repeater rptOrderDetails = (Repeater)e.Item.FindControl("rptOrderDetails");

                getcon();
                da = new SqlDataAdapter("SELECT * FROM OrderDetails WHERE OrderID='" + orderId + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                rptOrderDetails.DataSource = ds;
                rptOrderDetails.DataBind();
                con.Close();
            }
        }

        protected void btnBackToShop_Click(object sender, EventArgs e)
        {
            Response.Redirect("Shop.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string sql = "SELECT OrderID, CustomerName, Mobile, Address, District, Taluko, OrderDate, PaymentMethod FROM OrderMaster";
                DataSet ds = new DataSet();
                SqlDataAdapter adp = new SqlDataAdapter(sql, con);
                adp.Fill(ds);

                crystalReport.Load(Server.MapPath("~/CROrderMaster.rpt"));
                crystalReport.SetDataSource(ds.Tables[0]);

                crystalReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Order_Master_Crystal_Report");
                crystalReport.Close();
                crystalReport.Dispose();
                Response.End();
            }
        }
    }
}
