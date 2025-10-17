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
    public partial class Shop_PB_ : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        PagedDataSource pg;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["pid"] = 0;
            }

            getcon();
            filllist();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            if (con.State != System.Data.ConnectionState.Open)
                con.Open();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            int currentpage = Convert.ToInt32(ViewState["pid"]);
            currentpage++;
            ViewState["pid"] = currentpage;
            filllist();
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            int currentpage = Convert.ToInt32(ViewState["pid"]);
            currentpage--;
            ViewState["pid"] = currentpage;
            filllist();
        }

        void filllist()
        {
            da = new SqlDataAdapter("SELECT * FROM watch_info", con);
            ds = new DataSet();
            da.Fill(ds);
            DataTable productsTable = ds.Tables[0];

            pg = new PagedDataSource
            {
                AllowPaging = true,
                PageSize = 3,
                CurrentPageIndex = Convert.ToInt32(ViewState["pid"]),
                DataSource = productsTable.DefaultView
            };

            ///btnPrev.Enabled = !pg.IsFirstPage;
            ///btnNext.Enabled = !pg.IsLastPage;

//            DataList1.DataSource = pg;
  //          DataList1.DataBind();
        }

        //protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        //{
        //    if (e.CommandName == "cmd_view")
        //    {
        //        int id = Convert.ToInt32(e.CommandArgument);
        //        Response.Redirect("ViewDetail.aspx?id=" + id);
        //    }
        //    else if (e.CommandName == "cmd_add")
        //    {
        //        // get user data
        //        da = new SqlDataAdapter("select * from user_tbl where Email ='" + Session["user"] + "'", con);
        //        ds = new DataSet();
        //        da.Fill(ds);
        //        int uid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

        //        // get product data
        //        int pid = Convert.ToInt32(e.CommandArgument);
        //        da = new SqlDataAdapter("select * from add_prod where Id ='" + pid + "'", con);
        //        ds = new DataSet();
        //        da.Fill(ds);
        //        string pname = ds.Tables[0].Rows[0][2].ToString();
        //        decimal pprice = Convert.ToDecimal(ds.Tables[0].Rows[0][4]);
        //        string pimage = ds.Tables[0].Rows[0][5].ToString();  // Assuming image is in 6th column (index 5)
        //        int pquantity = 1;

        //        // insert to cart table with updated field names and image
        //        //cmd = new SqlCommand("insert into cart_tbl (UserId, ProductId, ProdName, ProdPrice, ProdQuantity, ProdImage) values('" + uid + "','" + pid + "','" + pname + "','" + pprice + "','" + pquantity + "','" + pimage + "')", con);
        //        //cmd.ExecuteNonQuery();
        //    }
        //}
    }
}
