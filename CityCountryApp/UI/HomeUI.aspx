<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeUI.aspx.cs" Inherits="CityCountryApp.UI.Home" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Home</title>

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
            <div class="col-lg-8">

                <!-- Blog Post -->

                <!-- Title -->
                <h1>Country City Application</h1>

                <!-- Author -->
                <p class="lead">
                    by <a href="#">Dew Drop</a>
                </p>

                <hr>

              
                <!-- Side Widget Well -->
                <div class="well">
                    <h4>Members</h4>
                    <p>1. Md. Kamrul Hasan <code>(103247)</code></p>
                    <p>2. Nazmul Hasan <code>(103633)</code></p>
                    <p>3. Md. Salman Sabbir <code>(103486)</code></p>
                    <p>4. Ashiqur Rahman <code>(102639)</code></p>
                </div>

            </div>

        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; 2015</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>

    </div>


    <!-- Jquery and Bootstrap Script files -->
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/npm.js"></script>
</body>
</html>
