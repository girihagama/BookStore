<<<<<<< HEAD
<%-- 
    Document   : subPage
    Created on : Mar 22, 2015, 6:08:29 PM
    Author     : Chami
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Classes.AuthorClass"%>
<%@page import="java.util.Calendar"%>
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
           <%@include file="HeaderFiles/bookHeader.jsp"%> 
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2">
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left;">Books</li>
                        <li>
                            <div id="topmenu">
                                <ul class="nav nav-pills nav-stacked topmenu">
                                    <li role="presentation" class="active"><a href="#">Add Book</a></li>
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/modifiBook1.jsp"><font style="color: orange">Modify Book</font></a></li>
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/removeBook1.jsp"><font style="color: orange">Remove Book</font></a></li>
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
                    %><br><div class="alert alert-warning" role="alert"><strong><%=request.getAttribute("msg")%>.</strong><br>
                        If you want add another book fill below form and add a book.</div><%
                            } else {%>
                    <br><%}%>
                    <br>                 
                    <form id="AddForm"<%if (request.getAttribute("action") != null) {%>
                          action="<%=request.getAttribute("action")%>"<%} else {%>
                          action="../AddBook"<%}%>
                          method="POST" enctype="multipart/form-data">
                        <div id ="orange">
                            <div class="form-group orange">
                                <label for="bookTitle">Book Title</label>
                                <input type="text" name="bookTitle" id="bookTitle" class="form-control" placeholder="Enter book title" 
                                       <%if (request.getAttribute("errorBookTitle") != null) {%>
                                       value="<%=request.getAttribute("errorBookTitle")%>"<%}%>>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <jsp:useBean id="author" class="Classes.AuthorClass"></jsp:useBean>                        
                        <div id ="orange">
                            <div class="form-group orange">
                                <label for="autherName">Author Name</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <select name="autherName" id="autherName" class="form-control" >
                                            <option disabled selected value="0">Select an author</option> 
                                        <%
                                            List results = author.getAlist();
                                            Iterator it = results.iterator();
                                                while (it.hasNext()) {%>
                                        <option><%=it.next()%></option>
                                        <%}%>
                                    </select>
                                    </div>
                                    <div class="col-lg-2">
                                        <a class="btn btn-default" href="#" role="button">Add Authors</a>
                                    </div>
                                </div>                            
                            </div>
                        </div> 
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Edition</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input name="bookEdition" type="text" class="form-control" placeholder="Enter book edition"
                                               <%if (request.getAttribute("errorEdition") != null) {%>
                                               value="<%=request.getAttribute("errorEdition")%>"<%}%>>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Published Year</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <select name="year" class="form-control" placeholder="Select year">
                                            <%  int year = Calendar.getInstance().get(Calendar.YEAR); %>
                                            <option disabled selected value="0">Select a year</option>
                                                <%for (int i = year; i > (year - 200); i--) {%><option><%=i%></option><%}%>
                                        </select>
                                    </div>
                                </div>                            
                            </div>
                        </div> 
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Image</label>
                                <input name="image" type="file" style="border-color: orange">
                            </div>  
                        </div> 
                        <button type="submit" class="btn btn-default">Add Book</button>
                    </form>
                </div>
            </div>
            <%--Form end--%>
            <%--script for validation--%>
            <script type="text/javascript">
                $(document).ready(function() {
                    var validator = $("#AddForm").bootstrapValidator({
                        fields: {
                            bookTitle: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide a book title"
                                    }
                                }
                            },
                            autherName: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide an author. if there is no author, please add and select the author"
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
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Library</a></li>
                    <li class="active">Data</li>
                </ol>
            </div> 
        </div>
    </body>
</html>

=======
<%-- 
    Document   : subPage
    Created on : Mar 22, 2015, 6:08:29 PM
    Author     : Chami
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Classes.AuthorClass"%>
<%@page import="java.util.Calendar"%>
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
           <%@include file="HeaderFiles/bookHeader.jsp"%> 
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2">
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left;">Books</li>
                        <li>
                            <div id="topmenu">
                                <ul class="nav nav-pills nav-stacked topmenu">
                                    <li role="presentation" class="active"><a href="#">Add Book</a></li>
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/modifiBook1.jsp"><font style="color: orange">Modify Book</font></a></li>
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/removeBook1.jsp"><font style="color: orange">Remove Book</font></a></li>
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
                    %><br><div class="alert alert-warning" role="alert"><strong><%=request.getAttribute("msg")%>.</strong><br>
                        If you want add another book fill below form and add a book.</div><%
                            } else {%>
                    <br><%}%>
                    <br>                 
                    <form id="AddForm"<%if (request.getAttribute("action") != null) {%>
                          action="<%=request.getAttribute("action")%>"<%} else {%>
                          action="../AddBook"<%}%>
                          method="POST" enctype="multipart/form-data">
                        <div id ="orange">
                            <div class="form-group orange">
                                <label for="bookTitle">Book Title</label>
                                <input type="text" name="bookTitle" id="bookTitle" class="form-control" placeholder="Enter book title" 
                                       <%if (request.getAttribute("errorBookTitle") != null) {%>
                                       value="<%=request.getAttribute("errorBookTitle")%>"<%}%>>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <jsp:useBean id="author" class="Classes.AuthorClass"></jsp:useBean>                        
                        <div id ="orange">
                            <div class="form-group orange">
                                <label for="autherName">Author Name</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <select name="autherName" id="autherName" class="form-control" >
                                            <option disabled selected value="0">Select an author</option> 
                                        <%
                                            List results = author.getAlist();
                                            Iterator it = results.iterator();
                                                while (it.hasNext()) {%>
                                        <option><%=it.next()%></option>
                                        <%}%>
                                    </select>
                                    </div>
                                    <div class="col-lg-2">
                                        <a class="btn btn-default" href="#" role="button">Add Authors</a>
                                    </div>
                                </div>                            
                            </div>
                        </div> 
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Edition</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input name="bookEdition" type="text" class="form-control" placeholder="Enter book edition"
                                               <%if (request.getAttribute("errorEdition") != null) {%>
                                               value="<%=request.getAttribute("errorEdition")%>"<%}%>>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Published Year</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <select name="year" class="form-control" placeholder="Select year">
                                            <%  int year = Calendar.getInstance().get(Calendar.YEAR); %>
                                            <option disabled selected value="0">Select a year</option>
                                                <%for (int i = year; i > (year - 200); i--) {%><option><%=i%></option><%}%>
                                        </select>
                                    </div>
                                </div>                            
                            </div>
                        </div> 
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Image</label>
                                <input name="image" type="file" style="border-color: orange">
                            </div>  
                        </div> 
                        <button type="submit" class="btn btn-default">Add Book</button>
                    </form>
                </div>
            </div>
            <%--Form end--%>
            <%--script for validation--%>
            <script type="text/javascript">
                $(document).ready(function() {
                    var validator = $("#AddForm").bootstrapValidator({
                        fields: {
                            bookTitle: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide a book title"
                                    }
                                }
                            },
                            autherName: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide an author. if there is no author, please add and select the author"
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
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Library</a></li>
                    <li class="active">Data</li>
                </ol>
            </div> 
        </div>
    </body>
</html>

>>>>>>> origin/master
