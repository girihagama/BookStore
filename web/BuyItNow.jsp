<%-- 
    Document   : BuyItNow
    Created on : Apr 26, 2015, 11:35:00 PM
    Author     : Indunil
--%>

<%@page import="Classes.BookClass"%>
<%@page import="Classes.UserClass"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Buy It Now</title>

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
        String username = null;

        if (session.getAttribute("Username") != null) {
            username = session.getAttribute("Username").toString();
        } else {
            response.sendRedirect("ClearAll");
        }

        int qty = Integer.parseInt(request.getParameter("Qty"));
        int id = Integer.parseInt(request.getParameter("BookID"));
    %>

    <%
        BookClass bk = new BookClass();
        bk.setB_ID(id);
        double price = bk.getBookPrice();
        double Amount = price * qty;
    %>

    <%
        ArrayList userinfo = (ArrayList) request.getAttribute("userinfo");

        Iterator itr = userinfo.iterator();
        UserClass usr = null;

        while (itr.hasNext()) {
            usr = (UserClass) itr.next();

            String l1 = null;
            if (usr.getU_addLine1() == null || usr.getU_addLine1() == "null") {
                usr.setU_addLine1("");
            }
            String l2 = null;
            if (usr.getU_addLine2() == null || usr.getU_addLine2() == "null") {
                usr.setU_addLine2("");
            }
            String l3 = null;
            if (usr.getU_addLine3() == null || usr.getU_addLine3() == "null") {
                usr.setU_addLine3("");
            }
            if (usr.getU_CardNo().length() != 16) {
                session.setAttribute("Info", "Invalid card number");
                response.sendRedirect("ViewMyProfile");
            }
        }
    %>

    <body>

        <jsp:include page="header.jsp"></jsp:include>

            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <form action="PayBuyItNow" method="POST">
                            <input type="hidden" name="Qty" value="<%= qty%>" />
                        <input type="hidden" name="BookID" value="<%= id%>" />
                        <div class="page-header">
                            <h1>
                                Checkout <small>Buy It Now</small>
                            </h1>
                        </div>

                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    Complete Checkout
                                </h3>
                            </div>
                            <div class="panel-body" style="font-family:calibri;">
                                <div>
                                    <h2>Amount :</h2>
                                    <p>Rs <%= Amount%></p>
                                </div>

                                <div>
                                    <h3>Address :</h3>
                                    <p>
                                        <%= usr.getU_addLine1()%>
                                        <%= usr.getU_addLine2()%>
                                        <%= usr.getU_addLine3()%>
                                    </p>
                                </div>

                                <div>
                                    <h3>Card Number :</h3>
                                    <p><%= usr.getU_CardNo()%></p>
                                </div>

                                <br/>

                                <div class="btn-group" role="group">
                                    <button type="submit" name="submit" value="editAddress" class="btn btn-default btn-group">Edit Address</button>
                                    <button type="submit" name="submit" value="editCard" class="btn btn-default btn-group">Change Card</button>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="row">						
                                    <div class="col-lg-12">
                                        <button type="submit" name="submit" value="Pay" class="btn btn-danger btn-block">Pay For Items Now</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
