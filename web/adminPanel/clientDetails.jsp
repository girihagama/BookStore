<%-- 
    Document   : clientDetails
    Created on : Apr 15, 2015, 10:09:21 PM
    Author     : Chami
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
            <%@include file="HeaderFiles/clientHeader.jsp"%>           
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2">
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left;">Client</li>
                        <li>
                            <div id="topmenu">
                                 <ul class="nav nav-pills nav-stacked topmenu">
                                    <li role="presentation" class="active"><a href="#">Client Details</a></li>
                                    <li>&nbsp;</li>
                                    <li>&nbsp;</li>
                                    <li>&nbsp;</li>
                                    <li>&nbsp;</li>
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
                    <% if (request.getAttribute("msg") != null) {
                    %><div class="alert alert-warning" role="alert"><strong><%=request.getAttribute("msg")%>.</strong><br></div><%
                    } else {%>
                    <label><h3>Client Details</h3></label>
                    <form id="Client" action="RemoveClient" method="POST">
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td><label>Client Name </label></td>
                                    <td><label>: <%=request.getAttribute("searchedClientName")%></label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label>Client E-mail Address </label></td>
                                    <td><label>: <%=request.getAttribute("searchedClientMail")%></label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label>Client Telephone Number </label>&nbsp;&nbsp;&nbsp; </td>
                                    <td><label>: <%=request.getAttribute("searchedClientTPN")%></label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label>Client Address Line 1 </label></td>
                                    <td><label>:  <%=request.getAttribute("searchedClientAdd1")%></label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label>Client Address Line 2 </label></td>
                                    <td><label>:  <%=request.getAttribute("searchedClientAdd2")%></label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label>Client Address Line 3 </label></td>
                                    <td><label>:  <%=request.getAttribute("searchedClientAdd3")%></label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label>Client Registered Date </label></td>
                                    <td><label>:  <%=request.getAttribute("searchedClientRegDate")%></label></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>                      
                        <input type="hidden" name="oldName" value="<%=request.getAttribute("searchedClientName")%>">
                        <div class="row">
                            <div class="form-group">
                                <div class="col-lg-5">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="checkbox" value="Choice #1" /> This is the client i need to remove
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div><br>
                        <tbody> 
                                <tr>
                                    <td><label><button type="submit" class="btn btn-default">Remove This Client</button></label></td>
                                    <td></td>
                                </tr>
                        </tbody>
                    </form><%}%>
                    <br>
                    <button type="button" class="btn btn-warning btn-lg" data-toggle="modal" data-target="#email" data-whatever="<%=request.getAttribute("searchedClientMail")%>">Send Email</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <%-- email send box--%>
                    <div class="modal fade" id="email" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="text_box" id="exampleModalLabel" style="padding: 0px; text-align: left; font-size: 3em; ">New E-mail Address</h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div id ="orange">
                                        <div class="form-group orange" >
                                            <label for="recipient-name" class="control-label">Recipient:</label>
                                            <input type="text" class="form-control" id="recipient-name">
                                        </div>
                                        </div>
                                        <div id ="orange">
                                        <div class="form-group orange">
                                            <label for="message-text" class="control-label">Message:</label>
                                            <textarea class="form-control" id="message-text"></textarea>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-warning">Send message</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--end of email send box---%>
                    
                    <script type="text/javascript">
                        $(document).ready(function() {
                            var validator = $("#Client").bootstrapValidator({
                                fields: {
                                    checkbox: {
                                        validators: {
                                            notEmpty: {
                                                message: "If you need to remove this client, please put a tick"
                                            }
                                        }
                                    }
                                }
                            });
                        });
                    </script>
                    <%-- email box--%>
                    <script type="text/javascript">
                        $('#email').on('show.bs.modal', function (event) {
                            var button = $(event.relatedTarget) // Button that triggered the modal
                            var recipient = button.data('whatever') // Extract info from data-* attributes
                            var modal = $(this)
                            modal.find('.text_box').text('New email to ' + recipient)
                            modal.find('.modal-body input').val(recipient)
                            })
                    </script>    
                </div>
            </div>
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
            <%} else {%>
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
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Library</a></li>
                    <li class="active">Data</li>
                </ol>
            </div> 
        </div>
    </body>
</html>
