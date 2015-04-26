<%-- 
    Document   : EditProfile
    Created on : Apr 26, 2015, 11:51:18 AM
    Author     : Indunil
--%>

<%@page import="Classes.UserClass"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Edit Profile</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

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

    <jsp:include page="header.jsp"></jsp:include>

        <body>

        <%
            ArrayList profileEdit = (ArrayList) request.getAttribute("editInfo");

            Iterator itr = profileEdit.iterator();
            UserClass user = null;

            out.println("<div class='container-fluid'>");

            while (itr.hasNext()) {
                user = (UserClass) itr.next();
                
                if(user.getU_TPN()==null|| user.getU_TPN()=="null"){
                    user.setU_TPN("");
                }
                if(user.getU_addLine1()==null|| user.getU_addLine1()=="null"){
                    user.setU_addLine1("");
                }
                if(user.getU_addLine2()==null|| user.getU_addLine2()=="null"){
                    user.setU_addLine2("");
                }
                if(user.getU_addLine3()==null|| user.getU_addLine3()=="null"){
                    user.setU_addLine3("");
                }

                out.println("<div class='row clearfix'>"
                        + "<div class='col-md-12 column'>"
                        + "<div class='page-header'>"
                        + "<h1>Edit Profile <small>" + user.getU_Name() + "</small></h1>"
                        + "</div>"
                        + "</div>"
                        + "</div>" //end of page header
                        + "<div class='row clearfix'>"
                        + "<div class='col-md-12 column' style='font-family:calibri;'>"
                        + "<form role='form' method = 'POST' action='EditProfile' enctype = 'multipart/form-data'>"
                        + "<div class='form-group'>"
                        + "<label for='exampleInputEmail1'>Email address</label><input type='email' name='email' value='"+user.getU_Mail()+"' class='form-control' id='exampleInputEmail1' required>"
                        + "</div>"
                        + "<div class='form-group'>"
                        + "<label for='exampleInput'>Contact Number</label><input type='text' name='TPN' value='"+user.getU_TPN()+"' class='form-control' id='exampleInputEmail1' required>"
                        + "</div>"
                        + "<div class='form-group'>"
                        + "<label for='exampleInput'>Card Number</label><input type='number' value='"+user.getU_CardNo()+"' maxlength='16' name='CCN' class='form-control' id='exampleInputEmail1' required>"
                        + "</div>"
                        + "<div class='form-group'>"
                        + "<label for='exampleInput'>Address Line 1</label><input type='text' value='"+user.getU_addLine1()+"' name='addressL1' class='form-control' id='exampleInputEmail1' required>"
                        + "</div>"
                        + "<div class='form-group'>"
                        + "<label for='exampleInput'>Address Line 2</label><input type='text' value='"+user.getU_addLine2()+"' name='addressL2' class='form-control' id='exampleInputEmail1' required>"
                        + "</div>"
                        + "<div class='form-group'>"
                        + "<label for='exampleInput'>Address Line 3</label><input type='text' value='"+user.getU_addLine3()+"' name='addressL3' class='form-control' id='exampleInputEmail1'>"
                        + "</div>"
                        + "<div class='form-group'>"
                        + "<label for='exampleInputFile'>Upload Image</label><input type='file' id='exampleInputFile' name='photo'>"
                        + "</div>"
                        + "<hr>"
                        + "<div class='form-group'>"
                        + "<button type='submit' class='btn btn-warning btn-block'>Submit</button>"
                        + "</div>"
                        + "</form>"
                        + "</div>"
                        + "</div>");

            }

            out.println("</div>");
        %>

    </body>

    <jsp:include page="footer.jsp"></jsp:include>
</html>
