
<%-- 
    Document   : Stocks
    Created on : Mar 23, 2015, 2:53:44 PM
    Author     : Khaushalya
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
            <%@include file="HeaderFiles/stockHeader.jsp"%> 
                <div class="row">
                    <%-- left side --%>
                    <div class="col-lg-2">
                        <ul class="nav nav-pills nav-stacked">
                              <li role="presentation" class="text_box" style="padding: 0px; text-align: left;">Stocks</li>
                            <li>
                            <div id="topmenu">
                            <ul class="nav nav-pills nav-stacked topmenu">
                                <li role="presentation" class="active"><a href="#">Add Book Stocks</a></li>
                                <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/EditStock.jsp"><font style="color: orange">Edit Book Stocks</font></a></li>
                                <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/DeleteStocks.jsp"><font style="color: orange">Delete Stocks</font></a></li>
                                <li role="1presentation"><a href="http://localhost:8080/BookStore/adminPanel/SearchStocks.jsp"><font style="color: orange">Search Book Stocks</font></a></li>
                            </ul>
                            </div>
                        </li>
                            
                        </ul>
                    </div>
                    <div class="col-lg-1">&nbsp;</div>
                <%--left side navigation end--%>
                <%--Form--%>
                <div class="col-lg-7">
                    <br>
                    <br>
                    <form>
                    <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Name :</label>
                                <div class="row">
                                      <div class="col-lg-6">

                                          <input type="text" class="form-control" placeholder="Enter book name here" required="ppp"> 

                                           

                                      </div>
                                        <div class="col-lg-2">
                                            <div class="col-md-1"><a href="addBook.jsp"><button type="button" class="btn btn-default">Add New Book</button></a></div> 
                                       </div>
                                   
                                </div>                            
                            </div>
                        </div>
                        <br>
                       <div id ="orange">
                            <div class="form-group orange">
                                <label>Supplier Name :</label>
                                <div class="row">
                                      <div class="col-lg-6">
                                          <input type="text" class="form-control" placeholder="Enter supplier name here"> 
                                      </div>
                                        <div class="col-lg-2">
                                            <div class="col-md-1"><a href="#"><button type="button" class="btn btn-default">Add New Supplier</button></a></div> 
                                       </div>
                                   
                                </div>                            
                            </div>
                        </div>
                       <br>
                           <div id ="orange">
                            <div class="form-group orange">
                                <label>Stock Date :</label>
                                <div class="row">
                                    <div class="col-lg-2">
                                        <select class="form-control" placeholder="Select date" >
                                            <%  int date = Calendar.getInstance().get(Calendar.DATE) - 1;
                                    for (int i = date; i >0 ; i--) {%><option><%=i%></option><%}%>
                                        </select>
                                    </div>
                                        <div class="col-lg-2">
                                            <select class="form-control" placeholder="Select month">
                                                <option><%="January" %> </option>
                                               <option> <%="February" %> </option>
                                               <option> <%="March" %> </option>
                                               <option> <%="April" %> </option>
                                               <option> <%="May" %> </option>
                                               <option> <%="June" %> </option>
                                               <option> <%="July" %> </option>
                                                <option><%="Auguast" %> </option>
                                                <option><%="September" %> </option>
                                                <option><%="October" %> </option>
                                               <option> <%="November" %> </option>
                                               <option> <%="December" %> </option>
                                           </select>
                                          
                                    </div>
                                            <div class="col-lg-2">
                                        <select class="form-control" placeholder="Select date" >
                                            <%  int year = Calendar.getInstance().get(Calendar.YEAR) - 1;
                                    for (int i = year; i >(year-10) ; i--) {%><option><%=i%></option><%}%>
                                        </select>
                                    </div>
                                </div>                            
                            </div>
                        </div>
                            <br>            
                            <div id ="orange">
                            <div class="form-group orange">
                                 <label>Stock Quentity :</label> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                 <label>Stock Price :</label>
                                <div class="row">
                                    <div class="col-lg-5">
                                        <input type="text" class="form-control" placeholder="Enter stock quntity">
                                    </div>
                                    
                                    <div class="col-lg-5">
                                        <input type="text" class="form-control" placeholder="Enter stock price">  
                                    </div>
                                </div>
                            </div>
                         <br>
                        </div> 
                        
                           <div id ="orange">
                            <div class="form-group orange">    
                              <button type="submit" class="btn btn-default">Submit</button>
                            </div>
                        </div>
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
