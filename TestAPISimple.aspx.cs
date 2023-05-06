using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CountryRoads
{
    public partial class TestAPISimple : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected async void Button1_Click(object sender, EventArgs e)
        {
            var client = new HttpClient();
            var request = new HttpRequestMessage
            {
                Method = HttpMethod.Get,
                RequestUri = new Uri("https://rest-country-api.p.rapidapi.com/"),
                Headers =
                {
                    { "X-RapidAPI-Key", "8f6c6ab0c3mshc7efaf2e55a1070p1f04cajsna153dead5087" },
                    { "X-RapidAPI-Host", "rest-country-api.p.rapidapi.com" },
                },
            };
            using (var response = await client.SendAsync(request))
            {
                response.EnsureSuccessStatusCode();
                var body = await response.Content.ReadAsStringAsync();
                Console.WriteLine(body);
                testresult.Text = body;
            }
        }

        protected async void Button2_Click(object sender, EventArgs e)
        {
            //fetch
            var client = new HttpClient();
            var request = new HttpRequestMessage
            {
                Method = HttpMethod.Get,
                RequestUri = new Uri("https://rest-country-api.p.rapidapi.com/"),
                Headers =
                {
                    { "X-RapidAPI-Key", "8f6c6ab0c3mshc7efaf2e55a1070p1f04cajsna153dead5087" },
                    { "X-RapidAPI-Host", "rest-country-api.p.rapidapi.com" },
                },
            };
            using (var response = await client.SendAsync(request))
            {
                response.EnsureSuccessStatusCode();
                var body = await response.Content.ReadAsStringAsync();
                var jsonObject = JsonConvert.DeserializeObject<List<test>>(body);

                //SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Github\\CountryRoads\\App_Data\\CountryRoadsDB.mdf;Integrated Security=True");
                //con.Open();

                //foreach(var country in jsonObject) 
                //    {
                //    using (var cmd = new SqlCommand("INSERT INTO country (countryId, countryName, countryCapital, countryFlag, countryArea, " +
                //        "countryPopulation, countryLanguage, countryCurrency, countryTimeZone, continentCode) VALUES (@countryId, @countryName, " +
                //        "@countryCapital, @countryFlag, @countryArea, @countryPopulation, @countryLanguage, @countryCurrency, @countryTimeZone, TA)", con))
                //        {
                //            cmd.Parameters.AddWithValue("@countryCode", country.CountryId);
                //            cmd.Parameters.AddWithValue("@countryName", country.CountryName);
                //            cmd.Parameters.AddWithValue("@countryCapital", country.CountryCapital);
                //            cmd.Parameters.AddWithValue("@countryFlag", country.CountryFlag);
                //            cmd.Parameters.AddWithValue("@countryArea", country.CountryArea);
                //            cmd.Parameters.AddWithValue("@countryPopulation", country.CountryPopulation);
                //            cmd.Parameters.AddWithValue("@countryLanguage", country.CountryLanguage);
                //            cmd.Parameters.AddWithValue("@countryCurrency", country.CountryCurrency);
                //            cmd.Parameters.AddWithValue("@countryTimezone", country.CountryTimezone);

                //            cmd.ExecuteNonQuery();

                //        break;
                //        }
                //    };

                //con.Close();

                SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Github\\CountryRoads\\App_Data\\CountryRoadsDB.mdf;Integrated Security=True");
                con.Open();

                foreach (var test in jsonObject)
                {
                    using (var cmd = new SqlCommand("INSERT INTO testing VALUES (@countryID, @countryFlag, @countryArea, @countryPopulation)", con))
                    {
                        cmd.Parameters.AddWithValue("@countryFlag", test.flag);
                        cmd.Parameters.AddWithValue("@countryArea", test.area);
                        cmd.Parameters.AddWithValue("@countryPopulation", test.population);
                        

                        cmd.ExecuteNonQuery();

                        break;
                    }
                };

                con.Close();

            }
            //perform add into db
            
        }
    }
}