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
				// Querys that insert the Bid and update the current price
				String query = "UPDATE Item Set currentPrice = " + requestedBid + " Where itemnum =  " + itemnum;
				String bidQuery = "INSERT INTO Bid(ammount,bidder,itemnum,datetime,winningbid) VALUES(" + requestedBid + ", \"" + username + "\"," + itemnum + "," + date.getTime() + ", 0)";
				
				//Run the query against the database.
				int itemRowsUpdated = stmt.executeUpdate(query);
				int bidRowsUpdated = stmt.executeUpdate(bidQuery);
				session.setAttribute("BidOutcome","Bid Successful");
				String isThereAnAutoBidder = "SELECT * FROM AutoBid A WHERE A.itemnum = " + itemnum;
				ResultSet result = stmt.executeQuery(isThereAnAutoBidder);
				if(result.next()){ // There is an auto bidder
					// Check if an auto bid can take place
					int autoBidAmount = requestedBidInt + bidIncrementInt;
					if(autoBidAmount < (int)(Integer.parseInt(result.getString("maxBid")))){
						String autoBidQuery = "INSERT INTO Bid(ammount,bidder,itemnum,datetime,winningbid) VALUES(" + autoBidAmount + ", \"" + itemnum + "," + date.getTime() + ", 0)";
						String update = "UPDATE Item Set currentPrice = " + autoBidAmount + " Where itemnum =  " + itemnum;
						int bidUpdate = stmt.executeUpdate(query);
						int itemUpdate = stmt.executeUpdate(update);
					}
				} else { // There is not so do nothing in this case
					
				}
				
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