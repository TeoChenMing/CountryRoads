using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CountryRoads.User
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                Response.Redirect("~/User/UserLandingPage.aspx");
            }
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT count(*) FROM users WHERE username = '" + usernameInput.Text + "'and password = '" + passwordInput.Text + "'", con);

            int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

            if (count > 0)
            {
                SqlCommand cmdType = new SqlCommand("SELECT status, username, fullName FROM users WHERE username = '" + usernameInput.Text + "'", con);
                SqlDataReader dr = cmdType.ExecuteReader();

                string username = "";
                string status = "";

                while (dr.Read())
                {
                    username = dr["username"].ToString();
                    status = dr["status"].ToString().Trim();
                }

                if (status.Equals("Banned"))
                {
                    ErrorMsg.Text = "You have been banned LMAO GET REKT :c";
                    return;
                }

                Session["userName"] = username;
                Response.Redirect("UserLandingPage.aspx");
            }

            else
            {
                ErrorMsg.Text = "Username or Password is incorrect. Please Try Again.";
                return;
            }


            con.Close();
        }
    }
}