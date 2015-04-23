<%-- 
    Document   : removePage2
    Created on : Mar 23, 2015, 5:30:38 PM
    Author     : Chami
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
        <%
            if(request.getAttribute("searchedBookName")==null){
                response.sendRedirect("http://localhost:8080/BookStore/adminPanel/removeBook1.jsp");
            }
            %>
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
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/addBook.jsp"><font style="color: orange">Add Book</font></a></li>
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/modifiBook1.jsp"><font style="color: orange">Modify Book</font></a></li>
                                    <li role="presentation" class="active" ><a href="#">Remove Book</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>  
                </div>
                <div class="col-lg-1">&nbsp;</div>
                <%--left side navigation end--%>

                <%--Form--%>
                <div class="col-lg-9">
                    <br>
                    
                    <label><h3>Book Details</h3></label>
                    <form id="RemoveForm" action="RemoveBook2" method="POST">
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td><label>Book Title</label></td>
                                    <td><label>: <%=request.getAttribute("searchedBookName")%></label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label>Author Name</label></td>
                                    <td><label>: <%=request.getAttribute("searchedBookAName")%></label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label>Book Edition</label></td>
                                    <td><label>: <%=request.getAttribute("searchedBookEdition")%></label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label>Book Published Year </label>&nbsp;&nbsp;&nbsp; </td>
                                    <td><label>:  <%=request.getAttribute("searchedBookYear")%></label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label>Book Supplier Name </label>&nbsp;&nbsp;&nbsp; </td>
                                    <td><label>:  <%=request.getAttribute("searchedBooksup")%></label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label>Book Quantity </label>&nbsp;&nbsp;&nbsp; </td>
                                    <td><label>:  <%=request.getAttribute("searchedBookQty")%></label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label>Book Price </label>&nbsp;&nbsp;&nbsp; </td>
                                    <td><label>:&nbsp;  Rs.  <%=request.getAttribute("searchedBookPrice")%></label></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>                      
                        <input type="hidden" name="oldName" value="<%=request.getAttribute("searchedBookName")%>">
                        <div class="row">
                            <div class="form-group">
                                <div class="col-lg-5">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="checkbox" value="Choice #1" /> This is the book i need to remove
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div><br>
                        <tbody>
                                <tr>
                                    <td><label> <a class="btn btn-default" href="adminPanel/removeBook1.jsp" role="button">Cancel</a></label></td>
                                    <td><label><button type="submit" class="btn btn-default">Remove This Book</button></label></td>
                                    <td></td>
                                </tr>
                        </tbody>
                    </form>
                    <script type="text/javascript">
                        $(document).ready(function() {
                            var validator = $("#RemoveForm").bootstrapValidator({
                                fields: {
                                    checkbox: {
                                        validators: {
                                            notEmpty: {
                                                message: "If you need to remove this book, please put a tick"
                                            }
                                        }
                                    }
                                }
                            });
                        });
                    </script>
                </div>
            </div>
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
            <%} else {%>
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
