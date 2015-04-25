<%-- 
    Document   : CompleteCheckout
    Created on : Apr 26, 2015, 12:19:21 AM
    Author     : Indunil
--%>

<%@page import="Classes.UserClass"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>My Shopping Cart</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

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

        <!--internal JS end-->   
    </head>

    <jsp:include page="header.jsp"></jsp:include>

    <%
        ArrayList userinfo = (ArrayList) request.getAttribute("userinfo");

        Iterator itr = userinfo.iterator();
        UserClass usr = null;

        String checkoutDisable = null;

        if (userinfo.isEmpty()) {
            checkoutDisable = "Disabled";
        }

        while (itr.hasNext()) {
            usr = (UserClass) itr.next();
        }

        String amount = request.getParameter("Amount");

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
            response.sendRedirect("EditProfile");
        }
    %>
    <body>
        <form method="POST" action="PayCart">
            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <div class="page-header">
                            <h1>
                                Checkout <small>Pay For Items</small>
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
                                    <p>Rs <%= amount%></p>
                                </div>

                                <div>
                                    <h3>Address :</h3>
                                    <p>
                                        <%= usr.getU_addLine1()%><br/>
                                        <%= usr.getU_addLine2()%><br/>
                                        <%= usr.getU_addLine3()%>
                                    </p>
                                </div>

                                <div>
                                    <h3>Card Number :</h3>
                                    <p><%=usr.getU_CardNo()%></p>
                                </div>

                                <br/>

                                <div class="btn-group" role="group">
                                    <button name="submit" value="editAddress" type="submit" class="btn btn-default btn-group">Edit Address</button>
                                    <button name="submit" value="editCard" type="submit" class="btn btn-default btn-group">Change Card</button>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="row">						
                                    <div class="col-lg-12">
                                        <button name="submit" value="pay" type="submit" <%= checkoutDisable%> class="btn btn-danger btn-block">Pay For Items Now</button>
                                    </div>
                                </div>
                            </div>
                        </div>			
                    </div>
                </div>
            </div>
        </form>
    </body>
    
    <jsp:include page="footer.jsp"></jsp:include>
</html>
