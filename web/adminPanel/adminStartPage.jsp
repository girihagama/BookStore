<%-- 
    Document   : adminStartPage
    Created on : Mar 22, 2015, 12:04:56 PM
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
        <div class="container" style="background-color:#F5F5F0">
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
                    <img src="Images/Orthers/line.png" class="img-responsive" width="100%" alt="Responsive image">
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
                <div class="col-md-1">&nbsp;</div>
                <div class="col-md-1">&nbsp;</div>
                <div class="col-md-2">                    
                    <img src="Images/StartPageIcons/Home.png" class="img-responsive" alt="Responsive image">                     
                </div>
                <div class="col-md-2">
                    <div class="picholder">
                        <img src="Images/StartPageIcons/Books.jpg" class="fancypics" alt="Responsive image">
                        <div class="overlay"><a href="addBook.jsp" style="text-decoration: none"><p class="text_box">Go</p></a></div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="picholder">
                    <img src="Images/StartPageIcons/Author.jpg" class="fancypics" alt="Responsive image">
                    <div class="overlay"><a href="addAuthors.jsp" style="text-decoration: none"><p class="text_box">Go</p></a></div>
                    </div>
                </div>  
                <div class="col-md-2">
                    <div class="picholder">
                    <img src="Images/StartPageIcons/Clients.jpg" class="fancypics" alt="Responsive image">
                    <div class="overlay"><a href="#" style="text-decoration: none"><p class="text_box">Go</p></a></div>
                    </div>
                </div>
            </div>
            <div class="row">
                &nbsp;
            </div>
            <div class="row">
                <div class="col-md-1">&nbsp;</div>
                <div class="col-md-1">&nbsp;</div>
                <div class="col-md-2">
                    <div class="picholder">
                    <img src="Images/StartPageIcons/Admins.jpg" class="fancypics" alt="Responsive image">
                    <div class="overlay"><a href="#" style="text-decoration: none"><p class="text_box">Go</p></a></div>
                    </div>
                </div>  
                <div class="col-md-2">
                    <div class="picholder">
                    <img src="Images/StartPageIcons/Stocks.jpg" class="fancypics" alt="Responsive image">
                    <div class="overlay"><a href="AddBookStocks.jsp" style="text-decoration: none"><p class="text_box">Go</p></a></div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="picholder">
                    <img src="Images/StartPageIcons/Suppliers.jpg" class="fancypics" alt="Responsive image">
                    <div class="overlay"><a href="addSuppliers.jsp" style="text-decoration: none"><p class="text_box">Go</p></a></div>
                    </div>
                </div>  
                <div class="col-md-2">
                    <div class="picholder">
                    <img src="Images/StartPageIcons/Oders.jpg" class="fancypics" alt="Responsive image">
                    <div class="overlay"><a href="#" style="text-decoration: none"><p class="text_box">Go</p></a></div>
                    </div>
                </div>
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
