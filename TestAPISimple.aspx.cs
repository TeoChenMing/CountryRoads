using System;
using System.Collections.Generic;
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
    }
}