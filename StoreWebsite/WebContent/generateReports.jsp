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
		
        int counter = 1;

        // Find total earnings
        String totalEarningsQuery = "SELECT SUM(amount) AS \"TOTAL_EARNINGS\" FROM Bid WHERE winningBid IS 1;";
        
        ResultSet r = stmt.executeQuery(totalEarningsQuery);
        String totalEarnings = String(r.getString("TOTAL_EARNINGS"));
    %>
    <p><b>Total Earnings:</b> <% = totalEarnings%></p>
    <p><b>Top 5 Selling Items:</b> <% = top5Items%></p>
    <p><b>Top 10 Sellers:</b> <% = top10Sellers%></p>

        ResultSetMetaData metaData = r.getMetaData();
        while(r.next())
        {
            %>
                <tr>
                 <%
                 for(int i = 1; i<=metaData.getColumnCount();i++)
                    { %>
                     <td>
                     <%= r.getString(i)%>
                     </td>
                <% 
                    }
                %>                   
                </tr>
            <% 
        }
    %>
	</table>
	</body>
</html>