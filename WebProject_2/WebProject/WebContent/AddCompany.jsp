<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/jpg" href="pharmacyIcon.jpg" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Company</title>
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
			
				<h2 class="text-info text-center">Add Company</h2>
				<div id="content">
					<div class="form-group">
				    	<label for="nam">Name:</label>
				    	<input type="text" class="form-control" placeholder="Enter Company Name" id="nam">
				  	</div>
				  	<div class="form-group">
						 <label for="cat">Medicine Category(Ctrl+Click/Drag/Tap Screen to select multiple):</label>
						 <select class="form-control" id="cat" multiple size="3">
						 	<option value="Antipyretics">Antipyretics</option>
						    <option value="Analgesics">Analgesics</option>
						    <option value="Antiseptics">Antiseptics</option>
						    <option value="Antibiotics">Antibiotics</option>
						    <option value="Anti-Cancer">Anti-Cancer</option>
						 </select>
					</div>
					<div class="text-center">
						<%if(session.getAttribute("user") != null && session.getAttribute("user").equals("admin")){%>
							<div><button class="btn btn-info" onclick="getValues()">Add</button></div>
						<%}else{ %>
							<div><button class="btn btn-info" onclick="getValues()">Add</button></div>
						<%} %>
						<div class="lds-ellipsis"><div></div><div></div><div></div><div></div></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="errMsg">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="heading"><b class="text-danger">Sorry!!!</b></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body text-center">
				  	<div id="msg">Only Admin can add a company!</div>
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
			let cat=$("#cat").val();
			if(name != "" && cat.length != 0){
				let categories="";
				for(let i=0; i<cat.length; i++)
					categories +="&cat="+cat[i];
				document.getElementById("nam").value="";
				document.querySelector(".lds-ellipsis").style.display = "inline-block";
				setTimeout((function(){
					$.post("AddCompany","name="+name+categories, function (data, status){
						if (status == "success"){
							document.querySelector(".lds-ellipsis").style.display = "none";
							if(data == 1){
								document.getElementById("heading").innerHTML = "<b class='text-success'>Success!!</b>";
								document.getElementById("msg").innerHTML = "<b class='text-success'>Comapny Added Successfully!</b>";
								$("#errMsg").modal("show");
							}
							else{
								document.getElementById("heading").innerHTML = "<b class='text-danger'>Error!!</b>";
								document.getElementById("msg").innerHTML = "<b class='text-danger'>Company already exists!</b>";
								$("#errMsg").modal("show");
							}
						}
					});
				}),700);
			}
			else{
				document.getElementById("heading").innerHTML = "<b class='text-danger'>Error!!</b>";
				document.getElementById("msg").innerHTML = "<b class='text-danger'>Invalid Company Name or Medicine Category!</b>";
				$("#errMsg").modal("show");
			}
		}
	</script>
</body>
</html>