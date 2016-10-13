<%-- 
    Document   : StartPage
    Created on : Apr 26, 2015, 6:41:46 PM
    Author     : Chami
--%>

<%@page import="Classes.UserClass"%>
<%! String username; String adminLevel;%>
<%
    if (session.getAttribute("Username") != null) {
        username = session.getAttribute("Username").toString();
        UserClass admin = new UserClass();
        admin.getAdminLevel(username);
        adminLevel = admin.getA_Level();
    }
%>
