<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
		try {
			//Get the selected command
			String bidInc = session.getAttribute("bidIncrement").toString();
			int bidIncrement = (int)Integer.parseInt(bidInc);
			
			String curbid = session.getAttribute("currentBid").toString();
			int currentBid = (int)Integer.parseInt(curbid);
			ApplicationDB db =  new ApplicationDB();
			Connection con = db.getConnection();
		
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			
			// Insert the users username and password into the database
			String reqBid = request.getParameter("bidAmount");
			int requestedBid = (int)Integer.parseInt(reqBid);
				
				if(requestedBid - currentBid >= bidIncrement)
				{
					
				
				String query = "UPDATE Item Set initPrice = \"" + requestedBid + "\" Where itemnum =  \"" + session.getAttribute("iNum") + "\"";
				//Run the query against the database.
				int rowsUpdated = stmt.executeUpdate(query);
					session.setAttribute("BidOutcome","Bid Successful");
				}
				else
				{
					session.setAttribute("BidOutcome","Bid Must Be Greater than Current Bid By $" + bidIncrement);
				}
		
			
			//close the connection.
			db.closeConnection(con);	
			response.sendRedirect("http://localhost:8080/StoreWebsite/ItemPage.jsp");
		} catch (Exception e) 
		{
			out.print(e);
		}
	%>