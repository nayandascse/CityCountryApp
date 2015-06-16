using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryCityApp.BLL;

namespace CityCountryApp.UI
{
    public partial class ViewCountriesUi : System.Web.UI.Page
    {
        CityManager cityManager = new CityManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadCountry();
        }

        private void LoadCountry()
        {
            viewCountryGridView.DataSource = cityManager.GetAllCountry();
            viewCountryGridView.DataBind();
        }

        protected void viewCountryGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            viewCountryGridView.PageIndex = e.NewPageIndex;
            LoadCountry();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string search = Request.Form["countrySearchTextBox"];
            if (search != "")
            {
                viewCountryGridView.DataSource = cityManager.GetAllCountryByItem(search);
                viewCountryGridView.DataBind();
            }
            else
            {
                viewCountryGridView.DataSource = cityManager.GetAllCountry();
                viewCountryGridView.DataBind();
            }
        }
    }
}