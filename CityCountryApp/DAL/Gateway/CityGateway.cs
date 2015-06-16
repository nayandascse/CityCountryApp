using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using CityCountryApp.DAL.DAO;
using CountryCityApp.DAL.DAO;

namespace CountryCityApp.DAL.Gateway
{
    public class CityGateway
    {
        private SqlConnection sqlConnection;
        private SqlCommand sqlCommand;
        public CityGateway()
        {
            sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CityCountry"].ConnectionString);
            sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnection;
        }
        public bool IsCityNameExists(string name)
        {
            string countryNameExistsQuery = "SELECT cityName FROM tbl_city WHERE cityName='" + name + "'";

            sqlConnection.Open();
            sqlCommand.CommandText = countryNameExistsQuery;
            SqlDataReader countryNameExistsReader = sqlCommand.ExecuteReader();
            bool cityNameStatus = false;
            cityNameStatus = countryNameExistsReader.HasRows;
            countryNameExistsReader.Close();
            sqlConnection.Close();

            return cityNameStatus;
        }

        public bool SaveCity(City aCity)
        {
            string insertSQL;
            insertSQL = "INSERT INTO tbl_city (";
            insertSQL += "CityName, AboutCity, Dwellers, Location, Weather, CountryId) ";
            insertSQL += "VALUES (";
            insertSQL += "@name, @about, @dwellers, @location, @weather, @ciuntryid)";

            sqlConnection.Open();
            sqlCommand.CommandText = insertSQL;
            sqlCommand.Parameters.AddWithValue("@name", aCity.Name);
            sqlCommand.Parameters.AddWithValue("@about", aCity.About);
            sqlCommand.Parameters.AddWithValue("@dwellers", aCity.Dwellers);
            sqlCommand.Parameters.AddWithValue("@location", aCity.Location);
            sqlCommand.Parameters.AddWithValue("@weather", aCity.Weather);
            sqlCommand.Parameters.AddWithValue("@ciuntryid", aCity.CountryId);

            int saveRowAffected = sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();

            if (saveRowAffected > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public List<City> GetAllCity()
        {
            string allCityQuery = "SELECT CityName, Dwellers, CountryName FROM tbl_city JOIN tbl_country ON tbl_country.id=tbl_city.CountryId ORDER BY CityName ASC ";
            sqlConnection.Open();
            sqlCommand.CommandText = allCityQuery;
            SqlDataReader reader = sqlCommand.ExecuteReader();

            List<City> allCityList = new List<City>();

            while (reader.Read())
            {
                City aCity = new City();

                aCity.Name = reader["CityName"].ToString();
                aCity.Dwellers = int.Parse(reader["Dwellers"].ToString());
                aCity.Country = reader["CountryName"].ToString();

                allCityList.Add(aCity);
            }
            reader.Close();
            sqlConnection.Close();

            return allCityList;
        }


        public List<CityCountry> GetAllData()
        {
            string allCityQuery = "SELECT tbl_city.CityName, tbl_city.AboutCity, tbl_city.Dwellers, tbl_city.Location, tbl_city.Weather, tbl_country.CountryName, tbl_country.AboutCountry FROM tbl_city JOIN tbl_country ON tbl_country.id=tbl_city.CountryId ORDER BY CityName ASC ";
            return GetData(allCityQuery);
        }

        public List<CityCountry> GetAllDataByCity(string search)
        {
            string allCityQuery = "SELECT tbl_city.CityName, tbl_city.AboutCity, tbl_city.Dwellers, tbl_city.Location, tbl_city.Weather, tbl_country.CountryName, tbl_country.AboutCountry FROM tbl_city JOIN tbl_country ON tbl_country.id=tbl_city.CountryId WHERE CityName LIKE '%" + search + "%' ORDER BY CityName ASC ";
            return GetData(allCityQuery);
        }

        public List<CityCountry> GetAllDataByCountry(string search)
        {
            string allCityQuery = "SELECT tbl_city.CityName, tbl_city.AboutCity, tbl_city.Dwellers, tbl_city.Location, tbl_city.Weather, tbl_country.CountryName, tbl_country.AboutCountry FROM tbl_city JOIN tbl_country ON tbl_country.id=tbl_city.CountryId WHERE CountryName='" + search + "' ORDER BY CityName ASC ";
            return GetData(allCityQuery);
        }

        public List<CityCountry> GetData(string allCityQuery)
        {
            sqlConnection.Open();
            sqlCommand.CommandText = allCityQuery;
            SqlDataReader reader = sqlCommand.ExecuteReader();

            List<CityCountry> allCityCountryList = new List<CityCountry>();

            while (reader.Read())
            {
                CityCountry aCityCountry = new CityCountry();

                aCityCountry.City = reader["CityName"].ToString();
                aCityCountry.AboutCity = reader["AboutCity"].ToString();
                aCityCountry.Dwellers = int.Parse(reader["Dwellers"].ToString());
                aCityCountry.Location = reader["Location"].ToString();
                aCityCountry.Weather = reader["Weather"].ToString();
                aCityCountry.Country = reader["CountryName"].ToString();
                aCityCountry.AboutCountry = reader["AboutCountry"].ToString();

                allCityCountryList.Add(aCityCountry);
            }
            reader.Close();
            sqlConnection.Close();

            return allCityCountryList;
        }

        public List<CityCountry> GetAllCountryData()
        {
            string allCountryQuery = "SELECT tbl_country.CountryName,  COUNT(*)totalCity, SUM(Dwellers)totalDewllers,tbl_country.AboutCountry FROM tbl_city JOIN tbl_country ON tbl_country.id=tbl_city.CountryId GROUP BY CountryName,AboutCountry";

            return GetAllCountry(allCountryQuery);
        }

        public List<CityCountry> GetAllCountryByItem(string search)
        {
            string allCountryQuery = "SELECT tbl_country.CountryName,  COUNT(*)totalCity, SUM(Dwellers)totalDewllers,tbl_country.AboutCountry FROM tbl_city JOIN tbl_country ON tbl_country.id=tbl_city.CountryId GROUP BY CountryName,AboutCountry HAVING CountryName LIKE '%"+search+"%'";

            return GetAllCountry(allCountryQuery);
        }

        public List<CityCountry> GetAllCountry( string quary)
        {
            sqlConnection.Open();
            sqlCommand.CommandText = quary;
            SqlDataReader reader = sqlCommand.ExecuteReader();

            List<CityCountry> allCityCountryList = new List<CityCountry>();

            while (reader.Read())
            {
                CityCountry aCityCountry = new CityCountry();

                aCityCountry.Country = reader["CountryName"].ToString();
                aCityCountry.TotalCity = int.Parse(reader["totalCity"].ToString());
                aCityCountry.Dwellers = int.Parse(reader["totalDewllers"].ToString());
                aCityCountry.AboutCountry = reader["AboutCountry"].ToString();

                allCityCountryList.Add(aCityCountry);
            }
            reader.Close();
            sqlConnection.Close();
            return allCityCountryList;
        }
    }
}