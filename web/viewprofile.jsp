<%-- 
    Document   : viewprofile
    Created on : Apr 19, 2015, 11:38:21 PM
    Author     : Indunil
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Classes.UserClass"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ArrayList profile = (ArrayList) request.getAttribute("MyProfile");

            Iterator itr = profile.iterator();
            UserClass received = null;
            
            while (itr.hasNext()) {
                Object a = itr.next();
                received = (UserClass) a;
            }
        %>
        <form action="myform" method="POST" enctype="multipart/form-data">
            <input type="file" style="font-family: calibri;"/>
            <input name="username" value="<%= received.getU_Name()%>"/>
            <input name="password" value="<%= received.getU_Pass()%>"/>
            <input type="Submit">
        </form>
    </body>
</html>
