using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace Manage_p_r
{
    public partial class ManageProducts : System.Web.UI.Page
    {
        String s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;       // Connection
        SqlDataAdapter da;       // Container
        DataSet ds;              // Runtime container
        SqlCommand cmd;          // Insert/Update/Delete
        string fnm;              // Image path

        protected void Page_Load(object sender, EventArgs e)
        {
           if (!IsPostBack)
            {
                getcon();
                fillgrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void imgupload()
        {
            if (fuImage.HasFile)
            {
                fnm = "images/" + fuImage.FileName;
                fuImage.SaveAs(Server.MapPath(fnm));
            }
        }

        void clear()
        {
            txtWatchName.Text = "";
            txtPrice.Text = "";
            txtQty.Text = "";
            ddlBrand.ClearSelection();
            rdbType.ClearSelection();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (Button1.Text == "Save Watch")
                {
                    getcon();
                    imgupload();

                    cmd = new SqlCommand("insert into watch_info(WatchName,Brand,Type,Price,Quantity,Image) " +
                        "values('" + txtWatchName.Text + "','" + ddlBrand.SelectedValue + "','" + rdbType.Text + "','" + txtPrice.Text + "','" + txtQty.Text + "','" + fnm + "')", con);

                    cmd.ExecuteNonQuery();
                    fillgrid();
                    clear();
                    Response.Redirect(Request.RawUrl);
                }
                else
                {
                    getcon();
                    cmd = new SqlCommand("update watch_info set WatchName='" + txtWatchName.Text + "',Brand='" + ddlBrand.SelectedValue + "',Type='" + rdbType.Text + "',Price='" + txtPrice.Text + "',Quantity='" + txtQty.Text + "' where Id='" + ViewState["id"] + "'", con);

                    cmd.ExecuteNonQuery();
                    fillgrid();
                    clear();
                    Button1.Text = "Save Watch";
                    Response.Redirect(Request.RawUrl);
                }

            }
        }
        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from watch_info", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        void select()
        {
            getcon();
            da = new SqlDataAdapter("select * from watch_info where Id='" + ViewState["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            // pairing
            txtWatchName.Text = ds.Tables[0].Rows[0]["WatchName"].ToString();
            ddlBrand.SelectedValue = ds.Tables[0].Rows[0]["Brand"].ToString();
            rdbType.SelectedValue = ds.Tables[0].Rows[0]["Type"].ToString();
            txtPrice.Text = ds.Tables[0].Rows[0]["Price"].ToString();
            txtQty.Text = ds.Tables[0].Rows[0]["Quantity"].ToString();
        }

        void delete()
        {
            getcon();
            da = new SqlDataAdapter("delete from watch_info where Id='" + ViewState["no"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;
                Button1.Text = "Update Watch";
                select();
            }
            else if (e.CommandName == "cmd_dlt")
            {
                int no = Convert.ToInt32(e.CommandArgument);
                ViewState["no"] = no;
                delete();
                GridView1.DataBind();
                fillgrid();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;
                Button1.Text = "Update Watch";
                select();
            }
            else if (e.CommandName == "cmd_dlt")
            {
                int no = Convert.ToInt32(e.CommandArgument);
                ViewState["no"] = no;
                delete();
                GridView1.DataBind();
                fillgrid();
            }
        }
    }
}