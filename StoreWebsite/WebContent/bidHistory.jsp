<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.util.Date,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<%
	ApplicationDB db =  new ApplicationDB();
	Connection con = db.getConnection();
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	String itemNum = session.getAttribute("itemnum").toString();
	
	
	String query = "SELECT * FROM Bid I WHERE I.itemnum =  \"" + itemNum + "\";"; //\"" + search ;
	//also need to query to see if description contains search
	//out.print("TEST");
	//Run the query against the database.
	ResultSet result = stmt.executeQuery(query);
	
	
	List<String> bidder = new ArrayList<String>();
	List<String> amount = new ArrayList<String>();
	List<String> time = new ArrayList<String>();
	
	if(result.next())
	{
	while(result.isAfterLast() == false)
	{
		bidder.add(result.getString(3));
		amount.add(result.getString(1));
		time.add(result.getString(5));
		result.next();
	//list.add("hello");
	//list.add("afsd");
	}
	
	%>
	<table>
	<% 
	for ( int i =0; i < bidder.size() ; i++)
	{
	%>
	
	<tr>
	<td> Bidder: <%=bidder.get(i)%></td>
	<td> 		Amount: <%=amount.get(i)%></td>
	<td> 		Date/Time: <%=time.get(i)%></td>
	</tr>
	 
	<%
	}
	}
	%>
	
	
	
	</table>
	
	
		<form action = "ItemPage.jsp">
			<br>
	  		<button type="submit" name="back" value="back">back</button>
	  		<br>
		</form>
	
</body>
</html>