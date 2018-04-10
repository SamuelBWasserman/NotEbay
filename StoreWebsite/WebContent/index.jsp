<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login Page</title>
	</head>
	<body>
		<h1>Welcome to the Store</h1>
									  
		<br>
		<div class = "left">
			<form action="login.jsp">
	  			<button type="submit" value="Log In">Log In</button>
	  			<br>
	  		</form>
  		</div>
  		<div class = "right">
	  		<form action="signUp.jsp">
	  			<button type="submit" value="Sign Up" >Sign Up</button>
	  			<br>
			</form>
			<br>
		</div>
	</body>
</html>