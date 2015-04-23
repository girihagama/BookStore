<%-- 
    Document   : removeAuthors2
    Created on : Mar 25, 2015, 10:45:04 AM
    Author     : Dushara Vitiyala
--%>

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
            if (!"http://localhost:8080/BookStore/adminPanel".equals(request.getHeader("Referer").substring(0, 42))) {
            System.out.println(request.getHeader("Referer").substring(0, 42));%>
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
                                <li role="presentation" class="active"><a href="#">Remove Author</a></li>
                            </ul>
                            </div>
                        </li>
                    </ul>  
                </div>
            
                <div class="col-lg-1">&nbsp;</div>
                <%--left side navigation end--%>
                <div class="col-lg-9">
                    <br>
                    <label><h3>Author Name</h3></label>
                    <form id="RemoveForm" action="RemoveAuthor3" method="POST">
                    <table border="0">
                            <tbody>
                                <tr>
                                    <td><label>Author Name</label></td>
                                    <td><label>: <%=request.getAttribute("searchedAuthorName")%></label></td>
                                    <td></td>
                                </tr>

                                <tr>
                                    <td><label>Author Date of Birth </label>&nbsp;&nbsp;&nbsp; </td>
                                    <td><label>:  <%=request.getAttribute("searchedAuthorDOB")%></label></td>
                                    <td></td>
                                </tr>
                                
                                <tr>
                                    <td><label>Author Description</label></td>
                                    <td><label>: <%=request.getAttribute("searchedAuthorDesc")%></label></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>                      
                        <input type="hidden" name="oldName" value="<%=request.getAttribute("searchedAuthorName")%>">
                        <div class="row">
                            <div class="form-group">
                                <div class="col-lg-5">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="checkbox" value="Choice #1" /> I want to remove this Author
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <table>
                        <tbody>
                                <tr>
                                    <td><label> <a class="btn btn-default" href="adminPanel/removeAuthors.jsp" role="button">Cancel</a></label></td>
                                    <td><label><button type="submit" class="btn btn-default">Remove This Book</button></label></td>
                                </tr>
                        </tbody>
                        </table>
                    </form>
                        <script type="text/javascript">
                        $(document).ready(function() {
                            var validator = $("#RemoveForm").bootstrapValidator({
                                fields: {
                                    checkbox: {
                                        validators: {
                                            notEmpty: {
                                                message: "If you need to remove this author, please put a tick"
                                            }
                                        }
                                    }
                                }
                            });
                        });
                    </script>
                </div>
            </div>
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
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Library</a></li>
                    <li class="active">Data</li>
                </ol>
            </div> 
         
                 </div>
    </body>
</html>
