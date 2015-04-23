<%-- 
    Document   : addAdmin
    Created on : Apr 20, 2015, 3:02:56 PM
    Author     : Chami
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
        <div class="container" style="background-color:#F5F5F0">
            <%@include file="HeaderFiles/admiinHeader.jsp"%>           
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2">
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left;">Admin</li>
                        <li>
                            <div id="topmenu">
                                <ul class="nav nav-pills nav-stacked topmenu">
                                    <li role="presentation" ><a href="#"><font style="color: orange">Admin Details</font></a></li>
                                    <li role="presentation" class="active" ><a href="">Add Admin</a></li>
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
                <%! String level1="Have authority to add, modify and remove admins."
                                        + "<br> Have authority to add, modify and remove books, authors and suppliers."
                                        + "<br> Have authority to add books copies."
                                        + "<br> Have authority to manage clients and orders.";
                    String level2="Have authority to add, modify and remove books, authors and suppliers."
                                        + "<br>Have authority to add books copies."
                                        + "<br>Have authority to manage clients and orders.";
                    String level3="Have authority to only add books, authors and suppliers."
                                        + "<br>Have authority to add books copies."
                                        + "<br>Have authority to manage clients and orders."; %>
                <%--Form--%>
                <div class="col-lg-9">
                    <br>
                     <% if (request.getAttribute("msg") != null) {
                    %><br><div class="alert alert-warning" role="alert"><strong><%=request.getAttribute("msg")%>.</strong><br>
                        If you want add another admin fill below form and add an admin.</div><%
                            } else {%>
                    <br><%}%>
                    <form id="Admin" method="POST" <%if (request.getAttribute("msg") != null) {%>
                          action="AdminAdd"<%} else {%>
                          action="../AdminAdd"<%}%>>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Admin Name / User Name</label>
                                <input type="text" class="form-control" placeholder="Enter admin name" name="Name" id="Name">
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Password</label>
                                <input type="password" class="form-control" placeholder="Enter password" name="password" id="password">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                         <div id ="orange">
                            <div class="form-group orange">
                                <label>Confirm Password</label>
                                <input type="password" class="form-control" placeholder="Confirm password" name="confirm" id="confirm">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Admin Email</label>
                                <input type="text" class="form-control" placeholder="Enter admin email" name="Email" id="Email">                          
                            </div>
                        </div> 
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Admin Contact Number</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input type="text" class="form-control" placeholder="Enter contact number" name="TPN" id="TPN">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Admin Address</label>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <input type="text" class="form-control" placeholder="Enter address line 1" name="add1" id="add1">
                                        <input type="text" class="form-control" placeholder="Enter address line 2" name="add2" id="add2">
                                        <input type="text" class="form-control" placeholder="Enter address line 3" name="add3" id="add3">
                                    </div>
                                </div>
                            </div>
                        </div>                      
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Admin Level</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <select name="Level" id="Level" class="form-control" >
                                            <option disabled selected value="0">Choose admin level</option> 
                                            <option value="L1" data-toggle="tooltip" data-placement="left" title="<%=level1%>">Level 1</option>
                                            <option value="L2" data-toggle="tooltip" data-placement="left" title="<%=level2%>">Level 2</option>
                                            <option value="L3" data-toggle="tooltip" data-placement="left" title="<%=level3%>">Level 3</option>
                                        </select>
                                    </div>
                                </div>                            
                            </div>
                        </div> 
                        <button type="submit" class="btn btn-default">Add Admin</button>
                    </form>
                </div>
            </div>
                <script type="text/javascript">
                $(document).ready(function() {
                    var validator = $("#Admin").bootstrapValidator({
                        fields: {
                            Name: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide a admin name"
                                    }
                                }
                            },
                            Email: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide an email address"
                                    },
                                    emailAddress:{
                                        message: "Email address is invalid"
                                    }
                                }
                            },
                            TPN: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide a contact number"
                                    }
                                }
                            },
                            add1: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide atleast address line 1"
                                    }
                                }
                            },
                            Level: {
                                validators: {
                                    notEmpty: {
                                        message: "Please select admin level"
                                    }
                                }
                            },
                            password: {
                                validators: {
                                    notEmpty: {
                                        message: "Password is required"
                                    },
                                    stringLength: {
                                        min: 8,
                                        message: "Password must be 8 characters long"
                                    }
                                }
                                
                            },
                            confirm: {
                                validators: {
                                    notEmpty: {
                                        message: "Confirm password is required"
                                    },
                                    identical: {
                                        field: "password",
                                        message : "Password and confirmation must match"
                                    }
                                }
                            }
                        }
                    });
                });
            </script>
                
            <%--tool tip--%>
            <script type="text/javascript">
                $(function () {
                    $('[data-toggle="tooltip"]').tooltip()
                })
            </script>
            <%--Form end--%>
            
            <div class="row">
                &nbsp;
            </div>
            <div class="row">
                &nbsp;
            </div>
            <div class="row" >
                <ol class="breadcrumb" style="background-color:#FF9933">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Library</a></li>
                    <li class="active">Data</li>
                </ol>
            </div> 
        </div>
    </body>
</html>
