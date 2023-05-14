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
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string userId = "";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("SELECT userId FROM users WHERE username = '" + Session["userName"] + "'", con);
            dt = new DataTable();
            da.Fill(dt);
            con.Close();

            foreach (DataRow row in dt.Rows)
            {
                userId = row["userId"].ToString();
            }

            if (Session["userName"] != null)
            {
                con.Open();
                string query1 = "INSERT INTO contactAdmin VALUES (@userId, @username, @description, @email)";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                cmd1.Parameters.AddWithValue("@userId", userId);
                cmd1.Parameters.AddWithValue("@username", Session["userName"]);
                cmd1.Parameters.AddWithValue("@description", EnquiryText.Text);
                cmd1.Parameters.AddWithValue("@email", DBNull.Value);

                cmd1.ExecuteNonQuery();
                con.Close();
            } else
            {
                Random rng = new Random();
                int value = rng.Next(100000);
                string num = value.ToString("00000");

                con.Open();
                string query1 = "INSERT INTO contactAdmin VALUES (@userId, @username, @description, @email)";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                cmd1.Parameters.AddWithValue("@userId", DBNull.Value);
                cmd1.Parameters.AddWithValue("@username", "Guest"+num);
                cmd1.Parameters.AddWithValue("@description", EnquiryText.Text);
                cmd1.Parameters.AddWithValue("@email", EmailText.Text);

                cmd1.ExecuteNonQuery();
                con.Close();
            }

            Response.Redirect("UserLandingPage.aspx");
        }
    }
}