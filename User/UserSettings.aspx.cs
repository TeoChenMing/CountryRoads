using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CountryRoads.User
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                Response.Redirect("UserLogin.aspx");
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT count(*) FROM users WHERE username = '" + Session["userName"] + "' AND password = '" + currentPass.Text +"'", con);
            int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

            if (count > 0)
            {
                var np = newPass.Text;
                var cnp = confirmNewPass.Text;

                curPassErrorMsg.Text = "";
                errorMessage.Text = "";

                if (np.Trim() == "" || cnp.Trim() == "")
                {
                    errorMessage.Text = "Please fill in required fields";
                    return;
                } 
                else if (np.Trim().Length < 6)
                {
                    errorMessage.Text = "Passwords must be longer than 6 characters";
                    return;
                }
                else if (np.Trim() != cnp.Trim()) {
                    errorMessage.Text = "Passwords do not match";
                    return;
                }
                else
                {
                    using (var newCmd = new SqlCommand("UPDATE users SET password = @password WHERE username = @username", con))
                    {
                        newCmd.Parameters.AddWithValue("@password", np.Trim());
                        newCmd.Parameters.AddWithValue("@username", Session["userName"]);

                        newCmd.ExecuteNonQuery();
                    }
                }
            }
            else
            {
                curPassErrorMsg.Text = "Password Incorrect.";
                return;
            }

            con.Close();

            Session["userName"] = null;
            Response.Redirect("UserLogin.aspx");
        }


    }
}