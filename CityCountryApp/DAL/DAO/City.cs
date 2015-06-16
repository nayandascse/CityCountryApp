namespace CityCountryApp.DAL.DAO
{
    public class City
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string About { get; set; }
        public double Dwellers { get; set; }
        public string Location { get; set; }
        public string Weather { get; set; }
        public string Country { get; set; }
        public int CountryId { get; set; }

    }
}