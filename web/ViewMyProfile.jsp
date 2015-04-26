<%-- 
    Document   : ViewMyProfile
    Created on : Apr 23, 2015, 10:52:57 PM
    Author     : Indunil
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.UserClass"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- Bootstrap CSS-->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-theme.css" rel="stylesheet">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">

        <!--internal CSS-->

        <style type="text/css">
        </style>

        <!--internal CSS end-->

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.js"></script>


        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>  
        <script src="js/bootstrap.js"></script> 

        <script type="text/javascript">
            function Confirm() {
                var x;
                if (confirm("Confirm this action..?") == true) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>

        <!--internal JS end-->  
    </head>

    <jsp:include page="ShowMessageScript.jsp"></jsp:include>
    <jsp:include page='header.jsp'></jsp:include>

        <body>

        <%
            ArrayList userProfile = (ArrayList) request.getAttribute("ViewUserProfile");
            Iterator itr = userProfile.iterator();
        %>

        <%
            if (!userProfile.isEmpty()) {
                out.println("<div class='container-fluid'>");

                while (itr.hasNext()) {
                    UserClass user = (UserClass) itr.next();

                    if (user.getU_addLine1() == null || user.getU_addLine1() == "null") {
                        user.setU_addLine1("");
                    }
                    if (user.getU_addLine1() == null || user.getU_addLine1() == "null") {
                        user.setU_addLine1("");
                    }
                    if (user.getU_addLine2() == null || user.getU_addLine2() == "null") {
                        user.setU_addLine2("");
                    }
                    if (user.getU_addLine3() == null || user.getU_addLine3() == "null") {
                        user.setU_addLine3("");
                    }
                    String address = user.getU_addLine1() + " " + user.getU_addLine2() + " " + user.getU_addLine3();

                    if (user.getU_TPN() == null || user.getU_TPN() == "null") {
                        user.setU_TPN("Not Yet Added");
                    }
                    
                    if (user.getU_CardNo() == null || user.getU_CardNo() == "null") {
                        user.setU_CardNo("Not Yet Added");
                    }

                    out.println("<form method='POST' action='ManageProfile' onsubmit='return Confirm();'>"
                            + "<div class='row clearfix'>"
                            + "<div class='col-md-12 column'>"
                            + "<div class='jumbotron'>"
                            + "<img class='img-circle img-responsive center-block' src='UserImage.jsp?ID=" + user.getU_Name() + "' style='max-width: 150px;max-height: 150px;' alt='Profile Image'/>"
                            + "<h1 style='font-family: calibri;'>My Profile..!</h1>"
                            + "</div>"
                            + "</div>"
                            + "</div>"
                            + "<div class='row'>"
                            + "<div class='col-md-12'>"
                            + "<div class='panel panel-default'>"
                            + "<div class='panel-body'>Email : " + user.getU_Mail() + "</div>"
                            + "<div class='panel-body'>Card Number : " + user.getU_CardNo() + "</div>"
                            + "<div class='panel-body'>Address : " + address + "</div>"
                            + "<div class='panel-body'>Contact Number : " + user.getU_TPN() + "</div>"
                            + "<div class='panel-body'>Member Since : " + user.getU_RegDate() + "</div>"
                            + "<hr/>"
                            + "<center>"
                            + "<div class='btn-group col' role='group'>"
                            + "<button type='submit' name='submit' value='Edit' class='btn btn-md btn-warning'>Edit Profile</button>"
                            + "<button type='submit' name='submit' value='Deactivate' class='btn btn-md btn-danger'>Deactivate Account</button>"
                            + "</div>"
                            + "</center>"
                            + "<hr/>"
                            + "</div>"
                            + "</div>"
                            + "</form>");
                }

                out.println("</div>");
            } else {
                response.sendRedirect("Login.jsp");
            }
        %>

    </body>

    <jsp:include page='footer.jsp'></jsp:include>

</html>
