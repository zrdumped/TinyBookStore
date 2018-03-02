<%@ page import="java.util.ArrayList"%>
<%@ page import="model.Book"%>
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
 <script type="text/javascript">
    function doAjaxCall()
    {
    	var detail = document.getElementById("detail").innerText;
        var request=null;
        if(window.XMLHttpRequest)
        {
            request=new XMLHttpRequest();
        }else if(window.ActiveXObject)
        {
            request=new ActiveXObject("Microsoft.XMLHTTP");
        }
        if(request)
        {
            request.open("GET","bookstore/" + detail,true);

            request.onreadystatechange=function()
            {
                if(request.readyState===4)
                {
                    if (request.status == 200 || request.status == 0)
                    {
                    	document.getElementById("more").innerHTML=request.responseText;
                    }
                }
            }
            request.send(null);
        }else{
            alert("error");
            }
    }                   
  </script>
  
 <style type="text/css"> 
.AutoNewline 
{ 
  Word-break: break-all;
</style>

</head>

<body>
	<%
		ArrayList<Book> bookList = new ArrayList<Book>();
			if (request.getAttribute("books") != null) {
		bookList = (ArrayList<Book>) request.getAttribute("books");
			}
	%>
<nav class="navbar  navbar-default " role="navigation">
	<div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="allBooksClientPro">BOOK STORE</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            	<li class="active"><a href="allBooksPro"><span class="glyphicon glyphicon-book"  style="padding-bottom:7px">Book</span></a></li>
				<li><a href="allUsersPro"><span class="glyphicon glyphicon-user">User</span></a></li>
				<li><a href="allOrdersPro"><span class="glyphicon glyphicon-th-list">Order</span></a></li>
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
							<font style="font-size:30px">Book</font>
							<button class="btn btn-default" type="button" id="add"  style="floating:right">
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
											<th>Title</th>
											<th>Author</th>
											<th>Price</th>
											<th>Publisher</th>
											<th>Image</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<%
											for (int i = 0; i < bookList.size(); i++) {
																				Book book = bookList.get(i);
										%>
										<tr>
										    <td><%=book.getId()%></td>
											<td><%=book.getTitle()%></td>
											<td><%=book.getAuthor()%></td>
											<td><%=book.getPrice()/100.0%></td>
											<td><%=book.getPublisher()%></td>
											<td><img src="bookstore/<%=book.getImage()%>" style="height:80px;width:70px"></td>
											<td>
												<button class="btn btn-default delete" type="button"
													data-id="<%=book.getId()%>">
													<i class="fa fa-trash"></i>
												</button>
												<button class="btn btn-default edit" type="button"
													data-id="<%=book.getId()%>"
													data-title="<%=book.getTitle()%>"
													data-author="<%=book.getAuthor()%>"
													data-price="<%=book.getPrice()/100.0%>"
													data-publisher="<%=book.getPublisher()%>"
													data-date="<%=book.getDate()%>"
													data-stock="<%=book.getStock()%>"
													data-detail="<%=book.getDetail()%>"
													data-image="<%=book.getImage()%>"
													data-type="<%=book.getType()%>">
													<i class="fa fa-edit"></i>
												</button>
												<button class="btn btn-default detail" type="button"
													data-id="<%=book.getId()%>"
													data-title="<%=book.getTitle()%>"
													data-author="<%=book.getAuthor()%>"
													data-price="<%=book.getPrice()/100.0%>"
													data-publisher="<%=book.getPublisher()%>"
													data-date="<%=book.getDate()%>"
													data-stock="<%=book.getStock()%>"
													data-detail="<%=book.getDetail()%>"
													data-image="<%=book.getImage()%>"
													data-type="<%=book.getType()%>">
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
									<label>Title</label> <input class="form-control" name="title">
								</div>
								<div class="form-group">
									<label>Author</label> <input class="form-control" name="author">
								</div>
								<div class="form-group">
									<label>Price</label> <input class="form-control" type="number"
										step="0.01" name="price">
								</div>
								<div class="form-group">
									<label>Stock</label> <input class="form-control" type="number"
										step="1" name="stock">
								</div>
								<div class="form-group">
									<label>Detail</label> <input class="form-control" 
										name="detail">
								</div>
								<div class="form-group">
									<label>Image</label> <input class="form-control"
											name="image">
								</div>
								<div class="form-group">
									<label>Publisher</label> <input class="form-control"
										name="publisher">
								</div>
								<div class="form-group">
									<label>Date</label> <input class="form-control" type="datetime-local" id="date"
										name="date">
								</div>
								<div class="form-group">
									<label>Type</label> <input class="form-control"
										name="type">
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
									<label>Title</label><p class="form-control-static" id="title"></p>
								</div>
								<div class="form-group">
									<label>Author</label><p class="form-control-static" id="author"></p>
								</div>
								<div class="form-group">
									<label>Price</label><p class="form-control-static" id="price"></p>
								</div>
								<div class="form-group">
									<label>Stock</label><p class="form-control-static" id="stock"></p>
								</div>
								<div class="form-group">
									<label>Detail</label> 
									<p><a class="form-control-static" id="detail"  onclick="doAjaxCall();"></a><div id="more"></div></p>
								</div>
								<div class="form-group">
									<label>Image</label> <p class="form-control-static" id="image"></p>
								</div>
								<div class="form-group">
									<label>Publisher</label> <p class="form-control-static" id="publisher"></p>
								</div>
								<div class="form-group">
									<label>Date</label> <p class="form-control-static" id="date2"></p>
								</div>
								<div class="form-group">
									<label>Type</label> <p class="form-control-static" id="type"></p>
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

	<script src="<%=path%>/bookstore/js/book.js" ></script>

	<script>
		$(document).ready(function() {
			$('#dataTables').DataTable({
				responsive : true
			});
		});
	</script>
	

</body>

</html>

