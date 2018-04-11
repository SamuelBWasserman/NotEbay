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
	// Get the selected command
	String entity = request.getParameter("command");
	ApplicationDB db =  new ApplicationDB();
	Connection con = db.getConnection();
	
	// Create an SQL statement
	Statement stmt = con.createStatement();
	
	// Parse string itemnum attribute into an integer
	int itemNum = Integer.parseInt((String)session.getAttribute("itemnum"));
	
	// If the user clicked Remove auction
	if(entity.equals("Remove")){
		String query = "DELETE FROM ITEM WHERE itemnum = " + itemNum;
		int rowsUpdated = stmt.executeUpdate(query);
		if(rowsUpdated == 1){
			out.print("You have succesfully deleted an auction.");
		} else{
			out.print("There was a problem deleting the auction.");
		}
	} else { // This means the user clicked Edit Info
		
	}

%>
		
</body>
</html>