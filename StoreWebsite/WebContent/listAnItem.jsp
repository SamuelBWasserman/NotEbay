<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
</head>
<body>
	<form action = "processListItem.jsp">
		Item Name: <input type="text" name="itemname"><br>
		Description: <input type="text" name="descrp"><br>
		<p>Category</p>
  		<input type="radio" name="gender" value="Computer Components">Computer Components
  		<input type="radio" name="gender" value="Peripherals"> Peripherals
  		<input type="radio" name="gender" value="Software"> Software<br>
  		Initial Price: <input type="text" name="initprice"><br>
  		Min Sell Price: <input type="text" name="minsell"><br>
  		Bid Increment: <input type="text" name="bidincr"><br>
  		Length(Hours): <input type="text" name="length"><br>
		<br>
  		<button type="submit" name="command" value="List Item">List Item</button>
  		<br>
	</form>
	

</body>
</html>