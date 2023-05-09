using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CountryRoads.Admin
{
    public partial class AdminManageContent : System.Web.UI.Page
    {
        protected DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
                con.Open();

                if (!Page.IsPostBack)
                {
                    SqlDataAdapter da = new SqlDataAdapter("select * from country", con);

                    dt = new DataTable();
                    da.Fill(dt);

                    DataBind();


                }
            } else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx");
            }
            
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            
            SqlDataAdapter da = new SqlDataAdapter("select * from country", con);

            dt = new DataTable();
            da.Fill(dt);

            DataBind();

            Label1.Text = CountryName.Value;

            //DataTable dt = (DataTable)ViewState["dt"];
        }

   
       
    }
}