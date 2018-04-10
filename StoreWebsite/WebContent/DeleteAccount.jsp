<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
		// Open database connection
		ApplicationDB db =  new ApplicationDB();
		Connection con = db.getConnection();
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		// Retrieve the username from the session
		// HttpSession sesh = request.getSession();
		String username = (String)session.getAttribute("username");
        
        // Execute delete query. Bye Bye user.
		String query = "DELETE FROM User WHERE username = \"" + username + "\"";
        
		int rowsUpdated = stmt.executeUpdate(query);
		if(rowsUpdated == 1){
			out.print("GoodBye");
			response.sendRedirect("http://localhost:8080/StoreWebsite/index.jsp");
		} else{
		}
		
		db.closeConnection(con);
		
%>