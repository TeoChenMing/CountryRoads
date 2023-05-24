using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CountryRoads.User
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected DataTable dt;
        protected DataTable dtable;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();
            SqlDataAdapter da;
            SqlDataAdapter sda;

            if (Session["userName"] != null)
            {
                da = new SqlDataAdapter("SELECT * FROM country c INNER JOIN userBookmark ub ON c.countryId = ub.countryId INNER JOIN users u ON ub.userId = u.userId WHERE u.userName = '" + Session["userName"] + "' ORDER BY c.countryName ASC", con);
                dt = new DataTable();
                da.Fill(dt);

                sda = new SqlDataAdapter(
                    "SELECT TOP 5 * FROM userView " +
                    "INNER JOIN country ON userView.countryID = country.countryId " +
                    "INNER JOIN users ON userView.userId = users.userId " +
                    "WHERE users.userName = '" + Session["userName"] + "' " +
                    "ORDER BY viewId DESC", con);
                dtable = new DataTable();
                sda.Fill(dtable);

                DataBind();
            } else
            {
                Response.Redirect("UserLogin.aspx");
            }

        }

        protected void SelectedContinent_ValueChanged(object sender, EventArgs e)
        {

        }

        protected void SelectedCountry_ValueChanged(object sender, EventArgs e)
        {

        }

        protected void FilterCountries_Click(object sender, EventArgs e)
        {

        }

        protected void CountryDetailsButton_Click(object sender, EventArgs e)
        {
            string countryId = SelectedCountry.Value.ToString().Trim();

            if (countryId != null || countryId != "")
            {
                Session["countryId"] = countryId;
            }

            Response.Redirect("UserCountryDetails.aspx");

            string countryName = SelectedCountry.Value.ToString().Trim();

            if (countryName != null || countryName != "")
            {
                Session["countryName"] = countryName;
            }

            Response.Redirect("UserCountryDetails.aspx");

        }
    }
}