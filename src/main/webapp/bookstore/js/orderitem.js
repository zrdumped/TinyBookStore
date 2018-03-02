$(function() {

	$("#save").click(function(e) {
		var orderid = $("#orderid").val();
		var bookid = $("#bookid").val();
		var amount = $("input[name='amount']").val();
		var price = $("input[name='price']").val();
		console.log(orderid, bookid, amount, price);
		var dataset = e.currentTarget.dataset;
		var id = dataset.id;
			jQuery.ajax({
				url : 'addOrderitemPro',
				processData : true,
				dataType : "text",
				data : {
					orderid : orderid,
					bookid : bookid,
					amount : amount,
					price : price
				},
				success : function(data) {
					bootbox.alert({
						message : 'Add Successfully! ',
						callback : function() {
							location.reload();
						}
					});
				}
			})
		

		$('#modal').modal('hide');
	});
	
	$("#update").click(function(e) {
		var orderid = $("#orderid").val();
		var bookid = $("#bookid").val();
		var amount = $("input[name='amount']").val();
		var price = $("input[name='price']").val();
		console.log(orderid, bookid, amount, price);
		
		var dataset = e.currentTarget.dataset;
		var id = dataset.id;
			jQuery.ajax({
				url : 'updateOrderitemPro',
				processData : true,
				dataType : "text",
				data : {
					id : id,
					orderid : orderid,
					bookid : bookid,
					amount : amount,
					price : price
				},
				success : function(data) {
					console.log(id);
					bootbox.alert({
						message : 'Add Successfully! ',
						callback : function() {
							location.reload();
						}
					});
				}
			})
		

		$('#modal1').modal('hide');
	});


	$(".delete").click(function(e) {
		bootbox.confirm({
			buttons : {
				confirm : {
					label : 'Delete'
				},
				cancel : {
					label : 'Cancel'
				}
			},
			message : 'Sure to delete?',
			callback : function(result) {
				if (result) {

					var dataset = e.currentTarget.dataset;
					var id = dataset.id;
					jQuery.ajax({
						url : 'deleteOrderitemPro',
						processData : true,
						dataType : "text",
						data : {
							id : id
						},
						success : function(data) {
							console.log(id);
							bootbox.alert({
								message : 'Delete Successfully! ',
							    callback : function() {
									location.reload();
								}
							});
						}
					});

				}
			}
		});
	});

	$("#add").click(function(e) {
		$('#modalTitle').html("Add");

		$("#orderid").val("");
		$("#bookid").val("");
		$("input[name='amount']").val("");
		$("input[name='price']").val("");

		$("#save").attr("data-id", "");
		$('#modal').modal('show');
	});

	$(".edit").click(function(e) {
		$('#modalTitle1').html("Edit");
		var dataset = e.currentTarget.dataset;
		var id = dataset.id;
		console.log(id);

		$("#orderid").val(dataset.orderid);
		$("#bookid").val(dataset.bookid);
		$("input[name='price']").val(dataset.price);
		$("input[name='amount']").val(dataset.amount);

		$("#update").attr("data-id", dataset.id);
		$('#modal1').modal('show');
	});

});
