using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebGrease.Extensions;

namespace CountryRoads
{
    public class test
    {
        
        public string flag { get; set; }
        public float area { get; set; }
        public int population { get; set; }

        public string cca3 { get; set; }

        public string[] capital { get; set; }

        public string[] flags { get; set; }

        public string[] timezones { get; set; }

        public Dictionary<string, string> languages { get; set; }
        
        public string languageNames
        {
            get { return string.Join(",", languages.Values); }
        }

        public Name name { get; set; }


        //public Currency[] currencies { get; set; }
        //public Currency currencies { get; set; }

        //public Dictionary<string, Currency> currencies { get; set; }


    }

    public class Name
    {
        public string common { get; set; }

    }

    //public class Currency
    //{
    //    public string name { get; set; }
    //    public string symbol { get; set; }
    //}

    //public class CurrencyCode
    //{ public string code { get; set; } }

}