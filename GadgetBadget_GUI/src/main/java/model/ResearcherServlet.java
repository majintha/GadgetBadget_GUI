package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class ResearcherServlet {

	
	//Connect to the MySQL DB
	private Connection connect() 
	{ 
		Connection con = null; 
		try
		{ 
			Class.forName("com.mysql.jdbc.Driver");  
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test?useTimezone=true&serverTimezone=UTC", "root", ""); 
		} 
		catch (Exception e) 
		{
			e.printStackTrace();} 
		 	return con; 
		} 

		public String insertResearcher(String researcherName, String researcherEmail, String researcherNumber, String researcherAddress, String researcherProductType, String researcherReDate) 
		 { 
			 String output = ""; 
			 try
			 { 
				 Connection con = connect(); 
				 if (con == null) 
				 {
					 return "Error while connecting to the database for inserting."; 
				 } 
			 	 	 // create a prepared statement
				 	 String query = "INSERT INTO researcher_gui(`researcherID`,`researcherName`,`researcherEmail`,`researcherNumber`,`researcherAddress`,`researcherProductType`,`researcherReDate`)" + " VALUES (?, ?, ?, ?, ?, ?, ?)"; 
					 PreparedStatement preparedStmt = con.prepareStatement(query); 					 
					 
					 // binding values
					 preparedStmt.setInt(1, 0);
					 preparedStmt.setString(2, researcherName);
					 preparedStmt.setString(3, researcherEmail);
					 preparedStmt.setString(4, researcherNumber);
					 preparedStmt.setString(5, researcherAddress);
					 preparedStmt.setString(6, researcherProductType);
					 preparedStmt.setString(7, researcherReDate);
					 				 
					 preparedStmt.execute(); 
					 con.close(); 
					 
					 String newResearcher = readResearcher(); 
					 output = "{\"status\":\"success\", \"data\": \"" + newResearcher + "\"}"; 
			 } 
			 catch (Exception e) 
			 { 
				 output = "{\"status\":\"error\", \"data\": \"Error while inserting the Researcher.\"}";
				 System.err.println(e.getMessage());
			 } 
		 	return output; 
		 } 

		//Read Investments
		 public String readResearcher() 
		 { 
			 String output = ""; 

			 try
			 { 
				 Connection con = connect(); 
				 if (con == null) 
				 {
					 return "Error while connecting to the database for reading."; 
				 } 
				 
				 // Prepare the html table to be displayed
				 output = "<table border='1'><tr><th>researcher Name</th>"
				 + "<th>researcher Email</th>" + 
				 "<th>researcher Number</th>" + 
				 "<th>researcher Address</th>" +
				 "<th>Product Type</th>" +
				 "<th>Registerg Date</th>" +
				 "<th>Update</th><th>Remove</th></tr>"; 
			 
				 
				 String query = "SELECT * FROM researcher_gui"; 
				 Statement stmt = con.createStatement(); 
				 ResultSet rs = stmt.executeQuery(query); 
				 
				 // iterate through the rows in the result set
				 while (rs.next()) 
				 { 
					 String researcherID = Integer.toString(rs.getInt("researcherID")); 
					 String researcherName = rs.getString("researcherName"); 
					 String researcherEmail = rs.getString("researcherEmail"); 
					 String researcherNumber = rs.getString("researcherNumber"); 
					 String researcherAddress = rs.getString("researcherAddress"); 
					 String researcherProductType = rs.getString("researcherProductType");
					 String researcherReDate = rs.getString("researcherReDate");
					 
					 
					 // Add into the html table
					 output += "<tr><td>" + researcherName + "</td>"; 
					 output += "<td>" + researcherEmail + "</td>"; 
					 output += "<td>" + researcherNumber + "</td>"; 
					 output += "<td>" + researcherAddress + "</td>"; 
					 output += "<td>" + researcherProductType + "</td>"; 
					 output += "<td>" + researcherReDate + "</td>"; 					 
					 
					 
					 // buttons
					 output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td>"
					 + "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-itemid='" 
					 + researcherID + "'>" + "</td></tr>";
				 } 
				 	 con.close(); 
				 	 // Complete the html table
				 	 output += "</table>"; 
			 } 
			 catch (Exception e) 
			 { 
				 output = "Error while reading the investment"; 
				 System.err.println(e.getMessage()); 
			 } 
		 	 return output; 
		 } 
				
		//Update Investments
		public String updateResearcher(String researcherID, String researcherName, String researcherEmail, String researcherNumber, String researcherAddress , String researcherProductType , String researcherReDate)
		{ 
			 String output = ""; 
			 try
			 { 
				 Connection con = connect(); 
				 if (con == null) 
				 {
					 return "Error while connecting to the database for updating."; 
				 } 
				 
				 // create a prepared statement
				 String query = "UPDATE researcher_gui SET researcherName=? , researcherEmail=? , researcherNumber=? , researcherAddress=? , researcherProductType=? , researcherReDate=?  WHERE researcherID=?"; 
				 PreparedStatement preparedStmt = con.prepareStatement(query); 
				 
				 // binding values
				 preparedStmt.setString(1, researcherName); 
				 preparedStmt.setString(2, researcherEmail); 
				 preparedStmt.setString(3, researcherNumber);  
				 preparedStmt.setString(4, researcherAddress); 
				 preparedStmt.setString(5, researcherProductType); 
				 preparedStmt.setString(6, researcherReDate); 
				 preparedStmt.setInt(7, Integer.parseInt(researcherID)); 
				 
				 // execute the statement
				 preparedStmt.execute(); 
				 con.close(); 
				 String newResearcher = readResearcher(); output = "{\"status\":\"success\", \"data\": \"" + newResearcher + "\"}"; 
			 } 
			 catch (Exception e) 
			 { 
				 output = "{\"status\":\"error\", \"data\": \"Error while updating the Researcher.\"}"; 
				 System.err.println(e.getMessage()); 
			 } 
			 	return output; 
			 } 
		
			//Delete Investments
			 public String deleteResearcher(String researcherID) 
			 { 
				 String output = ""; 
			 try
			 { 
				 Connection con = connect(); 
			 if (con == null) 
			 {
				 return "Error while connecting to the database for deleting."; 
			 } 
			 
			 	 // create a prepared statement
				 String query = "DELETE FROM researcher_gui WHERE investmentID=?"; 
				 PreparedStatement preparedStmt = con.prepareStatement(query); 
				 
				 // binding values
				 preparedStmt.setInt(1, Integer.parseInt(researcherID)); 
				 
				 // execute the statement
				 preparedStmt.execute(); 
				 con.close(); 
				 String newResearcher = readResearcher(); output = "{\"status\":\"success\", \"data\": \"" + newResearcher + "\"}";
			 } 
			 catch (Exception e) 
			 { 
				 output = "{\"status\":\"error\", \"data\": \"Error while deleting the Researcher.\"}"; 
				 System.err.println(e.getMessage()); 
			 } 
			 return output; 
		} 
} 