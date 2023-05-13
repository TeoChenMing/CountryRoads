using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlTypes;
using NodaTime;
using TimeZoneNames;
using System.Security.Policy;
using System.Web.ModelBinding;

namespace CountryRoads.User
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["countryId"] != null)
            {
                Session.Remove("countryId");
            }
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
                SqlCommand cmdType = new SqlCommand("SELECT * FROM country WHERE countryName = '" + country + "'", con);
                SqlDataReader dr = cmdType.ExecuteReader();

                while (dr.Read())
                {
                    string countryId = dr["countryId"].ToString().Trim();
                    string countryName = dr["countryName"].ToString().Trim();
                    string countryFlag = dr["countryFlag"].ToString().Trim();
                    string countryCapital = dr["countryCapital"].ToString().Trim();
                    string countryArea = dr["countryArea"].ToString().Trim();
                    string countryPopulation = dr["countryPopulation"].ToString().Trim();
                    string countryLanguage = dr["countryLanguage"].ToString().Trim();
                    string countryTimezone = dr["countryTimeZone"].ToString().Trim();
                    string countryCurrency = dr["countryCurrency"].ToString().Trim();

                    DateTimeZone timezone = DateTimeZoneProviders.Tzdb[countryTimezone];    
                    string timezoneName = TZNames.GetDisplayNameForTimeZone(timezone.Id, "en-US");
                    DateTime utcTime = DateTime.UtcNow;

                    var instant = Instant.FromDateTimeUtc(DateTime.SpecifyKind(utcTime, DateTimeKind.Utc));
                    var result = instant.InZone(timezone).ToDateTimeUnspecified();

                    Session["countryId"] = countryId;
                    CountryNameModal.InnerText = countryName;
                    CountryFlagImage.ImageUrl = countryFlag;
                    CountryTimeModal.Text = "Local time: " + result.ToString();
                }



                // Call Javascript function openModal()
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "openModal()", true);
            }
            else
            {
                return;
            }
        }
    }
}