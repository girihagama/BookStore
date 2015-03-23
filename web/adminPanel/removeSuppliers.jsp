<%-- 
    Document   : removeSuppliers
    Created on : Mar 23, 2015, 4:11:25 PM
    Author     : Dushara Vitiyala
--%>

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
                    <a href="#"><img src="Images/Page icons/Books.png" class="image" width="100%" alt="Responsive image" title="Books"></a>
                </div>
                <div class="col-lg-1">
                    <a href="addAuthors.jsp"><img src="Images/Page icons/Author.png" class="image" width="100%" alt="Responsive image" title="Authors" ></a>
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
                    <a href="#"><img src="Images/Page icons/Suppliers.png" class="image" width="100%" alt="Responsive image" title="Suppliers" style="opacity: 0.4"></a>
                </div>
                <div class="col-lg-1">
                    <a href="#"><img src="Images/Page icons/Order.png" class="image" width="100%" alt="Responsive image" title="Orders"></a>
                </div>
            </div>    
            <div class="row">
                <img src="Images/Orthers/orange line.png"width="100%" alt="Responsive image">
            </div>
            <%-- end of sub menus--%>  
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2">
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left; font-size: 4em;">Suppliers</li>
                        <li>
                            <div id="topmenu">
                            <ul class="nav nav-pills nav-stacked topmenu">
                                <li role="presentation"><a href="addSuppliers.jsp"><font style="color: orange">Add Supplier</font></a></li>
                                <li role="presentation"><a href="modifySuppliers.jsp"><font style="color: orange">Modify Supplier</font></a></li>
                                <li role="presentation" class="active"><a href="#">Remove Supplier</a></li>
                            </ul>
                            </div>
                        </li>
                    </ul>  
                </div>
            </div>
                <div class="col-lg-1">&nbsp;</div>
                <%--left side navigation end--%>
                
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
