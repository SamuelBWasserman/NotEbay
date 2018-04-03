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
		String query = "DELETE FROM User WHERE username = " + cookie.getName();
		int rowsUpdated = stmt.executeUpdate(query);
		if(rowsUpdated == 1){
			out.print("GoodBye");
			response.sendRedirect("http://localhost:8080/StoreWebsite/index.jsp");
		} else{
		}
		db.closeConnection(con);
		
		%>