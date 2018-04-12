<!-- This page was written by Ram Patel-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<html>
	<body>
	<!-- A template for auto-generating a table from the DB; TO BE CHANGED -->
	<table width="59%" border="1">
    <%
    	ApplicationDB db =  new ApplicationDB();
		Connection con = db.getConnection();
		
		Statement stmt = con.createStatement();

        // Find total earnings
        String totalEarningsQuery = "SELECT SUM(amount) AS \"TOTAL_EARNINGS\" FROM Bid WHERE winningBid=1;";
        
        ResultSet r1 = stmt.executeQuery(totalEarningsQuery);
        
        // Find top 5 items
        String top5Items = "SELECT * FROM Item, Bid WHERE Bid.itemnum=Item.itemnum AND Bid.winningBid=1 ORDER BY ammount DESC LIMIT 5;";
        
        ResultSet r2 = stmt.executeQuery(top5Items);
        
        // Find top 10 sellers
        String top10Sellers = "SELECT Item.seller, SUM(Item.currentPrice) as totalEarnings FROM Item, Bid WHERE Item.itemnum=Bid.itemnum AND Bid.winningBid=1 ORDER BY totalEarnings DESC LIMIT 10;";
        
        ResultSet r3 = stmt.executeQuery(top10Sellers);
        
        String totalEarnings = r1.getString("TOTAL_EARNINGS");
    %>
    <h2>Total Earnings:</h2>
    <p><%= totalEarnings%></p>
    
    <!-- List top 5 selling items -->>
    <h2>Top 5 Selling Items:</h2>
	<%
        while(r2.next())
        {
    %>
   
                <tr>
                     <td>
                     <%= r2.getString("name")%>
                     </td>
                     <td>
                     <%= r2.getString("ammount")%>>
                     </td>
                </tr>
            
        }
   
    	
    	<!-- List top 10 sellers -->>
    	<h2>Top 10 Sellers:</h2>
	<%
        while(r3.next())
        {
    %>
                <tr>
                     <td>
                     <%= r3.getString("Item.seller")%>
                     </td>
                     <td>
                     <%= r3.getInt("totalEarnings")%>>
                     </td>
                </tr>
            <% 
        }
    	%>
	</table>
	</body>
</html>