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
                SqlCommand cmdType = new SqlCommand("SELECT * FROM country WHERE countryName = '" + country + "'", con);
                SqlDataReader dr = cmdType.ExecuteReader();

                while (dr.Read())
                {
                    string countryName = dr["countryName"].ToString().Trim();
                    string countryCapital = dr["countryCapital"].ToString().Trim();
                    string countryCurrency = dr["countryCurrency"].ToString().Trim();
                    string countryFlag = dr["countryFlag"].ToString().Trim();

                    CountryNameModal.InnerText = countryName;
                    CountryFlagImage.ImageUrl = countryFlag;
                    CountryCurrencyModel.Text = countryCurrency;
                    CountryCapitalModal.Text = countryCapital;


                }

                

                // Call Javascript function openModal()
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "openModal()", true);
            }
            else
            {
                CountryCurrencyModel.Text = "N/A";
                return;
            }
        }
    }
}