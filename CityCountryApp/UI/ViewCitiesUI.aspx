<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCitiesUI.aspx.cs" Inherits="CityCountryApp.UI.ViewCitiesUI" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A Bootstrap Blog Template">
    <meta name="author" content="Vijaya Anand">

    <title>View Cities</title>

    <!-- Bootstrap CSS file -->
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/bootstrap-theme.css" rel="stylesheet" />
    <link href="../css/bootstrap-theme.min.css" rel="stylesheet" />


    <style>
        @media (max-width: 600px) {
            .facet_sidebar {
                display: none;
            }
        }

        body {
            padding-top: 70px;
        }

        footer {
            margin: 50px 0;
        }
    </style>
</head>

<body>

    <header class="navbar navbar-inverse navbar-fixed-top bs-docs-nav" role="banner">
        <div class="container">
            <div class="navbar-header">
                <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand">Country City</a>
            </div>
            <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="HomeUI.aspx">Home</a></li>
                    <li><a href="CountryEntryUI.aspx">Country Entry</a></li>
                    <li><a href="CityEntryUI.aspx">City Entry</a></li>
                    <li><a href="ViewCountriesUI.aspx">View Countries</a></li>
                    <li><a href="ViewCitiesUI.aspx">View Cities</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <div class="container">

        <div class="row">

            <!-- Blog Post Content Column -->
            <div class="col-lg-12">

                <!-- Blog Post -->

                <!-- Title -->
                <h1>View Cities</h1>

                <hr>

                <hr>



                <form class="form-horizontal" role="form" runat="server">
                    <div class="well">
                        <h4>Search Criteria</h4>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="cityNameRadioButton">CITY NAME 
                                <asp:RadioButton ID="cityNameRadioButton" GroupName="searchCriteria" runat="server" /></label>
                            <div class="col-sm-5">
                                <input type="text" runat="server" id="searchTextBox" class="form-control" placeholder="Search by City Name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="countryRadioButton">COUNTRY 
                                <asp:RadioButton ID="countryRadioButton" GroupName="searchCriteria" runat="server" /></label>
                            <div class="col-sm-5">

                                <asp:DropDownList ID="countryDropDownList" class="form-control" runat="server"></asp:DropDownList>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-1 col-sm-10">
                                <asp:Button ID="searchButton" class="btn btn-default" runat="server" Text="Search" OnClick="searchButton_Click1" />
                            </div>

                        </div>
                    </div>


                    <div class="col-md-12">

                        <div class="well">
                            <h4>Country List</h4>

                            <div style="width: 960px; margin: 0 auto;">
                                <asp:GridView ID="viewCityGridView" runat="server" CssClass="table table-hover table-bordered"
                                    AutoGenerateColumns="False" CellPadding="3" PageSize="5"
                                    ForeColor="Black" Width="960px" AllowPaging="True"
                                    OnPageIndexChanging="viewCityGridView_PageIndexChanging" ShowHeaderWhenEmpty="True" AllowSorting="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                    <AlternatingRowStyle BackColor="#CCCCCC"></AlternatingRowStyle>
                                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" ></PagerSettings>

                                    <Columns>
                                        <asp:TemplateField HeaderText="Serial No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="City Name" DataField="City" />
                                        <asp:BoundField HeaderText="About" DataField="AboutCity" HtmlEncode="False" />
                                        <asp:BoundField HeaderText="No of Dwellers" DataField="Dwellers" />
                                        <asp:BoundField HeaderText="Location" DataField="Location" />
                                        <asp:BoundField HeaderText="Weather" DataField="Weather" HtmlEncode="False" />
                                        <asp:BoundField HeaderText="Country" DataField="Country" />
                                        <asp:BoundField HeaderText="About Country" DataField="AboutCountry" HtmlEncode="False" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                                    <HeaderStyle BackColor="Black" Font-Bold="True"
                                        ForeColor="White"></HeaderStyle>
                                    <PagerStyle BackColor="#999999" ForeColor="Black"
                                        HorizontalAlign="Center"></PagerStyle>
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True"
                                        ForeColor="White"></SelectedRowStyle>
                                    <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                                    <SortedAscendingHeaderStyle BackColor="#808080"></SortedAscendingHeaderStyle>
                                    <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                                    <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                                </asp:GridView>
                            </div>

                        </div>

                    </div>

                </form>
                <hr>
            </div>

        </div>

        <hr>


        <footer>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <p>Copyright &copy; 2015</p>
                </div>
            </div>

        </footer>

    </div>


    <!-- Jquery and Bootstrap Script files -->
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/npm.js"></script>
</body>
</html>

