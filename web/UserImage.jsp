<%-- 
    Document   : UserImage
    Created on : Apr 26, 2015, 10:21:14 AM
    Author     : Indunil
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="Classes.ImageExchange"%>

<%
    try {            
            ImageExchange x = new ImageExchange();
            
            byte[] imgData = x.userImageBytes(request.getParameter("ID"));
            
            // display the image
            response.setContentType("image/gif");
            OutputStream o = response.getOutputStream();
            o.write(imgData);
            o.flush();
            o.close();
    } catch (Exception e) {
        e.printStackTrace();
        throw e;
    }
%>
