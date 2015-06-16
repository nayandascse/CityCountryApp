using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CityCountryApp.DAL.DAO;
using CountryCityApp.DAL.DAO;
using CountryCityApp.DAL.Gateway;

namespace CountryCityApp.BLL
{
   
    public class CityManager
    {
        CityGateway cityGateway = new CityGateway();
        public string SaveCity(City aCity)
        {
            if (cityGateway.IsCityNameExists(aCity.Name))
            {
                return "City name already Exists";
            }
            else
            {
                if (cityGateway.SaveCity(aCity))
                {
                    return "City name successfully save";
                }
                else
                {
                    return "Save Failed";
                }
            }
        }

        public List<City> GetAllCity()
        {
            return cityGateway.GetAllCity();
        }

        public List<CityCountry> GetAllCityForView()
        {
            return cityGateway.GetAllData();
        }

        public List<CityCountry> GetAllCityForViewByCity(string search)
        {
            return cityGateway.GetAllDataByCity(search);
        }

        public List<CityCountry> GetAllCityForViewByCountry(string search)
        {
            return cityGateway.GetAllDataByCountry(search);
        }

        public List<CityCountry> GetAllCountry()
        {
            return cityGateway.GetAllCountryData();
        }

        public List<CityCountry> GetAllCountryByItem(string search)
        {
            return cityGateway.GetAllCountryByItem(search);
        }
    }
}