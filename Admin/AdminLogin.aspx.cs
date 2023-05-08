using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CountryRoads.Admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand("select count(*) from admin where username = '" + username.Text + "'and password = '" + password.Text + "'", con);

            int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

            if (count > 0)
            {
                SqlCommand cmdType = new SqlCommand("select username from admin where username = '" + username.Text + "'", con);
                SqlDataReader dr = cmdType.ExecuteReader();

                string name = "";

                while (dr.Read())
                {

                    name = dr["username"].ToString().Trim();
                }


                Session["userName"] = name;

                
                Response.Redirect("~/Admin/AdminDashboard.aspx");
                
       
            }
            else
            {
                
                return;
            }

            con.Close();
        }
    }
}