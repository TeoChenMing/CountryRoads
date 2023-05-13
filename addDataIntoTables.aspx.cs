using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CountryRoads
{
    public partial class addDataIntoTables : System.Web.UI.Page
    {

        protected DataTable dt, tempdt;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_addToUsers_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
                con.Open();

                /*string Query = "select count(*) from users where username = '" + username.Text + "'";
                SqlCommand cmd = new SqlCommand(Query, con);
                int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());*/

                // create record in a table called users
                string query1 = "INSERT INTO users VALUES (@username, @password, @email, @fullName, @gender, @quizAccessed, @status)";
                SqlCommand cmd1 = new SqlCommand(query1, con);

                cmd1.Parameters.AddWithValue("@username", "username3");
                cmd1.Parameters.AddWithValue("@password", "password3");
                cmd1.Parameters.AddWithValue("@email", "email3@email.com");
                cmd1.Parameters.AddWithValue("@fullName", "John Wick3");
                cmd1.Parameters.AddWithValue("@gender", "Female");
                cmd1.Parameters.AddWithValue("@quizAccessed", 0);
                cmd1.Parameters.AddWithValue("@status", "Banned");
                cmd1.ExecuteNonQuery();
                Response.Redirect("addDataIntoTables.aspx");

                con.Close();
            }
            catch 
            {                
            }
        }

        protected void btn_clearUsers_Click(object sender, EventArgs e)
        {

        }

        protected void Btn_addToQuestions_Click(object sender, EventArgs e)
        {
            // Get countries
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CountryRoadsDB"].ConnectionString);
                con.Open();

                SqlDataAdapter da = new SqlDataAdapter("select * from country", con);

                dt = new DataTable();
                da.Fill(dt);

                if (dt != null)
                {
                    Label1.Text = "Actually got data wtf";
                    // inserting values into 

                    // loop questions
                    foreach (DataRow row in dt.Rows)
                    {
                        string flagQuery = "INSERT INTO questions VALUES (@countryId, @quizType, @title, @options, @answer)";
                        string capitalQuery = "INSERT INTO questions VALUES (@countryId1, @quizType1, @title1, @options1, @answer1)";
                        string areaQuery = "INSERT INTO questions VALUES (@countryId2, @quizType2, @title2, @options2, @answer2)";
                        string populationQuery = "INSERT INTO questions VALUES (@countryId3, @quizType3, @title3, @options3, @answer3)";
                        string languageQuery = "INSERT INTO questions VALUES (@countryId4, @quizType4, @title4, @options4, @answer4)";
                        string currencyQuery = "INSERT INTO questions VALUES (@countryId5, @quizType5, @title5, @options5, @answer5)";
                        string timezoneQuery = "INSERT INTO questions VALUES (@countryId6, @quizType6, @title6, @options6, @answer6)";
                        string continentQuery = "INSERT INTO questions VALUES (@countryId7, @quizType7, @title7, @options7, @answer7)";

                        // flag
                        SqlCommand cmd = new SqlCommand(flagQuery, con);
                        cmd.Parameters.AddWithValue("@countryId", $"{row["countryId"]}");
                        cmd.Parameters.AddWithValue("@quizType", "flag");
                        cmd.Parameters.AddWithValue("@title", $"Which country is represented by this flag?");
                        SqlDataAdapter flagDA = new SqlDataAdapter("SELECT TOP 3 * FROM country ORDER BY NEWID()", con);
                        tempdt = new DataTable();
                        flagDA.Fill(tempdt);

                        string options = $"{row["countryName"]}||";
                        int counter = 0;
                        foreach (DataRow tempRow in tempdt.Rows)
                        {
                            options += tempRow["countryName"];

                            if (counter != 2)
                            {
                                options += "||";
                            }
                            counter += 1;
                        }

                        // debugging
                        // Label1.Text = options;
                        // Label2.Text = "No error hurrah";
                        cmd.Parameters.AddWithValue("@options", options); // separated by ||
                        cmd.Parameters.AddWithValue("@answer", $"{row["countryName"]}");



                        // Capital
                        SqlCommand cmd1 = new SqlCommand(capitalQuery, con);
                        cmd1.Parameters.AddWithValue("@countryId1", $"{row["countryId"]}");
                        cmd1.Parameters.AddWithValue("@quizType1", "fact");
                        cmd1.Parameters.AddWithValue("@title1", $"What is the capital of {row["countryName"]}?");
                        SqlDataAdapter capitalDA = new SqlDataAdapter("SELECT TOP 3 * FROM country ORDER BY NEWID()", con);
                        tempdt = new DataTable();
                        capitalDA.Fill(tempdt);

                        string cOptions = $"{row["countryCapital"]}||";
                        int counter1 = 0;
                        foreach (DataRow tempRow in tempdt.Rows)
                        {
                            cOptions += tempRow["countryCapital"];

                            if (counter1 != 2)
                            {
                                cOptions += "||";
                            }
                            counter1 += 1;
                        }

                        // debugging
                        // Label1.Text = options;
                        // Label2.Text = "No error hurrah";
                        cmd1.Parameters.AddWithValue("@options1", cOptions); // separated by ||
                        cmd1.Parameters.AddWithValue("@answer1", $"{row["countryCapital"]}");



                        // Area
                        SqlCommand cmd2 = new SqlCommand(areaQuery, con);
                        cmd2.Parameters.AddWithValue("@countryId2", $"{row["countryId"]}");
                        cmd2.Parameters.AddWithValue("@quizType2", "fact");
                        cmd2.Parameters.AddWithValue("@title2", $"What is the area of {row["countryName"]}?");
                        SqlDataAdapter areaDA = new SqlDataAdapter("SELECT TOP 3 countryArea FROM country ORDER BY NEWID()", con);
                        tempdt = new DataTable();
                        areaDA.Fill(tempdt);

                        string aOptions = $"{row["countryArea"]}||";
                        int counter2 = 0;
                        foreach (DataRow tempRow in tempdt.Rows)
                        {
                            aOptions += tempRow["countryArea"];

                            if (counter2 != 2)
                            {
                                aOptions += "||";
                            }
                            counter2 += 1;
                        }

                        // debugging
                        // Label1.Text = options;
                        // Label2.Text = "No error hurrah";
                        cmd2.Parameters.AddWithValue("@options2", aOptions); // separated by ||
                        cmd2.Parameters.AddWithValue("@answer2", $"{row["countryArea"]}");



                        // Population
                        SqlCommand cmd3 = new SqlCommand(populationQuery, con);
                        cmd3.Parameters.AddWithValue("@countryId3", $"{row["countryId"]}");
                        cmd3.Parameters.AddWithValue("@quizType3", "fact");
                        cmd3.Parameters.AddWithValue("@title3", $"What is the population of {row["countryName"]}?");
                        SqlDataAdapter populationDA = new SqlDataAdapter("SELECT TOP 3 countryPopulation FROM country ORDER BY NEWID()", con);
                        tempdt = new DataTable();
                        populationDA.Fill(tempdt);

                        string pOptions = $"{row["countryPopulation"]}||";
                        int counter3 = 0;
                        foreach (DataRow tempRow in tempdt.Rows)
                        {
                            pOptions += tempRow["countryPopulation"];

                            if (counter3 != 2)
                            {
                                pOptions += "||";
                            }
                            counter3 += 1;
                        }

                        // debugging
                        // Label1.Text = options;
                        // Label2.Text = "No error hurrah";
                        cmd3.Parameters.AddWithValue("@options3", pOptions); // separated by ||
                        cmd3.Parameters.AddWithValue("@answer3", $"{row["countryPopulation"]}");



                        // Language
                        SqlCommand cmd4 = new SqlCommand(languageQuery, con);
                        cmd4.Parameters.AddWithValue("@countryId4", $"{row["countryId"]}");
                        cmd4.Parameters.AddWithValue("@quizType4", "fact");
                        cmd4.Parameters.AddWithValue("@title4", $"What is the main language used in {row["countryName"]}?");
                        SqlDataAdapter languageDA = new SqlDataAdapter("SELECT TOP 3 * FROM ( SELECT DISTINCT countryLanguage FROM country ) AS subquery ORDER BY NEWID()", con);
                        tempdt = new DataTable();
                        languageDA.Fill(tempdt);

                        string lOptions = $"{row["countryLanguage"]}||";
                        int counter4 = 0;
                        foreach (DataRow tempRow in tempdt.Rows)
                        {
                            lOptions += tempRow["countryLanguage"];

                            if (counter4 != 2)
                            {
                                lOptions += "||";
                            }
                            counter4 += 1;
                        }

                        // debugging
                        // Label1.Text = options;
                        // Label2.Text = "No error hurrah";
                        cmd4.Parameters.AddWithValue("@options4", lOptions); // separated by ||
                        cmd4.Parameters.AddWithValue("@answer4", $"{row["countryLanguage"]}");



                        // Currency
                        SqlCommand cmd5 = new SqlCommand(currencyQuery, con);
                        cmd5.Parameters.AddWithValue("@countryId5", $"{row["countryId"]}");
                        cmd5.Parameters.AddWithValue("@quizType5", "fact");
                        cmd5.Parameters.AddWithValue("@title5", $"What is the currency used in {row["countryName"]}?");
                        SqlDataAdapter currencyDA = new SqlDataAdapter("SELECT TOP 3 * FROM ( SELECT DISTINCT countryCurrency FROM country ) AS subquery ORDER BY NEWID()", con);
                        tempdt = new DataTable();
                        currencyDA.Fill(tempdt);

                        string curOptions = $"{row["countryCurrency"]}||";
                        int counter5 = 0;
                        foreach (DataRow tempRow in tempdt.Rows)
                        {
                            curOptions += tempRow["countryCurrency"];

                            if (counter5 != 2)
                            {
                                curOptions += "||";
                            }
                            counter5 += 1;
                        }

                        // debugging
                        // Label1.Text = options;
                        // Label2.Text = "No error hurrah";
                        cmd5.Parameters.AddWithValue("@options5", curOptions); // separated by ||
                        cmd5.Parameters.AddWithValue("@answer5", $"{row["countryCurrency"]}");



                        // Time Zone
                        SqlCommand cmd6 = new SqlCommand(timezoneQuery, con);
                        cmd6.Parameters.AddWithValue("@countryId6", $"{row["countryId"]}");
                        cmd6.Parameters.AddWithValue("@quizType6", "fact");
                        cmd6.Parameters.AddWithValue("@title6", $"What is the Time Zone adapted by {row["countryName"]}?");
                        SqlDataAdapter timezoneDA = new SqlDataAdapter("SELECT TOP 3 * FROM ( SELECT DISTINCT countryTimeZone FROM country ) AS subquery ORDER BY NEWID()", con);
                        tempdt = new DataTable();
                        timezoneDA.Fill(tempdt);

                        string tOptions = $"{row["countryTimeZone"]}||";
                        int counter6 = 0;
                        foreach (DataRow tempRow in tempdt.Rows)
                        {
                            tOptions += tempRow["countryTimeZone"];

                            if (counter6 != 2)
                            {
                                tOptions += "||";
                            }
                            counter6 += 1;
                        }

                        // debugging
                        // Label1.Text = options;
                        // Label2.Text = "No error hurrah";
                        cmd6.Parameters.AddWithValue("@options6", tOptions); // separated by ||
                        cmd6.Parameters.AddWithValue("@answer6", $"{row["countryTimeZone"]}");



                        // Continent
                        SqlCommand cmd7 = new SqlCommand(continentQuery, con);
                        cmd7.Parameters.AddWithValue("@countryId7", $"{row["countryId"]}");
                        cmd7.Parameters.AddWithValue("@quizType7", "fact");
                        cmd7.Parameters.AddWithValue("@title7", $"Which continent does {row["countryName"]} belong to?");
                        SqlDataAdapter continentDA = new SqlDataAdapter("SELECT TOP 3 * FROM ( SELECT DISTINCT continent FROM country ) AS subquery ORDER BY NEWID()", con);
                        tempdt = new DataTable();
                        continentDA.Fill(tempdt);

                        string conOptions = $"{row["continent"]}||";
                        int counter7 = 0;
                        foreach (DataRow tempRow in tempdt.Rows)
                        {
                            conOptions += tempRow["continent"];

                            if (counter7 != 2)
                            {
                                conOptions += "||";
                            }
                            counter7 += 1;
                        }

                        // debugging
                        // Label1.Text = options;
                        // Label2.Text = "No error hurrah";
                        cmd7.Parameters.AddWithValue("@options7", conOptions); // separated by ||
                        cmd7.Parameters.AddWithValue("@answer7", $"{row["continent"]}");

                        // run and insert all values (IT WORKED)
                        /*cmd.ExecuteNonQuery();
                        cmd2.ExecuteNonQuery();
                        cmd3.ExecuteNonQuery();
                        cmd4.ExecuteNonQuery();
                        cmd5.ExecuteNonQuery();
                        cmd6.ExecuteNonQuery();
                        cmd7.ExecuteNonQuery();*/
                    }
                }

                //string countryQuery = "INSERT INTO questions VALUES ()";
                //SqlCommand cmd = new SqlCommand(countryQuery, con);

                // Loop Countries and check available data

                // cmd.ExecuteNonQuery();

                //Response.Redirect("addDataIntoTables.aspx");
                con.Close();

            }
            catch (Exception ex)
            {
                Label2.Text = ex.ToString();
            }
        }

        protected void btn_clearQuestions_Click(object sender, EventArgs e)
        {

        }
    }
}