<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/jpg" href="pharmacyIcon.jpg" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Companies</title>
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
			
				<h2 class="text-info">Companies</h2>
				<div id="content">
					<div class="lds-ellipsis"><div></div><div></div><div></div><div></div></div>
					<div id="nt" class="text-danger text-left  mt-5" style="display:none;">Note: Click on a company name to delete it!</div>
					<table class="table table-bordered mt-2" id="tbl"></table>
				</div>
				
			</div>
		</div>
	</div>
	<div class="modal fade" id="delComp">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header text-danger">
					<h4 class="modal-title">Warning!!!</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body text-center">
				  	<div>This company will be deleted permanently. Do you want to delete it?</div>
				</div>
				<div class="modal-footer justify-content-center">
					<button class="btn btn-danger" onclick="delCompany()">Yes</button>
					<button class="btn btn-success" data-dismiss="modal">No</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="errMsg">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header text-danger">
					<h4 class="modal-title">Sorry!!!</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body text-center">
				  	<div>Only Admin can delete a company!</div>
				</div>
				<div class="modal-footer justify-content-center">
					<button class="btn btn-info" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	<%
		if(session.getAttribute("user") != null && session.getAttribute("user").equals("admin")){%>
			<script>
			setTimeout((function(){
				$.post("GetCompanies","", function (data, status){
					if (status == "success"){
						document.querySelector(".lds-ellipsis").style.display = "none";
						let rs=JSON.parse(data);
						let tbl= document.getElementById("tbl");
						if(rs.length){
							document.getElementById("nt").style.display="block";
							tbl.innerHTML = "<tr class=\"bg-info\"><th class=\"w-50\">Company</th><th>Medicine Category</th></tr>";
							for(let i=0; i < rs.length; i++){
								let row = document.createElement("tr");
								let d1=document.createElement("td");
								let d2=document.createElement("td");
								d1.innerHTML = "<span class='cName' data-toggle='modal' data-target='#delComp' onclick='getName()'>" + rs[i].name + "</span>";
								row.appendChild(d1);
								let str=rs[i].medcat[0];
								for(let j=1; j<rs[i].medcat.length; j++)
									str+=", "+rs[i].medcat[j];
								d2.innerText = str;
								row.appendChild(d2);
								tbl.appendChild(row);
							}
						}
						else{
							tbl.innerHTML = "<tr><td>No companies added yet!</td></tr>";
						}
					}
				});
			}),700);
			</script>
		<%}
		else{%>
			<script type="text/javascript">
			setTimeout((function(){
				$.post("GetCompanies","", function (data, status){
					if (status == "success"){
						document.querySelector(".lds-ellipsis").style.display = "none";
						let rs=JSON.parse(data);
						let tbl= document.getElementById("tbl");
						if(rs.length){
							document.getElementById("nt").style.display="block";
							tbl.innerHTML = "<tr class=\"bg-info\"><th class=\"w-50\">Company</th><th>Medicine Category</th></tr>";
							for(let i=0; i < rs.length; i++){
								let row = document.createElement("tr");
								let d1=document.createElement("td");
								let d2=document.createElement("td");
								d1.innerHTML = "<span class='cName' data-toggle='modal' data-target='#errMsg'>" + rs[i].name + "</span>";
								row.appendChild(d1);
								let str=rs[i].medcat[0];
								for(let j=1; j<rs[i].medcat.length; j++)
									str+=", "+rs[i].medcat[j];
								d2.innerText = str;
								row.appendChild(d2);
								tbl.appendChild(row);
							}
						}
						else{
							tbl.innerHTML = "<tr><td>No companies added yet!</td></tr>";
						}
					}
				});
			}),700);
			</script>
		<%}	
	%>
	<script>
		var row;
		function getName(){
			row=event.target.parentNode.parentNode;
		}
		function delCompany() {
			row.remove();
			$.post("RemoveCompany","name="+row.firstChild.innerText, function (data, status){
				if (status == "success"){
					$("#delComp").modal("hide");
					let x=document.querySelectorAll("#tbl tr");
					if(x.length < 2){
						document.getElementById("nt").style.display="none";
						tbl.innerHTML = "<tr><td>No companies added yet!</td></tr>";
					}
				}
			});
		}
	</script>
</body>
</html>