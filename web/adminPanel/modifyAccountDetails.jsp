<%-- 
    Document   : modifyAccountDetails
    Created on : Apr 26, 2015, 11:01:38 AM
    Author     : Chami
--%>

<%@page import="Classes.UserClass"%>
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
        <title>Admin Panel - Modify My Account</title>
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
            <%@include file="HeaderFiles/accountHeader.jsp"%>           
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2">
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left; font-size: 4em;">Account</li>
                        <li>
                            <div id="topmenu">
                                <ul class="nav nav-pills nav-stacked topmenu">
                                    <li role="presentation" class="active"><a href="#">Modify Account</a></li>
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/changePassword.jsp"><font style="color: orange">Change Password</font></a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>  
                </div>
                <div class="col-lg-1">&nbsp;</div>
                <%--left side navigation end--%>
                <%--Form--%>
                <%
                    UserClass admin = new UserClass();
                    admin.setU_Name(username);
                    admin.getUserDetails();
                %>
                <div class="col-lg-9">
                    <% if (request.getAttribute("msg") != null) {
                    %><br><div class="alert alert-warning" role="alert"><strong><%=request.getAttribute("msg")%>.</strong><br></div><%
                        } else {%>
                    <br><%}%>
                    <br>
                    <form id="ModifyAdmin"<%if (request.getAttribute("msg") != null) {%>
                          action="MyAccountModify"<%} else {%>
                          action="../MyAccountModify"<%}%>
                          method="POST">
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Admin Name / User Name : <%=admin.getU_Name()%></label>
                                <input type="hidden" name="oldName" value="<%=admin.getU_Name()%>">
                                <input type="text" class="form-control" placeholder="Enter new admin name" name="changedName" id="changedName">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Admin Email : <%=admin.getU_Mail()%></label>
                                <input type="text" class="form-control" placeholder="Enter new admin email" name="changedEmail" id="changedEmail">                          
                            </div>
                        </div> 
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Admin Contact Number : <%=admin.getU_TPN()%></label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input type="text" class="form-control" placeholder="Enter new contact number" name="changedTPN" id="changedTPN">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>
                                    <table border="0">
                                        <tbody>
                                            <tr>
                                                <td>Admin Address : </td>
                                                <td>&nbsp;<%=admin.getU_addLine1()%></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>
                                                    &nbsp;<%=admin.getU_addLine2()%><br>
                                                    &nbsp;<%=admin.getU_addLine3()%>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </label>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <input type="text" class="form-control" placeholder="Enter new address line 1" name="add1" id="add1">
                                        <input type="text" class="form-control" placeholder="Enter new address line 2" name="add2" id="add2">
                                        <input type="text" class="form-control" placeholder="Enter new address line 3" name="add3" id="add3">
                                    </div>
                                </div>
                            </div>
                        </div>   
                        <tbody>
                            <tr>
                                <td><label><button type="submit" class="btn btn-default">Modify Admin</button></label></td>
                                <td><label> <a class="btn btn-default" href="http://localhost:8080/BookStore/adminPanel/adminStartPage.jsp" role="button">Cancel</a></label></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </form>
                </div>
            </div>
            <script type="text/javascript">
                $(document).ready(function() {
                    var validator = $("#ModifyAdmin").bootstrapValidator({
                        fields: {
                            changedName: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide a admin name"
                                    }
                                }
                            },
                            changedEmail: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide an email address"
                                    }
                                }
                            },
                            changedTPN: {
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
                            changedLevel: {
                                validators: {
                                    notEmpty: {
                                        message: "Please select admin level"
                                    }
                                }
                            }
                        }
                    });
                });
            </script>
            <%--tool tip--%>
            <script type="text/javascript">
                $(function() {
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
                </ol>
            </div> 
        </div>
    </body>
</html>
