<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>My Account</title>
	</head>
	<body>
		<h1>My Account</h1>
		<form action = "myAccount.jsp">
			<button type="submit" name="deleteAccount" value="Delete Account">Delete Account</button>
		</form>
		<form action = "watchList.jsp">
			<button type="submit" name="watchList" value="Watch List">Watch List</button>
		</form>					  
		<%
		// Open database connection
		ApplicationDB db =  new ApplicationDB();
		Connection con = db.getConnection();
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		// Retrieve the username from the cookie
		Cookie cookie = null;
        Cookie[] cookies = null;
        
        cookies = request.getCookies();
        
        if( cookies != null ) {
           for (int i = 0; i < cookies.length; i++) {
	        	   if(cookies[i].getName().equals("username")){
	        		   cookie = cookies[i];
	        	   }
           }
        }
        
        // Execute delete query. Bye Bye user.
		
		
		
		
		%>
		
	</body>
</html>