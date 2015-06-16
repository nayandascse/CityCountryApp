using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using CountryCityApp.DAL.DAO;

namespace CityCountryApp.DAL.Gateway
{
    public class CountryGateway
    {
        private SqlConnection sqlConnection;
        private SqlCommand sqlCommand;

        public CountryGateway()
        {
            sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CityCountry"].ConnectionString);
            sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnection;
        }

        public bool HasCountryNameExists(string name)
        {
            string countryNameExistsQuery = "SELECT countryName FROM tbl_country WHERE countryName='" + name + "'";

            sqlConnection.Open();
            sqlCommand.CommandText = countryNameExistsQuery;
            SqlDataReader countryNameExistsReader = sqlCommand.ExecuteReader();
            bool countryNameStatus = false;
            countryNameStatus = countryNameExistsReader.HasRows;
            countryNameExistsReader.Close();
            sqlConnection.Close();

            return countryNameStatus;
        }

        public bool SaveCountry(Country aCountry)
        {
            string insertSQL;
            insertSQL = "INSERT INTO tbl_country (";
            insertSQL += "CountryName, AboutCountry) ";
            insertSQL += "VALUES (";
            insertSQL += "@name, @about)";

            sqlConnection.Open();
            sqlCommand.CommandText = insertSQL;
            sqlCommand.Parameters.AddWithValue("@name", aCountry.Name);
            sqlCommand.Parameters.AddWithValue("@about", aCountry.About);
            
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

        public List<Country> GetAllCountry()
        {
            string allCountryQuery = "SELECT * FROM tbl_country ORDER BY CountryName ASC ";

            return GetQueryinList(allCountryQuery);
        }

        private List<Country> GetQueryinList(string query)
        {
           
            sqlConnection.Open();
            sqlCommand.CommandText = query;
            SqlDataReader reader = sqlCommand.ExecuteReader();

            List<Country> allCountryList = new List<Country>();

            while (reader.Read())
            {
                Country aCountry =new Country();
               
                aCountry.Id = int.Parse(reader["id"].ToString());
                aCountry.Name = reader["countryName"].ToString();
                aCountry.About = reader["AboutCountry"].ToString();
               

                allCountryList.Add(aCountry);
            }
            reader.Close();
            sqlConnection.Close();

            return allCountryList;
        }
    }
}