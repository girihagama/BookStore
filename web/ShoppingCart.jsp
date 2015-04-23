<%-- 
    Document   : ShoppingCart
    Created on : Apr 21, 2015, 12:41:40 PM
    Author     : Indunil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>My Shopping Cart</title>
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
        </script>

        <!--internal JS end-->   
    </head>

    <jsp:include page="header.jsp"></jsp:include>

    <body style="margin:5px;">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">

                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title" style="font-family:calibri;">
                                <center>Shopping Cart Total</center>
                            </h3>
                        </div>
                        <div class="panel-body" style="font-family:calibri;">
                            <center>
                                <font color="red"> RS. </font>
                            </center>
                        </div>
                        <div class="panel-footer">
                            <button type="submit" style="font-family:calibri;" class="btn btn-lg btn-warning navbar-btn btn-block" style="border-radius:0px;">
                                <span class="glyphicon glyphicon-shopping-cart"></span>
                                Checkout
                            </button>
                        </div>
                    </div>

                    <div class="panel-group" id="panel-664082">

                        <form method="" action="">
                            <div class="panel panel-default">
                                <div class="panel-heading">						
                                    <button type="submit" class="btn btn-sm btn-danger navbar-btn" style="border-radius:0px;">
                                        <span class="glyphicon glyphicon-minus-sign"></span>
                                        Remove
                                    </button>
                                    <a style="font-family:calibri;" class="panel-title" data-toggle="collapse" data-parent="#panel-664082" href="#panel-element-504340">Item : Item #</a>
                                </div>
                                <div id="panel-element-504340" class="panel-collapse in">
                                    <div class="panel-body" style="font-family:calibri;">
                                        <span class="glyphicon glyphicon-book"></span>
                                        Qty: 
                                        <br>
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                        Price:	

                                        <button type="submit" class="btn btn-sm btn-danger navbar-btn btn-block" style="border-radius:0px;">
                                            <span class="glyphicon glyphicon-shopping-cart"></span>
                                            Remove
                                        </button>											
                                    </div>
                                </div>
                            </div>
                        </form>

                        <br/>

                        <form method="" action="">
                            <div class="panel panel-default">
                                <div class="panel-heading">						
                                    <button type="submit" class="btn btn-sm btn-danger navbar-btn" style="border-radius:0px;">
                                        <span class="glyphicon glyphicon-minus-sign"></span>
                                        Remove
                                    </button>
                                    <a style="font-family:calibri;" class="panel-title" data-toggle="collapse" data-parent="#panel-664082" href="#panel-element-504341">Item : Item #</a>
                                </div>
                                <div id="panel-element-504341" class="panel-collapse in">
                                    <div class="panel-body" style="font-family:calibri;">
                                        <span class="glyphicon glyphicon-book"></span>
                                        Qty: 
                                        <br>
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                        Price:	

                                        <button type="submit" class="btn btn-sm btn-danger navbar-btn btn-block" style="border-radius:0px;">
                                            <span class="glyphicon glyphicon-shopping-cart"></span>
                                            Remove
                                        </button>											
                                    </div>
                                </div>
                            </div>
                        </form>

                        <br/>

                        <form method="" action="">
                            <div class="panel panel-default">
                                <div class="panel-heading">						
                                    <button type="submit" class="btn btn-sm btn-danger navbar-btn" style="border-radius:0px;">
                                        <span class="glyphicon glyphicon-minus-sign"></span>
                                        Remove
                                    </button>
                                    <a style="font-family:calibri;" class="panel-title" data-toggle="collapse" data-parent="#panel-664082" href="#panel-element-504342">Item : Item #</a>
                                </div>
                                <div id="panel-element-504342" class="panel-collapse in">
                                    <div class="panel-body" style="font-family:calibri;">
                                        <span class="glyphicon glyphicon-book"></span>
                                        Qty: 
                                        <br>
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                        Price:	

                                        <button type="submit" class="btn btn-sm btn-danger navbar-btn btn-block" style="border-radius:0px;">
                                            <span class="glyphicon glyphicon-shopping-cart"></span>
                                            Remove
                                        </button>											
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>			

                </div>
            </div>
        </div>
    </body>
</html>
