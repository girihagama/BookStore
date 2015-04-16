<%-- 
    Document   : modifibook2
    Created on : Mar 23, 2015, 5:19:38 PM
    Author     : Chami
--%>

<<<<<<< HEAD
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
=======
>>>>>>> d80cd2d375e1054004de650d4feff4e0da0fd368
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css"/>
<<<<<<< HEAD

        <%--Bootsrap CSS files--%>
        <link rel="stylesheet" href="http://localhost:8080/BookStore/adminPanel/css/bootstrap.css"/>
        <link rel="stylesheet" href="http://localhost:8080/BookStore/adminPanel/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="http://localhost:8080/BookStore/adminPanel/css/bootstrapValidator.css"/>

        <%--Bootsrap jS files--%>
        <script type="text/javascript" src="http://localhost:8080/BookStore/adminPanel/js/jquery.min.js"></script>
        <script type="text/javascript" src="http://localhost:8080/BookStore/adminPanel/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://localhost:8080/BookStore/adminPanel/js/bootstrapValidator.js"></script>

        <%-- my css files --%>
=======
        <link href="http://localhost:8080/BookStore/adminPanel/css/bootstrap.css" rel="stylesheet">
        <link href="http://localhost:8080/BookStore/adminPanel/css/bootstrap.min.css" rel="stylesheet">
>>>>>>> d80cd2d375e1054004de650d4feff4e0da0fd368
        <link href="http://localhost:8080/BookStore/adminPanel/css/startPage.css" rel="stylesheet">
        <link href="http://localhost:8080/BookStore/adminPanel/css/form.css" rel="stylesheet">
        <title>Admin Panel</title>
    </head>
    <body>
        <div class="container" style="background-color:#F5F5F0">
<<<<<<< HEAD
            <%@include file="HeaderFiles/bookHeader.jsp"%>           
=======
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
>>>>>>> d80cd2d375e1054004de650d4feff4e0da0fd368
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2">
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left;">Books</li>
                        <li>
                            <div id="topmenu">
                                <ul class="nav nav-pills nav-stacked topmenu">
<<<<<<< HEAD
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/addBook.jsp"><font style="color: orange">Add Book</font></a></li>
                                    <li role="presentation" class="active"><a href="#">Modify Book</a></li>
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/removeBook1.jsp"><font style="color: orange">Remove Book</font></a></li>
=======
                                    <li role="presentation"><a href="#"><font style="color: orange">Add Book</font></a></li>
                                    <li role="presentation" class="active"><a href="#">Modify Book</a></li>
                                    <li role="presentation"><a href="#"><font style="color: orange">Remove Book</font></a></li>
>>>>>>> d80cd2d375e1054004de650d4feff4e0da0fd368
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
<<<<<<< HEAD
                    <% if (request.getAttribute("msg") != null) {
                    %><div class="alert alert-warning" role="alert"><strong><%=request.getAttribute("msg")%>.</strong><br></div><%
                            } else {%>
                    <form id="ModifyBook" action="ModifyBook3" method="POST">
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Title : <%=request.getAttribute("searchedBookName")%></label>
                                <input type="hidden" name="oldName" value="<%=request.getAttribute("searchedBookName")%>">
                                <input type="text" class="form-control" placeholder="Enter new book title" name="changedName" id="changedName">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <jsp:useBean id="author" class="Classes.AuthorClass"></jsp:useBean>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Author Name : <%=request.getAttribute("searchedBookAName")%></label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <select name="autherName" id="autherName" class="form-control" >
                                            <option disabled selected value="0">Select a new author</option> 
                                        <%
                                            List results = author.getAlist();
                                            Iterator it = results.iterator();
                                                while (it.hasNext()) {%>
                                        <option><%=it.next()%></option>
                                        <%}%>
=======
                    <form>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Title</label>
                                <input type="text" class="form-control" placeholder="Enter book title" required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Author Name</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <select class="form-control" placeholder="Select year" required >
                                            <option>Author name</option>
>>>>>>> d80cd2d375e1054004de650d4feff4e0da0fd368
                                        </select>
                                    </div>
                                    <div class="col-lg-2">
                                        <a class="btn btn-default" href="#" role="button">Add Authors</a>
                                    </div>
                                </div>                            
                            </div>
                        </div> 
                        <div id ="orange">
                            <div class="form-group orange">
<<<<<<< HEAD
                                <label>Book Edition : <%=request.getAttribute("searchedBookEdition")%></label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input type="text" class="form-control" placeholder="Enter new book edition" name="changedEdition" >
=======
                                <label>Book Edition</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input type="text" class="form-control" placeholder="Enter book edition">
>>>>>>> d80cd2d375e1054004de650d4feff4e0da0fd368
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
<<<<<<< HEAD
                                <label>Book Published Year :  <%=request.getAttribute("searchedBookYear")%></label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <select name="year" class="form-control" placeholder="Select year">
                                            <%  int year = Calendar.getInstance().get(Calendar.YEAR); %>
                                            <option disabled selected value="0">Select a new year</option>
                                                <%for (int i = year; i > (year - 200); i--) {%><option><%=i%></option><%}%>
=======
                                <label>Book Published Year</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <select class="form-control" placeholder="Select year" >
                                            <%  int year = Calendar.getInstance().get(Calendar.YEAR) - 1;
                                                for (int i = year; i > (year - 200); i--) {%><option><%=i%></option><%}%>
>>>>>>> d80cd2d375e1054004de650d4feff4e0da0fd368
                                        </select>
                                    </div>
                                </div>                            
                            </div>
<<<<<<< HEAD
                        </div>
                         <div class="form-group orange">
                                <label>Book Image : </label>
                                <div class="row">
                                    <%-- need image--%>
                                </div>                            
                           </div>
                        <button type="submit" class="btn btn-default">Modify Book</button>
                    </form><%}%>
                </div>
            </div>
                <script type="text/javascript">
                $(document).ready(function() {
                    var validator = $("#ModifyBook").bootstrapValidator({
                        fields: {
                            changedName: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide a book title"
                                    }
                                }
                            },
                            autherName: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide an author. if there is no author, please add and select the author"
                                    }
                                }
                            }
                        }
                    });
                });
            </script>
            <%--Form end--%>
            <% if (request.getAttribute("msg") != null) {
            %>
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
            <%}%>
=======
                        </div> 
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Image</label>
                                <input type="file" style="border-color: orange">
                            </div>  
                        </div> 
                        <button type="submit" class="btn btn-default">Modify Book</button>
                    </form>
                </div>
            </div>
            <%--Form end--%>
>>>>>>> d80cd2d375e1054004de650d4feff4e0da0fd368
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
