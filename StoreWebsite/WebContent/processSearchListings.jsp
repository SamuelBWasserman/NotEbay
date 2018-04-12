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
	String section = request.getParameter("sectionSelect");
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	//Get the selected 
	//String entity = request.getParameter("listing");
	int temp1 = 0;
	String temp2  = "name";
	//String insert = "INSERT INTO Item VALUES(\"00/00/0000\",\"0001\",\"10\",\"1\",\"1\",\"Seller\",\"descript\",\"name\")";
	//String insert = "INSERT INTO Item VALUES(\"" + temp2 + "\",\"" + temp2 + "\",\"" + temp1 + "\",\"" + temp1 + "\",\"" + temp1 + "\",\"" + temp1 + "\",\"" + temp2 + "\",\"" + temp2 + "\")";
	//Run the query against the database.
	//int rowsUpdated = stmt.executeUpdate(insert);
	//if(rowsUpdated == 1){
		//out.print("You have succesfully created an account.");
//	} else{
	//	out.print("A user with those credentials already exists.");
	//};
		
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
		out.print(search);
		String query = "SELECT * FROM Item I WHERE name LIKE \"" + search + "\";"; //\"" + search ;
		//also need to query to see if description contains search
		//out.print("TEST");
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(query);
		//out.print("testig");
		
		int i = 0;
		
		List<String> listName = new ArrayList<String>();
		List<String> listNum = new ArrayList<String>();
		
		if(result.next())
		{
		while(result.isAfterLast() == false)
		{
			listName.add(result.getString(8) + " " + result.getString(1));
			listNum.add(result.getString(1));
			result.next();
		//list.add("hello");
		//list.add("afsd");
		}
		}
		String query2 = "SELECT * FROM Item I WHERE description LIKE \"" + search + "\";";
		ResultSet result2 = stmt.executeQuery(query2);
		if(result2.next())
		{
		while(result2.isAfterLast() == false)
		{
			if(listNum.contains(result2.getString(1)))
			{
				listName.add(result2.getString(8) + " " + result2.getString(1));
				listNum.add(result2.getString(1));
			}
			result2.next();
			
		}
		}
		%>
 
		
		<form method="get" name="itemSelected" action="ItemPage.jsp">
		<select name="mySelect" id = "mySelect" STYLE="width:120px">
		<%
		//suppose u ve an array of permission and array of 
		// value or numeric id matching at respective index


		// some how u fill both the arrays from database or hard-coded 
		//it depends on you
		for (int z=0; z< listName.size(); z++){
		if(listName.get(z) != null)
		%>
		<option value="<%=listName.get(z) %>"><%= listName.get(z) %></option>
		
		<%
		}
		%>

		</select>
		<br>
			<button type="submit" name="Select" value="Select">Select</button>
		<br>
		</form>
		
		<%
		
		
		
		//request.setAttribute("list", list);
		//request.getRequestDispatcher("/WEB-INF/SearchListing.jsp").forward(request, response);

	//close the connection.
	db.closeConnection(con);
	//response.sendRedirect("http://localhost:8080/StoreWebsite/SearchListings.jsp");
} catch (Exception e) {
	out.print(e);
}
%>
<form action = "addToAlerts.jsp">
		<br>
			<button type="submit" name="command" value="AlertMe">AlertMe</button>
		<br>
		<% 
		out.print(session.getAttribute("AlertList"));
		session.setAttribute("AlertList", "");
		%>
</form>	
<form action = "SearchListings.jsp">
		<br>
			<button type="submit" name="command" value="Back">Back</button>
		<br>
</form>	

	