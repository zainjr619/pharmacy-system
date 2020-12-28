<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/jpg" href="pharmacyIcon.jpg" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Medicines</title>
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
	  display: inline-block;
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
	.cName:hover{
		cursor: pointer;
	}
</style>
</head>
<body>
	<div style="position: fixed;"><img src="pharmacy3.jpeg" style="width: 110vmax;"/></div>
	<div class="container-fluid" style="top: 15%; padding: 0 5% 3% 5%; position: absolute;">
		<div class="row bg-light rounded-lg shadow-lg" style="padding: 3%;">
			<div class="col-12 text-center">
			
				<h2 class="text-info">Medicines</h2>
				<div id="content">
					<div class="lds-ellipsis"><div></div><div></div><div></div><div></div></div>
					<div id="nt" class="text-danger text-left  mt-5" style="display:none;">Note: Click on Medicine Name for Editing!</div>
					<table class="table table-bordered mt-2" id="tbl"></table>
				</div>
				
			</div>
		</div>
	</div>
	<div class="modal fade" id="editMed">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header text-info">
					<h4 class="modal-title ">Edit Medicine</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
				    	<label for="nam">Name:</label>
				    	<input type="text" class="form-control" disabled id="nam">
				  	</div>
					<div class="form-group">
				    	<label for="qty">Quantity:</label>
				    	<input type="number" min="1" class="form-control" id="qty">
				  	</div>
				  	<div class="form-group">
				    	<label for="price">Price/Unit:</label>
				    	<input type="number" min="1" class="form-control" id="price">
				  	</div>
				  	<div id="msg"></div>
				</div>
				<div class="modal-footer justify-content-center">
					<button class="btn btn-success" onclick="editMedicine()">Save Changes</button>
					<button class="btn btn-danger" onclick="delMedicine()" data-dismiss="modal">Delete</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		setTimeout((function(){
			$.post("GetMedicines","", function (data, status){
				if (status == "success"){
					document.querySelector(".lds-ellipsis").style.display = "none";
					let rs=JSON.parse(data);
					let tbl= document.getElementById("tbl");
					if(rs.length){
						document.getElementById("nt").style.display="block";
						tbl.innerHTML = "<tr class=\"bg-info\"><th>Name</th><th>Category</th><th>Quantity</th><th>Price/Unit</th></tr>";
						for(let i=0; i < rs.length; i++){
							let row = document.createElement("tr");
							let d1=document.createElement("td");
							let d2=document.createElement("td");
							let d3=document.createElement("td");
							let d4=document.createElement("td");
							d1.innerHTML = "<span class='cName' onclick='populateModal()' data-toggle='modal' data-target='#editMed'>" + rs[i].name + 
							"</span>";
							row.appendChild(d1);
							d2.innerText = rs[i].category;
							row.appendChild(d2);
							d3.innerText = rs[i].quantity;
							row.appendChild(d3);
							d4.innerText = rs[i].price;
							row.appendChild(d4);
							tbl.appendChild(row);
						}
					}
					else{
						tbl.innerHTML = "<tr><td>No Medicines added yet!</td></tr>";
					}
				}
			});
		}),700);
		
		var row;
		function populateModal() {
			document.getElementById("msg").style.display="none";
			document.getElementById("nam").value=event.target.innerText;
			document.getElementById("qty").value=event.target.parentNode.nextSibling.nextSibling.innerText;
			document.getElementById("price").value=event.target.parentNode.parentNode.lastChild.innerText;
			row=event.target.parentNode.parentNode;
		}
		
		function delMedicine() {
			let res = confirm("Warning!!! This Medicine'll be removed permanently. Do you want to remove it?");
			if(res){
				row.remove();
				$.post("RemoveMedicine","name="+document.getElementById("nam").value, function (data, status){
					if (status == "success"){
						let x=document.querySelectorAll("#tbl tr");
						if(x.length < 2){
							document.getElementById("nt").style.display="none";
							tbl.innerHTML = "<tr><td>No Medicines added yet!</td></tr>";
						}
					}
				});
			}
		}
		function editMedicine(){
			let qty = document.getElementById("qty").value;
			let price = document.getElementById("price").value;
			if(qty != "" && qty[0] != '-' && price != "" && price[0] != '-'){
				$.post("EditMedicine","name="+document.getElementById("nam").value+"&qty="+qty+"&price="+price, function (data, status){
					if (status == "success"){
						document.getElementById("msg").style.display="none";
						row.lastChild.previousSibling.innerText=qty;
						$("#editMed").modal("hide");
						alert("Quantity Updated!");
					}
				});
			}
			else{
				document.getElementById("msg").style.display="block";
				document.getElementById("msg").innerHTML="<span class='text-danger'>Error!! Invalid Quantity!</span>"
			}
		}
	</script>
</body>
</html>