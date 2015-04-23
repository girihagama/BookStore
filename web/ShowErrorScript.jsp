<%-- 
    Document   : ShowScript
    Created on : Apr 9, 2015, 10:51:47 PM
    Author     : Indunil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Script</title>

        <script>
            function myFunction() {
                window.alert(arguments[0]);
            }
        </script>

    </head>
    <%        //showing session value via java script
        if (session.getAttribute("Error") != null) {
            String messege = (String) session.getAttribute("Error");
            out.print("<body onload=\"myFunction('" + messege + "')\">"
                    + "</body>");
        }
    %>
    <%
        session.setAttribute("Error", null);
    %>
</html>
