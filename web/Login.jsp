<%-- 
    Document   : BeginPage
    Created on : Mar 15, 2015, 6:35:56 PM
    Author     : Indunil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>    
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Sign In</title>

        <!-- Bootstrap CSS-->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-theme.css" rel="stylesheet">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

        <!--aditional CSS imports-->
        <!-- IF online useage required
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        Remove this comment tag-->
        <!--aditional CSS imports end-->

        <!--internal CSS-->

        <style type="text/css">
            .panel-heading {
                padding: 5px 15px;
            }

            .panel-footer {
                padding: 1px 15px;
                color: #A0A0A0;
            }

            .profile-img {
                width: 96px;
                height: 96px;
                margin: 0 auto 10px;
                display: block;
                -moz-border-radius: 50%;
                -webkit-border-radius: 50%;
                border-radius: 50%;
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

        <!--aditional JS imports-->
        <!-- IF online useage required
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        Remove this comment tag-->
        <!--aditional JS imports end-->

        <!--internal JS-->

        <script type="text/javascript">
            function sync() {
                var n1 = document.getElementById('username');
                var n2 = document.getElementById('recHint');
                n2.value = n1.value;
            }

            function validateForm() {
                if (!nullHandler()) {
                    return false;
                }
            }

            function nullHandler() {
                if (document.forms["loginForm"]["username"].value == "") {
                    var x = window.prompt("Please Enter Your Username OR E-Mail to Reset Password", "");

                    if (x !== "" || x !== null) {
                        document.getElementById('username').value = x;
                        sync();
                    } else {                        
                        return false;
                    }
                    return false;

                } else {
                    return true;
                }
            }

            function autoClick() {
                document.forms('passRecover').submit();
            }            
            
        </script>

        <!--internal JS end-->
    </head>
    <body style="background-image: url(indunil_files/Resources/Graphics/clean-white-polygon-backgrounds-8.jpg); background-color: #B5B5B5;">	    

        <div class="container" style="margin-top:40px;">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <strong> <center> Sign In To Continue</center> </strong>
                        </div>
                        <div class="panel-body">
                            <form name="loginForm" role="form" action="Login" method="POST">
                                <fieldset>
                                    <div class="row">
                                        <div class="center-block">
                                            <img class="profile-img" src="indunil_files/Resources/Graphics/photo.png" alt="login image">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 col-md-10  col-md-offset-1 ">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="glyphicon glyphicon-user"></i>
                                                    </span> 
                                                    <input id="username" class="form-control" placeholder="E-Mail OR Username" name="username" type="text" autofocus required="" onchange="sync()" onkeyup="sync()">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="glyphicon glyphicon-lock"></i>
                                                    </span>
                                                    <input class="form-control" placeholder="Password" name="password" type="password" value="" required="">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="checkbox">
                                                    <center><label><input name="Remember" type="checkbox" value="Remember" checked="true"> Remember Me</label></center>
                                                </div>                                                
                                            </div>

                                            <div class="form-group">
                                                <input type="submit" class="btn btn-lg btn-primary btn-block" value="Sign in">
                                            </div>                                            
                                        </div>                                        
                                    </div>
                                </fieldset>
                            </form>
                            <!--Recover Password start-->
                            <div class="form-group">
                                <form onsubmit="return validateForm()" name="passRecover" action="RecoverPassword" method="GET">
                                    <input type="hidden" id="recHint" name="recHint">
                                    <center><input id="ResetPassword" type="submit" class="btn" onclick="sync();" value="Forget Password?"/></center>
                                </form>
                            </div>
                            <!--Recover Password end-->
                        </div>
                        <div class="panel-footer center-block">
                            <marquee id="marquee" behavior="alternate" onmouseover="stop()" onmouseout="start()">
                                Don't have an account?
                                <span class="glyphicon glyphicon-user"></span>
                                <b><a style="font-family: calibri;" href="SignUp.jsp">Sign Up Here </a></b>
                            </marquee>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
