<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/jpg" href="pharmacyIcon.jpg" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<!-- bootstrap /////////-->

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
	@media only screen and (max-width: 620px){
		#nam{
			font-size:18px !important;
		}
	}
	@media only screen and (max-width: 767px){
		#sideBar{
			display:none;
		}
		#logo{
			width:50px !important;
		}
	}
	#sideBar i{
			margin:0% 7% 0% 5%;
		}
	#sideBar span{
			font-size: 1.2vw;
	}
	#sideBar i{
		transition: margin 1s;
	}
	#sideBar div{
		transition: box-shadow 0.4s;
	}
	.navItm{
		cursor: pointer;
	}
	.navItm:hover{
		box-shadow: 0px 0px 10px #555;
	}
	.bshadow{
		box-shadow: 0px 0px 10px #555;
	}
	#sideBar{
		overflow:auto;
	}
	#contentArea{
		overflow:auto;
	}
	#frame{
		width:100%;
		height:98%;
		border:none;
		display: block;
		position: absolute;
		bottom: 0px;
	}
</style>
</head>
<body onresize="update()" onload="update()">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-12 text-center text-info" style="font-size: 3vw; text-shadow:2px 2px 3px #79efec;" id="nam">
				<b>Pharmacy Management System</b>
			</div>
		</div>
		<nav class="navbar navbar-expand-md navbar-dark row p-0" style="background-color:#197f9c">
			<a class="navbar-brand" href="index.jsp"><img id="logo" class="rounded ml-3" style="width:5vw;" src="pharmacy.jpg"/></a>
			<ul class="navbar-nav ml-auto my-auto">
				<li>
					<button class="navbar-toggler" style="outline:none;" type="button" data-toggle="collapse" data-target="#myNav">
						<span class="navbar-toggler-icon"></span>
					</button>
				</li>
			</ul>
		</nav>
		<div class="collapse bg-white text-center text-white" id="myNav">
				<div class="bg-info pt-2 my-1 rounded navItm" onclick="openPage()" data-toggle="collapse" data-target="#myNav" style="width:100%; height:40px;">Dashboard</div>
				<div class="bg-info pt-2 my-1 rounded navItm" onclick="openPage()" data-toggle="collapse" data-target="#myNav" style="width:100%; height:40px;">Companies</div>
				<div class="bg-info pt-2 my-1 rounded navItm" onclick="openPage()" data-toggle="collapse" data-target="#myNav" style="width:100%; height:40px;">Add Company</div>
				<div class="bg-info pt-2 my-1 rounded navItm" onclick="openPage()" data-toggle="collapse" data-target="#myNav" style="width:100%; height:40px;">Pharmacists</div>
				<div class="bg-info pt-2 my-1 rounded navItm" onclick="openPage()" data-toggle="collapse" data-target="#myNav" style="width:100%; height:40px;">Add Pharmacist</div>
				<div class="bg-info pt-2 my-1 rounded navItm" onclick="openPage()" data-toggle="collapse" data-target="#myNav" style="width:100%; height:40px;">Medicines</div>
				<div class="bg-info pt-2 my-1 rounded navItm" onclick="openPage()" data-toggle="collapse" data-target="#myNav" style="width:100%; height:40px;">Add Medicine</div>
			</div>
		<div class="row" id="content">
			<div class="col-2 bg-info p-0 shadow-lg h-100" id="sideBar">
				<div class="mt-2 my-1 text-white pt-2 navItm bshadow" style="width:100%; height:45px;" onclick="openPage()"><i class="fa fa-home fa-lg"></i><span>Dashboard</span></div>
				<div class="ml-1 text-white mt-4 pb-2" style="font-size:12px;"><hr class="bg-white mx-2"/>Medical Companies</div>
				<div class="my-1 text-white pt-2 navItm" style="width:100%; height:45px;" onclick="openPage()"><i class="fa fa-building fa-lg"></i><span>Companies</span></div>
				<div class="my-1 text-white pt-2 navItm" style="width:100%; height:45px;" onclick="openPage()"><i class="fa fa-plus fa-lg"></i><span>Add Company</span></div>
				<div class="ml-1 text-white mt-4 pb-2" style="font-size:12px;"><hr class="bg-white mx-2"/>Pharmacist</div>
				<div class="my-1 text-white pt-2 navItm" style="width:100%; height:45px;" onclick="openPage()"><i class="fa fa-user-md fa-lg"></i><span>Pharmacists</span></div>
				<div class="my-1 text-white pt-2 navItm" style="width:100%; height:45px;" onclick="openPage()"><i class="fa fa-plus fa-lg"></i><span>Add Pharmacist</span></div>
				<div class="ml-1 text-white mt-4 pb-2" style="font-size:12px;"><hr class="bg-white mx-2"/>Medicine</div>
				<div class="my-1 text-white pt-2 navItm" style="width:100%; height:45px;" onclick="openPage()"><i class="fa fa-medkit fa-lg"></i><span>Medicines</span></div>
				<div class="my-1 text-white pt-2 navItm" style="width:100%; height:45px;" onclick="openPage()"><i class="fa fa-plus fa-lg"></i><span>Add Medicine</span></div>
			</div>
			<div class="col text-center p-0" id="contentArea" style="margin-top: -12px;">
				<iframe id="frame" src="Dashboard.jsp">
				</iframe>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var frameSources={"Dashboard":"Dashboard.jsp" , "Companies":"Companies.jsp" , "Add Company":"AddCompany.jsp" , "Pharmacists":"Pharmacists.jsp" , 
				"Medicines":"Medicines.jsp" , "Add Pharmacist":"AddPharmacist.jsp" , "Add Medicine":"AddMedicine.jsp"};
		var contnt=document.getElementById("content");
		var nav=document.querySelector(".navbar");
		function hideNav(){
			if(window.innerWidth > 767)
				$(".collapse").collapse('hide');
		}
		function update(){
			contnt.style.height = (window.innerHeight - nav.offsetTop - nav.clientHeight)+"px";
			hideNav();
		}
		var sideTabs=document.querySelectorAll("#sideBar div");
		var navTabs=document.querySelectorAll("#myNav div");
		function highlight(e){
			for(let i=0; i < sideTabs.length; i++){
				sideTabs[i].classList.remove("bshadow");
				if(e === sideTabs[i].innerText)
					sideTabs[i].classList.add("bshadow");
			}
			
			for (let i = 0; i < navTabs.length; i++) {
				navTabs[i].classList.remove("bshadow");
				if (e === navTabs[i].innerText)
					navTabs[i].classList.add("bshadow");
			}
		}
		function openPage() {
			let name = event.target.innerText;
			document.getElementById("frame").setAttribute("src",
					frameSources[name]);
			highlight(name);
		}
	</script>
</body>
</html>