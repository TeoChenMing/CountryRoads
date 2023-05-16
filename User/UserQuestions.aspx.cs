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
    public partial class UserQuestions : System.Web.UI.Page
    {
        protected DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
                con.Open();

                SqlDataAdapter da = new SqlDataAdapter("SELECT TOP 1 * FROM questions INNER JOIN country ON questions.countryId = country.countryId ORDER BY NEWID()", con);

                dt = new DataTable();
                da.Fill(dt);

                DataBind();

            }
            else
            {
                Response.Redirect("~/User/UserLogin.aspx");
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {

        }
    }
}