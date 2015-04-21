<%-- 
    Document   : latestItems
    Created on : Apr 20, 2015, 11:45:15 PM
    Author     : Indunil
--%>

<%@page import="Classes.BookClass"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Latest Items</title>

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
    <%
        out.println("<div class='row container-fluid'>");
        ArrayList latest = (ArrayList) request.getAttribute("LatestItems");

        Iterator itr = latest.iterator();
        BookClass received = null;

        while (itr.hasNext()) {
            Object a = itr.next();
            received = (BookClass) a;

            out.print("<div class='col-lg-4'>"
                    + "<form method='GET' action='viewItem'>"
                    + "<input type='hidden' name='item' value='" + received.getB_ID() + "'/>"
                    + "<div class='panel panel-success text-center' style='margin: 5px; border-radius:0px; box-shadow: 0px 0px 2px 2px gray;'>"
                    + "<div class='panel-heading'>"
                    + "<h6 class='panel-title'>Item: " + received.getB_ID() + "</h6>"
                    + "</div><!--panal body end-->"
                    + "<div class='panel-body'>"
                    + "<img class='img-circle img-responsive center-block' src='BookImage.jsp?ID=" + received.getB_ID() + "' alt='" + received.getB_ID() + "' width='150' height='150'/>"
                    + "</div><!--panal body end-->"
                    + "<div class='panel-footer'>"
                    + "<button type='submit' class='btn btn-primary btn-sm btn-block' aria-label='Left Align'>"
                    + "<span class='glyphicon glyphicon-info-sign' aria-hidden='true'></span>"
                    + " View Item"
                    + "</button>"
                    + "</div><!--panal footer end-->"
                    + "</div><!--panal end-->"
                    + "</form>"
                    + "</div>");
        }
        out.println("</div>");
    %>
