<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/jpg" href="pharmacyIcon.jpg" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

 <!-- Font Awesome///////// -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
	body, html{
		height: 100%;
	}
	body{
		background-image: url("Pharmacy4.jpg");
		background-attachment: fixed;
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
		height: 100%;
	}
	@media only screen and (max-width : 767px){
		.txt{
			padding : 1.5% !important;
			font-size: 14px;
		}
		#cart{
			right:0px;
		}
	}
	.txt{
		margin: 1% 1% 1% 1%;
		transition: all 0.8s;
	}
	.txt:hover{
		cursor: pointer;
		background-color: white !important;
		color: #179999 !important;
	}
	.txt:hover i{
		transform: matrix(1.5, 0, 0, 1.5, -10, 0);
	}
	.txt i{
		transition: transform 0.8s;
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
	
	.mName:hover{
		cursor: pointer;
	}
	#cart{
		color: #177777;
		position: fixed;
		z-index: 1;
		right:10px;
		top: 10px;
		background-color: white;
		transition: all 0.8s;
		box-shadow: 0px 0px 12px 5px grey;
	}
	#cart:hover{
		background-color: #1799a9;
		color:white;
		cursor: pointer;
	}
	#cart:hover i{
		transform: translate(-5px);
	}
	#cart i{
		transition: transform 0.6s;
	}
}

