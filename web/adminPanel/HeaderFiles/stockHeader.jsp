<%-- 
    Document   : stockHeader
    Created on : Mar 27, 2015, 1:37:43 PM
    Author     : Chami
--%>

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
        <div class="row"><div class="col-md-10">&nbsp;</div></div>
        <div class="row">
            <div class="col-md-11"></div>
            <div class="col-md-1"><button type="button" class="btn btn-warning">Logout</button></div>
        </div>
        <div class="row">
            <div class="col-lg-1">
                <img src="http://localhost:8080/BookStore/adminPanel/Images/Page icons/BookIcon.png" class="img-responsive" width="100%"alt="Responsive image">
            </div>
            <div class="col-md-11">
                <font color=#FF7519><h1><strong>Orchid Book Store</strong><small>&nbsp; Admin Panel</small></h1></font>
            </div>
        </div>
        <div class="row">
            <img src="http://localhost:8080/BookStore/adminPanel/Images/Orthers/line.png" width="100%" alt="Responsive image">
        </div>
        <%-- sub menus--%>
        <div class="row">
            <div class="col-lg-1">
                <a href="#"><img src="http://localhost:8080/BookStore/adminPanel/Images/Page icons/Home.png" class="image" width="100%" alt="Responsive image" title="Home"></a>
            </div>
            <div class="col-lg-1">
                <a href="#"><img src="http://localhost:8080/BookStore/adminPanel/Images/Page icons/Books.png" class="image" width="100%" alt="Responsive image" title="Books" ></a>
            </div>
            <div class="col-lg-1">
                <a href="#"><img src="http://localhost:8080/BookStore/adminPanel/Images/Page icons/Author.png" class="image" width="100%" alt="Responsive image" title="Authors"></a>
            </div>
            <div class="col-lg-1">
                <a href="#"><img src="http://localhost:8080/BookStore/adminPanel/Images/Page icons/Clients.png" class="image" width="100%" alt="Responsive image" title="Clients"></a>
            </div>
            <div class="col-lg-1">
                <a href="#"><img src="http://localhost:8080/BookStore/adminPanel/Images/Page icons/Admin.png" class="image" width="100%" alt="Responsive image" title="Admins"></a>
            </div>
            <div class="col-lg-1">
                <img src="http://localhost:8080/BookStore/adminPanel/Images/Page icons/Stocks.png" class="image" width="100%" alt="Responsive image" title="Stocks" style="opacity: 0.5">
            </div>
            <div class="col-lg-1">
                <a href="#"><img src="http://localhost:8080/BookStore/adminPanel/Images/Page icons/Suppliers.png" class="image" width="100%" alt="Responsive image" title="Suppliers"></a>
            </div>
            <div class="col-lg-1">
                <a href="#"><img src="http://localhost:8080/BookStore/adminPanel/Images/Page icons/Order.png" class="image" width="100%" alt="Responsive image" title="Orders"></a>
            </div>
        </div>    
        <div class="row">
            <img src="http://localhost:8080/BookStore/adminPanel/Images/Orthers/orange line.png"width="100%" alt="Responsive image"">
        </div>
    </body>
</html>
