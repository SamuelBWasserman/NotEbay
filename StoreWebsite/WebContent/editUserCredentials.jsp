<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Item</title>
</head>
<body>
<%
	//Get the selected command
	String oldUsername = request.getParameter("oldUsername");
	String newUsername = request.getParameter("newUsername");
	String oldPassword = request.getParameter("oldPassword");
	String newPassword = request.getParameter("newPassword");
	ApplicationDB db =  new ApplicationDB();
	Connection con = db.getConnection();
	
	// Create an SQL statement
	Statement stmt = con.createStatement();
	
	// Parse string itemnum attribute into an integer
	
	
	// If the user clicked Remove auction
	String query = "UPDATE User SET username = \"" + newUsername + "\", password = \"" + newPassword + "\" WHERE username = \"" + oldUsername + "\"";
	System.out.println(query);
	System.out.println(query);
	int rowsUpdated = stmt.executeUpdate(query);
	if(rowsUpdated == 1){
		System.out.print("You have succesfully edited a User.");
		response.sendRedirect("http://localhost:8080/StoreWebsite/userDashboard.jsp");
	} else{
		out.print("There was a problem editing the user.");
	}
%>
		
</body>
</html>