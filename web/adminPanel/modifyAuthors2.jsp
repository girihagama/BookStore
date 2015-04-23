<%-- 
    Document   : modifyAuthors2
    Created on : Mar 23, 2015, 3:35:52 PM
    Author     : Dushara Vitiyala
--%>

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
        <title>Admin Panel - Modify Authors</title>
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
                 <div class="container" style="background-color:#F5F5F0">
            <%@include file="HeaderFiles/authorHeader.jsp"%> 
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2">
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left;">Authors</li>
                        <li>
                            <div id="topmenu">
                            <ul class="nav nav-pills nav-stacked topmenu">
                                <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/addAuthors.jsp"><font style="color: orange">Add Author</font></a></li>
                                <li role="presentation" class="active"><a href="#">Modify Author</a></li>
                                <li role="presentation"><a href="http://localhost:8080/BookStore/adminPanel/removeAuthors.jsp"><font style="color: orange">Remove Author</font></a></li>
                            </ul>
                            </div>
                        </li>
                    </ul>  
                </div>
            
                <div class="col-lg-1">&nbsp;</div>
                <%--left side navigation end--%>
                <div class="col-lg-9">
                    <br>
                    <br>
                    <form id="ModifyAuthor" action="ModifyAuthor3" method="POST" >
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Author Name : <%=request.getAttribute("searchedAuthorName")%></label>
                                <input type="hidden" name="oldName" value="<%=request.getAttribute("searchedAuthorName")%>">
                                <input type="text" class="form-control" placeholder="Enter Author Name" name="changedName" id="changedName">
                            </div>
                        </div>
  
                        <div id ="orange">
                            <div class="form-group orange">
                                <label>Author Date of Birth :  <%=request.getAttribute("searchedAuthorDOB")%></label>
                                <div class="row">
                                    <div class="col-lg-2">
                                        <select class="form-control" placeholder="Select year" name="changedYear">
                                            <option disabled selected value="0">Year</option>
                                            <%  int year = Calendar.getInstance().get(Calendar.YEAR) - 1;
                                                for (int i = year; i > (year - 200); i--) {%><option><%=i%></option><%}%>
                                        </select>
                                    </div>
                                    <div class="col-lg-2">
                                        <select class="form-control" placeholder="Select year" name="changedMonth">
                                            <option disabled selected value="0">Month</option>
                                            <option value="1">January</option>
                                            <option value="2">February</option>
                                            <option value="3">March</option>
                                            <option value="4">April</option>
                                            <option value="5">May</option>
                                            <option value="6">June</option>
                                            <option value="7">July</option>
                                            <option value="8">August</option>
                                            <option value="9">September</option>
                                            <option value="10">October</option>
                                            <option value="11">November</option>
                                            <option value="12">December</option>                                            
                                        </select>
                                    </div>
                                    <div class="col-lg-2">
                                        <select class="form-control" placeholder="Select year" name="changedDate">
                                            <option disabled selected value="0">Date</option>
                                            <% 
                                                for (int i = 0; i <31; i++) {%><option><%=i+1%></option><%}%>
                                        </select>
                                    </div>
                                        
                                </div>                            
                            </div>
                        </div> 
                           <div id ="orange">
                            <div class="form-group orange">
                                <label>Author Description : <%=request.getAttribute("searchedAuthorDesc")%></label>
                                <textarea class="form-control" rows="3" placeholder="Enter Description" name="changedDesc"></textarea>
                            </div>
                        </div>
                        <tbody>
                                <tr>
                                    <td><label><button type="submit" class="btn btn-default">Modify Author</button></label></td>
                                    <td><label> <a class="btn btn-default" href="http://localhost:8080/BookStore/adminPanel/modifyAuthors.jsp" role="button">Cancel</a></label></td>
                                    <td></td>
                                </tr>
                        </tbody>
                    </form>
                </div>
            </div>
                <script type="text/javascript">
                $(document).ready(function() {
                    var validator = $("#ModifyAuthor").bootstrapValidator({
                        fields: {
                            changedName: {
                                validators: {
                                    notEmpty: {
                                        message: "Please provide an Author Name"
                                    }
                                }
                            }
                        }
                    });
                });
            </script>
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
