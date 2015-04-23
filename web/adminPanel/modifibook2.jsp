<%-- 
    Document   : modifibook2
    Created on : Mar 23, 2015, 5:19:38 PM
    Author     : Chami
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
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
        <title>Admin Panel - Modify Book</title>
    </head>
    <body>
        <% if(request.getHeader("Referer").length()<42){%>
           <script>
                history.forward()
        </script> 
        <%} else
            if (!"http://localhost:8080/BookStore/adminPanel".equals(request.getHeader("Referer").substring(0, 42))) {%>
            <script>
                history.forward()
        </script>
            
        <%}%>
        <%
            if (request.getAttribute("searchedBookName") == null) {
                response.sendRedirect("http://localhost:8080/BookStore/adminPanel/modifiBook1.jsp");
            }
        %>
        <div class="container" style="background-color:#F5F5F0">
            <%@include file="HeaderFiles/bookHeader.jsp"%>           
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2">
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left;">Books</li>
                        <li>
                            <div id="topmenu">
                                <ul class="nav nav-pills nav-stacked topmenu">
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/addBook.jsp"><font style="color: orange">Add Book</font></a></li>
                                    <li role="presentation" class="active"><a href="#">Modify Book</a></li>
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/removeBook1.jsp"><font style="color: orange">Remove Book</font></a></li>
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
                                        <select name="changedAName" id="changedAName" class="form-control" >
                                            <option disabled selected value="0">Select a new author</option> 
                                            <%
                                                List results = author.getAlist();
                                                Iterator it = results.iterator();
                                                while (it.hasNext()) {%>
                                            <option><%=it.next()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="col-lg-2">
                                        <a class="btn btn-default" href="http://localhost:8080/BookStore/adminPanel/addAuthors.jsp" role="button">Add Authors</a>
                                    </div>
                                </div>                            
                            </div>
                        </div> 
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Edition : <%=request.getAttribute("searchedBookEdition")%></label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input type="text" class="form-control" placeholder="Enter new book edition" name="changedEdition" >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Published Year :  <%=request.getAttribute("searchedBookYear")%></label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <select name="changedYear" class="form-control" placeholder="Select year">
                                            <%  int year = Calendar.getInstance().get(Calendar.YEAR); %>
                                            <option disabled selected value="0">Select a new year</option>
                                            <%for (int i = year; i > (year - 200); i--) {%><option><%=i%></option><%}%>
                                        </select>
                                    </div>
                                </div>                            
                            </div>
                        </div>
                        <jsp:useBean id="sup" class="Classes.SupplierClass"></jsp:useBean>      
                        <div id ="orange">
                            <div class="form-group orange">
                                <label for="supplierName">Supplier Name : <%=request.getAttribute("searchedBooksup")%></label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <select name="supplierName" id="supplierName" class="form-control" >
                                            <option disabled selected value="0">Select a supplier</option> 
                                            <%
                                                List result = sup.getSlist();
                                                Iterator itr = result.iterator();
                                            while (itr.hasNext()) {%>
                                            <option><%=itr.next()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="col-lg-2">
                                        <a class="btn btn-default" href="http://localhost:8080/BookStore/adminPanel/addSuppliers.jsp" role="button">Add Suppliers</a>
                                    </div>
                                </div>                            
                            </div>
                        </div> 
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Quantity : <%=request.getAttribute("searchedBookQty")%> </label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input name="bookQuantity" id="bookQuantity" type="text" class="form-control" placeholder="Enter book quantity" required="required" pattern="^(\d*)$">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Price (Rs) : <%=request.getAttribute("searchedBookPrice")%></label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input name="bookPrice" id="bookPrice" type="text" class="form-control" placeholder="Enter book price like 12345.67" required="required" pattern="^(\d*\.\d{2})?$">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <tbody>
                                <tr>
                                    <td><label><button type="submit" class="btn btn-default">Modify Book</button></label></td>
                                    <td><label> <a class="btn btn-default" href="http://localhost:8080/BookStore/adminPanel/modifiBook1.jsp" role="button">Cancel</a></label></td>
                                    <td></td>
                                </tr>
                        </tbody>
                    </form>
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
                            changedAName: {
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
