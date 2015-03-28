<%-- 
    Document   : modifiBook
    Created on : Mar 23, 2015, 3:45:51 PM
    Author     : Chami
--%>

<<<<<<< HEAD
=======
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
>>>>>>> chami1994-master
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css"/>
        <link href="http://localhost:8080/BookStore/adminPanel/css/bootstrap.css" rel="stylesheet">
        <link href="http://localhost:8080/BookStore/adminPanel/css/bootstrap.min.css" rel="stylesheet">
        <link href="http://localhost:8080/BookStore/adminPanel/css/startPage.css" rel="stylesheet">
        <link href="http://localhost:8080/BookStore/adminPanel/css/form.css" rel="stylesheet">
        <title>Admin Panel</title>
    </head>
    <body>
        <div class="container" style="background-color:#F5F5F0">
<<<<<<< HEAD
            <div class="row"><div class="col-md-10">&nbsp;</div></div>
            <div class="row">
                <div class="col-md-11"></div>
                <div class="col-md-1"><button type="button" class="btn btn-warning">Logout</button></div>
            </div>
            <div class="row">
                <div class="col-lg-1">
                    <img src="Images/Page icons/BookIcon.png" class="img-responsive" width="100%"alt="Responsive image">
                </div>
                <div class="col-md-11">
                    <font color=#FF7519><h1><strong>Orchid Book Store</strong><small>&nbsp; Admin Panel</small></h1></font>
                </div>
            </div>
            <div class="row">
                <img src="Images/Orthers/line.png" width="100%" alt="Responsive image">
            </div>
            <%-- sub menus--%>
            <div class="row">
                <div class="col-lg-1">
                    <a href="#"><img src="Images/Page icons/Home.png" class="image" width="100%" alt="Responsive image" title="Home"></a>
                </div>
                <div class="col-lg-1">
                    <img src="Images/Page icons/Books.png" class="image" width="100%" alt="Responsive image" title="Books" style="opacity: 0.5">
                </div>
                <div class="col-lg-1">
                    <a href="#"><img src="Images/Page icons/Author.png" class="image" width="100%" alt="Responsive image" title="Authors"></a>
                </div>
                <div class="col-lg-1">
                    <a href="#"><img src="Images/Page icons/Clients.png" class="image" width="100%" alt="Responsive image" title="Clients"></a>
                </div>
                <div class="col-lg-1">
                    <a href="#"><img src="Images/Page icons/Admin.png" class="image" width="100%" alt="Responsive image" title="Admins"></a>
                </div>
                <div class="col-lg-1">
                    <a href="#"><img src="Images/Page icons/Stocks.png" class="image" width="100%" alt="Responsive image" title="Stocks"></a>
                </div>
                <div class="col-lg-1">
                    <a href="#"><img src="Images/Page icons/Suppliers.png" class="image" width="100%" alt="Responsive image" title="Suppliers"></a>
                </div>
                <div class="col-lg-1">
                    <a href="#"><img src="Images/Page icons/Order.png" class="image" width="100%" alt="Responsive image" title="Orders"></a>
                </div>
            </div>    
            <div class="row">
                <img src="Images/Orthers/orange line.png"width="100%" alt="Responsive image"">
            </div>
            <%-- end of sub menus--%>           
=======
            <%@include file="HeaderFiles/bookHeader.jsp"%>          
>>>>>>> chami1994-master
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2" >
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left;">Books</li>
                        <li>
                            <div id="topmenu">
                                <ul class="nav nav-pills nav-stacked topmenu">
                                    <li role="presentation"><a href="#"><font style="color: orange">Add Book</font></a></li>
                                    <li role="presentation" class="active"><a href="#">Modify Book</a></li>
                                    <li role="presentation"><a href="#"><font style="color: orange">Remove Book</font></a></li>
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
<<<<<<< HEAD
                            <label><h4>Search Book For Modify</h4></label>
                            <div class="row">
                                <div class="col-lg-8">
                                    <div id="orange">
                                      <div class="input-group">
                                        <input type="text" class="form-control orange" placeholder="Search for...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default orange" type="button">Search</button>
                                        </span>
                                    </div>  
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        
=======
                            <form <%if (request.getAttribute("bookList")!= null ||request.getAttribute("errorSearch")!=null ) {%>
                                action="ModifyBook"<%} else {%>
                                action="../ModifyBook"<%}%> method="POST">
                                <label><h4>Search Book For Modify</h4></label>
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div id="orange">
                                            <div class="input-group">
                                                <input type="text" class="form-control orange" placeholder="Search for..." required name="searchName">
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
                        <%!int numberOfResult = 0;%> 
                        <%if (request.getAttribute("bookList") != null) {
                            List results =(List) request.getAttribute("bookList");
                            Iterator it =results.iterator();
                            numberOfResult=0;
                                while (it.hasNext()) {
                                    bookName = (String) it.next();
                                    numberOfResult = numberOfResult + 1;%>                                
                        <br>
                        <form action="ModifyBook2" method="POST">
                            <input type="hidden" name="bookName" value="<%=bookName%>">
                            <button type="submit" class="btn btn-default">Click here to modify <strong><%=bookName%></strong></button>                                    
                        </form>
                        <%}%>
                        <%} else if(request.getAttribute("errorSearch")!=null) {%>
                        <br>
                        <div class="alert alert-warning" role="alert"><strong>Sorry, Your search - <%=request.getAttribute("errorSearch")%> - did not match any book.</strong><br></div>
                            <%}%>
>>>>>>> chami1994-master
                    </div>
                </div>
            </div>

<<<<<<< HEAD
=======
            <%if (numberOfResult < 5) {%>
>>>>>>> chami1994-master
            <div class="row">
                &nbsp;
            </div>
            <div class="row">
                &nbsp;
            </div>
<<<<<<< HEAD
                <div class="row">
=======
            <div class="row">
>>>>>>> chami1994-master
                &nbsp;
            </div>
            <div class="row">
                &nbsp;
            </div>
<<<<<<< HEAD
                <div class="row">
=======
            <div class="row">
>>>>>>> chami1994-master
                &nbsp;
            </div>
            <div class="row">
                &nbsp;
            </div>
<<<<<<< HEAD
                <div class="row">
=======
            <%}%>

            <div class="row">
>>>>>>> chami1994-master
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
