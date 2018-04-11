<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Representative Page</title>
</head>
<body>
	<form action = "processRepSignUp.jsp">
		Username: <input type="text" name="username"><br>
		Email: <input type="text" name="email"><br>
  		Password: <input type="text" name="password"><br>
  		Confirm Password: <input type="text" name="passwordConfirmation"><br>
		<br>
  		<button type="submit" name="command" value="Sign Up">Add User</button>
  		<br>
	</form>
	

</body>
</html>