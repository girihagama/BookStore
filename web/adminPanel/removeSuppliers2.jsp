<%-- 
    Document   : removeSuppliers2
    Created on : Mar 25, 2015, 10:45:25 AM
    Author     : Dushara Vitiyala
--%>

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
        <title>Admin Panel - Remove Suppliers</title>
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
           <%@include file="HeaderFiles/suppliersHeader.jsp"%> 
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2">
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left; font-size: 4em;">Suppliers</li>
                        <li>
                            <div id="topmenu">
                            <ul class="nav nav-pills nav-stacked topmenu">
                                <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/addAuppliers.jsp"><font style="color: orange">Add Supplier</font></a></li>
                                <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/modifySuppliers.jsp"><font style="color: orange">Modify Supplier</font></a></li>
                                <li role="presentation" class="active"><a href="#">Remove Supplier</a></li>
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
                    <form id="RemoveForm" action="RemoveSupplier3" method="POST">
                    <table border="0">
                            <tbody>
                                <tr>
                                    <td><label>Supplier Name</label></td>
                                    <td><label>: <%=request.getAttribute("searchedSupplierName")%></label></td>
                                    <td></td>
                                </tr>

                                <tr>
                                    <td><label>Supplier Contact Number </label>&nbsp;&nbsp;&nbsp; </td>
                                    <td><label>:  <%=request.getAttribute("searchedSupplierConNO")%></label></td>
                                    <td></td>
                                </tr>
                                
                                <tr>
                                    <td><label>Supplier Email</label></td>
                                    <td><label>: <%=request.getAttribute("searchedSupplierMail")%></label></td>
                                    <td></td>
                                </tr>
                                
                                <tr>
                                    <td><label>Supplier Address Line1</label></td>
                                    <td><label>: <%=request.getAttribute("searchedSupplierADD1")%></label></td>
                                    <td></td>
                                </tr>
                                
                                <tr>
                                    <td><label>Supplier Address Line 2</label></td>
                                    <td><label>: <%=request.getAttribute("searchedSupplierADD2")%></label></td>
                                    <td></td>
                                </tr>
                                
                                <tr>
                                    <td><label>Supplier Address Line 3</label></td>
                                    <td><label>: <%=request.getAttribute("searchedSupplierADD3")%></label></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>                      
                        <input type="hidden" name="oldName" value="<%=request.getAttribute("searchedSupplierName")%>">
                        <div class="row">
                            <div class="form-group">
                                <div class="col-lg-5">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="checkbox" value="Choice #1" /> I want to remove this supplier
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <table>
                        <tbody>
                                <tr>
                                    <td><label> <a class="btn btn-default" href="adminPanel/removeSuppliers.jsp" role="button">Cancel</a></label></td>
                                    <td><label><button type="submit" class="btn btn-default">Remove This Supplier</button></label></td>
                                </tr>
                        </tbody>
                        </table>
                    </form>
                 <script type="text/javascript">
                        $(document).ready(function() {
                            var validator = $("#RemoveForm").bootstrapValidator({
                                fields: {
                                    checkbox: {
                                        validators: {
                                            notEmpty: {
                                                message: "If you need to remove this supplier, please put a tick"
                                            }
                                        }
                                    }
                                }
                            });
                        });
                    </script>
                </div>
            </div>
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
            <%} else {%>
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