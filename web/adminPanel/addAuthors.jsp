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
            <%@include file="HeaderFiles/authorHeader.jsp"%>

            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2">
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left;">Authors</li>
                        <li>
                            <div id="topmenu">
                            <ul class="nav nav-pills nav-stacked topmenu">
                                <li role="presentation" class="active"><a href="#">Add Author</a></li>
                                <li role="presentation"><a href="modifyAuthors.jsp"><font style="color: orange">Modify Author</font></a></li>
                                <li role="presentation"><a href="removeAuthors.jsp"><font style="color: orange">Remove Author</font></a></li>
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
                                <label>Author Name</label>
                                <input type="text" name="addAuthorName" class="form-control" placeholder="Enter Author Name" required>
                            </div>
                        </div>
  
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Author Date of Birth</label>
                                <div class="row">
                                    <div class="col-lg-2">
                                        <select class="form-control" placeholder="Select year" name="addYear">
                                            <option>Year</option>
                                            <%  int year = Calendar.getInstance().get(Calendar.YEAR) - 1;
                                                for (int i = year; i > (year - 200); i--) {%><option><%=i%></option><%}%>
                                        </select>
                                    </div>
                                    <div class="col-lg-2">
                                        <select class="form-control" placeholder="Select year" name="addMonth">
                                            <option>Month</option>
                                            <option>January</option>
                                            <option>February</option>
                                            <option>March</option>
                                            <option>April</option>
                                            <option>May</option>
                                            <option>June</option>
                                            <option>July</option>
                                            <option>August</option>
                                            <option>September</option>
                                            <option>October</option>
                                            <option>November</option>
                                            <option>December</option>                                            
                                        </select>
                                    </div>
                                    <div class="col-lg-2">
                                        <select class="form-control" placeholder="Select year" name="addDate">
                                            <option>Date</option>
                                            <% 
                                                for (int i = 0; i <31; i++) {%><option><%=i+1%></option><%}%>
                                        </select>
                                    </div>
                                        
                                </div>                            
                            </div>
                        </div> 
                           <div id ="orange">
                            <div class="form-group orange">
                                <label>Author Description</label>
                                <textarea class="form-control" rows="3" placeholder="Enter Description" name="addAuthorDesc"></textarea>
                            </div>
                        </div>
                        
                        <button type="submit" class="btn btn-default">Add Author</button>
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
