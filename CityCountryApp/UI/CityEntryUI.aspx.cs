using System;
using System.Web.UI.WebControls;
using CityCountryApp.DAL.DAO;
using CountryCityApp.BLL;
using CountryCityApp.DAL.DAO;

namespace CityCountryApp.UI
{
    public partial class CityEntryUi : System.Web.UI.Page
    {
        CountryManager countryManager = new CountryManager();
        CityManager cityManager = new CityManager();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                countryDropDownList.DataSource = countryManager.GetAllCountry();
                countryDropDownList.DataTextField = "Name";
                countryDropDownList.DataValueField = "Id";
                countryDropDownList.DataBind();
                ListItem li = new ListItem("Select Country", "-1");
                countryDropDownList.Items.Insert(0, li);

                LoadAllCityInGridView();
            }
        }

        private void LoadAllCityInGridView()
        {
            cityGridView.DataSource = cityManager.GetAllCity();
            cityGridView.DataBind();
        }
        
        protected void saveCityButton_Click1(object sender, EventArgs e)
        {
            City aCity = new City();
            aCity.Name = Request.Form["cityNameTextBox"];
            aCity.About = Request.Form["cityAboutTextarea"];
            aCity.Dwellers = double.Parse(Request.Form["dwellersTextBox"]);
            aCity.Location = Request.Form["locationTextBox"];
            aCity.Weather = Request.Form["weatherTextarea"];
            aCity.CountryId = Convert.ToInt32(countryDropDownList.SelectedItem.Value);

            string message = cityManager.SaveCity(aCity);

            messageLabel.Text = message;
            LoadAllCityInGridView();
        }

        protected void cencleCityButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UI/HomeUI.aspx");
        }
        protected void cityGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            cityGridView.PageIndex = e.NewPageIndex;
            LoadAllCityInGridView();
        }

    }
}