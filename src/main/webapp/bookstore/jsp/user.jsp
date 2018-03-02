<%@ page import="java.util.ArrayList"%>
<%@ page import="model.User"%>
<%@ page import="model.UserMongoInfo"%>
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
		ArrayList<User> userList = new ArrayList<User>();
	ArrayList<UserMongoInfo> userInfoList = new ArrayList<UserMongoInfo>();
			if (request.getAttribute("users") != null) {
		userList = (ArrayList<User>) request.getAttribute("users");
		userInfoList = (ArrayList<UserMongoInfo>) request.getAttribute("userMongoInfos");
		
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
				<li class="active"><a href="allUsersPro"><span class="glyphicon glyphicon-user" style="padding-bottom:7px">User</span></a></li>
				<li><a href="allOrdersPro"><span class="glyphicon glyphicon-th-list" >Order</span></a></li>
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
							<font style="font-size:30px">Users</font>
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
											<th>Username</th>
											<th>Password</th>
											<th>Role</th>
											<th>Photo</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<%
											for (int i = 0; i < userList.size(); i++) {
																				User user = userList.get(i);
																				UserMongoInfo userMongoInfo = userInfoList.get(i);
																				
										%>
										<tr>
										    <td><%=user.getId()%></td>
											<td><%=user.getUsername()%></td>
											<td><%=user.getPassword()%></td>
											<td><%=user.getRole()%></td>
											<td><img id="<%=user.getUsername()%>" style="width:50px;height:50px"></td>
											<script>
											$("#"+"<%=user.getUsername()%>").attr("src","getPhotoPro?type=" + <%=user.getId()%>);
											$("#"+"<%=user.getUsername()%>").bind("error", function(){
												this.onerror='';
												this.src = "bookstore/img/default.png";
											})
											</script>
											<td>
												<button class="btn btn-default delete" type="button"
													data-id="<%=user.getId()%>">
													<i class="fa fa-trash"></i>
												</button>
												<button class="btn btn-default edit" type="button"
													data-id="<%=user.getId()%>"
													data-username="<%=user.getUsername()%>"
													data-password="<%=user.getPassword()%>"
													data-role="<%=user.getRole()%>">
													<i class="fa fa-edit"></i>
												</button>
												<button class="btn btn-default detail" type="button
													data-id="<%=user.getId()%>"
													data-username="<%=user.getUsername()%>"
													data-password="<%=user.getPassword()%>"
													data-role="<%=user.getRole()%>"
													data-sex="<%=userMongoInfo.getSex()%>"
													data-phone="<%=userMongoInfo.getPhone()%>"
													data-country="<%=userMongoInfo.getCountry()%>"
													data-city="<%=userMongoInfo.getCity()%>"
													data-email="<%=userMongoInfo.getEmail()%>"
													data-age="<%=userMongoInfo.getAge()%>"
													data-job="<%=userMongoInfo.getJob()%>">
													<i class="fa fa-ellipsis-h"></i>
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
									<label>Username</label> <input class="form-control" name="username">
								</div>
								<div class="form-group">
									<label>Password</label> <input class="form-control"
										name="password">
								</div>
								<div class="form-group">
									<label>Role</label>							
												<select class="form-control" id="userrole">
												<option value="user">User</option>
												<option value="admin">Admin</option>
									</select>
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
	
		<div class="modal fade" id="modal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="modalTitle2"></h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12">
							<form role="form">
								<div class="form-group">
									<label>Username</label><p class="form-control-static" id="username"></p>
								</div>
								<div class="form-group">
									<label>Password</label><p class="form-control-static" id="password"></p>
								</div>
								<div class="form-group">
									<label>Sex</label><p class="form-control-static" id="sex"></p>
								</div>
								<div class="form-group">
									<label>City</label><p class="form-control-static" id="city"></p>
								</div>
								<div class="form-group">
									<label>Country</label> <p class="form-control-static" id="country"></p>
								</div>
								<div class="form-group">
									<label>Phone</label> <p class="form-control-static" id="phone"></p>
								</div>
								<div class="form-group">
									<label>Email</label> <p class="form-control-static" id="email"></p>
								</div>
								<div class="form-group">
									<label>Age</label> <p class="form-control-static" id="age"></p>
								</div>
								<div class="form-group">
									<label>Job</label> <p class="form-control-static" id="job"></p>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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

	<script src="<%=path%>/bookstore/js/user.js"></script>

	<script>
		$(document).ready(function() {
			$('#dataTables').DataTable({
				responsive : true
			});
		});
	</script>

</body>

</html>

