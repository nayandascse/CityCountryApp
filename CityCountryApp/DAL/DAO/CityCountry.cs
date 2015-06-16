using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryCityApp.DAL.DAO
{
    public class CityCountry
    {
        public string City { get; set; }
        public string AboutCity { get; set; }
        public int Dwellers { get; set; }
        public string Location { get; set; }
        public string Weather { get; set; }
        public string Country { get; set; }
        public int TotalCity { get; set; }
        public string AboutCountry { get; set; }
    }
}