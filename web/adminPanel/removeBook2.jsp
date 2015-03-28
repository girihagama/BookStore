<%-- 
    Document   : removePage2
    Created on : Mar 23, 2015, 5:30:38 PM
    Author     : Chami
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css"/>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/startPage.css" rel="stylesheet">
        <link href="css/form.css" rel="stylesheet">
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
                                    <li role="presentation"><a href="#"><font style="color: orange">Add Book</font></a></li>
                                    <li role="presentation"><a href="#"><font style="color: orange">Modify Book</font></a></li>
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
                    <br>
                    <form>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Title</label>
                                <input type="text" class="form-control" placeholder="Enter book title" required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Author Name</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <select class="form-control" placeholder="Select year" required >
                                            <option>Author name</option>
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
                                        <input type="text" class="form-control" placeholder="Enter book edition">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Published Year</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <select class="form-control" placeholder="Select year" >
                                            <%  int year = Calendar.getInstance().get(Calendar.YEAR) - 1;
                                                for (int i = year; i > (year - 200); i--) {%><option><%=i%></option><%}%>
                                        </select>
                                    </div>
                                </div>                            
                            </div>
                        </div> 
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Image</label>
                                <input type="file" style="border-color: orange">
                            </div>  
                        </div> 
                        <button type="submit" class="btn btn-default">Remove Book</button>
                    </form>
                </div>
            </div>
            <%--Form end--%>
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
