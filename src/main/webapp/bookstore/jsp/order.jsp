<%@ page import="java.util.ArrayList"%>
<%@ page import="model.Order"%>
<%@ page import="model.Orderitem"%>
<%@ page import="model.User"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.Iterator"%>
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
<link href="<%=path%>/bookstore/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="bookstore/css/bootstrap.min.css">  
	<script src="bookstore/js/jquery.min.js"></script>
	<script src="bookstore/js/bootstrap.min.js"></script>

</head>

<body>
	<%
		ArrayList<Order> orderList = new ArrayList<Order>();
		if (request.getAttribute("orders") != null) {
		    orderList = (ArrayList<Order>) request.getAttribute("orders");
		}
		ArrayList<User> userList = new ArrayList<User>();
		if(request.getAttribute("users") != null) {
			userList = (ArrayList<User>) request.getAttribute("users");	
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
				<li class="active"><a href="allOrdersPro"><span class="glyphicon glyphicon-th-list"  style="padding-bottom:7px">Order</span></a></li>
				<li><a href="allOrderitemsPro"><span class="glyphicon glyphicon-th">Orderitem</span></a></li>
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
							<font style="font-size:30px">Orders</font>
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
											<th>Userid</th>
											<th>Date</th>
											<th>Orderitem ID List</th>
											<th>Total price</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<%
											for (int i = 0; i < orderList.size(); i++) {
												Order order = orderList.get(i);
												Double tot_price = 0.0;
												Set<Orderitem> orderitems = order.getOrderitems();
												ArrayList<String> orderitemStr = new ArrayList<String>();
																												
												Iterator iterator = orderitems.iterator();     
												while(iterator.hasNext()){
													Orderitem item = (Orderitem)iterator.next();
													orderitemStr.add(item.getId()+"");
													tot_price += item.getPrice();
												}
										%>
										<tr>
											<td><%=order.getId()%></td>
											<td><%=order.getUserid()%></td>
											<td><%=order.getDate()%></td>
											<td><%=orderitemStr%></td>
											<td><%=tot_price/100%></td>
											<td>
												<button class="btn btn-default delete" type="button"
													data-id="<%=order.getId()%>">
													<i class="fa fa-trash"></i>
												</button>
												<button class="btn btn-default edit" type="button"
													data-id="<%=order.getId()%>"
													data-userid="<%=order.getUserid()%>"
													data-date="<%=order.getDate()%>">
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
							<form role="form">
								<div class="form-group">
									<label>Userid</label>
									<select class="form-control" id="userid">
										<%
											for (int i = 0; i < userList.size(); i++) {
												User user = userList.get(i);
										%>
										<option value="<%=user.getId()%>"><%=user.getId()%></option>
										<%
											}
										%>
									</select>
								</div>
								<div class="form-group">
									<label>Date </label>
									<div id="time">    
                						<script>     
                							document.getElementById('time').innerHTML=new Date().toLocaleString();     
                							setInterval("document.getElementById('time').innerHTML=new Date().toLocaleString();",1000);  
                						</script>    
									</div>
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

	<script src="<%=path%>/bookstore/js/jquery.min.js"></script>
	<script src="<%=path%>/bookstore/js/bootstrap.min.js"></script>
	<script src="<%=path%>/bookstore/js/jquery.dataTables.min.js"></script>
	<script src="<%=path%>/bookstore/js/dataTables.bootstrap.min.js"></script>
	<script src="<%=path%>/bookstore/js/bookstore.js"></script>
	<script src="<%=path%>/bookstore/js/bootbox.min.js"></script>

	<script src="<%=path%>/bookstore/js/order.js"></script>

	<script>
		$(document).ready(function() {
			$('#dataTables').DataTable({
				responsive : true
			});
		});
	</script>

</body>

</html>

