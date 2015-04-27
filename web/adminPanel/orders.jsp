<%-- 
    Document   : orders
    Created on : Apr 23, 2015, 3:38:36 PM
    Author     : Chami
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Classes.SaleClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="http://localhost:8080/BookStore/adminPanel/Images/Page icons/BookIcon.png" type="image/x-icon" />
        <link rel="shortcut icon" href="http://localhost:8080/BookStore/adminPanel/Images/Page icons/BookIcon.ico" type="image/ico" />

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css"/>

        <%--Bootsrap CSS files--%>
        <link rel="stylesheet" href="http://localhost:8080/BookStore/adminPanel/css/bootstrap.css"/>
        <link rel="stylesheet" href="http://localhost:8080/BookStore/adminPanel/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="http://localhost:8080/BookStore/adminPanel/css/bootstrapValidator.css"/>

        <%--Bootsrap jS files--%>
        <script type="text/javascript" src="http://localhost:8080/BookStore/adminPanel/js/jquery.min.js"></script>
        <script type="text/javascript" src="http://localhost:8080/BookStore/adminPanel/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://localhost:8080/BookStore/adminPanel/js/bootstrapValidator.js"></script>

        <%-- my css files --%>
        <link href="http://localhost:8080/BookStore/adminPanel/css/startPage.css" rel="stylesheet">
        <link href="http://localhost:8080/BookStore/adminPanel/css/form.css" rel="stylesheet">
        <title>Admin Panel - Orders</title>
    </head>
    <body>
        <% if (request.getHeader("Referer").length() < 42) {%>
        <script>
            history.forward()
        </script> 
        <%} else if (!"http://localhost:8080/BookStore/adminPanel".equals(request.getHeader("Referer").substring(0, 42))) {%>
        <script>
            history.forward()
        </script>

        <%}%>

        <div class="container" style="background-color:#F5F5F0">
            <%@include file="HeaderFiles/orderHeader.jsp"%>           
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2">
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left;">Orders</li>
                        <li>
                            <div id="topmenu">
                                <ul class="nav nav-pills nav-stacked topmenu">
                                    <li role="presentation" class="active"><a href="#">Shift Orders</a></li>
                                    <li>&nbsp;</li>
                                    <li>&nbsp;</li>
                                    <li>&nbsp;</li>
                                </ul>
                            </div>
                        </li>
                    </ul>  
                </div>
                <div class="col-lg-1">&nbsp;</div>
                <%--left side navigation end--%>

                <div class="col-lg-9">
                    <% if (request.getAttribute("msg") != null) {
                    %><div class="row">
                        <div class="col-lg-9">
                    <br><div class="alert alert-warning" role="alert"><strong><%=request.getAttribute("msg")%>.</strong><br></div>
                        </div>
                    </div><%
                        }%>
                    <label><h3>Orders</h3></label>
                    <div class="row">
                        <div class="col-lg-9">
                            <%!Iterator itr;%> 
                            <%
                                SaleClass order = new SaleClass();
                                itr = order.Orders().iterator();
                                SaleClass received = null;
                                if (!itr.hasNext()) {%>
                            <div class="alert alert-warning" role="alert"><strong>No orders to be shipped.</strong><br></div>
                            <div class="row">&nbsp;</div><div class="row">&nbsp;</div><div class="row">&nbsp;</div>
                            <div class="row">&nbsp;</div><div class="row">&nbsp;</div>
                            <%if (request.getAttribute("msg") == null){%>
                            <div class="row">&nbsp;</div>
                            <div class="row">&nbsp;</div>
                            <div class="row">&nbsp;</div>
                            <div class="row">&nbsp;</div>
                            <div class="row">&nbsp;</div><%}%>
                            <%} else {
                                while (itr.hasNext()) {
                                    Object orderDet = itr.next();
                                    received = (SaleClass) orderDet;
                            %>
                            <div class="alert alert-warning" role="alert">
                            <form <%if (request.getAttribute("msg") != null) {%>
                                action="ShiftOrders"<%} else {%>
                                action="../ShiftOrders"<%}%> method="POST">
                                <div class="row">
                                    <div class="col-lg-8"></div>
                                    <div class="col-lg-4">
                                        <tbody>
                                            <tr>
                                                <td>Order Date : <%=received.getS_Date()%></td>
                                            </tr>
                                        </tbody>
                                    </div>
                                </div>
                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td>Ordered Client Name </td>
                                            <td>: &nbsp;&nbsp;&nbsp;</td>
                                            <td><%=received.getU_Name()%></td>
                                        </tr>
                                        <tr>
                                            <td>Ordered Book Name </td>
                                            <td>: &nbsp;&nbsp;&nbsp;</td>
                                            <td><%=received.getB_Title()%></td>
                                        </tr>
                                        <tr>
                                            <td>Ordered Book Quantity &nbsp;&nbsp;&nbsp;  </td>
                                            <td>: &nbsp;&nbsp;&nbsp;</td>
                                            <td><%=received.getS_Qty()%></td>
                                        </tr>
                                        <tr>
                                            <td>Price </td>
                                            <td>: &nbsp;&nbsp;&nbsp;</td>
                                            <td>Rs. <%=received.getS_Amount()%></td>
                                        </tr>
                                </table>
                                </table>
                                <div class="row">
                                    <div class="col-lg-9"></div>
                                    <div class="col-lg-3">
                                        <input type="hidden" name="uName" value="<%=received.getU_Name()%>">
                                        <input type="hidden" name="bName" value="<%=received.getB_Title()%>">
                                        <input type="hidden" name="sDate" value="<%=received.getS_Date()%>">
                                        <input type="hidden" name="sQty" value="<%=received.getS_Qty()%>">
                                        <input type="hidden" name="sAmount" value="<%=received.getS_Amount()%>">
                                        <input type="hidden" name="sID" value="<%=received.getS_ID()%>">

                                        <button type="submit" class="btn btn-default">Ship Order</button> &nbsp;&nbsp;&nbsp;
                                    </div>
                                </div>
                            </div>
                            </form>
                            <img src="http://localhost:8080/BookStore/adminPanel/Images/Orthers/orange line.png"width="100%" alt="Responsive image">
                            <br><br>
                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>

                </div>
                <div class="row">
                    &nbsp;
                </div>
                <div class="row">
                    &nbsp;
                </div>
                <div class="row">
                    &nbsp;
                </div>
                <div class="row">
                    &nbsp;
                </div>
                <div class="row">
                    &nbsp;
                </div>
            </div>
            <div class="row" >
                <ol class="breadcrumb" style="background-color:#FF9933">
                </ol>
            </div> 
        </div>
    </div>
</body>
</html>
