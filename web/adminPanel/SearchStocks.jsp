
<%-- 
    Document   : SearchStocks
    Created on : Mar 23, 2015, 6:01:13 PM
    Author     : Khaushalya
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
        <div class="container" style="background-color:#F5F5F0">
             <%@include file="HeaderFiles/stockHeader.jsp"%> 
                <div class="row">
                    <%-- left side --%>
                    <div class="col-lg-2">
                        <ul class="nav nav-pills nav-stacked">
                              <li role="presentation" class="text_box" style="padding: 0px; text-align: left;">Stocks</li>
                            <li>
                            <div id="topmenu">
                            <ul class="nav nav-pills nav-stacked topmenu">
                                 <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/AddBookStocks.jsp"><font style="color: orange">Add Book Stocks</font></a></li>
                                   <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/EditStock.jsp"><font style="color: orange">Edit Book Stocks</font></a></li>
                                <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/DeleteStocks.jsp"><font style="color: orange">Delete Stocks</font></a></li>
                               <li role="presentation" class="active"><a href="#">Search Book Stocks</a></li>
                            </ul>
                            </div>
                        </li>
                            
                        </ul>
                    </div>
               <div class="col-xs-1">&nbsp;</div>
                <%--left side navigation end--%>
               
                 <div class="col-lg-9">
                     <br><br>
                    <div class="col-lg-12">
                        <div class="row">
                            <label><h4>Search Stock</h4></label>
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
                        
                    </div>
                </div>
              
            </div>
         <br><br><br><br><br><br>
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