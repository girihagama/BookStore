<%-- 
    Document   : removePage1
    Created on : Mar 23, 2015, 5:25:42 PM
    Author     : Chami
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
                <div class="col-lg-2" >
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left;">Books</li>
                        <li>
                            <div id="topmenu">
                                <ul class="nav nav-pills nav-stacked topmenu">
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/addBook.jsp"><font style="color: orange">Add Book</font></a></li>
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/modifiBook1.jsp"><font style="color: orange">Modify Book</font></a></li>
                                    <li role="presentation" class="active" ><a href="#">Remove Book</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>  
                </div>
                <div class="col-xs-1">&nbsp;</div>
                <%--left side navigation end--%>
                <div class="col-lg-9">
                    <div class="row">&nbsp;</div>
                    <div class="row">&nbsp;</div>
                    <div class="col-lg-12">
                        <div class="row">
                            <% if (request.getAttribute("msg") != null) {
                                %><div class="alert alert-warning" role="alert"><strong><%=request.getAttribute("msg")%>.</strong><br></div><%
                            } %>
                            <form id="Search" <%if (request.getAttribute("bookList")!= null ||request.getAttribute("errorSearch")!=null ||request.getAttribute("msg")!=null) {%>
                                action="RemoveBook"<%} else {%>
                                action="../RemoveBook"<%}%> method="POST">
                                <label><h4>Search Book For Remove</h4></label>
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div id="orange">
                                            <div class="input-group">
                                                <input type="text" class="form-control orange" placeholder="Search for..." name="searchName" id="searchName">
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
                        <%!String bookName;%>
                        <%!int numberOfResult;%> 
                        <% numberOfResult=0;%>
                        <%if (request.getAttribute("bookList") != null) {
                            List results =(List) request.getAttribute("bookList");
                            Iterator it =results.iterator();
                            numberOfResult=0;
                                while (it.hasNext()) {
                                    bookName = (String) it.next();
                                    numberOfResult = numberOfResult + 1;%>                                
                        <br>
                        <form action="RemoveBook1" method="POST">
                            <input type="hidden" name="bookName" value="<%=bookName%>">
                            <button type="submit" class="btn btn-default">Click here to remove <strong><%=bookName%></strong></button>                                    
                        </form>
                        <%}%>
                        <%} else if(request.getAttribute("errorSearch")!=null) {%>
                        <br>
                        <div class="alert alert-warning" role="alert"><strong>Sorry, Your search - <%=request.getAttribute("errorSearch")%> - did not match any book.</strong><br></div>
                            <%}%>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                $(document).ready(function() {
                    var validator = $("#Search").bootstrapValidator({
                        fields: {
                            searchName: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide a book title to search"
                                    }
                                }
                            }
                        }
                    });
                });
            </script>       
            <%System.out.println("num"+numberOfResult);  
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
            <div class="row" >
                <ol class="breadcrumb" style="background-color:#FF9933">
                    
                </ol>
            </div>   
        </div>        
    </body>
</html>
