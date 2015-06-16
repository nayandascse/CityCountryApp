<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CountryEntryUI.aspx.cs" Inherits="CityCountryApp.UI.CountryEntryUi" validateRequest="false" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A Bootstrap Blog Template">
    <meta name="author" content="Vijaya Anand">

    <title>Country Entry</title>

    <!-- Bootstrap CSS file -->
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
            padding-top: 50px;
        }

        footer {
            margin: 50px 0;
        }

        #messageLabel {
            margin-left: 30px;
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

            <div class="col-md-12">

                <h1>Country Entry</h1>

                <hr>

                <hr>

                <form class="form-horizontal" role="form" runat="server">
                    
                    <div class="well">
                        <div class="form-group">
                            <label class="control-label col-sm-1" for="countryNameTextBox">Name</label>
                            <div class="col-sm-11">
                                <input runat="server" class="form-control" type="text" id="countryNameTextBox" placeholder="Country Name" required="Required"/>
                                
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-1" for="edit">About</label>
                            <div class="col-sm-11">
                                <textarea runat="server" class="form-control"  id="edit" ></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-1 col-sm-11">
                                <asp:Button class="btn btn-default" ID="countrySaveButton" runat="server" Text="Save" OnClick="countrySaveButton_Click" />
                                <asp:Button class="btn btn-default" ID="countryCencalButton" UseSubmitBehavior="False"  runat="server" Text="Cancel" OnClick="countryCencalButton_Click" />

                                <asp:Label ID="messageLabel" runat="server"></asp:Label>
                            </div>

                        </div>
                    </div>

                    <div class="well col-md-12">
                        <h4>Country List</h4>
                        <div style="width: 800px; margin: 0 auto;">
                            <asp:GridView class="table table-hover table-bordered table-striped" ID="countryGridView" runat="server"
                                AutoGenerateColumns="False" CellPadding="5" PageSize="5"
                                ForeColor="#333333" GridLines="Both" Width="800px" AllowPaging="True"
                                OnPageIndexChanging="countryGridView_PageIndexChanging" ShowHeaderWhenEmpty="True">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                                <PagerSettings Mode="NumericFirstLast" PageButtonCount="5"  ></PagerSettings>
                                
                                <Columns>
                                    <asp:TemplateField HeaderText="Serial No.">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:BoundField HeaderText="Country Name" DataField="Name" />
                                    <asp:BoundField HeaderText="About" DataField="About" HtmlEncode="False"  />
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
                </form>
            </div>

        </div>

        <hr>


        <footer>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <p>Copyright &copy;2015</p>
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
            $('#edit').editable({ inlineMode: false, height:100, alwaysBlank: true })
        });
  </script>

</body>
</html>
