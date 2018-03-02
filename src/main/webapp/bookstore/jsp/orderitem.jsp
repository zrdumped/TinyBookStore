<%@ page import="java.util.ArrayList"%>
<%@ page import="model.Book"%>
<%@ page import="model.Order"%>
<%@ page import="model.Orderitem"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>BookStore</title>

<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/bookstore/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/bookstore/css/dataTables.bootstrap.css"
	rel="stylesheet">
<link href="<%=path%>/bookstore/css/dataTables.responsive.css"
	rel="stylesheet">
<link href="<%=path%>/bookstore/css/bookstore.css" rel="stylesheet">
<link href="<%=path%>/bookstore/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	     <link rel="stylesheet" href="bookstore/css/validation.css">
			<link rel="stylesheet" href="bookstore/css/bootstrap.min.css">  
	<script src="bookstore/js/jquery.min.js"></script>
	<script src="bookstore/js/bootstrap.min.js"></script>
		
<script>
function showHint(amount, bookid)
{
	if(bookid.length==0){
		return;
	}
	var xmlhttp;
	if (window.XMLHttpRequest) 	
	{// code for IE7+, Firefox, Chrome, Opera, Safari
  		xmlhttp=new XMLHttpRequest();
  	}
	else
  	{// code for IE6, IE5
  		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
 	 }
	xmlhttp.onreadystatechange=function()
 	{
  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    	{
   		 	document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
    	}
  	}
	xmlhttp.open("GET","calPricePro?amount="+amount+"&bookid="+bookid,true);
	xmlhttp.send();
}
</script> 
</head>

<body>
	<%
		ArrayList<Orderitem> orderitemList = new ArrayList<Orderitem>();
	    if (request.getAttribute("orderitems") != null) {
		    orderitemList = (ArrayList<Orderitem>) request.getAttribute("orderitems");
		}
	    ArrayList<Order> orderList = new ArrayList<Order>();
	    if(request.getAttribute("orders") != null) {
	    	orderList = (ArrayList<Order>) request.getAttribute("orders");
	    }
	    ArrayList<Book> bookList = new ArrayList<Book>();
	    if(request.getAttribute("books") != null) {
	    	bookList = (ArrayList<Book>) request.getAttribute("books");
	    }
	%>
		<!-- Navigation -->
		<nav class="navbar  navbar-default " role="navigation">
	<div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="allBooksClientPro">BOOK STORE</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            	<li><a href="allBooksPro"><span class="glyphicon glyphicon-book">Book</span></a></li>
				<li><a href="allUsersPro"><span class="glyphicon glyphicon-user">User</span></a></li>
				<li><a href="allOrdersPro"><span class="glyphicon glyphicon-th-list">Order</span></a></li>
				<li><a href="allOrderitemsPro"  class="active"><span class="glyphicon glyphicon-th" style="padding-bottom:7px">Orderitem</span></a></li>
				<li><a href="salesBookPro"><span class="glyphicon glyphicon-stats">Statistic</span></a></li>
        </ul>
    </div>
	</div>
</nav>
			<!-- /.row -->
			<div class="container-fluid row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<font style="font-size:30px">Orderitems</font>
							<button class="btn btn-default" type="button" id="add">
								<i class="fa fa-plus"></i>
							</button>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables">
									<thead>
										<tr>
										    <th>ID</th>
											<th>Orderid</th>
											<th>Bookid</th>
											<th>Amount</th>
											<th>Price</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<%
											for (int i = 0; i < orderitemList.size(); i++) {
																				Orderitem orderitem = orderitemList.get(i);
										%>
										<tr>
										    <td><%=orderitem.getId()%></td>
											<td><%=orderitem.getOrderid()%></td>
											<td><%=orderitem.getBookid()%></td>
											<td><%=orderitem.getAmount()%></td>
											<td><%=orderitem.getPrice()/100.0%></td>
											<td>
												<button class="btn btn-default delete" type="button"
													data-id="<%=orderitem.getId()%>">
													<i class="fa fa-trash"></i>
												</button>
												<button class="btn btn-default edit" type="button"
													data-id="<%=orderitem.getId()%>"
													data-orderid="<%=orderitem.getOrderid()%>"
													data-bookid="<%=orderitem.getBookid()%>"
													data-amount="<%=orderitem.getAmount()%>"
													data-price="<%=orderitem.getPrice()/100.0%>">
													<i class="fa fa-edit"></i>
												</button>
											</td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

	<div class="modal fade" id="modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="modalTitle"></h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12">
							<form role="form" id="registerform1">
								<div class="form-group">
								    <label>Orderid</label>
								    <select class="form-control" id="orderid">
										<%
											for (int i = 0; i < orderList.size(); i++) {
												Order order = orderList.get(i);
										%>
										<option value="<%=order.getId()%>"><%=order.getId()%></option>
										<%
											}
										%>
									</select>
								</div>
								<div class="form-group">
								    <label>Bookid</label>
								    <select class="form-control" id="bookid">
										<%
											for (int i = 0; i < bookList.size(); i++) {
												Book book = bookList.get(i);
										%>
										<option id="bookid" value="<%=book.getId()%>"><%=book.getId()%></option>
										<%
											}
										%>
									</select>
								</div>
								<div class="form-group">
									<label>Amount</label> <input class="form-control" type="number" min="1"
										name="amount" onkeyup="showHint(this.value, bookid.value)">
								</div>
								<div class="form-group">
									<label>Price</label>  <span id="txtHint"></span></p> 
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="save">Save</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="modalTitle1"></h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12">
							<form role="form" id="registerform2">
								<div class="form-group">
								    <label>Orderid</label>
								    <select class="form-control" id="orderid">
										<%
											for (int i = 0; i < orderList.size(); i++) {
												Order order = orderList.get(i);
										%>
										<option value="<%=order.getId()%>"><%=order.getId()%></option>
										<%
											}
										%>
									</select>
								</div>
								<div class="form-group">
								    <label>Bookid</label>
								    <select class="form-control" id="bookid">
										<%
											for (int i = 0; i < bookList.size(); i++) {
												Book book = bookList.get(i);
										%>
										<option id="bookid" value="<%=book.getId()%>"><%=book.getId()%></option>
										<%
											}
										%>
									</select>
								</div>
								<div class="form-group">
									<label>Amount</label> <input class="form-control" type="number" min="1"
										name="amount" step="1">
								</div>
								<div class="form-group">
									<label>Price</label> <input class="form-control" type="number"
										name="price" step="0.01">
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="update">Save</button>
				</div>
			</div>
		</div>
	</div>

	<script src="<%=path%>/bookstore/js/jquery.min.js"></script>
	<script src="<%=path%>/bookstore/js/bootstrap.min.js"></script>
	<script src="<%=path%>/bookstore/js/jquery.dataTables.min.js"></script>
	<script src="<%=path%>/bookstore/js/dataTables.bootstrap.min.js"></script>
	<script src="<%=path%>/bookstore/js/bookstore.js"></script>
	<script src="<%=path%>/bookstore/js/bootbox.min.js"></script>

	<script src="<%=path%>/bookstore/js/orderitem.js"></script>

	<script>
		$(document).ready(function() {
			$('#dataTables').DataTable({
				responsive : true
			});
		});
	</script>
	<script src="bookstore/js/jquery.validate.min.js"></script>
	                        <script>
                window.onload = function(){
                $("#registerform1").validate({
            		messages:{
            			amount:{
            				min:"The amount must larger than 0"
            			}
            		}});
                $("#registerform2").validate({
            		messages:{
            			amount:{
            				min:"The amount must larger than 0"
            			}
            		}});
                }
        </script>

</body>

</html>

