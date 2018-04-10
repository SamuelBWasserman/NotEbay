<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.util.Date,java.text.*"%>
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
					
				
				String query = "UPDATE Item Set currentPrice = \"" + requestedBid + "\" Where itemnum =  \"" + session.getAttribute("iNum") + "\"";
				//Run the query against the database.
				int rowsUpdated = stmt.executeUpdate(query);
					session.setAttribute("BidOutcome","Bid Successful");
				}
				else
				{
					session.setAttribute("BidOutcome","Bid Must Be Greater than Current Bid By $" + bidIncrement);
				}
		
				 SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//dd/MM/yyyy
				  Date now = new Date();
				  String strDate = sdfDate.format(now);
				 int bidNum;
				String query3 = "SELECT MAX(bidnum) From Bid";
				ResultSet result = stmt.executeQuery(query3);
				
				if(result.next() != false)
				{
					bidNum = result.getInt(1) + 1;
				}
				else
				{
					bidNum = 1;
				}
				
				String query2 = "INSERT Into Bid Values(\"" + requestedBid + "\",\"" + bidNum + "\",\"" + session.getAttribute("username") + "\",\"" + session.getAttribute("iNum")  + "\",\"" + strDate  + "\")";
				stmt.executeUpdate(query2);
				
				//close the connection.
			db.closeConnection(con);	
			response.sendRedirect("http://localhost:8080/StoreWebsite/ItemPage.jsp");
		} catch (Exception e) 
		{
			out.print(e);
		}
	%>