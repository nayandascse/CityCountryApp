using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CityCountryApp.DAL.Gateway;
using CountryCityApp.DAL.DAO;
using CountryCityApp.DAL.Gateway;

namespace CountryCityApp.BLL
{
    public class CountryManager
    {
        CountryGateway countryGateway = new CountryGateway();
        public string SaveCountry(Country aCountry)
        {
            if (countryGateway.HasCountryNameExists(aCountry.Name))
            {
                return "2";
            }
            else
            {
                if (countryGateway.SaveCountry(aCountry))
                {
                    return "1";
                }
                else
                {
                    return "0";
                }
            }
            return null;
        }

        public List<Country> GetAllCountry()
        {
            return countryGateway.GetAllCountry();
        }
    }
}