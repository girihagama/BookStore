<%-- 
    Document   : addSupliers
    Created on : Mar 23, 2015, 3:37:58 PM
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
        <title>Admin Panel - Add Suppliers</title>
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
        <%! String backSite = null;%>
        <% backSite = request.getHeader("Referer");%>
        <div class="container" style="background-color:#F5F5F0">
            <%@include file="HeaderFiles/suppliersHeader.jsp"%> 
            <%--for authentication--%>
            <%!String level;%>
            <% level = adminLevel;%>
            <%-- ------------ --%>
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2">
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left; font-size: 4em;">Suppliers</li>
                        <li>
                            <div id="topmenu">
                                <ul class="nav nav-pills nav-stacked topmenu">
                                    <li role="presentation" class="active"><a href="#">Add Supplier</a></li>
                                        <%if ("L3".equals(level)) {%>
                                    <li role="presentation"><a href="" data-toggle="modal" data-target="#Modify" data-backdrop="static"><font style="color: orange">Modify Supplier</font></a></li>
                                            <%} else {%>
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/modifySuppliers.jsp"><font style="color: orange">Modify Supplier</font></a></li><%}%>
                                            <%if ("L3".equals(level)) {%>
                                    <li role="presentation"><a href="" data-toggle="modal" data-target="#remove" data-backdrop="static"><font style="color: orange">Remove Supplier</font></a></li>
                                            <%} else {%>
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/removeSuppliers.jsp"><font style="color: orange">Remove Supplier</font></a></li><%}%>
                                </ul>
                            </div>
                        </li>
                    </ul>  
                </div>
                <div class="col-lg-1">&nbsp;</div>
                <%--left side navigation end--%>

                <%--Form--%>
                <div class="col-lg-9">
                    <% if (request.getAttribute("msg") != null) {
                    %><br><div class="alert alert-warning" role="alert"><strong><%=request.getAttribute("msg")%>.</strong><br></div><%
                    } else {%>
                    <br><%}%>
                    <br>
                    <form id="AddForm"<%if (request.getAttribute("action") != null) {%>
                          action="<%=request.getAttribute("action")%>"<%} else {%>
                          action="../AddSupplier"<%}%> method="POST">
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Supplier Name</label>
                                <input type="text" class="form-control" id="addSupplierName" name="addSupplierName" placeholder="Enter Supplier Name" 
                                       <%if (request.getAttribute("errorSupplierName") != null) {%>
                                       value="<%=request.getAttribute("errorSupplierName")%>"<%}%>>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Supplier Contact Number</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input type="text" class="form-control" name="addSupplierContactNO" placeholder="Enter Contact Number" 
                                               <%if (request.getAttribute("errorSupplierNO") != null) {%>
                                               value="<%=request.getAttribute("errorSupplierNO")%>"<%}%>
                                               required="required" pattern="^(\d{10}||\d{13})?$">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Supplier Email</label>
                                <input type="email" class="form-control" name="addSupplierEmail" placeholder="Enter Email" data-error="Email address is invalid" 
                                       <%if (request.getAttribute("errorEmail") != null) {%>
                                       value="<%=request.getAttribute("errorEmail")%>"<%}%>>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Supplier Address</label>
                                <input type="text" name="addSupplierADD1" id="addSupplierADD1" class="form-control" placeholder="Address Line 1" 
                                       <%if (request.getAttribute("errorAddress1") != null) {%>
                                       value="<%=request.getAttribute("errorAddress1")%>"<%}%>>
                                <input type="text" name="addSupplierADD2" class="form-control" placeholder="Address Line 2"
                                       <%if (request.getAttribute("errorAddress2") != null) {%>
                                       value="<%=request.getAttribute("errorAddress2")%>"<%}%>>
                                <input type="text" name="addSupplierADD3" class="form-control" placeholder="Address Line 3"
                                       <%if (request.getAttribute("errorAddress3") != null) {%>
                                       value="<%=request.getAttribute("errorAddress3")%>"<%}%>>
                            </div>
                        </div>
                        <input type ="hidden" name="back" value="<%=backSite%>">
                        <tbody>
                            <tr>
                                <td><label><button type="submit" class="btn btn-default">Add Supplier</button></label></td>
                                <td><label> <a class="btn btn-default" href="http://localhost:8080/BookStore/adminPanel/adminStartPage.jsp" role="button">Cancel</a></label></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </form>
                </div>
            </div>
            <%--Form end--%>

            <%-- remove box--%>
            <div class="modal fade" id="remove" role="dialog" aria-hidden="false">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h2 class="modal-title"><strong>Sorry...!</strong></h2>
                        </div>
                        <div class="modal-body">
                            <h4><p>You have no authentication for remove suppliers.</p></h4>                                        
                        </div>
                        <div class="modal-footer">
                            <div class="span2">
                                <button type="button" class="btn btn-warning" data-dismiss="modal">Ok</button>
                            </div>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <%-- modify box--%>
            <div class="modal fade" id="Modify" role="dialog" aria-hidden="false">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h2 class="modal-title"><strong>Sorry...!</strong></h2>
                        </div>
                        <div class="modal-body">
                            <h4><p>You have no authentication for modify suppliers.</p></h4>                                        
                        </div>
                        <div class="modal-footer">
                            <div class="span2">
                                <button type="button" class="btn btn-warning" data-dismiss="modal">Ok</button>
                            </div>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <script type="text/javascript">
                $(document).ready(function() {
                    var validator = $("#AddForm").bootstrapValidator({
                        fields: {
                            addSupplierName: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide a supplier name"
                                    }
                                }
                            },
                            addSupplierContactNO: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide a contact number"
                                    }
                                }
                            },
                            addSupplierEmail: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide an email"
                                    }
                                }
                            },
                            addSupplierADD1: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide an address"
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
            <div class="row" >
                <ol class="breadcrumb" style="background-color:#FF9933">
                </ol>
            </div> 
        </div>
    </body>
</html>
