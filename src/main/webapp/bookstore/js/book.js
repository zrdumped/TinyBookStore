$(function() {

	$("#save").click(function(e) {
		var title = $("input[name='title']").val();
		var author = $("input[name='author']").val();
		var price = $("input[name='price']").val();
		var publisher = $("input[name='publisher']").val();
		var date = $("input[name='date']").val();
		var stock = $("input[name='stock']").val();
		var detail = $("input[name='detail']").val();
		var image = $("input[name='image']").val();
		var type = $("input[name='type']").val();
		console.log(title, author, price, publisher, date, stock, detail, image, type);

		var dataset = e.currentTarget.dataset;
		var id = dataset.id
		if (id != "") { // Edit
			jQuery.ajax({
				url : 'updateBookPro',
				processData : true,
				dataType : "text",
				contentType : "text/html;charset=utf-8",
				data : {
					id : id,
					title : encodeURI(encodeURI(title)),
					author : encodeURI(encodeURI(author)),
					price : price,
					publisher : encodeURI(encodeURI(publisher)),
					date : date,
					stock : stock,
					detail : detail,
					image : image,
					type : type
				},
				success : function(data) {
					console.log(id);
					bootbox.alert({
						message : 'Modify Successfully! ',
					    callback : function() {
							location.reload();
						}
					});
					
				}
			});
		} else { // Add
			jQuery.ajax({
				url : 'addBookPro',
				processData : true,
				dataType : "text",
				data : {
					title : encodeURI(encodeURI(title)),
					author : encodeURI(encodeURI(author)),
					price : price,
					publisher : encodeURI(encodeURI(publisher)),
					date : date,
					stock : stock,
					detail : detail,
					image : image,
					type : type
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
		}

		$('#modal').modal('hide');
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
						url : 'deleteBookPro',
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

		$("input[name='title']").val("");
		$("input[name='author']").val("");
		$("input[name='price']").val("");
		$("input[name='publisher']").val("");
		$("input[name='date']").val("");
		$("input[name='stock']").val("");
		$("input[name='detail']").val("");
		$("input[name='image']").val("");
		$("input[name='type']").val("");
		

		$("#save").attr("data-id", "");
		$('#modal').modal('show');
	});

	$(".edit").click(function(e) {
		$('#modalTitle').html("Edit");
		var dataset = e.currentTarget.dataset;
		var id = dataset.id;
		console.log(id);
		date = dataset.date.split(" ");
		date = date[0] + 'T' + date[1];
		$("input[name='title']").val(dataset.title);
		$("input[name='author']").val(dataset.author);
		$("input[name='price']").val(dataset.price);
		$("input[name='publisher']").val(dataset.publisher);
		document.getElementById("date").value = date;
		$("input[name='stock']").val(dataset.stock);
		$("input[name='detail']").val(dataset.detail);
		$("input[name='image']").val(dataset.image);
		$("input[name='type']").val(dataset.type);

		$("#save").attr("data-id", dataset.id);
		$('#modal').modal('show');
	});
	
	$(".detail").click(function(e) {
		$('#modalTitle2').html("Detail");
		var dataset = e.currentTarget.dataset;
		var id = dataset.id;
		console.log(id);

		$("#title").html(dataset.title);
		$("#author").html(dataset.author);
		$("#price").html(dataset.price);
		$("#publisher").html(dataset.publisher);
		$("#date2").html(dataset.date);
		$("#stock").html(dataset.stock);
		$("#detail").html(dataset.detail);
		$("#image").html(dataset.image);
		$("#type").html(dataset.type);

		$("#save").attr("data-id", dataset.id);
		$('#modal2').modal('show');
	});
	
});
