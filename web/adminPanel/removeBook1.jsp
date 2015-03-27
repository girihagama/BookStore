<%-- 
    Document   : removePage1
    Created on : Mar 23, 2015, 5:25:42 PM
    Author     : Chami
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
            <%@include file="HeaderFiles/bookHeader.jsp"%>           
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2" >
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
                <div class="col-xs-1">&nbsp;</div>
                <%--left side navigation end--%>
                <div class="col-lg-9">
                    <div class="row">&nbsp;</div>
                    <div class="row">&nbsp;</div>
                    <div class="col-lg-12">
                        <div class="row">
                            <label><h4>Search Book For Remove</h4></label>
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
