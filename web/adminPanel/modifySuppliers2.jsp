<%-- 
    Document   : modifySuppliers2
    Created on : Mar 25, 2015, 10:44:34 AM
    Author     : Dushara Vitiyala
--%>

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
        <title>Admin Panel</title>
    </head>
    <body>
         <%
            if (!"http://localhost:8080/BookStore/adminPanel".equals(request.getHeader("Referer").substring(0, 42))) {
            System.out.println(request.getHeader("Referer").substring(0, 42));%>
            <script>
                history.forward()
        </script>
            
        <%}%>
        <div class="container" style="background-color:#F5F5F0">
            <%@include file="HeaderFiles/suppliersHeader.jsp"%> 
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2">
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left; font-size: 4em;">Suppliers</li>
                        <li>
                            <div id="topmenu">
                            <ul class="nav nav-pills nav-stacked topmenu">
                                <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/addSuppliers.jsp"><font style="color: orange">Add Supplier</font></a></li>
                                <li role="presentation" class="active"><a href="#">Modify Supplier</a></li>
                                <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/removeSuppliers.jsp"><font style="color: orange">Remove Supplier</font></a></li>
                            </ul>
                            </div>
                        </li>
                    </ul>  
                </div>
                <div class="col-lg-1">&nbsp;</div>
                <%--left side navigation end--%>
                
                <%--Form--%>
                <div class="col-lg-9">
                    <br>
                    <br>
                    <form id="ModifySupplier" action="ModifySupplier3" method="POST" >
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Supplier Name : <%=request.getAttribute("searchedSupplierName")%></label>
                                <input type="hidden" name="oldName" value="<%=request.getAttribute("searchedSupplierName")%>">
                                <input type="text" class="form-control" placeholder="Enter Supplier Name" name="changedName" required>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Supplier Contact Number : <%=request.getAttribute("searchedSupplierConNo")%></label>
                                <input type="text" class="form-control" placeholder="Enter Contact Number" name="changedConNO" required>
                            </div>
                        </div>
                        
                            <div id ="orange">
                            <div class="form-group orange">
                                <label>Supplier Email :  <%=request.getAttribute("searchedSupplierMail")%></label>
                                <input type="email" class="form-control" name="changedMail" placeholder="Enter Email" data-error="Email address is invalid" required>
                            </div>
                        </div>
                        
                             <div id ="orange">
                            <div class="form-group orange">
                                <label>Supplier Address :  <%=request.getAttribute("searchedSupplierADD1")%></label>
                                <input type="text" name="changedADD1" class="form-control" placeholder="Address Line 1">
                                <label>Supplier Address :  <%=request.getAttribute("searchedSupplierADD2")%></label>
                                <input type="text" name="changedADD2" class="form-control" placeholder="Address Line 2">
                                <label>Supplier Address :  <%=request.getAttribute("searchedSupplierADD3")%></label>
                                <input type="text" name="changedADD3" class="form-control" placeholder="Address Line 3">
                            </div>
                        </div>
                        <tbody>
                                <tr>
                                    <td><label><button type="submit" class="btn btn-default">Modify Supplier</button></label></td>
                                    <td><label> <a class="btn btn-default" href="http://localhost:8080/BookStore/adminPanel/modifySuppliers.jsp" role="button">Cancel</a></label></td>
                                    <td></td>
                                </tr>
                        </tbody>
                    </form>
                </div>
            </div>
            <%--Form end--%>
            <script type="text/javascript">
                $(document).ready(function() {
                    var validator = $("#ModifySupplier").bootstrapValidator({
                        fields: {
                            changedName: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide a Supplier Name"
                                    }
                                }
                            },
                            changedConNO: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide a Supplier Contact Number"
                                    }
                                }
                            },
                            changedMail: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide a Supplier Email"
                                    }
                                }
                            },
                            changedADD1: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide a Supplier Address"
                                    }
                                }
                            }
                            
                        }
                    });
                });
            </script>
            <% if (request.getAttribute("msg") != null) {
            %>
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
            <div class="row">
                &nbsp;
            </div>
            <div class="row">
                &nbsp;
            </div>
            <div class="row">
                &nbsp;
            </div>
            <%}%>
                <div class="row">
                &nbsp;
            </div>
            <div class="row">
                &nbsp;
            </div>
            <div class="row" >
                <ol class="breadcrumb" style="background-color:#FF9933">
                </ol>
            </div> 
        </div>
    </body>
</html>