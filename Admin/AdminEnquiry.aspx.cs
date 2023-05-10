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
    public partial class AdminEnquiry : System.Web.UI.Page
    {
        protected DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
                con.Open();

                //if (!Page.IsPostBack)
                //{
                SqlDataAdapter da = new SqlDataAdapter("select * from contactAdmin", con);

                dt = new DataTable();
                da.Fill(dt);

                DataBind();


                //}
            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx");
            }
        }
    }
}