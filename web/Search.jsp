<%-- 
    Document   : Search
    Created on : Apr 26, 2015, 6:11:04 PM
    Author     : Indunil
--%>

<%@page import="Classes.BookClass"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Search</title>

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
            <div class='container-fluid' style='font-family:calibri;'>
              
            <%
                ArrayList result = (ArrayList) request.getAttribute("SearchResult");

                BookClass book = null;

                if (result.isEmpty()) {
                    out.print("<center><h1>No Books Found..!</h1></center>");
                } else {
                    for (int i = 0; i < result.size(); i++) {
                        book = (BookClass) result.get(i);

                        out.print("<div class='row clearfix'>"
                                + "<div class='col-md-12 column'>"
                                + "<form method='POST' action='Search'>"
                                + "<input type='hidden' name='BookID' value='"+book.getB_ID()+"'>"
                                + "<div class='list-group'>"
                                + "<a class='list-group-item active'>" + book.getB_Title() + "</a>"
                                + "<div class='row'>"
                                + "<div class='col-lg-4'>"
                                + "<br>"
                                + "<center><img class='img-responsive img-circle' src='BookImage.jsp?ID="+book.getB_ID()+"' width='100' height='100' alt='- Image Not Found'></center>"
                                + "</div>"
                                + "<div class='col-lg-8'>"
                                + "<div class='list-group-item'>"
                                + "<h4 class='list-group-item-heading'>"
                                + "Price : RS " + book.getPrice()
                                + "</h4>"
                                + "<h4 class='list-group-item-heading'>"
                                + "<div class='input-group'>"
                                + "<span class='input-group-addon'>"
                                + " Quantity"
                                + "</span>"
                                + "<input name='Qty' type='number' class='form-control' value='1' required='' min='1' step='1' max='"+book.getS_Qty()+"'>"
                                + "<span class='input-group-addon'>"
                                + "Stock: " + book.getS_Qty()
                                + "</span>"
                                + "</div>"
                                + "</h4>"
                                + "</div>"
                                + "<div class='list-group-item'>"
                                + "<div class='btn-group btn-group-sm' role='group'>"
                                + "<button type='submit' name='submit' value='Cart' class='btn btn-info'>"
                                + "<span class='glyphicon glyphicon-shopping-cart' aria-hidden='true'></span>"
                                + " To Cart"
                                + "</button>"
                                + "<button type='submit' name='submit' value='Buy' class='btn btn-danger'>"
                                + "<span class='glyphicon glyphicon-usd' aria-hidden='true'></span>"
                                + " Buy It Now"
                                + "</button>"
                                + "</div>"
                                + "</div>"
                                + "</div>"
                                + "</div>"
                                + "<a class='list-group-item active'>Item #: "+book.getB_ID()+"</a>"
                                + "</div>"
                                + "</form>"
                                + "</div>"
                                + "</div>");
                    }
                }
            %>
        </div>
    </body>

    <jsp:include page='footer.jsp'></jsp:include>
</html>
