<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CityEntryUI.aspx.cs" Inherits="CityCountryApp.UI.CityEntryUi" validateRequest="false" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A Bootstrap Blog Template">
    <meta name="author" content="Vijaya Anand">

    <title>City Entry</title>

    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/bootstrap-theme.css" rel="stylesheet" />
    <link href="../css/bootstrap-theme.min.css" rel="stylesheet" />

     <link href="../Content/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../editor/css/froala_content.css" rel="stylesheet" />
    <link href="../editor/css/froala_editor.min.css" rel="stylesheet" />
    <link href="../editor/css/froala_editor.css" rel="stylesheet" />
    <link href="../editor/css/froala_style.min.css" rel="stylesheet" />

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

        #messageLabel {
            margin-left: 50px;
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
                <h1>City Entry</h1>

                <hr>

                <hr>


                <form class="form-horizontal" role="form" runat="server">
                    <div class="well">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="cityNameTextBox">Name</label>
                            <div class="col-sm-10">
                                <input type="text" runat="server" class="form-control" id="cityNameTextBox" placeholder="City Name" required="required" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="cityAboutTextarea">About</label>
                            <div class="col-sm-10">
                                <textarea runat="server" id="cityAboutTextarea" class="form-control" rows="5"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="dwellersTextBox">No of Dwellers</label>
                            <div class="col-sm-10">
                                <input type="text" runat="server" class="form-control" id="dwellersTextBox" placeholder="No of Dwellers" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="locationTextBox">Location</label>
                            <div class="col-sm-10">
                                <input type="text" runat="server" class="form-control" id="locationTextBox" placeholder="Location" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="weatherTextarea">Weather</label>
                            <div class="col-sm-10">
                                <textarea runat="server" id="weatherTextarea" class="form-control" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="countryDropDownList">Country</label>
                            <div class="col-sm-10">
                                <asp:DropDownList ID="countryDropDownList" runat="server" class="form-control"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-1 col-sm-10">
                                <asp:Button ID="saveCityButton" runat="server" class="btn btn-default" Text="Submit" OnClick="saveCityButton_Click1" />
                                <asp:Button ID="cencleCityButton" runat="server" UseSubmitBehavior="False" class="btn btn-default" Text="Cencal" OnClick="cencleCityButton_Click" />

                                <asp:Label ID="messageLabel" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">

                        <div class="well">
                            <h4>City List</h4>

                            <div style="width: 750px;margin: 0 auto;">
                                <asp:GridView ID="cityGridView" runat="server" class="table table-hover table-bordered"
                                    AutoGenerateColumns="False" CellPadding="5" PageSize="5"
                                    ForeColor="#333333" GridLines="Both" Width="700px" AllowPaging="True"
                                    OnPageIndexChanging="cityGridView_PageIndexChanging" ShowHeaderWhenEmpty="True">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="<<" LastPageText=">>"></PagerSettings>
                                    <Columns>
                                        <asp:TemplateField HeaderText="Serial No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="City Name" DataField="Name" />
                                        <asp:BoundField HeaderText="Dwellers" DataField="Dwellers" />
                                        <asp:BoundField HeaderText="Country" DataField="Country" />
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


    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/npm.js"></script>
    

    <script src="../editor/js/jquery.min.js"></script>
    <script src="../editor/js/froala_editor.min.js"></script>

    <script src="../editor/js/plugins/tables.min.js"></script>
    <script src="../editor/js/plugins/lists.min.js"></script>
    <script src="../editor/js/plugins/colors.min.js"></script>
    <script src="../editor/js/plugins/media_manager.min.js"></script>
    <script src="../editor/js/plugins/font_family.min.js"></script>
    <script src="../editor/js/plugins/font_size.min.js"></script>
    <script src="../editor/js/plugins/block_styles.min.js"></script>
    <script src="../editor/js/plugins/video.min.js"></script>
   

    <script>
        $(function () {
            $('#cityAboutTextarea,#weatherTextarea').editable({ inlineMode: false, height: 100, alwaysBlank: true })
        });
  </script>
</body>
</html>
