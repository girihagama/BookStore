<%-- 
    Document   : subPage
    Created on : Mar 22, 2015, 6:08:29 PM
    Author     : Chami
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Classes.AuthorClass"%>
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
        <script type="text/javascript" src="http://localhost:8080/BookStore/adminPanel/js/jquery.maskMoney.js"></script>


        <%-- my css files --%>
        <link href="http://localhost:8080/BookStore/adminPanel/css/startPage.css" rel="stylesheet">
        <link href="http://localhost:8080/BookStore/adminPanel/css/form.css" rel="stylesheet">
        <title>Admin Panel - Add Book</title>
    </head>
    <body>

        <% if (request.getHeader("Referer").length() < 42) {%>
        <script>
            history.forward()
        </script> 
        <%} else if (!"http://localhost:8080/BookStore/adminPanel".equals(request.getHeader("Referer").substring(0, 42))) {%>
        <script>
            history.forward()
        </script>

        <%}%>

        <%--for authentication--%>
        <%! String level = "L1";%>
        <%-- ------------ --%>

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
                                    <li role="presentation" class="active"><a href="#">Add Book</a></li>
                                        <%if ("L3".equals(level)) {%>
                                    <li role="presentation"><a href="" data-toggle="modal" data-target="#Modify" data-backdrop="static"><font style="color: orange">Modify Book</font></a></li>
                                            <%} else {%>
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/modifiBook1.jsp"><font style="color: orange">Modify Book</font></a></li><%}%>
                                            <%if ("L3".equals(level)) {%>
                                    <li role="presentation"><a href="" data-toggle="modal" data-target="#remove" data-backdrop="static"><font style="color: orange">Remove Book</font></a></li>
                                            <%} else {%>
                                    <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/removeBook1.jsp"><font style="color: orange">Remove Book</font></a></li><%}%>
                                </ul>
                            </div>
                        </li>
                    </ul>  
                </div>
                <div class="col-lg-1">&nbsp;</div>
                <%--left side navigation end--%>
                <%--Form--%>
                <div class="col-lg-9">
                    <% if (request.getAttribute("msg") != null) {
                    %><br><div class="alert alert-warning" role="alert"><strong><%=request.getAttribute("msg")%>.</strong><br>
                        If you want add another book fill below form and add a book.</div><%
                        } else {%>
                    <br><%}%>
                    <br>                 
                    <form id="AddForm"<%if (request.getAttribute("action") != null) {%>
                          action="<%=request.getAttribute("action")%>"<%} else {%>
                          action="../AddBook"<%}%>
                          method="POST" enctype="multipart/form-data">
                        <div id ="orange">
                            <div class="form-group orange">
                                <label for="bookTitle">Book Title</label>
                                <input type="text" name="bookTitle" id="bookTitle" class="form-control" placeholder="Enter book title" 
                                       <%if (request.getAttribute("errorBookTitle") != null) {%>
                                       value="<%=request.getAttribute("errorBookTitle")%>"<%}%>>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <jsp:useBean id="author" class="Classes.AuthorClass"></jsp:useBean>                        
                            <div id ="orange">
                                <div class="form-group orange">
                                    <label for="autherName">Author Name</label>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <select name="autherName" id="autherName" class="form-control" >
                                                <option disabled selected value="0">Select an author</option> 
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
                                <label>Book Edition</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input name="bookEdition" type="text" class="form-control" placeholder="Enter book edition"
                                               <%if (request.getAttribute("errorEdition") != null) {%>
                                               value="<%=request.getAttribute("errorEdition")%>"<%}%>>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Published Year</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <select name="year" class="form-control" placeholder="Select year">
                                            <%  int year = Calendar.getInstance().get(Calendar.YEAR); %>
                                            <option disabled selected value="0">Select a year</option>
                                            <%for (int i = year; i > (year - 200); i--) {%><option><%=i%></option><%}%>
                                        </select>
                                    </div>
                                </div>                            
                            </div>
                        </div>
                        <jsp:useBean id="sup" class="Classes.SupplierClass"></jsp:useBean>      
                            <div id ="orange">
                                <div class="form-group orange">
                                    <label for="supplierName">Supplier Name</label>
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
                                <label>Book Quantity</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input name="bookQuantity" id="bookQuantity" type="text" class="form-control" placeholder="Enter book quantity"
                                               <%if (request.getAttribute("errorQuantity") != null) {%>
                                               value="<%=request.getAttribute("errorQuantity")%>"<%}%>
                                               required="required" pattern="^(\d*)$">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Price (Rs)</label>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input name="bookPrice" id="bookPrice" type="text" class="form-control" placeholder="Enter book price like 12345.67"
                                               <%if (request.getAttribute("errorPrice") != null) {%>
                                               value="<%=request.getAttribute("errorPrice")%>"<%}%>
                                               required="required" pattern="^(\d*\.\d{2})?$">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Book Image</label>
                                <input name="image" id="image" type="file" style="border-color: orange">
                            </div>  
                        </div> 
                        <tbody>
                            <tr>
                                <td><label><button type="submit" class="btn btn-default">Add Book</button></label></td>
                                <td><label> <a class="btn btn-default" href="http://localhost:8080/BookStore/adminPanel/adminStartPage.jsp" role="button">Cancel</a></label></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </form>
                </div>
            </div>
            <%--Form end--%>

            <%-- remove box--%>
            <div class="modal fade" id="remove" role="dialog" aria-hidden="false">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h2 class="modal-title"><strong>Sorry...!</strong></h2>
                        </div>
                        <div class="modal-body">
                            <h4><p>You have no authentication for remove books.</p></h4>                                        
                        </div>
                        <div class="modal-footer">
                            <div class="span2">
                                <button type="button" class="btn btn-warning" data-dismiss="modal">Ok</button>
                            </div>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <%-- modify box--%>
            <div class="modal fade" id="Modify" role="dialog" aria-hidden="false">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h2 class="modal-title"><strong>Sorry...!</strong></h2>
                        </div>
                        <div class="modal-body">
                            <h4><p>You have no authentication for modify books.</p></h4>                                        
                        </div>
                        <div class="modal-footer">
                            <div class="span2">
                                <button type="button" class="btn btn-warning" data-dismiss="modal">Ok</button>
                            </div>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <%--script for validation--%>
            <script type="text/javascript">
                $(document).ready(function() {
                    var validator = $("#AddForm").bootstrapValidator({
                        fields: {
                            bookTitle: {
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
                            },
                            image: {
                                validators: {
                                    file: {
                                        extension: 'jpg',
                                        maxSize: 1024 * 1024*2,
                                        message: 'Please choose jpeg image with a size less than 2M.'
                                    }
                                }

                            }
                        }
                    });
                });
            </script>
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


