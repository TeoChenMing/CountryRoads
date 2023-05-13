using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NodaTime;
using TimeZoneNames;
using static NodaTime.TimeZones.TzdbZone1970Location;
using System.Web.Http.Results;
using System.Drawing;

namespace CountryRoads.User
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM country WHERE countryId = '" + Session["countryId"] + "'", con);

            int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

            if (count == 1)
            {
                getCountryData();
                if (Session["userName"] != null)
                {
                    cmd = new SqlCommand("SELECT * FROM users WHERE username = '" + Session["userName"] + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    // create record in a table called users

                    while (dr.Read())
                    {
                        var userid = dr["userId"].ToString().Trim();
                        checkUser(userid);
                    }
                }
            }
            else
            {
                CountryName.InnerText = "No country selected";
                CountryFlag.ImageUrl = "../Assets/Images/imagePlaceholder.png";
                CountryCapital.Text = "";
                CountryArea.Text = "";
                CountryPopulation.Text = "";
                CountryLanguages.Text = "";
                CountryCurrency.Text = "";
                CountryTimeZone.Text = "";
                CountryTime.Text = "";
            }
            con.Close();
        }

        protected void getCountryData()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            SqlCommand cmdType = new SqlCommand("SELECT * FROM country WHERE countryId = '" + Session["countryId"] + "'", con);
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

                string[] countryLanguageList = countryLanguage.Split(',');
                countryLanguage = string.Join(", ", countryLanguageList);

                Session["countryId"] = countryId;
                CountryName.InnerText = countryName;
                CountryFlag.ImageUrl = countryFlag;
                CountryCapital.Text = countryCapital;
                CountryArea.Text = double.Parse(countryArea).ToString("N0") + " km²";
                CountryPopulation.Text = double.Parse(countryPopulation).ToString("N0");
                CountryLanguages.Text = countryLanguage;
                CountryCurrency.Text = countryCurrency;
                CountryTimeZone.Text = countryTimezone;
                CountryTimeZoneName.Text = timezoneName;
                CountryTime.Text = $"({result.ToString()})";

                factCapital.Text = "The capital of " + countryName + " is " + countryCapital + ".";
                factSize.Text = countryName + " has an area of " + double.Parse(countryArea).ToString("N0") + "km².";
                getFactSize(countryId, double.Parse(countryArea).ToString("N0"));
                factPopulation.Text = countryName + " has a population of " + int.Parse(countryPopulation).ToString("N0") + " people.";
                getFactPopulation(countryId, int.Parse(countryPopulation).ToString("N0"));
                getFactLanguage(countryName, countryLanguageList);
            }
            DataBind();
        }

        protected void getFactSize(string countryId, string size)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();
            SqlDataAdapter da;

            //check for largest country area
            da = new SqlDataAdapter("SELECT TOP 30 countryId, countryName, countryArea FROM country ORDER BY countryArea DESC", con);

            dt = new DataTable();
            da.Fill(dt);

            int rowNum = 1;
            foreach (DataRow row in dt.Rows)
            {
                if (row["countryId"].ToString().Equals(countryId))
                {
                    factSize.Text = row["countryName"] + " is ranked " + rowNum + " in largest country in the world with an area of " + size + " km².";
                    return;
                }
                rowNum++;

            }

            //check for largest country area
            da = new SqlDataAdapter("SELECT TOP 100 countryId, countryName, countryArea FROM country ORDER BY countryArea ASC", con);

            dt = new DataTable();
            da.Fill(dt);

            rowNum = 1;
            foreach (DataRow row in dt.Rows)
            {
                if (row["countryId"].ToString().Equals(countryId))
                {
                    factSize.Text = row["countryName"] + " is ranked " + rowNum + " in smallest country in the world with an area of " + size + " km².";
                    return;
                }
                rowNum++;

            }
        }

        protected void getFactPopulation(string countryId, string population)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();
            SqlDataAdapter da;

            //check for largest country population
            da = new SqlDataAdapter("SELECT TOP 30 countryId, countryName, countryPopulation FROM country ORDER BY countryPopulation DESC", con);

            dt = new DataTable();
            da.Fill(dt);

            int rowNum = 1;
            foreach (DataRow row in dt.Rows)
            {
                if (row["countryId"].ToString().Equals(countryId))
                {
                    factPopulation.Text = row["countryName"] + " has a population of " + population + " people which is ranked " + rowNum + " highest in the world.";
                    return;
                }
                rowNum++;

            }

            //check for largest country population
            da = new SqlDataAdapter("SELECT TOP 30 countryId, countryName, countryPopulation FROM country ORDER BY countryPopulation ASC", con);

            dt = new DataTable();
            da.Fill(dt);

            rowNum = 1;
            foreach (DataRow row in dt.Rows)
            {
                if (row["countryId"].ToString().Equals(countryId))
                {
                    factPopulation.Text = row["countryName"] + " has a population of " + population + " people which is ranked " + rowNum + " lowest in the world.";
                    return;
                }
                rowNum++;

            }
        }

        protected void getFactLanguage(string countryName, string[] languagelist)
        {
            if (languagelist.Length == 1)
            {
                factLanguage.Text = countryName + " is a monolingual country which mainly uses " + languagelist[0].ToString() + ".";
                return;
            }

            if (languagelist.Length == 2)
            {
                factLanguage.Text = countryName + " is a bilingual country which mainly uses " + languagelist[0].ToString() + " and " + languagelist[1].ToString() + ".";
                return;
            }

            if (languagelist.Length >= 2)
            {
                factLanguage.Text = countryName + " is a multilingual country which mainly uses " + languagelist[0].ToString() + ", " + languagelist[1].ToString() + ", " + languagelist[2].ToString() + " and more.";
                return;
            }
        }

        protected void checkUser(string userId)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM userView WHERE userId = '" + userId + "' AND countryId = '" + Session["countryId"] + "'", con);
            int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

            if (count == 0)
            {
                string query1 = "INSERT INTO userView VALUES (@userId, @countryId)";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                cmd1.Parameters.AddWithValue("@userId", userId);
                cmd1.Parameters.AddWithValue("@countryId", Session["countryId"]);

                cmd1.ExecuteNonQuery();
                con.Close();
            }            
        }
    }
}