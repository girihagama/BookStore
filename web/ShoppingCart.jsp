<%-- 
    Document   : ShoppingCart
    Created on : Apr 21, 2015, 12:41:40 PM
    Author     : Indunil
--%>

<%@page import="Classes.BookClass"%>
<%@page import="Classes.CartClass"%>
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

        <script type="text/javascript">
            function Confirm() {
                var x;
                if (confirm("Confirm this action..?") == true) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>

        <!--internal JS end-->   
    </head>

    <jsp:include page="header.jsp"></jsp:include>

        <body>

        <%
            ArrayList cart = (ArrayList) request.getAttribute("CartItems");

            Iterator itr = cart.iterator();
            Iterator itr2 = cart.iterator();

            CartClass crt = new CartClass();

            int panelGroupNo = 1000;
            int panelElementNo = 01;
            String checkoutDisable = null;

            double cart_amount = 0.00;

            while (itr.hasNext()) {
                crt = (CartClass) itr.next();
                cart_amount = cart_amount + crt.getAmount();
            }

            if (cart.isEmpty()) {
                checkoutDisable = "Disabled";
            }
        %>

        <jsp:include page="ShowMessageScript.jsp" />

        <div class="container-fluid">

            <div class="row clearfix">
                <div class="col-md-12 column">
                    <form method="POST" action="ManageCheckout" onsubmit="return Confirm();">
                        <input type="hidden" name="Amount" value="<%= cart_amount%>">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title" style="font-family:calibri;">
                                    <center>Shopping Cart Total</center>
                                </h3>
                            </div>
                            <div class="panel-body" style="font-family:calibri;">
                                <center>
                                    <font color="red"> RS. <%= cart_amount%></font>
                                </center>
                            </div>
                            <div class="panel-footer">
                                <button type="submit" name="submit" value="Checkout" style="font-family:calibri; border-radius:0px;" class="btn btn-lg btn-warning navbar-btn btn-block" <%=checkoutDisable%>>
                                    <span class="glyphicon glyphicon-shopping-cart"></span>
                                    Checkout
                                </button>
                            </div>
                        </div>
                    </form>
                </div>            
            </div>

            <%-- cart items listing --%>
            <div class="row">
                <div class="col-lg-12">
                    <%
                        if (!cart.isEmpty()) { //if cart has items                            
                            out.println("<div class='panel-group' id='panel-" + panelGroupNo + "'>");

                            while (itr2.hasNext()) {
                                crt = (CartClass) itr2.next();

                                out.println("<form method='POST' action='ManageCart' onsubmit='return Confirm();'>"
                                        + "<input type='hidden' name='ID' value='" + crt.getC_ID() + "'>"
                                        + "<div class='panel panel-default'>"
                                        + "<div class='panel-heading'>"
                                        + "<span class='glyphicon glyphicon-play'></span> </button>"
                                        + "<a style='font-family:calibri; text-decoration:none;' class='panel-title' data-toggle='collapse' data-parent='#panel-" + panelGroupNo + "' href='#panel-element-" + panelElementNo + "'> Item #: " + crt.getB_ID() + "</a>"
                                        + "</div>"
                                        + "<div id='panel-element-" + panelElementNo + "' class='panel-collapse collapse'>"
                                        + "<div class='panel-body' style='font-family:calibri;'>"
                                        + "<div class='row'>"
                                        + "<div class='col-lg-2'>"
                                        + "<img src='BookImage.jsp?ID=" + crt.getB_ID() + "' class='img-rounded img-responsive center-block' alt='Image Not Found' width='100' height='100'/>"
                                        + "</div>"
                                        + "<div class='col-lg-10'>"
                                        + "<hr/>"
                                        + "<span class='glyphicon glyphicon-book'></span>"
                                        + " Qty: " + crt.getC_Qty()
                                        + "<br>"
                                        + "<br>"
                                        + "<span class='glyphicon glyphicon-chevron-right'></span>"
                                        + " Amount: " + crt.getAmount()
                                        + "<br>"
                                        + "<button name='submit' type='submit' value='Delete' class='btn btn-sm btn-danger navbar-btn btn-block' style='border-radius:0px;'> <span class='glyphicon glyphicon-minus-sign'></span> Remove From Cart</button>"
                                        + "</div>"
                                        + "</div>"
                                        + "</div>"
                                        + "</div>"
                                        + "</div>"
                                        + "</form>"
                                        + "<br>");

                                panelElementNo++;
                            }

                            out.println("</div>");
                        } else { //if cart has no items
                            out.println("<center>"
                                    + "<h1 style='font-family:calibri;'>"
                                    + "No Items In Cart"
                                    + "</h1>"
                                    + "</center>");
                        }
                    %>
                </div>
            </div>

        </div>
    </body>
</html>
