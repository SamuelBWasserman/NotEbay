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
			
			

				String search = session.getAttribute("iSearch").toString();
	
					String query = "INSERT INTO AlertList VALUES(\"" + search + "\",\"" + username + "\")";
					int temp  = Integer.parseInt(session.getAttribute("emailNum").toString());
					temp++;
					
					int rowsUpdated = stmt.executeUpdate(query);
					session.setAttribute("AlertList","Alert Set!");
			
			//close the connection.
			db.closeConnection(con);	
			response.sendRedirect("http://localhost:8080/StoreWebsite/processSearchListings.jsp");
		} catch (Exception e) 
		{
			out.print(e);
		}
	%>