</style>
</head>
<body>
	<div class="container-fluid" style="padding: 3% 5% 3% 5%;">
		<h2 class="mb-3 text-center"><span class="bg-light text-info rounded-lg p-1 shadow-lg" style="text-shadow: 2px 2px 3px grey">
		<b>Dashboard</b></span></h2>
		<div id="cart" title="Cart" class="px-2 rounded-lg" data-toggle="modal" data-target="#invoice">
			<i class="fa fa-shopping-cart fa-2x mr-1"></i><span id="amnt" style="font-size: 20px;">0</span>
		</div>
		<div class="row justify-content-center">
		
			<div class="col-md-3 p-3 txt bg-info rounded-lg text-center text-white" onclick="loadMedicines()">
			<i class="fa fa-search pr-1"></i>
				Search Medicines
			</div>
			<div class="col-md-3 p-3 txt bg-info rounded-lg text-center text-white">
			<i class="fa fa-search pr-1"></i>
				Search Medicine
			</div>
			<div class="col-md-3 p-3 txt bg-info rounded-lg text-center text-white">
			<i class="fa fa-search pr-1"></i>
				Search Pharmacist
			</div>
			<div class="col-md-3 p-3 txt bg-info rounded-lg text-center text-white">
			<i class="fa fa-search pr-1"></i>
				Search Pharmacist 
			</div>
			<div class="col-md-3 p-3 txt bg-info rounded-lg text-center text-white">
			<i class="fa fa-search pr-1"></i>
				Search Medicine
			</div>
			<div class="col-md-3 p-3 txt bg-info rounded-lg text-center text-white">
			<i class="fa fa-search pr-1"></i>
				Search Pharmacist
			</div>
			
		</div>
		<div class="row justify-content-center">
			<div id="content" class="col-md-10 bg-light rounded-lg text-center mt-5 shadow-lg" style="height: 500px; overflow: auto;">
				<div class="lds-ellipsis"><div></div><div></div><div></div><div></div></div>
			</div>
			
		</div>
	</div>
	<div class="modal fade" id="addMed">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header text-info">
					<h4 class="modal-title ">Add Medicine to Invoice</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
				    	<label for="nam">Name:</label>
				    	<input type="text" class="form-control" disabled id="nam">
				  	</div>
				  	<div class="form-group">
				    	<label for="inStockQty">In Stock:</label>
				    	<input type="text" class="form-control" disabled id="inStockQty">
				  	</div>
					<div class="form-group">
				    	<label for="qty">Quantity:</label>
				    	<input type="number" min="1" class="form-control" id="qty">
				  	</div>
				  	<div id="msg"></div>
				</div>
				<div class="modal-footer justify-content-center">
					<button class="btn btn-success" onclick="addMedicine()">Add to Invoice</button>
					<button class="btn btn-danger" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="invoice">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header text-info">
					<h4 class="modal-title ">Invoice</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
				    	<label for="cnam">Customer Name:</label>
				    	<input type="text" class="form-control" id="cnam">
				  	</div>
				  	<div class="form-group">
				    	<label for="moblno">Mobile No:</label>
				    	<input type="number" class="form-control" placeholder="03**-*******" id="moblno">
				  	</div>
					<div class="form-group">
				    	<label for="price">Total Price:</label>
				    	<input type="number" class="form-control" disabled id="price" value="0">
				  	</div>
				  	<div class="my-4">
				  		<table class="table text-center">
				  			<thead>
					  			<tr class="bg-info">
					  				<th>Medicine</th>
					  				<th>Quantity</th>
					  				<th>Price</th>
					  				<th>Cancel</th>
					  			</tr>
				  			</thead>
				  			<tbody id="invoiceContent"></tbody>
				  		</table>
				  	</div>
				  	<div id="msg1"></div>
				</div>
				<div class="modal-footer justify-content-center">
					<button class="btn btn-success" onclick="printInvoice()">Print Invoice</button>
					<button class="btn btn-danger" onclick="clearInvoice()">Clear Invoice</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(loadMedicines());
	function loadMedicines(){
		content=document.getElementById("content").innerHTML="<div class=\"lds-ellipsis\"><div></div><div></div><div></div><div></div></div>";
		document.querySelector(".lds-ellipsis").style.display = "inline-block";
		setTimeout(function(){
			$.post("GetMedicines","", function (data, status){
				if (status == "success"){
					document.querySelector(".lds-ellipsis").style.display = "none";
					let content=document.getElementById("content");
					let search=document.createElement("input");
					search.setAttribute("id", "med");
					search.setAttribute("onkeyup", "searchMedicine()");
					search.setAttribute("class", "form-control my-4");
					search.setAttribute("placeholder", "Search Medicine...");
					content.appendChild(search);
					let rs=JSON.parse(data);
					let tbl=document.createElement("table");
					let tblBody=document.createElement("tbody");
					tblBody.setAttribute("id", "medTbl");
					tbl.setAttribute("class", "table table-bordered");
					if(rs.length){
						tbl.innerHTML = "<tr class=\"bg-info\"><th>Name</th><th>Category</th><th>Quantity</th><th>Price/Unit</th></tr>";
						for(let i=0; i < rs.length; i++){
							let row = document.createElement("tr");
							let d1=document.createElement("td");
							let d2=document.createElement("td");
							let d3=document.createElement("td");
							let d4=document.createElement("td");
							d1.innerHTML = "<span class='mName' onclick='populateModal()' data-toggle='modal' data-target='#addMed'>" + rs[i].name + 
							"</span>";
							row.appendChild(d1);
							d2.innerText = rs[i].category;
							row.appendChild(d2);
							d3.innerText = rs[i].quantity;
							row.appendChild(d3);
							d4.innerText = rs[i].price;
							row.appendChild(d4);
							tblBody.appendChild(row);
						}
						tbl.appendChild(tblBody);
						content.appendChild($("<p class='text-left'>NOTE: Click on Medicine Name for adding to Invoice!</p>")[0])
						content.appendChild(tbl);
					}
					else{
						tbl.innerHTML = "<tr><td>No Medicines added yet!</td></tr>";
						content.appendChild(tbl);
					}
				}
			}
		)},700);
	};
	function searchMedicine(){
	    var value = $("#med").val().toLowerCase();
	    $("#medTbl tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	}
	
	var row, totalQty, price={};
	function populateModal() {
		document.getElementById("msg").style.display="none";
		document.getElementById("nam").value=event.target.innerText;
		document.getElementById("inStockQty").value=event.target.parentNode.nextSibling.nextSibling.innerText;
		document.getElementById("qty").value="";
		totalQty=event.target.parentNode.nextSibling.nextSibling.innerText;
		document.getElementById("qty").setAttribute("max", totalQty);
		row=event.target.parentNode.parentNode;
	}
	
	function addMedicine(){
		let qty = document.getElementById("qty").value;
		if(qty != "" && qty[0] != '-' && qty[0] != '0' && qty[0] != 'e' && qty[0] != 'E' && Number.parseInt(qty) <= Number.parseInt(totalQty)){
			document.getElementById("msg").style.display="none";
			row.lastChild.previousSibling.innerText=Number.parseInt(totalQty) - Number.parseInt(qty);
			let x=document.getElementById("amnt");
			let p = document.getElementById("price");
			p.value = Number.parseInt(p.value) + Number.parseInt(row.lastChild.innerText)*Number.parseInt(qty);
			if(!price[row.firstChild.innerText]){
				price[row.firstChild.innerText]=Number.parseInt(row.lastChild.innerText)*Number.parseInt(qty);
				document.getElementById("invoiceContent").appendChild($("<tr><td>"+row.firstChild.innerText
						+"</td><td>"+qty+"</td><td>"+price[row.firstChild.innerText]+
						"</td><td class='mName bg-danger rounded-lg w-25' onclick='updateCart()'>"+'X'+"</td></tr>")[0]);
				x.innerText=Number.parseInt(x.innerText) + 1;
			}
			else{
				price[row.firstChild.innerText]+=Number.parseInt(row.lastChild.innerText)*Number.parseInt(qty);
				let rows=document.getElementById("invoiceContent");
				rows=rows.childNodes;
				for(let i=0; i<rows.length; i++){
					if(rows[i].firstChild.innerText == row.firstChild.innerText){
						rows[i].childNodes[1].innerText=Number.parseInt(rows[i].childNodes[1].innerText) + Number.parseInt(qty);
						rows[i].childNodes[2].innerText=price[row.firstChild.innerText];
						break;
					}
				}
			}
			
			$("#addMed").modal("hide");
		}
		else{
			document.getElementById("msg").style.display="block";
			document.getElementById("msg").innerHTML="<span class='text-danger'>Error!! Invalid Quantity!</span>"
		}
	}
	
	function clearInvoice() {
		document.getElementById("msg").style.display="none";
		document.getElementById("nam").value="";
		document.getElementById("inStockQty").value="";
		document.getElementById("qty").removeAttribute("max");
		document.getElementById("price").value=0;
		document.getElementById("amnt").innerText=0;
		let rows=document.getElementById("invoiceContent");
		let meds=document.getElementById("medTbl");
		meds=meds.childNodes;
		rows=rows.childNodes;
		for(let i=0; i<rows.length; i++){
			for(let j=0; j<meds.length; j++){
				if(rows[i].firstChild.innerText == meds[j].firstChild.innerText){
					meds[j].childNodes[2].innerText=Number.parseInt(meds[j].childNodes[2].innerText) + Number.parseInt(rows[i].childNodes[1].innerText);
					break;
				}
			}
		}
		row=null;
		totalQty=0;
		price={};
		$("#invoiceContent").children().remove();
		$("#invoice").modal("hide");
	}
	
	function updateCart() {
		let p=$(event.target).parent().children();
		let meds=document.getElementById("medTbl");
		meds=meds.childNodes;
		for(let j=0; j<meds.length; j++){
			if(p[0].innerText == meds[j].firstChild.innerText){
				meds[j].childNodes[2].innerText=Number.parseInt(meds[j].childNodes[2].innerText) + Number.parseInt(p[1].innerText);
				break;
			}
		}
		$(event.target).parent().remove();
		let pr = document.getElementById("price");
		pr.value = Number.parseInt(pr.value) - price[p[0].innerText];
		delete price[p[0].innerText];
		let x=document.getElementById("amnt");
		x.innerText=Number.parseInt(x.innerText) - 1;
	}
	
	function updateDatabase() {
		let names="";
		let qtys="";
		let rows=document.getElementById("invoiceContent");
		rows=rows.childNodes;
		for(let i=0; i<rows.length; i++){
			names+="name="+rows[i].childNodes[0].innerText+"&";
			if(i == rows.length-1)
				qtys+="qty="+rows[i].childNodes[1].innerText;
			else
				qtys+="qty="+rows[i].childNodes[1].innerText+"&";
		}
		$.post("UpdateMedicines",names+qtys , function (data, status){});
	}
	
	function printInvoice(){
		let mn = document.getElementById("moblno").value;
		let cn = document.getElementById("cnam").value;
		if(mn != "" && cn != ""){
			document.getElementById("msg1").style.display="none";
			$("#invoice").modal("hide");
			updateDatabase();
			let printWin = window.open("","Invoice", "height=600px, width=400px");
			printWin.document.write("<!DOCTYPE html>\
					<html>\
					<head>\
					<title>Invoice</title>\
					<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'>\
					<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>\
					</head>\
					<body>\
						<div class='container'>\
							<img src='pharmacyIcon.jpg' width='50px'/>\
							<div style='font-size: 25px;' class='text-center text-info mt-n4'>AZHA Pharmaceuticals</div>\
							<div>Name:<span class='float-right' id='name'>wer</span></div>\
							<div>Mobile No:<span class='float-right' id='mNo'>wer</span></div>\
							<div>\
								<table class='table border-0 mt-4'>\
									<thead>\
										<tr>\
											<th>Medicine</th>\
											<th>Qty</th>\
											<th>Price</th>\
										</tr>\
									</thead>\
									<tbody id='medicines'>\
									</tbody>\
								</table>\
								<div class='mt-3'>Total:<span class='float-right' id='tPrice'></span></div>\
								<div class='mt-3 text-center text-info'>Thank You</div>\
							</div>\
						</div>\
					</body>\
				</html>");
			
			let tbl = printWin.document.getElementById("medicines");
			let rows=document.getElementById("invoiceContent");
			rows=rows.childNodes;
			for(let i=0; i<rows.length; i++){
				let row=document.createElement("tr");
				let d1=document.createElement("td");
				let d2=document.createElement("td");
				let d3=document.createElement("td");
				d1.innerText= rows[i].childNodes[0].innerText;
				d2.innerText= rows[i].childNodes[1].innerText;
				d3.innerText= rows[i].childNodes[2].innerText;
				row.appendChild(d1);
				row.appendChild(d2);
				row.appendChild(d3);
				tbl.appendChild(row);
			}
			printWin.document.getElementById("name").innerText= cn;
			printWin.document.getElementById("mNo").innerText= mn;
			printWin.document.getElementById("tPrice").innerText= "Rs. "+document.getElementById("price").value;
			printWin.document.close();
			row=null;
			totalQty=0;
			price=null;
			$("#invoiceContent").children().remove();
			document.getElementById("msg1").style.display="none";
			document.getElementById("nam").value="";
			document.getElementById("inStockQty").value="";
			document.getElementById("price").value=0;
			document.getElementById("amnt").innerText=0;
			document.getElementById("cnam").value="";
			document.getElementById("moblno").value="";
			printWin.print();
		}
		else{
			document.getElementById("msg1").style.display="block";
			document.getElementById("msg1").innerHTML="<span class='text-danger'>Error!! Invalid Customer Name/Mobile No!</span>"
		}
	}
	</script>
	
</body>
</html>