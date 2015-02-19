<%-- 
    Document   : index
    Created on : Feb 1, 2015, 10:45:23 PM
    Author     : Indunil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Start Page</title>
    </head>
    <body class="body">
        <div class="startpage_main_div1">
            <div class="startpage_header">
                Orchid Book Store
                <hr class="startpage_header_hr"/>
                <div class="startpage_heaader_div1">Online Marketplace</div>
            </div>
        </div>

        <br/>

        <div class="startpage_main_div2">
            <iframe src="indunil_files/WOWSlider/iframe_wow slider.html" style="width:1350px;height:450px;max-width:100%;overflow:hidden;border:none;padding:0;margin:0 auto;display:block; border-radius: 10px;opacity: 0.2; z-index: 0;" marginheight="0" marginwidth="0" ng-disabled="true"></iframe>
            <div class="sign">
                <form method="POST" action="MyServlet">                     
                    <center><font style="font-family: trebuchet ms; font-size:18px;">Sign Up</font></center>
                    <hr>
                    <table class="signtable">
                        <tr>
                            <td>
                                User Name :
                            </td>
                            <td>
                                <input type="text" name="username" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Password :
                            </td>
                            <td>
                                <input id="pass1" type="password" name="pass1" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Password :
                            </td>
                            <td>
                                <input id="pass2" type="password" name="pass2" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                eMail :
                            </td>
                            <td>
                                <input type="email" name="eMail" />
                            </td>
                        </tr>                        
                    </table>
                    <hr>
                    <center><input type="submit" value="Create Account" onclick="validateForm();"/></center>
                </form>
            </div>
        </div>
    </body>
</html>
