<%@page import="model.ResearcherServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
			<title>Researcher Management - GadgetBadget</title>
	
		<link href="myStyle.css" rel="stylesheet" />
		<link rel="stylesheet" href="Views/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="Components/jquery-3.5.0.min.js"></script>
		<script src="Components/Researcher.js"></script>

	</head>
	
	<body>
		<div class="container">
	
			<p class="font-weight-bold">
				<center>
					<h1><b>Researcher Management - GadgetBadget</b></h1>
				</center>
			</p>
			<br><br>
			
			<fieldset>
	
				<legend><b>Add Researcher Details</b></legend>
					<form id="RESEARCHER" name="RESEARCHER" class="border border-light p-5">
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">Researcher Name:</label>
						    <input type="text" id="researcherName" class="form-control" name="researcherName" placeholder="Enter researcher Name..">						    
						</div>
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">researcher Email:</label>
						    <input type="text" id="researcherEmail" class="form-control" name="researcherEmail" placeholder="Enter Researcher Email..">						    
						</div>
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">researcher Number:</label>
						    <input type="text" id="researcherNumber" class="form-control" name="researcherNumber" placeholder="Enter Investor number..">						    
						</div>
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">researcher Address:</label>
						    <input type="text" id="researcherAddress" class="form-control" name="researcherAddress" placeholder="Enter Your Address">						    
						</div>
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">researcher Product Type:</label>
						    <input type="text" id="researcherProductType" class="form-control" name="researcherProductType" placeholder="Enter ptoduct type..">						    
						</div>
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm"> Registered Date:</label>
						    <input type="text" id="researcherReDate" class="form-control" name="researcherReDate" placeholder="Enter Your Registered Date">						    
						</div>
					
						 
											
						<br> 
						
						<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary btn-lg btn-block"> 
						<input type="hidden" id="hidResearcherIDSave" name="hidResearcherIDSave" value="">
					</form>
				
					<div id="alertSuccess" class="alert alert-success"></div>
					<div id="alertError" class="alert alert-danger"></div>			
			</fieldset>
			
			<br> 
			
			<div class="container" id="ResearcherGrid">
				<fieldset>
					<legend><b>View Researcher Details</b></legend>
					<form method="post" action="Researcher.jsp" class="table table-striped">
						<%
						ResearcherServlet viewResearcher = new ResearcherServlet();
											out.print(viewResearcher.readResearcher());
						%>
					</form>
					<br>
				</fieldset>
			</div>
		</div>
	</body>
</html>
