<%-- 
    Document   : clientHeader
    Created on : Mar 27, 2015, 1:32:04 PM
    Author     : Chami
--%>
<%@include file="userNameAndAdminLeve.jsp"%> 
<div class="row"><div class="col-md-10">&nbsp;</div></div>
<div class="row">
    <div class="col-md-10"></div>
    <div class="col-md-2">
        <!-- Split button -->
        <div class="btn-group">
            <button type="button" class="btn btn-warning"><%=username%></button>
            <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                <span class="caret"></span>
                <span class="sr-only">Toggle Dropdown</span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="http://localhost:8080/BookStore/adminPanel/modifyAccountDetails.jsp">My Account</a></li>
                <li class="divider"></li>
                <li><a href="#">Logout</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-1">
        <img src="http://localhost:8080/BookStore/adminPanel/Images/Page icons/BookIcon.png" class="img-responsive" width="100%"alt="Responsive image">
    </div>
    <div class="col-md-11">
        <font color=#FF7519><h1><strong>Orchid Book Store</strong><small>&nbsp; Admin Panel</small></h1></font>
    </div>
</div>
<div class="row">
    <img src="http://localhost:8080/BookStore/adminPanel/Images/Orthers/line.png" width="100%" alt="Responsive image">
</div>
<%-- sub menus--%>
<div class="row">
    <div class="col-lg-1">
        <a href="http://localhost:8080/BookStore/adminPanel/adminStartPage.jsp"><img src="http://localhost:8080/BookStore/adminPanel/Images/Page icons/Home.png" class="image" width="100%" alt="Responsive image" data-toggle="tooltip" data-placement="bottom" title="Home"></a>
    </div>
    <div class="col-lg-1">
        <a href="http://localhost:8080/BookStore/adminPanel/addBook.jsp"><img src="http://localhost:8080/BookStore/adminPanel/Images/Page icons/Books.png" class="image" width="100%" alt="Responsive image" data-toggle="tooltip" data-placement="bottom" title="Books" ></a>
    </div>
    <div class="col-lg-1">
        <a href="http://localhost:8080/BookStore/adminPanel/addAuthors.jsp"><img src="http://localhost:8080/BookStore/adminPanel/Images/Page icons/Author.png" class="image" width="100%" alt="Responsive image" data-toggle="tooltip" data-placement="bottom" title="Authors"></a>
    </div>
    <div class="col-lg-1">
        <img src="http://localhost:8080/BookStore/adminPanel/Images/Page icons/Clients.png" class="image" width="100%" alt="Responsive image" data-toggle="tooltip" data-placement="bottom" title="Clients" style="opacity: 0.5">
    </div>
    <div class="col-lg-1">
        <a href="http://localhost:8080/BookStore/adminPanel/adminDetails.jsp"><img src="http://localhost:8080/BookStore/adminPanel/Images/Page icons/Admin.png" class="image" width="100%" alt="Responsive image" data-toggle="tooltip" data-placement="bottom" title="Admins"></a>
    </div>
    <div class="col-lg-1">
        <a href="http://localhost:8080/BookStore/adminPanel/searchStock.jsp"><img src="http://localhost:8080/BookStore/adminPanel/Images/Page icons/Stocks.png" class="image" width="100%" alt="Responsive image" data-toggle="tooltip" data-placement="bottom" title="Stocks"></a>
    </div>
    <div class="col-lg-1">
        <a href="http://localhost:8080/BookStore/adminPanel/addSuppliers.jsp"><img src="http://localhost:8080/BookStore/adminPanel/Images/Page icons/Suppliers.png" class="image" width="100%" alt="Responsive image" data-toggle="tooltip" data-placement="bottom" title="Suppliers"></a>
    </div>
    <div class="col-lg-1">
        <a href="http://localhost:8080/BookStore/adminPanel/orders.jsp"><img src="http://localhost:8080/BookStore/adminPanel/Images/Page icons/Order.png" class="image" width="100%" alt="Responsive image" data-toggle="tooltip" data-placement="bottom" title="Orders"></a>
    </div>
</div>    
<div class="row">
    <img src="http://localhost:8080/BookStore/adminPanel/Images/Orthers/orange line.png"width="100%" alt="Responsive image"">
</div>
<script type="text/javascript">
    $(function() {
        $('[data-toggle="tooltip"]').tooltip()
    })
</script>