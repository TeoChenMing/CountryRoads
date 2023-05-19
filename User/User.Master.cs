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
                LoginButton.Visible = false;
                UserProfileButton.Text = "Good day " + Session["userName"];
            }
            else
            {
                LogoutButton.Visible = false;
                UserProfileButton.Visible = false;
                QuizzesButton.Visible = false;
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/UserLogin.aspx");
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Remove("userName");
            Response.Redirect("~/User/UserLandingPage.aspx");
        }

        protected void QuizzesButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/UserQuestions.aspx");
        }
    }
}