<!-- This page was written by Ram Patel-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Admin Page</title>
	</head>
	<body>	  
		<br>
		<div class = "left">
			<form action="addRep.jsp">
	  			<button type="submit" value="Add Rep">Add Rep</button>
	  			<br>
	  		</form>
  		</div>
  		<div class = "right">
	  		<form action="generateReports.jsp">
	  			<button type="submit" value="Generate Reports" >Generate Reports</button>
	  			<br>
			</form>
			<br>
		</div>
	</body>
</html>