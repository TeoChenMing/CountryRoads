using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace CountryRoads.User
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
                con.Open();

                String query = "select count(*) from users where username = '" + username.Text + "'or email = '" + email.Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                if (check > 0)
                {
                    ErrorMsg.Visible = true;
                    ErrorMsg.Text = "Username or Email Address has been used!";
                }

                else
                {
                    //create record in a table called userTable
                    string query1 = "insert into users (username, password, email, fullName, gender, quizAccessed, status, dateCreated) values (@username, @password, @email, @fullName, @gender, @quizAccessed, @status, @dateCreated)";
                    SqlCommand cmd1 = new SqlCommand(query1, con);

                    cmd1.Parameters.AddWithValue("@username", username.Text);
                    cmd1.Parameters.AddWithValue("@password", password.Text);
                    cmd1.Parameters.AddWithValue("@email", email.Text);
                    cmd1.Parameters.AddWithValue("@fullName", fullName.Text);
                    string selectedGender = "";
                    if (male.Checked)
                    {
                        selectedGender = male.Text;
                    }
                    else if (female.Checked)
                    {
                        selectedGender = female.Text;
                    }
                    cmd1.Parameters.AddWithValue("@gender", selectedGender);
                    cmd1.Parameters.AddWithValue("@quizAccessed", 0);
                    cmd1.Parameters.AddWithValue("@status", "Active");

                    DateTime now = DateTime.Now;
                    cmd1.Parameters.AddWithValue("@dateCreated", now);

                    cmd1.ExecuteNonQuery();
                    Response.Redirect("UserLogin.aspx");
                }
                con.Close();
            }

            catch
            {
                ErrorMsg.Visible = true;
                ErrorMsg.Text = "Registration not successful!";
            }
        }

    }
}