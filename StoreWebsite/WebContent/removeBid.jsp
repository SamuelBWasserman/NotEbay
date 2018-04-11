<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove Bid</title>
</head>
<body>
	<%
		//Get the selected command
		String bidder = request.getParameter("seller");
		String bidNum = request.getParameter("bid");
		ApplicationDB db =  new ApplicationDB();
		Connection con = db.getConnection();
		
		// Create an SQL statement
		Statement stmt = con.createStatement();
		String query = "REMOVE FROM Bid WHERE seller = \"" + bidder + " \" AND bidnum = " + bidNum;
		int rowsUpdated = stmt.executeUpdate(query);
		if(rowsUpdated == 1){
			System.out.print("You have succesfully removed an bid.");
			response.sendRedirect("http://localhost:8080/StoreWebsite/SearchListings.jsp");
		} else{
			out.print("There was a problem removing the bid.");
		}
		
	%>
</body>
</html>