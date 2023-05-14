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
    public partial class AdminManageQuestions : System.Web.UI.Page
    {
        protected DataTable dt, countryDT;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
                con.Open();

                SqlDataAdapter da = new SqlDataAdapter("select * from questions", con);

                dt = new DataTable();
                da.Fill(dt);

                SqlDataAdapter countryDA = new SqlDataAdapter("select * from country", con);

                countryDT = new DataTable();
                countryDA.Fill(countryDT);

                DataBind();

            }
            else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx");
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            using (var cmd = new SqlCommand("UPDATE questions SET countryId = @countryId, quizType = @quizType, title = @title, " +
                "options = @options, answer = @answer WHERE questionId = @questionId", con))
            {
                cmd.Parameters.AddWithValue("@questionId", questionId.Value);
                cmd.Parameters.AddWithValue("@countryId", countryId.Value);
                cmd.Parameters.AddWithValue("@quizType", quizType.Value);
                cmd.Parameters.AddWithValue("@title", title.Value);
                cmd.Parameters.AddWithValue("@options", options.Value);
                cmd.Parameters.AddWithValue("@answer", answer.Value);

                cmd.ExecuteNonQuery();

            }

            con.Close();
            Response.Redirect(Request.RawUrl);
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            

            con.Close();
            Response.Redirect(Request.RawUrl);
        }

        protected void AddQuestion_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            using (var cmd = new SqlCommand("INSERT INTO questions VALUES (@countryId, @quizType, @title, @options, @answer)", con))
            {
                cmd.Parameters.AddWithValue("@countryId", countryId.Value);
                cmd.Parameters.AddWithValue("@quizType", "TrueFalse");
                cmd.Parameters.AddWithValue("@title", title.Value);
                cmd.Parameters.AddWithValue("@options", "True||False");
                cmd.Parameters.AddWithValue("@answer", answer.Value);

                cmd.ExecuteNonQuery();

            }

            con.Close();
            Response.Redirect(Request.RawUrl);
        }
    }
}