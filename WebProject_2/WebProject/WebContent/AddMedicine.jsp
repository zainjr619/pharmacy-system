<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/jpg" href="pharmacyIcon.jpg" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Medicine</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
<style type="text/css">
	::-webkit-scrollbar {
	  width: 12px;
	}
	::-webkit-scrollbar-track {
	  box-shadow: inset 0 0 15px grey; 
	  background: #96fcff;
	}
	::-webkit-scrollbar-thumb {
	  background: #197f9c;
	  border-radius: 10px;
	}
	::-webkit-scrollbar-thumb:hover {
	  background: #095f7c;
	}
	.lds-ellipsis {
	  display: none;
	  position: relative;
	  width: 80px;
	  height: 80px;
	}
	.lds-ellipsis div {
	  position: absolute;
	  top: 33px;
	  width: 13px;
	  height: 13px;
	  border-radius: 50%;
	  background: #179999;
	  animation-timing-function: cubic-bezier(0, 1, 1, 0);
	}
	.lds-ellipsis div:nth-child(1) {
	  left: 8px;
	  animation: lds-ellipsis1 0.6s infinite;
	}
	.lds-ellipsis div:nth-child(2) {
	  left: 8px;
	  animation: lds-ellipsis2 0.6s infinite;
	}
	.lds-ellipsis div:nth-child(3) {
	  left: 32px;
	  animation: lds-ellipsis2 0.6s infinite;
	}
	.lds-ellipsis div:nth-child(4) {
	  left: 56px;
	  animation: lds-ellipsis3 0.6s infinite;
	}
	@keyframes lds-ellipsis1 {
	  0% {
	    transform: scale(0);
	  }
	  100% {
	    transform: scale(1);
	  }
	}
	@keyframes lds-ellipsis3 {
	  0% {
	    transform: scale(1);
	  }
	  100% {
	    transform: scale(0);
	  }
	}
	@keyframes lds-ellipsis2 {
	  0% {
	    transform: translate(0, 0);
	  }
	  100% {
	    transform: translate(24px, 0);
	  }
	}
</style>
</head>
<body>
	<div style="position: fixed;"><img src="pharmacy3.jpeg" style="width: 110vmax;"/></div>
	<div class="container-fluid" style="top: 15%; padding: 0 5% 3% 5%; position: absolute;">
		<div class="row bg-light rounded-lg shadow-lg" style="padding: 3%;">
			<div class="col-12">
			
				<h2 class="text-info text-center">Add Medicine</h2>
				<div id="content">
					<div class="form-group">
				    	<label for="nam">Name:</label>
				    	<input type="text" class="form-control" placeholder="Enter Medicine Name" id="nam">
				  	</div>
				  	<div class="form-group">
						 <label for="cat">Category:</label>
						 <select class="form-control" id="cat">
						 	<option value="Antipyretics">Antipyretics</option>
						    <option value="Analgesics">Analgesics</option>
						    <option value="Antiseptics">Antiseptics</option>
						    <option value="Antibiotics" selected>Antibiotics</option>
						    <option value="Anti-Cancer">Anti-Cancer</option>
						 </select>
					</div>
					<div class="form-group">
				    	<label for="qty">Quantity:</label>
				    	<input type="number" min="0" class="form-control" placeholder="Enter Quantity" id="qty">
				  	</div>
				  	<div class="form-group">
				    	<label for="price">Price per Unit:</label>
				    	<input type="number" min="1" class="form-control" placeholder="Enter Price/Unit" id="price">
				  	</div>
					<div class="text-center">
						<div><button class="btn btn-info" onclick="getValues()">Add</button></div>
						<div class="lds-ellipsis"><div></div><div></div><div></div><div></div></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="errMsg">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header text-danger">
					<h4 class="modal-title" id="heading"></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body text-center">
				  	<div id="msg"></div>
				</div>
				<div class="modal-footer justify-content-center">
					<button class="btn btn-info" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function getValues() {
			let name=document.getElementById("nam").value;
			let category=document.getElementById("cat").value;
			let qty=document.getElementById("qty").value;
			let price=document.getElementById("price").value;
			if(name != "" && qty != "" && qty[0] != "-" && price != "" && price[0] != "-"){
				document.querySelector(".lds-ellipsis").style.display = "inline-block";
				setTimeout((function(){
					$.post("AddMedicine","name="+name+"&cat="+category+"&qty="+qty+"&price="+price, function (data, status){
						if (status == "success"){
							document.querySelector(".lds-ellipsis").style.display = "none";
							if(data == 1){
								document.getElementById("heading").innerHTML = "<b class='text-success'>Success!!</b>";
								document.getElementById("msg").innerHTML = "<b class='text-success'>Medicine Added Successfully!</b>";
								$("#errMsg").modal("show");
							}
							else{
								document.getElementById("heading").innerHTML = "<b class='text-danger'>Error!!</b>";
								document.getElementById("msg").innerHTML = "<b class='text-danger'>Medicine already exists!</b>";
								$("#errMsg").modal("show");
							}
						}
					});
				}),700);
			}
			else{
				document.getElementById("heading").innerHTML = "<b class='text-danger'>Error!!</b>";
				document.getElementById("msg").innerHTML = "<b class='text-danger'>Invalid Medicine Name / Quantity or Price !</b>";
				$("#errMsg").modal("show");
			}
		}
	</script>
</body>
</html>