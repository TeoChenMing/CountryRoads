using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace CountryRoads.Admin
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected DataTable dt;
        protected DataTable dt4;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
                con.Open();

                //if (!Page.IsPostBack)
                //{
                SqlDataAdapter da = new SqlDataAdapter("select COUNT(countryId) from country", con);

                dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    int countryCount = Convert.ToInt32(dt.Rows[0][0]);
                    string countText = countryCount.ToString();

                    // Assign the count value to the label
                    countryProfile.Text = countText;
                }

                SqlDataAdapter da2 = new SqlDataAdapter("SELECT COUNT(userId) from users", con);
                DataTable dt2 = new DataTable();
                da2.Fill(dt2);

                if (dt2.Rows.Count > 0)
                {
                    int userCount = Convert.ToInt32(dt2.Rows[0][0]);
                    string userCountText = userCount.ToString();

                    // Assign the total population value to the second label
                    userProfile.Text = userCountText;
                }

                SqlDataAdapter da3 = new SqlDataAdapter("SELECT SUM(quizAssessed) from users", con);
                DataTable dt3 = new DataTable();
                da3.Fill(dt3);

                if (dt3.Rows.Count > 0)
                {
                    int quizCount = Convert.ToInt32(dt3.Rows[0][0]);
                    string quizCountText = quizCount.ToString();

                    // Assign the total population value to the second label
                    quiz.Text = quizCountText;
                }

                string query = "SELECT TOP 5 userId, fullName, username, email FROM users ORDER BY dateCreated DESC";
                SqlDataAdapter da4 = new SqlDataAdapter(query, con);
                dt4 = new DataTable();
                da4.Fill(dt4);

                DataBind();

            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx");
            }
        }
    }
}