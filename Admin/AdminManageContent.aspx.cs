using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace CountryRoads.Admin
{
    public partial class AdminManageContent : System.Web.UI.Page
    {
        protected DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
                con.Open();

                //if (!Page.IsPostBack)
                //{
                    SqlDataAdapter da = new SqlDataAdapter("select * from country", con);

                    dt = new DataTable();
                    da.Fill(dt);

                    DataBind();


                //}
            } else
            {
                Response.Redirect("~/Admin/AdminLogin.aspx");
            }
            
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
            con.Open();

            using (var cmd = new SqlCommand("UPDATE country SET countryName = @countryName, countryCapital = @countryCapital, countryArea = @countryArea, countryPopulation = @countryPopulation, " +
                "countryLanguage = @countryLanguage, countryCurrency = @countryCurrency WHERE countryId = @countryCode", con))
            {
                cmd.Parameters.AddWithValue("@countryCode", CountryCode.Value);
                cmd.Parameters.AddWithValue("@countryName", CountryName.Value);
                cmd.Parameters.AddWithValue("@countryCapital", Capital.Value);
                cmd.Parameters.AddWithValue("@countryArea", float.Parse(Area.Value, CultureInfo.InvariantCulture.NumberFormat));
                cmd.Parameters.AddWithValue("@countryPopulation", Int64.Parse(Population.Value));
                cmd.Parameters.AddWithValue("@countryLanguage", Languages.Value);
                cmd.Parameters.AddWithValue("@countryCurrency", Currency.Value);

                cmd.ExecuteNonQuery();


            }

            con.Close();

            Response.Redirect(Request.RawUrl);
            
        }




    }
}