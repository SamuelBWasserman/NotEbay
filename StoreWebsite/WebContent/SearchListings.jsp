<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listings</title>
</head>
<body>


	<form action = "processSearchListings.jsp">
	
			Search: <input type="text" name="search"><br>
		<br>
			<button type="submit" name="command" value="Search">listing</button>
		<br>
	</form>		
	
	<form action = "addToAlerts.jsp">
	
			Item to Add: <input type="text" name="search">
			<button type="submit" name="command" value="submit">Add to Alerts</button>
		<br>
	</form>		
	
	
	  
</body>
</html>