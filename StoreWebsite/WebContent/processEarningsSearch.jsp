<!-- This page was written by Ram Patel-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<html>
	<body>
		<%
			ApplicationDB db =  new ApplicationDB();
			Connection con = db.getConnection();
		
			Statement stmt = con.createStatement();
			
			// Check to see if the entity to search is item, item type, or user
			if(){
				
			}
		%>
		<form action = "generateReports.jsp">
		<br>
			<button type="submit" name="command" value="Back">Back</button>
		<br>
</form>	
	</body>
</html>