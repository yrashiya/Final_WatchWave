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

namespace user_re_lo
{
    public partial class Register : System.Web.UI.Page
    {
        String s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            //GridView1.Visible = false;
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

        void clear()
        {
            txtUsername.Text = "";
            txteml.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }

        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from register", con);
            ds = new DataSet();
            da.Fill(ds);
            //GridView1.DataSource = ds;
            //GridView1.DataBind();
        }
       

        void select()
        {
            getcon();
            da = new SqlDataAdapter("select * from register where Id='" + ViewState["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            //pairing
            txtUsername.Text = ds.Tables[0].Rows[0][1].ToString();
            txteml.Text = ds.Tables[0].Rows[0][3].ToString();
            txtPassword.Text = ds.Tables[0].Rows[0][2].ToString();
        }

        void delete()
        {
            getcon();
            da = new SqlDataAdapter("DELETE FROM register WHERE Id='" + ViewState["no"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }



        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt16(e.CommandArgument);
                ViewState["id"] = id;
                Button1.Text = "Update";
                select();
            }
            else if (e.CommandName == "cmd_dlt")
            {
                int no = Convert.ToInt16(e.CommandArgument);
                ViewState["no"] = no;
                delete();
                //GridView1.DataBind();
                fillgrid();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //GridView1.Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (Button1.Text == "Save")
                {
                    getcon();
                    cmd = new SqlCommand("insert into register(Username,Email,Password)" + " Values('" + txtUsername.Text + "','" + txteml.Text + "','" + txtPassword.Text + "')", con);

                    cmd.ExecuteNonQuery();
                    fillgrid();
                    clear();
                    Response.Redirect("Login.aspx");

                }
                else
                {
                    getcon();
                    cmd = new SqlCommand("Update register set Username='" + txtUsername.Text + "',Email='" + txteml.Text + "',Password='" + txtPassword.Text + "' where Id='" + ViewState["id"] + "'", con);
                    cmd.ExecuteNonQuery();
                    fillgrid();
                    clear();
                    Button1.Text = "Save";
                    Response.Redirect("Login.aspx");

                }
            }
        }
    }
}