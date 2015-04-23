<%-- 
    Document   : modifySuppliers
    Created on : Mar 23, 2015, 4:17:29 PM
    Author     : Dushara Vitiyala
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
        <title>Admin Panel - Modify Suppliers</title>
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
                                         <div class="col-lg-9">
                    <div class="row">&nbsp;</div>
                    <div class="row">&nbsp;</div>
                    <div class="col-lg-12">
                        <div class="row">
                            <% if (request.getAttribute("msg") != null) {
                                %><div class="alert alert-warning" role="alert"><strong><%=request.getAttribute("msg")%>.</strong><br></div><%
                            }%>                             
                            <form id="Search" <%if (request.getAttribute("supplierList")!= null ||request.getAttribute("errorSearch")!=null || request.getAttribute("msg")!=null  ) {%>
                                action="ModifySupplier"<%} else {%>
                                action="../ModifySupplier"<%}%> method="POST">
                            <label><h4>Search Supplier to Modify</h4></label>
                            <div class="row">
                                <div class="col-lg-8">
                                    <div id="orange">
                                      <div class="input-group">
                                          <input type="text" class="form-control orange" placeholder="Search for..." name="modifySupplierSearch" id="modifySupplierSearch">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default orange" type="submit">Search</button>
                                        </span>
                                    </div>  
                                    </div>
                                </div>
                            </div>
                            </form>
                        </div>
                        <br>
                        <%!String supplierName;%>
                        <%!int numberOfResult;%> 
                        <% numberOfResult=0;%>
                        <%if (request.getAttribute("supplierList") != null) {
                            List results =(List) request.getAttribute("supplierList");
                            Iterator it =results.iterator();
                            numberOfResult=0;
                                while (it.hasNext()) {
                                    supplierName = (String) it.next();
                                    numberOfResult = numberOfResult + 1;%>                                
                        <br>
                        <form action="ModifySupplier2" method="POST">
                            <input type="hidden" name="supplierName" value="<%=supplierName%>">
                            <button type="submit" class="btn btn-default">Click here to modify <strong><%=supplierName%></strong></button>                                    
                        </form>
                        <%}%>
                        <%} else if(request.getAttribute("errorSearch")!=null) {%>
                        <br>
                        <div class="alert alert-warning" role="alert"><strong>Sorry, Your search - <%=request.getAttribute("errorSearch")%> - did not match any supplier.</strong><br></div>
                            <%}%>
                        </div>
                    </div>
            </div>
                <script type="text/javascript">
                $(document).ready(function() {
                var validator = $("#Search").bootstrapValidator({
                fields: {
                modifySupplierSearch: {
                validators: {
                    notEmpty: {
                        message: "Please provide a supplier name to search"
                    }
                }
                }
                }
                });
                });
                </script> 
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
