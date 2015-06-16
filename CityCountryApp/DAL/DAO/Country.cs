using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace CountryCityApp.DAL.DAO
{
    public class Country
    {
        public int Serial { get; set; }
        public int Id { get; set; }
        public string Name { get; set; }
        public string About { get; set; }
    }
}