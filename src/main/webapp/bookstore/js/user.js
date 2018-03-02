$(function() {

	$("#save").click(function(e) {
		var username = $("input[name='username']").val();
		var password = $("input[name='password']").val();
		var role = $("#userrole").val();
		console.log(username, password, role);

		var dataset = e.currentTarget.dataset;
		var id = dataset.id;

		if (id != "") { // Edit
			var old = dataset.username;
			jQuery.ajax({
				url : 'updateUserPro',
				processData : true,
				dataType : "text",
				data : {
					id : id,
					username : username,
					password : password,
					role : role,
					old : old
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
				url : 'addUserPro',
				processData : true,
				dataType : "text",
				data : {
					username : username,
					password : password,
					role : role
				},
				success : function(data) {
					if(data=="0"){
					bootbox.alert({
						message : 'username exists'
					});}
					else{
						bootbox.alert({
							message : 'success',
							callback : function() {
								location.reload();
							}
						});
					}
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
						url : 'deleteUserPro',
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

		$("input[name='username']").val("");
		$("input[name='password']").val("");
		$("#userrole").val("");

		$("#save").attr("data-id", "");
		$('#modal').modal('show');
	});

	$(".edit").click(function(e) {
		$('#modalTitle').html("Edit");
		var dataset = e.currentTarget.dataset;
		var id = dataset.id;
		console.log(id);

		$("input[name='username']").val(dataset.username);
		$("input[name='password']").val(dataset.password);
		$("#userrole").val(dataset.role);

		$("#save").attr("data-id", dataset.id);
		$('#modal').modal('show');
	});
	
	$(".detail").click(function(e) {
		$('#modalTitle2').html("Detail");
		var dataset = e.currentTarget.dataset;
		var id = dataset.id;
		console.log(id);

		$("#username").html(dataset.username);
		$("#password").html(dataset.password);
		$("#sex").html(dataset.sex);
		$("#city").html(dataset.city);
		$("#country").html(dataset.country);
		$("#phone").html(dataset.phone);
		$("#email").html(dataset.email);
		$("#age").html(dataset.age);
		$("#job").html(dataset.job);

		$("#save").attr("data-id", dataset.id);
		$('#modal2').modal('show');
	});

});
