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

        // Find total earnings
        String totalEarningsQuery = "SELECT SUM(ammount) AS \"TOTAL_EARNINGS\" FROM Bid WHERE winningBid=1;";
        
        ResultSet r1 = stmt.executeQuery(totalEarningsQuery);
        
        String totalEarnings = "";
        
        if(r1.next()){
        	totalEarnings = r1.getString("TOTAL_EARNINGS");
        }
        // Find top 5 items
        String top5Items = "SELECT * FROM Item, Bid WHERE Bid.itemnum=Item.itemnum AND Bid.winningBid=1 ORDER BY ammount DESC LIMIT 5;";
        
        ResultSet r2 = stmt.executeQuery(top5Items);
    %>
    <h2>Total Earnings:</h2>
    <p><%= totalEarnings%></p>
    
    <!-- List top 5 selling items -->>
    <h2>Top 5 Selling Items:</h2>
    <table width="59%" border="1">
    			<tr>
					<td><b>Name</b></td>
					<td><b>Earnings</b></td>
				</tr>
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
     <%   
        }
     %>
     </table>
     <%   
     // Find top 10 sellers
        String top10Sellers = "SELECT Item.seller, SUM(Item.currentPrice) as totalEarnings FROM Item, Bid WHERE Item.itemnum=Bid.itemnum AND Bid.winningBid=1 ORDER BY totalEarnings DESC LIMIT 10;";
        
        ResultSet r3 = stmt.executeQuery(top10Sellers);
     %>
    	
    	<!-- List top 10 sellers -->>
    <h2>Top 10 Sellers:</h2>
    <table width="59%" border="1">
    			<tr>
					<td><b>Name</b></td>
					<td><b>Earnings</b></td>
				</tr>
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
	
	<h2>Find Earnings for(item, item type, user): </h2>
	<form action = "processEarningsSearch.jsp">
		<select name="mySelect" id = "mySelect" STYLE="width:120px">
			<option value="item">item</option>
			<option value="item type">item type</option>
			<option value="user">user</option>
		</select>
	
			Search: <input type="text" name="search"><br>
		<br>
			<button type="submit" name="command" value="Search">Submit</button>
		<br>
	</form>
	</body>
</html>