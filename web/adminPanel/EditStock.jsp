<%-- 
    Document   : EditStock
    Created on : Mar 23, 2015, 5:51:53 PM
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
            <%@include file="HeaderFiles/admiinHeader.jsp"%>           
            <div class="row">
                  <%--end of the sub menu--%>     
                <div class="row">
                    <%-- left side --%>
                    <div class="col-lg-2">
                        <ul class="nav nav-pills nav-stacked">
                              <li role="presentation" class="text_box" style="padding: 0px; text-align: left;">Stocks</li>
                            <li>
                            <div id="topmenu">
                            <ul class="nav nav-pills nav-stacked topmenu">
                                 <li role="presentation"><a href="AddBookStocks.jsp"><font style="color: orange">Add Book Stocks</font></a></li>
                                <li role="presentation" class="active"><a href="#">Edit Book Stocks</a></li>
                                <li role="presentation"><a href="DeleteStocks.jsp"><font style="color: orange">Delete Stocks</font></a></li>
                                <li role="presentation"><a href="SearchStocks.jsp"><font style="color: orange">Search Book Stocks</font></a></li>
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
                            <label><h4>Search Book For Edit Stock</h4></label>
                            <div class="row">
                                <div class="col-lg-8">
                                    <div id="orange">
                                      <div class="input-group">
                                        <input type="text" class="form-control orange" placeholder="Search for edit...">
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
                </ol>
            </div> 
        </div>
    </body>
</html>
