<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.util.Date,java.text.*"%>
<%
		try {
			// Open DB Connection
			ApplicationDB db =  new ApplicationDB();
			Connection con = db.getConnection();
			
			// Create datetime object
			Date date = new Date();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			// What the bid was
			String maxBid = request.getParameter("maxBid");
			int maxBidInt = (int)Integer.parseInt(maxBid);
			
			// Get all session data about user and item the user is bidding on
			String username = (String)session.getAttribute("username");
			String itemnum = (String)session.getAttribute("itemnum");
			
			String query = "INSERT INTO AutoBid(username, itemnum, maxBid) VALUES(\"" + username + "\"," + itemnum + "," + maxBid + ")";
			int rowsUpdated = stmt.executeUpdate(query);
			if(rowsUpdated == 1){
				response.sendRedirect("http://localhost:8080/StoreWebsite/ItemPage.jsp");
			} else{
			}
			//close the connection.
			db.closeConnection(con);	
			response.sendRedirect("http://localhost:8080/StoreWebsite/ItemPage.jsp");
		} catch (Exception e) 
		{
			out.print(e);
		}
	%>