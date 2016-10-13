<%-- 
    Document   : changePassword
    Created on : Apr 26, 2015, 12:26:57 PM
    Author     : Chami
--%>

<%@page import="Classes.UserClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
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
        <title>Admin Panel - Change My Account Password</title>
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
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/modifyAccountDetails.jsp"><font style="color: orange">Modify Account</font></a></li>
                                    <li role="presentation" class="active"><a href="#">Change Password</a></li>
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
                    <form id="changePassword"<%if (request.getAttribute("msg") != null) {%>
                          action="ChangePassword"<%} else {%>
                          action="../ChangePassword"<%}%>
                          method="POST">
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Admin Name / User Name : <%=admin.getU_Name()%></label>
                                <input type="hidden" name="oldName" value="<%=admin.getU_Name()%>">
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Current Password : </label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input type="password" class="form-control" placeholder="Enter current password" name="currentPassword" id="currentPassword"> 
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>New Password : </label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input type="password" class="form-control" placeholder="Enter new password" name="newPassword" id="newPassword">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Confirm New Password : </label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input type="password" class="form-control" placeholder="Confirm new password" name="newPasswordCon" id="newPasswordCon">
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <tbody>
                            <tr>
                            <td><label><button type="submit" class="btn btn-default">Change Password</button></label></td>
                            <td><label> <a class="btn btn-default" href="http://localhost:8080/BookStore/adminPanel/adminStartPage.jsp" role="button">Cancel</a></label></td>
                            <td></td>
                            </tr>
                        </tbody>
                    </form>
                </div>
            </div>
            <script type="text/javascript">
                $(document).ready(function() {
                    var validator = $("#changePassword").bootstrapValidator({
                        fields: {
                            currentPassword: {
                                validators: {
                                    notEmpty: {
                                        message: "You should provide your current password"
                                    }
                                }
                            },
                            newPassword: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide new password"
                                    },
                                    stringLength: {
                                        min: 8,
                                        message: "Password must be 8 characters long"
                                    }
                                }
                            },
                            newPasswordCon: {
                                validators: {
                                    notEmpty: {
                                        message: "Please confirm your password"
                                    },
                                    identical: {
                                        field: "newPassword",
                                        message: "Password and confirmation must match"
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
            <% if (request.getAttribute("msg") != null) {
            %>
            <div class="row">
                &nbsp;
            </div>
            <div class="row">
                &nbsp;
                <%}%>
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
