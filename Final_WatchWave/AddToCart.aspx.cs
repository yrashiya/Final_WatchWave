using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Final_WatchWave
{
    public partial class AddToCart : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        DataTable dtCart;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int productId = Convert.ToInt32(Request.QueryString["id"]);
                    AddProductToCart(productId);
                }
                BindCart();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void AddProductToCart(int productId)
        {
            if (Session["Cart"] == null)
            {
                dtCart = new DataTable();
                dtCart.Columns.Add("Id", typeof(int));
                dtCart.Columns.Add("WatchName", typeof(string));
                dtCart.Columns.Add("Price", typeof(decimal));
                dtCart.Columns.Add("Image", typeof(string));
                dtCart.Columns.Add("Quantity", typeof(int));
            }
            else
            {
                dtCart = (DataTable)Session["Cart"];
            }

            bool exists = false;
            foreach (DataRow row in dtCart.Rows)
            {
                if ((int)row["Id"] == productId)
                {
                    row["Quantity"] = Convert.ToInt32(row["Quantity"]) + 1;
                    exists = true;
                    break;
                }
            }

            if (!exists)
            {
                getcon();
                da = new SqlDataAdapter("SELECT Id, WatchName, Price, Image FROM Watch_Info WHERE Id='" + productId + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataRow dr = ds.Tables[0].Rows[0];
                    DataRow newRow = dtCart.NewRow();
                    newRow["Id"] = dr["Id"];
                    newRow["WatchName"] = dr["WatchName"];
                    newRow["Price"] = dr["Price"];
                    newRow["Image"] = dr["Image"];
                    newRow["Quantity"] = 1;
                    dtCart.Rows.Add(newRow);
                }
                con.Close();
            }

            Session["Cart"] = dtCart;
        }

        void BindCart()
        {
            if (Session["Cart"] != null)
            {
                dtCart = (DataTable)Session["Cart"];
                gvCart.DataSource = dtCart;
                gvCart.DataBind();

                decimal total = 0;
                foreach (DataRow row in dtCart.Rows)
                    total += Convert.ToDecimal(row["Price"]) * Convert.ToInt32(row["Quantity"]);

                lblTotal.Text = "Total: ₹" + total.ToString("N2");
            }
        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (Session["Cart"] != null)
            {
                dtCart = (DataTable)Session["Cart"];
                int productId = Convert.ToInt32(e.CommandArgument);

                foreach (DataRow row in dtCart.Rows)
                {
                    if ((int)row["Id"] == productId)
                    {
                        if (e.CommandName == "IncreaseQty")
                            row["Quantity"] = Convert.ToInt32(row["Quantity"]) + 1;
                        else if (e.CommandName == "DecreaseQty")
                        {
                            int qty = Convert.ToInt32(row["Quantity"]);
                            if (qty > 1) row["Quantity"] = qty - 1;
                        }
                        else if (e.CommandName == "RemoveItem")
                            row.Delete();

                        break;
                    }
                }

                dtCart.AcceptChanges();
                Session["Cart"] = dtCart;
                BindCart();
            }
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            if (Session["Cart"] == null || ((DataTable)Session["Cart"]).Rows.Count == 0)
            {
                string script = @"alert('🛒 Your cart is empty!'); window.location='Shop.aspx';";
                ClientScript.RegisterStartupScript(this.GetType(), "emptyCartMsg", script, true);
            }
            else
            {
                pnlOrderForm.Visible = true;
            }
        }

        protected void btnConfirmOrder_Click(object sender, EventArgs e)
        {
            if (Session["Cart"] != null && ((DataTable)Session["Cart"]).Rows.Count > 0)
            {
                int newOrderId = 0;
                getcon();

                try
                {
                    // Format DateTime properly for SQL Server
                    string formattedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

                    // Insert into OrderMaster
                    cmd = new SqlCommand("INSERT INTO OrderMaster (CustomerName, Mobile, Address, District, Taluko, OrderDate, PaymentMethod) OUTPUT INSERTED.OrderID " +
                        "VALUES('" + txtName.Text + "','" + txtMobile.Text + "','" + txtAddress.Text + "','" + txtDistrict.Text + "','" + txtTaluko.Text + "','" + formattedDate + "','Cash on Delivery')", con);

                    newOrderId = Convert.ToInt32(cmd.ExecuteScalar());

                    // Insert OrderDetails
                    dtCart = (DataTable)Session["Cart"];
                    foreach (DataRow row in dtCart.Rows)
                    {
                        cmd = new SqlCommand("INSERT INTO OrderDetails (OrderID, ProductID, WatchName, Price, Quantity, Image) " +
                            "VALUES('" + newOrderId + "','" + row["Id"] + "','" + row["WatchName"] + "','" + row["Price"] + "','" + row["Quantity"] + "','" + row["Image"] + "')", con);
                        cmd.ExecuteNonQuery();
                    }

                    con.Close();
                    Session.Remove("Cart");
                    Response.Redirect("OrderConfirmed.aspx?mobile=" + txtMobile.Text);
                }
                catch (Exception ex)
                {
                    // Handle the exception
                    string script = "alert('Error placing order: " + ex.Message.Replace("'", "") + "');";
                    ClientScript.RegisterStartupScript(this.GetType(), "orderError", script, true);

                    if (con.State == ConnectionState.Open)
                        con.Close();
                }
            }
        }
    }
}