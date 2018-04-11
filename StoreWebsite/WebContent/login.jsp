<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
</head>
<body>
	<form action = "login.jsp">
		Username: <input type="text" name="username"><br>
  		Password: <input type="text" name="password"><br>
		<br>
  		<button type="submit" name="command" value="Log In">Log In</button>
  		<br>
	</form>
	<%
		try {
			ApplicationDB db =  new ApplicationDB();
			Connection con = db.getConnection();
		
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Get the selected 
			String entity = request.getParameter("command");
			
			if(entity.equals("Log In")){
				// Retrieve data about End User
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String query = "SELECT * FROM User U WHERE username = \"" + username + "\" AND password = \"" + password + "\"";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(query);
			
				session.setAttribute("username", username);
				if(result.next() != false){
					response.sendRedirect("http://localhost:8080/StoreWebsite/userDashboard.jsp");
				} else{
					out.print("A user with those credentials does not exist.");
				}
			}
			
			
			//close the connection.
			db.closeConnection(con);
			
		} catch (Exception e) {
			//out.print(e);
		}
	%>

</body>
</html>