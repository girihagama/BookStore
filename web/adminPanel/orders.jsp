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
        <% if(request.getHeader("Referer").length()<42){%>
           <script>
                history.forward()
        </script> 
        <%} else
            if (!"http://localhost:8080/BookStore/adminPanel".equals(request.getHeader("Referer").substring(0, 42))) {%>
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
                    %><br><div class="alert alert-warning" role="alert"><strong><%=request.getAttribute("msg")%>.</strong><br></div><%
                        }%>
                    <label><h3>Orders</h3></label>
                    <div class="row">
                        <div class="col-lg-9">
                            <%!Iterator itr;%> 
                            <%
                                SaleClass order = new SaleClass();
                                itr = order.Orders().iterator();
                                SaleClass received = null;
                            %>

                            <%
                                while (itr.hasNext()) {
                                    Object orderDet = itr.next();
                                    received = (SaleClass) orderDet;
                                }
                            %>
                            <form <%if (request.getAttribute("msg") != null) {%>
                                action="ShiftOrders"<%} else {%>
                                action="../ShiftOrders"<%}%> method="POST">
                                <div class="row">
                                    <div class="col-lg-10"></div>
                                    <div class="col-lg-2">
                                        <tbody>
                                            <tr>
                                                <td><h4>Order Date : </h4></td>
                                                <td><%=received.getS_Date()%></td>
                                            </tr>
                                        </tbody>
                                    </div>
                                </div>
                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td><h2>Ordered Client Name :</h2></td>
                                            <td><h2><%=received.getU_Name()%></h2></td>
                                        </tr>
                                    </tbody>
                                    <table>
                                        <tr>
                                            <td><h2>Ordered Book Name :</h2></td>
                                            <td><%=received.getB_Title()%></td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <td>Ordered Book Quantity :</td>
                                            <td><%=received.getS_Qty()%></td>
                                        </tr>
                                        <tr>
                                            <td>Price : </td>
                                            <td>&nbsp;Rs. <%=received.getS_Amount()%></td>
                                        </tr>
                                    </table>
                                </table>
                                <div class="row">
                                    <div class="col-lg-8"></div>
                                    <div class="col-lg-4">
                                        <input type="hidden" name="uName" value="<%=received.getU_Name()%>">
                                        <input type="hidden" name="bName" value="<%=received.getB_Title()%>">
                                        <input type="hidden" name="sDate" value="<%=received.getS_Date()%>">
                                        <input type="hidden" name="sQty" value="<%=received.getS_Qty()%>">
                                        <input type="hidden" name="sAmount" value="<%=received.getS_Amount()%>">
                                        <input type="hidden" name="sID" value="<%=received.getS_ID()%>">
                                        
                                        <button type="submit" class="btn btn-default">Shift Order</button> &nbsp;&nbsp;&nbsp;
                                    </div>
                                </div>
                            </form>
                            <img src="http://localhost:8080/BookStore/adminPanel/Images/Orthers/orange line.png"width="100%" alt="Responsive image">
                            <br><br>
                            <%
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
