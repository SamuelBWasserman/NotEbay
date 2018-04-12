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

List<String> Sender = new ArrayList<String>();
List<String> Reciever = new ArrayList<String>();
List<String> Subject= new ArrayList<String>();
List<String> Body = new ArrayList<String>();
//Create a SQL statement
Statement stmt = con.createStatement();;
String user = session.getAttribute("username").toString();



String query2 = "SELECT * FROM Email WHERE receiver = \"" + user + "\";"; 
ResultSet result2 = stmt.executeQuery(query2);


if(result2.next())
{
while(result2.isAfterLast() == false)
{
	Sender.add(result2.getString(3));
	Reciever.add(result2.getString(4));
	Subject.add(result2.getString(1));
	Body.add(result2.getString(2));
	result2.next();

}
String query = "SELECT * FROM Email WHERE sender =  \"" + user + "\";"; //\"" + search ;
ResultSet result = stmt.executeQuery(query);
if(result.next())
{
while(result.isAfterLast() == false)
{
	Sender.add(result.getString(3));
	Reciever.add(result.getString(4));
	Subject.add(result.getString(1));
	Body.add(result.getString(2));
	result.next();
//list.add("hello");
//list.add("afsd");
}
}




%>
<table>
<% 
for ( int i =0; i < Sender.size() ; i++)
{
%>

<tr>
<td> Sender: <%=Sender.get(i)%></td>
<td>----------</td>
<td> 		Receiver: <%=Reciever.get(i)%></td>
<td>----------</td>
<td> 		Subject: <%=Subject.get(i)%></td>
<td>----------</td>
<td> 		Body: <%=Body.get(i)%></td>
</tr>
 
<%
}
}
%>



</table>


	<form action = "userDashboard.jsp">
		<br>
  		<button type="submit" name="back" value="back">back</button>
  		<br>
	</form>
	
</body>
</html>