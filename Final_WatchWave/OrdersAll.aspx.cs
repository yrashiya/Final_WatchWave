using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;

namespace Final_WatchWave
{
    public partial class OrdersAll : System.Web.UI.Page
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
                getcon();
                LoadAllOrders();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void LoadAllOrders()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM OrderMaster ORDER BY OrderDate DESC", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0)
            {
                litMessage.Text = "<b>No confirmed orders found.</b>";
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

        protected void rptOrders_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "CancelOrder")
            {
                int orderId = Convert.ToInt32(e.CommandArgument);
                getcon();

                // Delete from OrderDetails
                cmd = new SqlCommand("DELETE FROM OrderDetails WHERE OrderID='" + orderId + "'", con);
                cmd.ExecuteNonQuery();

                // Delete from OrderMaster
                cmd = new SqlCommand("DELETE FROM OrderMaster WHERE OrderID='" + orderId + "'", con);
                cmd.ExecuteNonQuery();

                con.Close();

                // Show confirmation alert
                string script = "alert('Order ID " + orderId + " has been cancelled successfully!');";
                ClientScript.RegisterStartupScript(this.GetType(), "cancelMsg", script, true);

                // Reload the orders
                LoadAllOrders();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string sql = "SELECT OrderDetailID, OrderID, ProductID, WatchName, Price, Quantity, Image FROM OrderDetails";
                DataSet ds = new DataSet();
                SqlDataAdapter adp = new SqlDataAdapter(sql, con);
                adp.Fill(ds);

                crystalReport.Load(Server.MapPath("~/CROrderDetails.rpt"));
                crystalReport.SetDataSource(ds.Tables[0]);

                crystalReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Order_Details_Crystal_Report");
                crystalReport.Close();
                crystalReport.Dispose();
                Response.End();
            }
        }
    }
}
