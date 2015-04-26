<%-- 
    Document   : adminStartPage
    Created on : Mar 22, 2015, 12:04:56 PM
    Author     : Chami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="http://localhost:8080/BookStore/adminPanel/Images/Page icons/BookIcon.png" type="image/x-icon" />
        <link rel="shortcut icon" href="http://localhost:8080/BookStore/adminPanel/Images/Page icons/BookIcon.ico" type="image/ico" />

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
        <title>Admin Panel - Home</title>
    </head>
    <body>
        <%@include file="HeaderFiles/userNameAndAdminLeve.jsp"%> 
        <div class="container" style="background-color:#F5F5F0">
            <div class="row"><div class="col-md-10">&nbsp;</div></div>
            <div class="row">
                <div class="col-md-10"></div>
                <div class="col-md-2">
                <!-- Split button -->
                <div class="btn-group">
                    <button type="button" class="btn btn-warning"><%=username%></button>
                    <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="http://localhost:8080/BookStore/adminPanel/modifyAccountDetails.jsp">My Account</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Logout</a></li>
                    </ul>
                </div>
                </div>
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
                        <div class="overlay"><a href="http://localhost:8080/BookStore/adminPanel/addBook.jsp" style="text-decoration: none"><p class="text_box">Go</p></a></div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="picholder">
                        <img src="Images/StartPageIcons/Author.jpg" class="fancypics" alt="Responsive image">
                        <div class="overlay"><a href="http://localhost:8080/BookStore/adminPanel/addAuthors.jsp" style="text-decoration: none"><p class="text_box">Go</p></a></div>
                    </div>
                </div>  
                <div class="col-md-2">
                    <div class="picholder">
                        <img src="Images/StartPageIcons/Clients.jpg" class="fancypics" alt="Responsive image">
                        <div class="overlay"><a href="http://localhost:8080/BookStore/adminPanel/clientSearch.jsp" style="text-decoration: none"><p class="text_box">Go</p></a></div>
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
                        <div class="overlay"><a href="http://localhost:8080/BookStore/adminPanel/adminDetails.jsp" style="text-decoration: none"><p class="text_box">Go</p></a></div>
                    </div>
                </div>  
                <div class="col-md-2">
                    <div class="picholder">
                        <img src="Images/StartPageIcons/Stocks.jpg" class="fancypics" alt="Responsive image">
                        <div class="overlay"><a href="http://localhost:8080/BookStore/adminPanel/searchStock.jsp" style="text-decoration: none"><p class="text_box">Go</p></a></div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="picholder">
                        <img src="Images/StartPageIcons/Suppliers.jpg" class="fancypics" alt="Responsive image">
                        <div class="overlay"><a href="http://localhost:8080/BookStore/adminPanel/addSuppliers.jsp" style="text-decoration: none"><p class="text_box">Go</p></a></div>
                    </div>
                </div>  
                <div class="col-md-2">
                    <div class="picholder">
                        <img src="Images/StartPageIcons/Oders.jpg" class="fancypics" alt="Responsive image">
                        <div class="overlay"><a href="http://localhost:8080/BookStore/adminPanel/orders.jsp" style="text-decoration: none"><p class="text_box">Go</p></a></div>
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
