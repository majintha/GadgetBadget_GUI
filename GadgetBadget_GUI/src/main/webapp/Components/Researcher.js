//hide alert
$(document).ready(function() {

	$("#alertSuccess").hide();
	$("#alertError").hide();
	$("#hidResearcherIDSave").val("");
	$("#RESEARCHER")[0].reset();
});

$(document).on("click", "#btnSave", function(event) {

	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	
	// Form validation-------------------
	var status = validateItemForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	
	// If valid------------------------
	var type = ($("#researcherID").val() == "") ? "POST" : "PUT";

	$.ajax({
		url : "ResearcherAPI",
		type : type,
		data : $("#RESEARCHER").serialize(),
		dataType : "text",
		complete : function(response, status) {
			onItemSaveComplete(response.responseText, status);
		}
	});

});

function onItemSaveComplete(response, status) {
	
	if (status == "success") {
		
		var resultSet = JSON.parse(response);
		
		if (resultSet.status.trim() == "success") {
			
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#ResearcherGrid").html(resultSet.data);
			
		} else if (resultSet.status.trim() == "error") {
			
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} 
	else if (status == "error") {
		
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
		
	} else {
		
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	
	$("#researcherID").val("");
	$("#RESEARCHER")[0].reset();
}

$(document).on("click", ".btnRemove", function(event) {
	
	$.ajax({
		url : "ResearcherAPI",
		type : "DELETE",
		data : "researcherID=" + event.target.value,
		dataType : "text",
		complete : function(response, status) {
			onItemDeleteComplete(response.responseText, status);
		}
	});
});

function onItemDeleteComplete(response, status) {
	
	if (status == "success") {
		
		var resultSet = JSON.parse(response);
		
		if (resultSet.status.trim() == "success") {
			
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#ResearcherGrid").html(resultSet.data);
			
		} else if (resultSet.status.trim() == "error") {
			
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
		
	} else if (status == "error") {
		
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
		
	} else {
		
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}

// UPDATE==========================================
$(document).on("click",".btnUpdate",function(event)
		{
			$("#researcherID").val($(this).closest("tr").find('td:eq(0)').text());
			$("#researcherName").val($(this).closest("tr").find('td:eq(1)').text());
			$("#researcherEmail").val($(this).closest("tr").find('td:eq(2)').text());
			$("#researcherNumber").val($(this).closest("tr").find('td:eq(3)').text());
			$("#researcherAddress").val($(this).closest("tr").find('td:eq(4)').text());
			$("#researcherProductType").val($(this).closest("tr").find('td:eq(5)').text());
			$("#researcherReDate").val($(this).closest("tr").find('td:eq(6)').text());		
		});


// CLIENTMODEL=========================================================================
function validateItemForm() {
	
	// researcherName
	if ($("#researcherName").val().trim() == "") {
		return "Please insert researcherName.";
	}
	
	// researcherEmail
	if ($("#researcherEmail").val().trim() == "") {
		return "Please insert researcherEmail.";
	}
	
	// researcherNumber
	if ($("#researcherNumber").val().trim() == "") {
		return "Please insert researcherNumber.";
	}

	// researcherAddress
	if ($("#researcherAddress").val().trim() == "") {
		return "Please insert researcherAddress.";
	}
	
	// researcherProductType
	if ($("#researcherProductType").val().trim() == "") {
		return "Please insert researcherProductType.";
	}
	
	// researcherReDate
	if ($("#researcherReDate").val().trim() == "") {
		return "Please insert researcherReDate.";
	}
	
	return true;
}