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

                bool genderChecked;

                if (male.Checked) 
                {
                    genderChecked = true;
                }
                else if (female.Checked)
                {
                    genderChecked = true;
                } else
                {
                    genderChecked = false;
                }

                ErrorMsg.Text = "";

                // Simple Validation
                if (username.Text.Trim() == "" || email.Text.Trim() == "" || password.Text.Trim() == "" || confirmPassword.Text.Trim() == "" || fullName.Text.Trim() == "" || !genderChecked)
                {
                    ErrorMsg.Visible = true;
                    ErrorMsg.Text = "Please fill in all fields!";
                    return;
                }

                if (password.Text.Trim() != confirmPassword.Text.Trim())
                {
                    ErrorMsg.Visible = true;
                    ErrorMsg.Text = "Passwords do not match!";
                    return;
                }
                else if (password.Text.Trim().Length < 6)
                {
                    ErrorMsg.Visible = true;
                    ErrorMsg.Text = "Password must be at least 6 characters long!";
                    return;
                }


                String query = "select count(*) from users where username = '" + username.Text + "'or email = '" + email.Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                if (check > 0)
                {
                    ErrorMsg.Visible = true;
                    ErrorMsg.Text = "Username or Email Address has been used!";
                    return;
                }

                else
                {
                    //create record in a table called userTable
                    string query1 = "insert into users (username, password, email, fullName, gender, quizAssessed, status, dateCreated) values (@username, @password, @email, @fullName, @gender, @quizAssessed, @status, @dateCreated)";
                    SqlCommand cmd1 = new SqlCommand(query1, con);

                    cmd1.Parameters.AddWithValue("@username", username.Text.Trim());
                    cmd1.Parameters.AddWithValue("@password", password.Text.Trim());
                    cmd1.Parameters.AddWithValue("@email", email.Text.Trim());
                    cmd1.Parameters.AddWithValue("@fullName", fullName.Text.Trim());
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
                    cmd1.Parameters.AddWithValue("@quizAssessed", 0);
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
                return;
            }
        }

    }
}