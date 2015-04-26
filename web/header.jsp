<%@page import="Classes.UserClass"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String user = null;

    if (session.getAttribute("Username") != null) {
        user = session.getAttribute("Username").toString();
        UserClass x = new UserClass();
        if (x.chkUserName(user) == false) {
            response.sendRedirect("Login.jsp");
        }
    } else {
        response.sendRedirect("Login.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Header</title>
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
                            <button style="font-family:calibri;" type="submit" class="btn btn-primary">
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
                                <a href="ViewMyProfile">
                                    <span class="glyphicon glyphicon-user"></span>                                    
                                    <font style="font-family: calibri;"><%= user.toUpperCase()%></font>
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
