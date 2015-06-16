using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryCityApp.BLL;
using CountryCityApp.DAL.DAO;

namespace CityCountryApp.UI
{
    public partial class CountryEntryUi : System.Web.UI.Page
    {
        CountryManager countryManager = new CountryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadAllCountryGridView();
        }

        private void LoadAllCountryGridView()
        {
            countryGridView.DataSource = countryManager.GetAllCountry();
            countryGridView.DataBind();
        }
       
        protected void countryGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            countryGridView.PageIndex = e.NewPageIndex;
            LoadAllCountryGridView();
        }

        protected void countrySaveButton_Click(object sender, EventArgs e)
        {
            Country aCountry = new Country();
            aCountry.Name = Request.Form["countryNameTextBox"];
            aCountry.About = Request.Form["edit"];

            string message = countryManager.SaveCountry(aCountry);
            if (message == "1")
            {
                messageLabel.Text = "Successfully saved";
                messageLabel.ForeColor = Color.Green;
            }
            else if (message == "2")
            {
                messageLabel.Text = "Name already Exists!";
                messageLabel.ForeColor = Color.Red;
            }
            else
            {
                messageLabel.Text = "Save Failed!";
                messageLabel.ForeColor = Color.Red;
            }

            LoadAllCountryGridView();
        }

        protected void countryCencalButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UI/HomeUI.aspx");
        }
    }
}