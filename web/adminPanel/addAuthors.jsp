<%-- 
    Document   : addAuthors
    Created on : Mar 23, 2015, 11:03:35 AM
    Author     : Dushara Vitiyala
--%>

<%@page import="java.util.Calendar"%>
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


        <title>Admin Panel - Add Authors</title>

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
            <%@include file="HeaderFiles/authorHeader.jsp"%>

            <%--for authentication--%>
            <%!String level;%>
            <% level = adminLevel;%>
            <%-- ------------ --%>
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2">
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left;">Authors</li>
                        <li>
                            <div id="topmenu">
                                <ul class="nav nav-pills nav-stacked topmenu">
                                    <li role="presentation" class="active"><a href="#">Add Author</a></li>
                                        <%if ("L3".equals(level)) {%>
                                    <li role="presentation"><a href="" data-toggle="modal" data-target="#Modify" data-backdrop="static"><font style="color: orange">Modify Author</font></a></li>
                                            <%} else {%>
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/modifyAuthors.jsp"><font style="color: orange">Modify Author</font></a></li><%}%>
                                            <%if ("L3".equals(level)) {%>
                                    <li role="presentation"><a href="" data-toggle="modal" data-target="#remove" data-backdrop="static"><font style="color: orange">Remove Author</font></a></li>
                                            <%} else {%>
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/removeAuthors.jsp"><font style="color: orange">Remove Author</font></a></li><%}%>
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
                    <form id="AddForm" <%if (request.getAttribute("msg") != null) {%>
                          action="AddAuthors"<%} else {%>
                          action="../AddAuthors"<%}%>
                          method="POST">
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Author Name</label>
                                <input type="text" id="authorName" name="authorName" class="form-control" placeholder="Enter Author Name"
                                       <%if (request.getAttribute("errorAuthorName") != null) {%>
                                       value="<%=request.getAttribute("errorAuthorName")%>"<%}%>>                                       
                            </div>
                        </div>

                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Author Date of Birth</label>
                                <div class="row">
                                    <div class="col-lg-2">
                                        <select class="form-control" placeholder="Select year" name="year">
                                            <option>Year</option>
                                            <%  int year = Calendar.getInstance().get(Calendar.YEAR) - 1;
                                                for (int i = year; i > (year - 200); i--) {%><option><%=i%></option><%}%>
                                        </select>
                                    </div>
                                    <div class="col-lg-2">
                                        <select class="form-control" placeholder="Select year" name="month">
                                            <option disabled selected value="0">Month</option>
                                            <option value="1">January</option>
                                            <option value="2">February</option>
                                            <option value="3">March</option>
                                            <option value="4">April</option>
                                            <option value="5">May</option>
                                            <option value="6">June</option>
                                            <option value="7">July</option>
                                            <option value="8">August</option>
                                            <option value="9">September</option>
                                            <option value="10">October</option>
                                            <option value="11">November</option>
                                            <option value="12">December</option>                                            
                                        </select>
                                    </div>
                                    <div class="col-lg-2">
                                        <select class="form-control" placeholder="Select year" name="date">
                                            <option disabled selected value="0">Date</option>
                                            <%
                                                for (int i = 0; i < 31; i++) {%><option><%=i + 1%></option><%}%>
                                        </select>
                                    </div>

                                </div>                            
                            </div>
                        </div> 
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Author Description</label>
                                <textarea class="form-control" rows="3" placeholder="Enter Description" name="authorDesc"
                                          <%if (request.getAttribute("errorDesc") != null) {%>
                                          value="<%=request.getAttribute("errorDesc")%>"<%}%>>                                   
                                </textarea>
                            </div>
                        </div>
                        <input type ="hidden" name="back" value="<%=backSite%>">
                        <tbody>
                            <tr>
                                <td><label><button type="submit" class="btn btn-default">Add Author</button></label></td>
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
                            <h4><p>You have no authentication for remove authors.</p></h4>                                        
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
                            <h4><p>You have no authentication for modify authors.</p></h4>                                        
                        </div>
                        <div class="modal-footer">
                            <div class="span2">
                                <button type="button" class="btn btn-warning" data-dismiss="modal">Ok</button>
                            </div>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <%--script for validation--%>
            <script type="text/javascript">
                $(document).ready(function() {
                    var validator = $("#AddForm").bootstrapValidator({
                        fields: {
                            authorName: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide an author name."
                                    }
                                }
                            },
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
            <div class="row" >
                <ol class="breadcrumb" style="background-color:#FF9933">
                </ol>
            </div> 
        </div>
    </body>
</html>
