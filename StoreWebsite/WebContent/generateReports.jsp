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
        String query = "SELECT * FROM transactions WHERE;";
        ResultSet r = stmt.executeQuery(query);
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