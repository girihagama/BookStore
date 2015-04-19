<%-- 
    Document   : Slider
    Created on : Apr 19, 2015, 1:08:38 PM
    Author     : Indunil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Slider</title>

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
        </script>

        <!--internal JS end-->          
    </head>
    <body>	    
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="carousel slide" id="carousel-48113">
                        <ol class="carousel-indicators">
                            <li data-slide-to="0" data-target="#">
                            </li>
                            <li data-slide-to="1" data-target="#">
                            </li>
                            <li data-slide-to="2" data-target="#" class="active">
                            </li>
                        </ol>
                        <div class="carousel-inner thumbnail" >
                            
                            <div class="item active">
                                <img alt="" src="indunil_files/Resources/images/1.jpg" />
                            </div>
                            
                            <div class="item">
                                <img alt="" src="indunil_files/Resources/images/2.jpg" />
                            </div>
                            <div class="item">
                                <img alt="" src="indunil_files/Resources/images/3.jpg" />
                            </div>
                        </div> <a class="left carousel-control" href="#carousel-48113" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-48113" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
