using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CountryRoads.User
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
                con.Open();

                //if (!Page.IsPostBack)
                //{
                SqlDataAdapter da = new SqlDataAdapter("select * from country", con);

                //dt = new DataTable();
                //da.Fill(dt);

                DataBind();


                //}
            }
            else
            {
                LogoutButton.Visible = false;
                UserProfileButton.Visible = false;
                
            }
        }
    }
}