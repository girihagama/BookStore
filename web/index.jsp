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
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">


        <link rel="stylesheet" type="text/css" href="style.css"/>
        <script type="text/javascript" src="script.js"></script>
        
        <title>Orchid Store</title>

        <!-- Bootstrap Core CSS -->
        <link href="startpage/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="startpage/css/agency.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="startpage/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body id="page-top" class="index">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header page-scroll">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand page-scroll" href="#page-top">Orchid Book Store</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="hidden">
                            <a href="#page-top"></a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#Signin">Sign In</a>
                        </li>                    
                        <li>
                            <a class="page-scroll" href="#Signup">Sign Up</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#About">About</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#contact">Contact</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>

        <!-- Header -->
        <header>
            <div class="container">
                <div class="intro-text">
                    <div class="intro-lead-in">Welcome To Our Store!</div>
                    <div class="intro-heading">It's Nice To Meet You</div>
                    <a href="#Signin" class="page-scroll btn btn-xl">Sign In</a>
                    <a href="#Signup" class="page-scroll btn btn-xl">Sign Up</a>
                </div>
            </div>
        </header>

        <hr/>

        <a id="Signin"></a>
        <!-- Sign In Section -->
        <section>
            <div class="row">
                <div class="col-lg-6">
                    <div class="jumbotron text-center">                        
                        <h1 class="" style="font-family: calibri;">Sign In..!</h1>
                        <p style="font-family: calibri;">Orchid Store login</p>
                    </div>
                </div>
                <div Class="col-lg-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Sign In
                        </div>
                        <div class="panel-body">

                            <form class="form-horizontal">
                                <fieldset>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="name">Username / E-Mail :</label>  
                                        <div class="col-md-4">
                                            <input id="name" name="name" type="text" placeholder="" class="form-control input-md" required="">

                                        </div>
                                    </div>

                                    <!-- Password input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="password">Password :</label>
                                        <div class="col-md-4">
                                            <input id="password" name="password" type="password" placeholder="" class="form-control input-md" required="">

                                        </div>
                                    </div>

                                    <!-- Multiple Checkboxes (inline) -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="remember"></label>
                                        <div class="col-md-4">
                                            <label class="checkbox-inline" for="remember-0">
                                                <input type="checkbox" name="remember" id="remember-0" value="">
                                                Remember Me
                                            </label>
                                        </div>
                                    </div>

                                    <!-- Button -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="login"></label>
                                        <div class="col-md-4">
                                            <button id="login" name="login" class="btn btn-success">Log In</button>
                                        </div>
                                    </div>

                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <hr/>

        <a id="Signup"></a>
        <!-- Sign Up Section -->
        <section>        
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Sign Up
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" name="signup" method="POST">
                                <fieldset>  
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="username">Username :</label>  
                                        <div class="col-md-4">
                                            <input id="username" name="username" type="text" placeholder="" class="form-control input-md" required="">

                                        </div>
                                    </div>

                                    <!-- Password input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="pass1">Password :</label>
                                        <div class="col-md-6">
                                            <input id="pass1" name="pass1" type="password" placeholder="password" class="form-control input-md" required="" >

                                            <input id="Password1" name="pass2" type="password" placeholder="confirm password" class="form-control input-md" required="" >
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="email">E-Mail :</label>  
                                        <div class="col-md-4">
                                            <input id="eMail" name="email" type="email" placeholder="" class="form-control input-md" required="">

                                        </div>
                                    </div>

                                    <!-- Button -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="submit"></label>
                                        <div class="col-md-4">
                                            <button id="submit" name="submit" class="btn btn-info" onsubmit="return validateForm()">Register To BookStore</button>
                                        </div>
                                    </div>

                                </fieldset>
                            </form>

                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="jumbotron text-center">
                        <h1 class="" style="font-family: calibri;">Sign Up..!</h1>
                        <p style="font-family: calibri;">Orchid Store register</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- About Section -->
        <section id="About">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 ">
                        about
                    </div>
                    <div class="col-md-4">
                        about
                    </div>
                    <div class="col-md-4">
                        about
                    </div>
                </div>
            </div>
        </section>

        <section id="contact">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 class="section-heading">Contact Us</h2>
                        <h3 class="section-subheading text-muted" style="color: #CC6600;">Orchid Store Customer Service</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <form name="sentMessage" id="contactForm" novalidate>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Your Name *" id="name" required data-validation-required-message="Please enter your name.">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                    <div class="form-group">
                                        <input type="email" class="form-control" placeholder="Your Email *" id="email" required data-validation-required-message="Please enter your email address.">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control" placeholder="Your Message *" id="message" required data-validation-required-message="Please enter a message."></textarea>
                                        <p class="help-block text-danger"></p>
                                    </div>                                
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-lg-12 text-center">
                                    <div id="success"></div>
                                    <button type="submit" class="btn btn-xl">Send Message</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <span class="copyright">Copyright &copy; Orchid Book Store 2015</span>
                    </div>
                    <div class="col-md-4">

                    </div>
                    <div class="col-md-4">
                        <ul class="list-inline social-buttons">
                            <li><a href="https://www.twitter.com/#OrchidBookStore" target="_blank"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="https://www.facebook.com/#OrchidBookStore" target="_blank"><i class="fa fa-facebook"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>

        <!-- jQuery -->
        <script src="startpage/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="startpage/js/bootstrap.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <script src="startpage/js/classie.js"></script>
        <script src="startpage/js/cbpAnimatedHeader.js"></script>

        <!-- Contact Form JavaScript -->
        <script src="startpage/js/jqBootstrapValidation.js"></script>
        <script src="startpage/js/contact_me.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="startpage/js/agency.js"></script>

    </body>
</html>
