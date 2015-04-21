<%@page import="Classes.UserClass"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String un=null;
    
    try {
        un = session.getAttribute("Username").toString();
    }catch(Exception x){
        response.sendRedirect("Login.jsp");
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Bootstrap</title>

        <!-- Bootstrap CSS-->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-theme.css" rel="stylesheet">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">

        <!--aditional CSS imports-->
        <!-- IF online useage required
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        Remove this comment tag-->
        <!--aditional CSS imports end-->

        <!--internal CSS-->

        <!--internal CSS end-->

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>  

        <!--aditional JS imports-->
        <!-- IF online useage required
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        Remove this comment tag-->
        <!--aditional JS imports end-->

        <!--internal JS-->

        <!--internal JS end-->          
    </head>

    <body class="container-fluid">

        <!--also "container" class can be used-->
        <div class="row">

            <nav class="navbar navbar-default" style="margin: 2px;">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" style="font-family:calibri; color:Black;" href="Home.jsp">
                            <span class="glyphicon glyphicon-home"></span>
                            Orchid Store
                        </a>
                    </div>

                    <!--navbar collapse-->

                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                        <!--Search start-->
                        <form class="navbar-form navbar-left center-block" role="search" action="SearchBook" method="GET">
                            <div class="form-group">
                                <input name="Search" type="text" class="form-control" placeholder="Search" required="" autofocus>          						
                            </div>
                            <button type="submit" class="btn btn-primary">
                                <span class="glyphicon glyphicon-search"></span>
                                Search Books
                            </button>  							
                        </form>
                        <!--Search end-->      							

                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <!--list btn-->
                                <form action="ChkSavedList" method="GET">
                                    <button type="submit" class="btn btn-sm btn-success navbar-btn btn-block" style="border-radius:0px;">
                                        <span class="glyphicon glyphicon-floppy-disk"></span>
                                        My Saved List
                                    </button>
                                </form>
                                <!--list btn end-->
                            </li>
                            <li>
                                <!--notifications btn-->
                                <form action="ChkMessage" method="GET">
                                    <button type="submit" class="btn btn-sm btn-danger navbar-btn btn-block" style="border-radius:0px;">
                                        <span class="glyphicon glyphicon-envelope"></span>
                                        Messages
                                    </button>
                                </form>
                                <!--notifications btn end-->
                            </li>

                            <li>
                                <!--messages btn-->
                                <form action="ChkNotification" method="GET">
                                    <button type="submit" class="btn btn-sm btn-warning navbar-btn btn-block" style="border-radius:0px;">
                                        <span class="glyphicon glyphicon-bullhorn"></span>
                                        Notifications
                                    </button>
                                </form>
                                <!--messages btn end-->
                            </li>

                            <li>
                                <!--shopping cart btn-->
                                <form action="ChkCart" method="GET">
                                    <button type="submit" class="btn btn-sm btn-info navbar-btn btn-block" style="border-radius:0px;">
                                        <span class="glyphicon glyphicon-shopping-cart"></span>
                                        Shopping Cart
                                    </button>
                                </form>
                                <!--shopping cart btn end-->
                            </li>

                            <li>
                                <a href="MyProfile">
                                    <span class="glyphicon glyphicon-user"></span>                                    
                                    <font style="font-family: calibri;"><%= un.toUpperCase()%></font>
                                </a>                          
                            </li>

                            <li>
                                <a href="SignOut">
                                    <span class="glyphicon glyphicon-off"></span>
                                    <font style="font-family: calibri;">Log Out</font>
                                </a>
                            </li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                    <!--navbar collapse end-->
                </div>
            </nav>            

        </div>
        <br/>
    </body>
</html>
