using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static NodaTime.TimeZones.TzdbZone1970Location;
using static NodaTime.TimeZones.ZoneEqualityComparer;

namespace CountryRoads.User
{
    public partial class UserQuestions : System.Web.UI.Page
    {
        protected DataTable dt, userDt, questionsDt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
                con.Open();

                SqlDataAdapter da = new SqlDataAdapter("SELECT TOP 1 * FROM questions INNER JOIN country ON questions.countryId = country.countryId ORDER BY NEWID()", con);

                dt = new DataTable();
                da.Fill(dt);

                SqlDataAdapter questionsDA = new SqlDataAdapter("SELECT TOP 5 * FROM questions " +
                                                                "INNER JOIN country ON questions.countryId = country.countryId " +
                                                                "WHERE country.countryId IN " +
                                                                "( SELECT countryId FROM userView " +
                                                                "INNER JOIN users ON users.userId = userView.userId " +
                                                                "WHERE users.username = '" + Session["userName"] + "' ) " +
                                                                "ORDER BY NEWID()", con);

                questionsDt = new DataTable();
                questionsDA.Fill(questionsDt);

                // get total attempts
                SqlDataAdapter userDA = new SqlDataAdapter("SELECT * FROM users WHERE username = '" + Session["userName"] + "'", con);

                userDt = new DataTable();
                userDA.Fill(userDt);

                DataBind();

                con.Close();

            }
            else
            {
                Response.Redirect("~/User/UserLogin.aspx");
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            var session_username = Session["userName"];

            SqlCommand cmdType = new SqlCommand("SELECT * FROM users WHERE username = '" + session_username + "' ", con);
            SqlDataReader dr = cmdType.ExecuteReader();

            int quizAssessedOri = 0;

            while (dr.Read())
            {
                quizAssessedOri = Int32.Parse(dr["quizAssessed"].ToString());
            }

            quizAssessedOri += 1;

            dr.Close();

            using (var cmd = new SqlCommand("UPDATE users SET quizAssessed = @quizAssessed WHERE username = @username", con))
            {
                cmd.Parameters.AddWithValue("@quizAssessed", quizAssessedOri);
                cmd.Parameters.AddWithValue("@username", Session["userName"]);

                cmd.ExecuteNonQuery();

            }

            con.Close();
            Response.Redirect(Request.RawUrl);
        }
    }
}