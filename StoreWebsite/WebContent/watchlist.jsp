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
Statement stmt = con.createStatement();;
String user = session.getAttribute("username").toString();

String query = "SELECT * FROM Item WHERE itemnum = (SELECT itemnum FROM WatchList W WHERE username =  \"" + user + "\");"; //\"" + search ;
//also need to query to see if description contains search
//out.print("TEST");
//Run the query against the database.
ResultSet result = stmt.executeQuery(query);


List<String> currentPrice = new ArrayList<String>();
List<String> Seller = new ArrayList<String>();
List<String> Name= new ArrayList<String>();

if(result.next())
{
while(result.isAfterLast() == false)
{
	currentPrice.add(result.getString("currentPrice"));
	Seller.add(result.getString("seller"));
	Name.add(result.getString("name"));
	result.next();
//list.add("hello");
//list.add("afsd");
}

%>
<table>
<% 
for ( int i =0; i < Name.size() ; i++)
{
%>

<tr>
<td> Name: <%=Name.get(i)%></td>
<td> 		CurrentPrice: <%=currentPrice.get(i)%></td>
<td> 		Seller: <%=Seller.get(i)%></td>
</tr>
 
<%
}
}
%>



</table>


	<form action = "myAccount.jsp">
		<br>
  		<button type="submit" name="back" value="back">back</button>
  		<br>
	</form>
	
</body>
</html>