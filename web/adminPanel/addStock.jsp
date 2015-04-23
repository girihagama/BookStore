<%-- 
    Document   : addStock
    Created on : Apr 22, 2015, 6:21:29 PM
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
         <%
            if (!"http://localhost:8080/BookStore/adminPanel".equals(request.getHeader("Referer").substring(0, 42))) {
            System.out.println(request.getHeader("Referer").substring(0, 42));%>
            <script>
                history.forward()
        </script>
            
        <%}%>
        <%
            if (request.getAttribute("searchedBookName") == null) {
                response.sendRedirect("http://localhost:8080/BookStore/adminPanel/removeBook1.jsp");
            }
        %>
        <div class="container" style="background-color:#F5F5F0">
            <%@include file="HeaderFiles/stockHeader.jsp"%>           
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2">
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left;">Stock</li>
                        <li>
                            <div id="topmenu">
                                <ul class="nav nav-pills nav-stacked topmenu">
                                    <li role="presentation" class="active"><a href="#">Add Book Stock</a></li>
                                    <li>&nbsp;&nbsp;</li>
                                    <li>&nbsp;&nbsp;</li>
                                    <li>&nbsp;&nbsp;</li>
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
                    <form id="addForm" action="AddStock3" method="POST">
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
                            </tbody>
                        </table>
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td><label><h2>Current Quantity </h2></label>&nbsp;&nbsp;&nbsp; </td>
                                    <td><label><h1>:  <%=request.getAttribute("searchedBookQty")%></h1></label></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-lg-5">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="checkbox" value="Choice #1" /> This is the book i need to add copies
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div><br>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Quantity you need to add</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input name="bookQuantity" id="bookQuantity" type="text" class="form-control" placeholder="Enter book quantity"
                                               required="required" pattern="^(\d*)$">
                                    </div>
                                </div>
                            </div>
                        </div>            
                        <input type="hidden" name="oldName" value="<%=request.getAttribute("searchedBookName")%>">
                        <tbody>
                            <tr>
                                <td><label> <a class="btn btn-default" href="adminPanel/searchStock.jsp" role="button">Cancel</a></label></td>
                                <td><label><button type="submit" class="btn btn-default">Add Copies To This Book</button></label></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </form>
                    <script type="text/javascript">
                        $(document).ready(function() {
                            var validator = $("#addForm").bootstrapValidator({
                                fields: {
                                    checkbox: {
                                        validators: {
                                            notEmpty: {
                                                message: "If you need to add copies to this book, please put a tick"
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
