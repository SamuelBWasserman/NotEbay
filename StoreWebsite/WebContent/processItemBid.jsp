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
			String requestedBid = request.getParameter("bidAmount");
			int requestedBidInt = (int)Integer.parseInt(requestedBid);
			
			// Get all session data about user and item the user is bidding on
			String username = (String)session.getAttribute("username");
			String itemnum = (String)session.getAttribute("itemnum");
			String bidIncrement = (String)session.getAttribute("bidIncrement");
			String currentPrice = (String)session.getAttribute("currentPrice");
			
			// parse some values to integers for processing
			int bidIncrementInt = (int)Integer.parseInt(bidIncrement);
			int currentPriceInt = (int)Integer.parseInt(currentPrice);
			
			// This means the bid is valid
			if(requestedBidInt - currentPriceInt >= bidIncrementInt){		
				String query = "UPDATE Item Set currentPrice = \"" + requestedBid + "\" Where itemnum =  \"" + session.getAttribute("iNum") + "\"";
				String bidQuery = "INSERT INTO Bid(ammount,bidder,itmnum,datetime,winningbid) VALUES(" + requestedBid + "," + username + "," + itemnum + "," + date.getTime() + ", 0)";
				//Run the query against the database.
				int rowsUpdated = stmt.executeUpdate(query);
				session.setAttribute("BidOutcome","Bid Successful");
			} else	{
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