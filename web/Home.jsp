<%-- 
    Document   : Home
    Created on : Apr 9, 2015, 8:05:50 PM
    Author     : Indunil
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Classes.BookClass"%>
<%@page import="Classes.UserClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    try {
        if (session.getAttribute("Login") == null) {
            response.sendRedirect("LoginCheck");
        } else {
            UserClass x = new UserClass();
            if (x.chkUserName(session.getAttribute("Username").toString()) == false) {
                response.sendRedirect("LoginCheck");
            }
        }
    }catch(Exception e){
        response.sendRedirect("LoginCheck");
    }
%>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Home</title>

        <!-- Bootstrap CSS-->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-theme.css" rel="stylesheet">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">

        <!--internal CSS-->

        <style type="text/css">
        </style>

        <!--internal CSS end-->

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.js"></script>


        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>  
        <script src="js/bootstrap.js"></script> 

        <script type="text/javascript">
        </script>

        <!--internal JS end-->           
    </head>

    <jsp:include page='header.jsp'></jsp:include>
    <jsp:include page="ShowMessageScript.jsp"></jsp:include>

        <body> 
            <div class="row container-fluid">
                <div class="row">
                    <!--Slider-->
                    <div class="col-lg-9 img-responsive">
                    <jsp:include page='Slider.jsp'></jsp:include>
                    </div> 

                    <div class="col-lg-3">

                        <!--Panel 1-->
                        <div class="col">
                            <div class="panel panel-default text-center" style="box-shadow: #330066 px 0px 50px 50px;">
                                <div class="panel-heading">
                                    <span class="glyphicon glyphicon-thumbs-up"></span>
                                    Easy
                                </div>
                                <div class="panel-body">
                                    <img class="img-circle pull-left" src="indunil_files/Resources/Icons/easy.png" width="50px" height="50px"/>
                                    Our customer support always cares users..
                                </div>
                            </div>
                        </div>

                        <!--Panel 2-->
                        <div class="col">
                            <div class="panel panel-default text-center" style="box-shadow: #330066 px 0px 50px 50px;">
                                <div class="panel-heading">
                                    <span class="glyphicon glyphicon-refresh"></span>
                                    Reliable
                                </div>
                                <div class="panel-body img-responsive">
                                    <img class="img-circle pull-left" src="indunil_files/Resources/Icons/reliable.png" width="50px" height="50px"/>
                                    We are serving customers with high reliable services..
                                </div>
                            </div>
                        </div>

                        <!--Panel 3-->
                        <div class="col">
                            <div class="panel panel-default text-center" style="box-shadow: #330066 px 0px 50px 50px;">
                                <div class="panel-heading">
                                    <span class="glyphicon glyphicon-lock"></span>
                                    Safe
                                </div>
                                <div class="panel-body">
                                    <img class="img-circle pull-left" src="indunil_files/Resources/Icons/safe.png" width="50px" height="50px"/>
                                    Your payments are 100% protected..
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                    
            </div>
            <div class="container">
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <a style="font-family: calibri;" href="#" class="btn btn-lg btn-block btn-info" type="button">Contact Support</a>
                    </div>
                </div>
            </div>
            <br/>
        </body>
    <jsp:include page='footer.jsp'></jsp:include>
</html>