<!-- Written by Josh -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
		try {
			//Get the selected command
			String username = session.getAttribute("username").toString();
			ApplicationDB db =  new ApplicationDB();
			Connection con = db.getConnection();
		
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			// What is this indentation?

				String search = request.getParameter("search");
	
					String query = "INSERT INTO AlertList VALUES(\"" + search + "\",\"" + username + "\")";
					
					int rowsUpdated = stmt.executeUpdate(query);
					session.setAttribute("AlertList","Alert Set!");
			
			//close the connection.
			db.closeConnection(con);
			response.sendRedirect("http://localhost:8080/StoreWebsite/SearchListings.jsp");
		} catch (Exception e) 
		{
			System.out.print(e);
			response.sendRedirect("http://localhost:8080/StoreWebsite/SearchListings.jsp");
		}
	%>