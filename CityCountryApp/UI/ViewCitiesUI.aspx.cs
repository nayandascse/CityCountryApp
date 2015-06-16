using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryCityApp.BLL;

namespace CityCountryApp.UI
{
    public partial class ViewCitiesUI : System.Web.UI.Page
    {
        CityManager cityManager = new CityManager();
        CountryManager countryManager = new CountryManager();
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
                LoadAllCity();
            }

        }

        private void LoadAllCity()
        {
            viewCityGridView.DataSource = cityManager.GetAllCityForView();
            viewCityGridView.DataBind();
        }

        
        protected void viewCityGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            viewCityGridView.PageIndex = e.NewPageIndex;
            LoadAllCity();
        }

        protected void searchButton_Click1(object sender, EventArgs e)
        {
            string search = Request.Form["searchTextBox"];
            if (cityNameRadioButton.Checked)
            {
                viewCityGridView.DataSource = cityManager.GetAllCityForViewByCity(search);
                viewCityGridView.DataBind();
            }
            else if (countryRadioButton.Checked)
            {
                viewCityGridView.DataSource = cityManager.GetAllCityForViewByCountry(countryDropDownList.SelectedItem.Text);
                viewCityGridView.DataBind();
            }
            else
            {
                viewCityGridView.DataSource = cityManager.GetAllCityForView();
                viewCityGridView.DataBind();
            }

        }
    }
}