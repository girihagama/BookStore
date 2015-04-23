<%-- 
    Document   : clientDetails
    Created on : Apr 15, 2015, 10:09:21 PM
    Author     : Chami
--%>

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
        <title>Admin Panel - Client Details</title>
    </head>
    <body>
         <%
            if (!"http://localhost:8080/BookStore/adminPanel".equals(request.getHeader("Referer").substring(0, 42))) {
            System.out.println(request.getHeader("Referer").substring(0, 42));%>
            <script>
                history.forward()
        </script>
            
        <%}%>
        <%
            if(request.getAttribute("searchedClientName")==null){
                response.sendRedirect("http://localhost:8080/BookStore/adminPanel/clientSearch.jsp");
            }
            %>
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
                    
                    <label><h3>Client Details</h3></label>
                    <form id="Client" action="removeClient" method="POST">
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
                                    <td><label> <a class="btn btn-default" href="http://localhost:8080/BookStore/adminPanel/clientSearch.jsp" role="button">Cancel</a></label></td>
                                    <td></td>
                                </tr>
                        </tbody>
                    </form>
                    <br>
                    <button type="button" class="btn btn-warning btn-lg" data-toggle="modal" data-target="#email" data-whatever="<%=request.getAttribute("searchedClientMail")%>" data-backdrop="static">Send Email</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-warning btn-lg" data-toggle="modal" data-target="#message" data-whatever="<%=request.getAttribute("searchedClientName")%>" data-backdrop="static">Send Message</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-warning btn-lg" data-toggle="modal" data-target="#notification" data-whatever="<%=request.getAttribute("searchedClientName")%>" data-backdrop="static">Send Notification</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <%-- email send box--%>
                    <div class="modal fade" id="email" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="text_box" id="exampleModalLabel" style="padding: 0px; text-align: left; font-size: 3em; ">New email to <%=request.getAttribute("searchedClientName")%></h4>
                                </div>
                                <div class="modal-body">
                                    <form action="ClientMail" id="ClientMail" method="POST">
                                        <div id ="orange">
                                        <div class="form-group orange" >
                                            <label for="recipient-name" class="control-label">Recipient:</label>
                                            <input type="hidden" class="form-control" name="email" value="<%=request.getAttribute("searchedClientMail")%>">
                                            <input type="text" class="form-control" id="recipient" name="recipient" disabled="true">
                                        </div>
                                        </div>
                                        <div id ="orange">
                                        <div class="form-group orange" >
                                            <label for="subject" class="control-label">Message Subject:</label>
                                            <input type="text" class="form-control" name="subject" id="subject">
                                        </div>
                                        </div>
                                        <div id ="orange">
                                        <div class="form-group orange">
                                            <label for="message-text" class="control-label">Message:</label>
                                            <textarea class="form-control" id="content" name="content"></textarea>
                                        </div>
                                        </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-warning">Send email</button>
                                </div>
                                </form>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <%--end of email send box---%>
                    
                    <%-- message send box--%>
                    <div class="modal fade" id="message" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="text_box" id="exampleModalLabel" style="padding: 0px; text-align: left; font-size: 3em; ">New message to <%=request.getAttribute("searchedClientName")%></h4>
                                </div>
                                <div class="modal-body">
                                    <form action="ClientMessage" id="ClientMessage" method="POST">
                                        <div id ="orange">
                                        <div class="form-group orange" >
                                            <label for="recipient-name" class="control-label">Recipient: </label>
                                            <input type="hidden" class="form-control" name="name" value="<%=request.getAttribute("searchedClientName")%>" >
                                            <input type="text" class="form-control" id="recipient" name="recipient" value="<%=request.getAttribute("searchedClientName")%>" disabled="true">
                                        </div>
                                        </div>
                                        
                                        <div id ="orange">
                                        <div class="form-group orange">
                                            <label for="message-text" class="control-label">Message:</label>
                                            <textarea class="form-control" id="content" name="content"></textarea>
                                        </div>
                                        </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-warning">Send message</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                                </form>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <%--end of message send box---%>
                    
                    <%-- notification send box--%>
                    <div class="modal fade" id="notification" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="text_box" id="exampleModalLabel" style="padding: 0px; text-align: left; font-size: 3em; ">New notification to <%=request.getAttribute("searchedClientName")%></h4>
                                </div>
                                <div class="modal-body">
                                    <form action="ClientNotifiaction" id="ClientNotifiaction" method="POST">
                                        <div id ="orange">
                                        <div class="form-group orange" >
                                            <label for="recipient-name" class="control-label">Recipient: </label>
                                            <input type="hidden" class="form-control" name="name" value="<%=request.getAttribute("searchedClientName")%>" >
                                            <input type="text" class="form-control" id="recipient" name="recipient" value="<%=request.getAttribute("searchedClientName")%>" disabled="true">
                                        </div>
                                        </div>
                                        
                                        <div id ="orange">
                                        <div class="form-group orange">
                                            <label for="message-text" class="control-label">Notification Conttent:</label>
                                            <textarea class="form-control" id="content" name="content"></textarea>
                                        </div>
                                        </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-warning">Send notification</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                                </form>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <%--end of notification send box---%>
                    
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
                            modal.find('#recipient').val(recipient)
                            })
                    </script>   
                    <%-- email box validation--%>
                    <script type="text/javascript">
                        $(document).ready(function() {
                            var validator = $("#ClientMail").bootstrapValidator({
                                fields: {
                                    subject: {
                                        validators: {
                                            notEmpty: {
                                                message: "Please provide a subject"
                                            }
                                        }
                                    },
                                    content: {
                                        validators: {
                                            notEmpty: {
                                                message: "Please provide the content"
                                            }
                                        }
                                    }
                                }
                            });
                        });
                    </script>
                </div>
            </div>
            <%--Form end--%>
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
                </ol>
            </div> 
        </div>
    </body>
</html>
