using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace CountryRoads.Admin
{
    public partial class AdminManageUsers : System.Web.UI.Page
    {
        protected DataTable dt;

        protected string userStatus = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
                con.Open();

                //if (!Page.IsPostBack)
                //{
                    SqlDataAdapter da = new SqlDataAdapter("select * from users", con);

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

        /*protected void Update_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            using (var cmd = new SqlCommand("UPDATE users SET username = @username, password = @password, email = @email, fullName = @fullName, " +
                "gender = @gender, quizAccessed = @quizAccessed, status = @status WHERE userId = @userId", con))
            {
                cmd.Parameters.AddWithValue("@userId", UserId.Value);
                cmd.Parameters.AddWithValue("@username", Username.Value);
                cmd.Parameters.AddWithValue("@password", Password.Value);
                cmd.Parameters.AddWithValue("@email", Email.Value);
                cmd.Parameters.AddWithValue("@fullName", FullName.Value);
                cmd.Parameters.AddWithValue("@gender", Gender.Value);
                cmd.Parameters.AddWithValue("@quizAccessed", QuizAccessed.Value);
                cmd.Parameters.AddWithValue("@status", Status.Value);
                cmd.ExecuteNonQuery();

            }

            con.Close();
            Response.Redirect(Request.RawUrl);
        }*/

        protected void Unban_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            using (var cmd = new SqlCommand("UPDATE users SET status = @status WHERE userId = @userId", con))
            {
                cmd.Parameters.AddWithValue("@userId", Int32.Parse(UserId.Value.Trim()));
                cmd.Parameters.AddWithValue("@status", "Active");
                cmd.ExecuteNonQuery();

            }

            con.Close();
            Response.Redirect(Request.RawUrl);
        }

        protected void Ban_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            using (var cmd = new SqlCommand("UPDATE users SET status = @status WHERE userId = @userId", con))
            {
                cmd.Parameters.AddWithValue("@userId", Int32.Parse(UserId.Value.Trim()));
                cmd.Parameters.AddWithValue("@status", "Banned");
                cmd.ExecuteNonQuery();

            }

            con.Close();
            Response.Redirect(Request.RawUrl);
        }

    }
}