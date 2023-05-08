using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CountryRoads.User
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Path_MouseOver(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static string UpdateName(string name)
        {
            return name;
        }

        protected void hdnfldVariable_ValueChanged(object sender, EventArgs e)
        {
            string variable = hdnfldVariable.Value;
            Label1.Text = variable;
        }
    }
}