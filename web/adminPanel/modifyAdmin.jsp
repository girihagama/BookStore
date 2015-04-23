<%-- 
    Document   : modifyAdmin
    Created on : Apr 19, 2015, 12:24:26 PM
    Author     : Chami
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
        <title>Admin Panel - Modify Admin</title>
    </head>
    <body>
         <%
            if (!"http://localhost:8080/BookStore/adminPanel".equals(request.getHeader("Referer").substring(0, 42))) {
            System.out.println(request.getHeader("Referer").substring(0, 42));%>
            <script>
                history.forward()
        </script>
            
        <%}%>
        <%
            if(request.getAttribute("searchedAdminName")==null){
                response.sendRedirect("http://localhost:8080/BookStore/adminPanel/adminDetails.jsp");
            }
            %>
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
                                    <li role="presentation" class="active"><a href="#">Modify Admin</a></li>
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/addAdmin.jsp"><font style="color: orange">Add Admin</font></a></li>
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
                    <br>
                    <form id="ModifyAdmin" action="adminModify2" method="POST">
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Admin Name : <%=request.getAttribute("searchedAdminName")%></label>
                                <input type="hidden" name="oldName" value="<%=request.getAttribute("searchedAdminName")%>">
                                <input type="text" class="form-control" placeholder="Enter new admin name" name="changedName" id="changedName">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Admin Email : <%=request.getAttribute("searchedAdminMail")%></label>
                                <input type="text" class="form-control" placeholder="Enter new admin email" name="changedEmail" id="changedEmail">                          
                            </div>
                        </div> 
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Admin Contact Number : <%=request.getAttribute("searchedAdminTPN")%></label>
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
                                                <td>&nbsp;<%=request.getAttribute("searchedAdminAdd1")%></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>
                                                    &nbsp;<%=request.getAttribute("searchedAdminAdd2")%><br>
                                                    &nbsp;<%=request.getAttribute("searchedAdminAdd3")%>
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
                        <div id ="orange">
                            <div class="form-group orange">
                                <%String level="";%>
                                <% if("L1".equalsIgnoreCase((String)request.getAttribute("searchedAdminLevel"))){
                                    level="Level 1";
                                }else if("L2".equalsIgnoreCase((String)request.getAttribute("searchedAdminLevel"))){
                                    level="Level 2";
                                }else if("L3".equalsIgnoreCase((String)request.getAttribute("searchedAdminLevel"))){
                                    level="Level 3";
                                } %>
                                <label>Admin Level : <%=level%></label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <select name="changedLevel" id="changedLevel" class="form-control" >
                                            <option disabled selected value="0">Choose a new admin level</option> 
                                            <option value="L1" data-toggle="tooltip" data-placement="left" title="<%=level1%>">Level 1</option>
                                            <option value="L2" data-toggle="tooltip" data-placement="left" title="<%=level2%>">Level 2</option>
                                            <option value="L3" data-toggle="tooltip" data-placement="left" title="<%=level3%>">Level 3</option>
                                        </select>
                                    </div>
                                </div>                            
                            </div>
                        </div> 
                        <tbody>
                                <tr>
                                    <td><label><button type="submit" class="btn btn-default">Modify Admin</button></label></td>
                                    <td><label> <a class="btn btn-default" href="http://localhost:8080/BookStore/adminPanel/adminDetails.jsp" role="button">Cancel</a></label></td>
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
                $(function () {
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
