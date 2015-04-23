<%-- 
    Document   : adminDetails
    Created on : Apr 17, 2015, 10:04:13 PM
    Author     : Chami
--%>

<%@page import="jdk.nashorn.internal.ir.annotations.Ignore"%>
<%@page import="java.sql.ResultSet"%>
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
        <title>Admin Panel - Admin Details</title>
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
        <%--for authentication--%>
        <%! String level="L1";%>
        <%-- ------------ --%>
        
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
                                    <li role="presentation" class="active"><a href="#">Admin Details</a></li>
                                        <%if(!"L1".equals(level)){%>
                                    <li role="presentation"><a href="" data-toggle="modal" data-target="#Add" data-backdrop="static"><font style="color: orange">Add Admin</font></a></li>
                                        <%}else{%>
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/addAdmin.jsp"><font style="color: orange">Add Admin</font></a></li><%}%>
                                            
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
                    <label><h3>Admins</h3></label>
                    <div class="row">
                        <div class="col-lg-9">

                            <%! ResultSet result;%>
                            <%! String adminDetails;%>
                            <%! String adminLevel;%>
                            <%! String adminName;%>

                            <%
                                UserClass admin = new UserClass();
                                result = admin.gteAllAdmins();
                                while (result.next()) {
                                    adminName = result.getString("u_Name").toLowerCase();
                                    System.out.println("name " + adminName);
                                    if ("L1".equalsIgnoreCase(result.getString("admin_Level"))) {
                                        adminDetails = "Have authority to add, modify and remove admins."
                                                + "<br> Have authority to add, modify and remove books, authors and suppliers."
                                                + "<br> Have authority to add books copies."
                                                + "<br> Have authority to manage clients and orders.";
                                        adminLevel = "Level 1 admin";
                                    } else if ("L2".equalsIgnoreCase(result.getString("admin_Level"))) {
                                        adminDetails = "Have authority to add, modify and remove books, authors and suppliers."
                                                + "<br>Have authority to add books copies."
                                                + "<br>Have authority to manage clients and orders.";
                                        adminLevel = "Level 2 admin";
                                    } else if ("L3".equalsIgnoreCase(result.getString("admin_Level"))) {
                                        adminDetails = "Have authority to only add books, authors and suppliers."
                                                + "<br>Have authority to add books copies."
                                                + "<br>Have authority to manage clients and orders.";
                                        adminLevel = "Level 3 admin";
                                    }
                            %>
                            <form <%if (request.getAttribute("msg") != null) {%>
                                action="AdminModify"<%} else {%>
                                action="../AdminModify"<%}%> method="POST">
                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td><h4><strong><%=adminName.toUpperCase()%></strong><small>&nbsp; <%=adminLevel%></small></h4></td>
                                        </tr>
                                        <tr>
                                            <td><%=adminDetails%></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="row">
                                    <div class="col-lg-8"></div>
                                    <div class="col-lg-4">
                                        <input type="hidden" name="adminName" value="<%=adminName%>">
                                        <button 
                                            <%if(!"L1".equals(level)){%>type="button" data-toggle="modal" data-target="#Modify" data-backdrop="static"<%}else{%>type="submit"<%}%>
                                             class="btn btn-default">Modify</button> &nbsp;&nbsp;&nbsp;
                                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#remove" data-whatever="<%=adminName%>" data-backdrop="static">Remove</button>
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
                    
                    <%-- add box--%>
                    <div class="modal fade" id="Add" role="dialog" aria-hidden="false">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h2 class="modal-title"><strong>Sorry...!</strong></h2>
                                </div>
                                    <div class="modal-body">
                                        <h4><p>You have no authentication for add admins.</p></h4>                                        
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
                                        <h4><p>You have no authentication for modify admins.</p></h4>                                        
                                    </div>
                                    <div class="modal-footer">
                                        <div class="span2">
                                            <button type="button" class="btn btn-warning" data-dismiss="modal">Ok</button>
                                        </div>
                                    </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                    
                    <%-- remove box--%>
                    <div class="modal fade" id="remove" role="dialog" aria-hidden="false">
                        <div class="modal-dialog">
                            <%if("L1".equals(level)){%>
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h1 class="modal-title"><strong>Are you ABSOLUTELY sure?</strong></h1>
                                </div>
                                <form id="removeBox" <%if (request.getAttribute("msg") != null) {%>
                                      action="removeAdmin"<%} else {%>
                                      action="../removeAdmin"<%}%> method="POST">
                                    <div class="modal-body">
                                        <div class="alert alert-warning" role="alert">If you remove, this account no longer will be available</div>
                                        <br>
                                        <p>Please type in the name of the person to confirm.</p>
                                        <div id ="orange">
                                            <div class="form-group orange">
                                                <input type="text" name="confirm" id="confirm" class="form-control" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <div class="span2">
                                            <input class="form-control" type="hidden" name="password" id="password" value="">
                                            <button type="submit" class="btn btn-danger btn-block" ><h4>Remove</h4></button>
                                        </div>
                                    </div>
                                </form>
                            </div><!-- /.modal-content -->
                            <%}else{%>
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h2 class="modal-title"><strong>Sorry...!</strong></h2>
                                </div>
                                    <div class="modal-body">
                                        <h4><p>You have no authentication for remove admins.</p></h4>                                        
                                    </div>
                                    <div class="modal-footer">
                                        <div class="span2">
                                            <button type="button" class="btn btn-warning" data-dismiss="modal">Ok</button>
                                        </div>
                                    </div>
                            </div><%}%>
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->


                    <%-- end of remove--%>
                    <script type="text/javascript">
                        $('#remove').on('shown.bs.modal', function(event) {
                            var button = $(event.relatedTarget) // Button that triggered the modal
                            var adminName = button.data('whatever') // Extract info from data-* attributes
                            var modal = $(this)
                            modal.find('#password').val(adminName)
                            modal.find('#confirm').text("")
                        })
                    </script>
                    <script type="text/javascript">
                        $(document).ready(function() {
                            var validator = $("#removeBox").bootstrapValidator({
                                fields: {
                                    confirm: {
                                        validators: {
                                            notEmpty: {
                                                message: 'The confirm name is required and can\'t be empty'
                                            },
                                            identical: {
                                                field: 'password',
                                                message: 'The admin name and its confirm name are not the same'
                                            }
                                        }
                                    },
                                    password: {
                                        validators: {
                                            identical: {
                                                field: 'confirm',
                                                message: 'The password and its confirm are not the same'
                                            }
                                        }
                                    }

                                }
                            });
                        });
                    </script>
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
