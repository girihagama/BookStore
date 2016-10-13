<%--
    Document   : removeAuthors
    Created on : Apr 20, 2015, 7:34:57 PM
    Author     : Dushara Vitiyala
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
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
        <title>Admin Panel - Remove Authors</title>
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
            <%@include file="HeaderFiles/authorHeader.jsp"%>
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2">
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left;">Authors</li>
                        <li>
                            <div id="topmenu">
                                <ul class="nav nav-pills nav-stacked topmenu">
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/addAuthors.jsp"><font style="color: orange">Add Author</font></a></li>
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/modifyAuthors.jsp"><font style="color: orange">Modify Author</font></a></li>
                                    <li role="presentation" class="active"><a href="">Remove Author</a></li>
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
                                } %>
                            <form id="Search" <%if (request.getAttribute("authorList") != null || request.getAttribute("errorSearch") != null || request.getAttribute("msg") != null) {%>
                                  action="RemoveAuthor"<%} else {%>
                                  action="../RemoveAuthor"<%}%> method="POST">
                                <label><h4>Search Author to Remove</h4></label>
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div id="orange">
                                            <div class="input-group">
                                                <input type="text" class="form-control orange" placeholder="Search for..." id="removeAuthorSearch" name="removeAuthorSearch">
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
                        <%!String authorName;%>
                        <%!int numberOfResult;%> 
                        <% numberOfResult = 0;%>
                        <%if (request.getAttribute("authorList") != null) {
                                List results = (List) request.getAttribute("authorList");
                                Iterator it = results.iterator();
                                numberOfResult = 0;
                                while (it.hasNext()) {
                                    authorName = (String) it.next();
                                    numberOfResult = numberOfResult + 1;%>
                        <br>
                        <form action="RemoveAuthor2" method="POST">
                            <input type="hidden" name="authorName" value="<%=authorName%>">
                            <button type="submit" class="btn btn-default">Click here to remove <strong><%=authorName%></strong></button>                                    
                        </form>
                        <%}%>
                        <%} else if (request.getAttribute("errorSearch") != null) {%>
                        <br>
                        <div class="alert alert-warning" role="alert"><strong>Sorry, Your search - <%=request.getAttribute("errorSearch")%> - did not match any author.</strong><br></div>
                            <%}%>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                $(document).ready(function() {
                    var validator = $("#Search").bootstrapValidator({
                        fields: {
                            removeAuthorSearch: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide an author name to search"
                                    }
                                }
                            }
                        }
                    });
                });
            </script>
            <%System.out.println("num" + numberOfResult);
                if (numberOfResult < 4) {%>
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
