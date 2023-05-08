using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

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
                var jsonObject = JsonConvert.DeserializeObject<List<test>>(body);
                string continentsString;

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
                con.Open();

                foreach (var test in jsonObject.Take(5))
                {
                    if (test.continents.Count > 2)
                    {

                        continentsString = string.Join(", ", test.continents);

                    }
                    else
                    {
                        continentsString = test.continents[0];
                    }


                    //Console.WriteLine(body);
                    testresult.Text += continentsString;
                }
                    
                

                //using (StreamWriter writer = new StreamWriter("C:\\Users\\aaron\\Documents\\GitHub\\CountryRoads\\country.txt"))
                //{
                //    writer.WriteLine(body);
                //}
            }
        }

        protected async void Button2_Click(object sender, EventArgs e)
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
                var jsonObject = JsonConvert.DeserializeObject<List<test>>(body);
                string continentsString;

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
                con.Open();

                foreach (var test in jsonObject)
                {
                    if (test.continents.Count > 1) {

                        continentsString = string.Join(", ", test.continents);

                    } else
                    {
                        continentsString = test.continents[0];
                    }
                    

                    using (var cmd = new SqlCommand("UPDATE country SET continent = @continent WHERE countryName = @countryName", con))
                    {

                        cmd.Parameters.AddWithValue("@countryName", test.name.common);
                        cmd.Parameters.AddWithValue("@continent", continentsString);


                        cmd.ExecuteNonQuery();
                    }
                };

                con.Close();

            }
            //perform add into db

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string readText = File.ReadAllText("C:\\Users\\aaron\\Documents\\GitHub\\CountryRoads\\country.txt");
            var jsonObject = JsonConvert.DeserializeObject<List<test>>(readText);
            string currencies = "";

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            foreach (var test in jsonObject)
            {
                var currenciesJSON = test.currencies.ToString();

                try
                {
                    var currencyJSON = JsonConvert.DeserializeObject<Dictionary<String, Object>>(test.currencies.ToString());
                    foreach (var key in currencyJSON.Values.Take(1))
                    {
                        string[] currencyDetails = new string[2];
                        int increment = 0;
                        var detailsJSON = JsonConvert.DeserializeObject<Dictionary<String, String>>(key.ToString());
                        foreach (var details in detailsJSON)
                        {
                            currencyDetails[increment] = details.Value;
                            increment++;
                        }
                        currencies = String.Join(", ", currencyDetails);
                    }
                }
                catch
                {
                    currencies = "NULL";
                }

                Label1.Text += currencies;

                using (var cmd = new SqlCommand("INSERT INTO country VALUES (@countryId, @countryName, @countryCapital, @countryFlag, @countryArea, @countryPopulation ,@countryLanguage, @countryCurrency, @countryTimezone, NULL)", con))
                {
                    cmd.Parameters.AddWithValue("@countryId", test.cca3);
                    cmd.Parameters.AddWithValue("@countryName", test.name.common);
                    
                    try
                    {
                        cmd.Parameters.AddWithValue("@countryCapital", test.capital[0] ?? (Object)DBNull.Value);
                    }
                    catch
                    {
                        cmd.Parameters.AddWithValue("@countryCapital", DBNull.Value);
                    }
                    
                    cmd.Parameters.AddWithValue("@countryFlag", test.flags[0] ?? "");
                    cmd.Parameters.AddWithValue("@countryArea", test.area);
                    cmd.Parameters.AddWithValue("@countryPopulation", test.population);
                    
                    // LANGUAGE
                    try
                    {
                        if (test.languageNames.Trim().Equals(""))
                        {
                            cmd.Parameters.AddWithValue("@countryLanguage", DBNull.Value);
                        } 
                        else
                        {
                            cmd.Parameters.AddWithValue("@countryLanguage", test.languageNames.Trim() ?? (Object)DBNull.Value);
                        }
                    }
                    catch
                    {
                        cmd.Parameters.AddWithValue("@countryLanguage", DBNull.Value);
                    }

                    // TIMEZONES
                    try
                    {
                        cmd.Parameters.AddWithValue("@countryTimezone", test.timezones[0] ?? (Object)DBNull.Value);
                    }
                    catch
                    {
                        cmd.Parameters.AddWithValue("@countryTimezone", DBNull.Value);
                    }

                    // CURRENCY
                    try
                    {
                        if (currencies.Equals("NULL"))
                        {
                            cmd.Parameters.AddWithValue("@countryCurrency", DBNull.Value);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@countryCurrency", currencies ?? (Object)DBNull.Value);
                        }
                        
                    }
                    catch
                    {
                        cmd.Parameters.AddWithValue("@countryCurrency", DBNull.Value);
                    }

                    cmd.ExecuteNonQuery();
                }
            }
            con.Close();
        }
    }
}