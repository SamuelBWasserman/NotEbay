<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
try {
	session.setAttribute("BidOutcome","");
	String entity = request.getParameter("command");
	ApplicationDB db =  new ApplicationDB();
	Connection con = db.getConnection();
	//Create a SQL statement
	Statement stmt = con.createStatement();
	int temp1 = 0;
	String temp2  = "name";
		
		if(session.getAttribute("iSearch") == null)
		{
			session.setAttribute("iSearch", request.getParameter("search"));	
		}
		
		if(request.getParameter("search") != null && request.getParameter("search").equals(session.getAttribute("iSearch").toString()) == false)
		{
			session.setAttribute("iSearch", request.getParameter("search"));	
		}
		// Retrieve data about End User
		String search = session.getAttribute("iSearch").toString();
		// Check if the name contains the searched name
		String query = "SELECT * FROM Item I WHERE name LIKE \"%" + search + "%\"";
		ResultSet result = stmt.executeQuery(query);
		
		List<String> listName = new ArrayList<String>();
		List<String> listNum = new ArrayList<String>();
		
	
		while(result.next())
		{
			listName.add(result.getString("name"));
		}
		
		%>
 
		
		<form method="get" name="itemSelected" action="ItemPage.jsp">
		<select name="mySelect" id = "mySelect" STYLE="width:120px">
		<%
		//suppose u ve an array of permission and array of 
		// value or numeric id matching at respective index
		// some how u fill both the arrays from database or hard-coded 
		//it depends on you
		for (int z = 0; z< listName.size(); z++){
		if(listName.get(z) != null)
		%>
		<option value="<%=listName.get(z) %>"><%= listName.get(z) %></option>
		
		<%
		String itemNumQuery = "SELECT itemnum FROM Item WHERE name = " + listName.get(z);
		ResultSet itemNumResult = stmt.executeQuery(query);
		String itemnum = "";
		if(itemNumResult.next()){
			itemnum = itemNumResult.getString("itemnum");
		}
		session.setAttribute("itemnum", itemnum);
		}
		%>

		</select>
		<br>
			<button type="submit" name="Select" value="Select">Select</button>
		<br>
		</form>
		
		<%
	
	//close the connection.
	db.closeConnection(con);
	//response.sendRedirect("http://localhost:8080/StoreWebsite/SearchListings.jsp");
} catch (Exception e) {
	out.print(e);
}
%>

<form action = "SearchListings.jsp">
		<br>
			<button type="submit" name="command" value="Back">Back</button>
		<br>
</form>	