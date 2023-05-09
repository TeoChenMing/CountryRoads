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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CountryButton_Click(object sender, EventArgs e)
        {
            var country = SendA.Value;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM country WHERE countryName = '" + country + "'", con);

            int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

            if (count > 0)
            {
                SqlCommand cmdType = new SqlCommand("SELECT countryCurrency FROM country WHERE countryName = '" + country + "'", con);
                SqlDataReader dr = cmdType.ExecuteReader();

                string currency = "";

                while (dr.Read())
                {
                    currency = dr["countryCurrency"].ToString().Trim();
                    Label1.Text = currency.ToString();
                }

            }
            else
            {
                Label1.Text = "N/A";
                return;
            }
        }
    }
}