<%-- 
    Document   : Exception
    Created on : Mar 25, 2015, 11:10:00 PM
    Author     : Indunil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Operation Error</title>

        <!-- Bootstrap CSS-->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-theme.css" rel="stylesheet">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

        <!--internal CSS-->

        <style type="text/css">
            button {
                margin-bottom: 3px;
            }

            /* REQUIRED */
            .page-alerts {
                margin-bottom: 20px;
            }

            .page-alerts .page-alert {
                border-radius: 0;
                margin-bottom: 0;
            }
            
            .square{
                border-radius: 0px;
                font-family: Courier New;
                font-size: 16px;
                font-weight: bold;
            }
        </style>

        <!--internal CSS end-->

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>  

        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

        <!--internal JS-->

        <script type="text/javascript">
            $(function () {
                $('.page-alert').hide();
                //Show alert
                $('button[data-toggle="page-alert"]').click(function (e) {
                    e.preventDefault();
                    var id = $(this).attr('data-toggle-id');
                    var alert = $('#alert-' + id);
                    var timeOut;
                    alert.appendTo('.page-alerts');
                    alert.slideDown();

                    //Is autoclosing alert
                    var delay = $(this).attr('data-delay');
                    if (delay != undefined)
                    {
                        delay = parseInt(delay);
                        clearTimeout(timeOut);
                        timeOut = window.setTimeout(function () {
                            alert.slideUp();
                        }, delay);
                    }
                });
                //Close alert
                $('.page-alert .close').click(function (e) {
                    e.preventDefault();
                    $(this).closest('.page-alert').slideUp();
                });
                //Clear all
                $('.clear-page-alerts').click(function (e) {
                    e.preventDefault();
                    $('.page-alert').slideUp();
                });
            });
        </script>

    </head>
    <body >

        <div class="page-alerts">
            <%-- this will print exception if exist --%>
            <% session.setAttribute("Exception", "Exception Information"); %>
            
            <%
                if (session.getAttribute("Exception") != null) {
                    out.print("<div>"
                            + "<div class=\"alert alert-warning page-alert\" id=\"alert-3\">"
                            + "<button type=\"button\" class=\"close\"><span aria-hidden=\"true\">×</span><span class=\"sr-only\">Close</span></button>"
                            + "<strong>Information!</strong>"
                            + "<br/><br/>"
                            + session.getAttribute("Exception").toString() + " "
                            + "<br/><br/>"
                            + "<a href=\"Home.jsp\">Go to Home Page</a>"
                            + "</div>"
                            + "<button id=\"btn\" data-toggle=\"page-alert\" data-toggle-id=\"3\" class=\"btn btn-warning btn-block square\">See Exception</button>"
                            + "</div>");
                }
            %>
        </div>

    </body>
</html>
