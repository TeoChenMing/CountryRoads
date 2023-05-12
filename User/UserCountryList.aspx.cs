using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace CountryRoads.User
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM country WHERE continent LIKE '%"+SelectedContinent.Value+"%' ORDER BY countryName ASC", con);


            dt = new DataTable();
            da.Fill(dt);

            DataBind();
        }

        protected void CountryDetailsButton_Click(object sender, EventArgs e)
        {
            string countryId = SelectedCountry.Value.ToString().Trim();

            if (countryId != null || countryId != "")
            {
                Session["countryId"] = countryId;
            }

            Label1.Text = Session["countryId"] + " is your country";
        }
    }
}