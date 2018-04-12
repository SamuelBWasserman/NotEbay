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
			String entityType = request.getParameter("mySelect");
			String entity = request.getParameter("search");
			
			ResultSet r;
			String result = "";

			if(entityType.equals("item")){
				String query = "SELECT SUM(Item.currentPrice) AS \"EARNINGS\" FROM Item, Bid WHERE Item.name=" + entity +" AND Bid.bidder=Item.seller AND Bid.winningBid=1;";
		        
		        r = stmt.executeQuery(query);
		        if(r.next()){
		        	result = r.getString("EARNINGS");
		        }
			} else if(entityType.equals("item type")){
				String query = "SELECT SUM(Item.currentPrice) AS \"EARNINGS\" FROM Item, Bid WHERE Item.itemnum=" + entity +" AND Bid.bidder=Item.seller AND Bid.winningBid=1;";
		        
		        r = stmt.executeQuery(query);
		        if(r.next()){
		        	result = r.getString("EARNINGS");
		        }
			} else {
				String query = "SELECT SUM(Item.currentPrice) AS \"EARNINGS\" FROM Item, Bid WHERE Item.seller=" + entity +" AND Bid.bidder=Item.seller AND Bid.winningBid=1;";
		        
		        r = stmt.executeQuery(query);
		        if(r.next()){
		        	result = r.getString("EARNINGS");
		        }
			}
			
		%>
		
		<table width="59%" border="1">
				<tr>
					<td><b><%= entityType %>></b></td>
					<td><b>Earnings</b></td>
				</tr>
   
                <tr>
                     <td>
                     <%= entity %>
                     </td>
                     <td>
                     <%= result %>
                     </td>
                </tr>
     	</table>
		
		<form action = "generateReports.jsp">
		<br>
			<button type="submit" name="command" value="Back">Back</button>
		<br>
</form>	
	</body>
</html>