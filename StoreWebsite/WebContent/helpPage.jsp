<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Help Page</title>
</head>
<body>
	<form action = "processHelpEmail.jsp">
		Email To: Customer Rep<br>
		Subject: <input type="text" name="subject"><br>
  		Body: <input type="text" name="body"><br>
		<br>
  		<button type="submit" name="command" value="Sign Up">Send</button>
  		<br>
	</form>
	<form action = "userDashboard.jsp">
		<br>
  		<button type="submit" name="command" value="Back">Back</button>
  		<br>
	</form>
	

</body>
</html>