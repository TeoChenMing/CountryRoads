using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CountryRoads
{
    public partial class addDataIntoTables : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_addToUsers_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
                con.Open();

                /*string Query = "select count(*) from users where username = '" + username.Text + "'";
                SqlCommand cmd = new SqlCommand(Query, con);
                int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());*/

                // create record in a table called users
                string query1 = "INSERT INTO users VALUES (@username, @password, @email, @fullName, @gender, @quizAccessed, @status)";
                SqlCommand cmd1 = new SqlCommand(query1, con);

                cmd1.Parameters.AddWithValue("@username", "username3");
                cmd1.Parameters.AddWithValue("@password", "password3");
                cmd1.Parameters.AddWithValue("@email", "email3@email.com");
                cmd1.Parameters.AddWithValue("@fullName", "John Wick3");
                cmd1.Parameters.AddWithValue("@gender", "Female");
                cmd1.Parameters.AddWithValue("@quizAccessed", 0);
                cmd1.Parameters.AddWithValue("@status", "Banned");
                cmd1.ExecuteNonQuery();
                Response.Redirect("addDataIntoTables.aspx");

                con.Close();
            }
            catch 
            {                
            }
        }

        protected void btn_clearUsers_Click(object sender, EventArgs e)
        {

        }

        protected void btn_addToQuestions_Click(object sender, EventArgs e)
        {

        }

        protected void btn_clearQuestions_Click(object sender, EventArgs e)
        {

        }
    }
}