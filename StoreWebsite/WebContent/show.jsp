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
				String username = request.getParameter("uname");
				String query = "SELECT * FROM User U WHERE username = \"" + username + "\"";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(query);
				if(result.next() != false){
					out.print("Hello " + username + ", you have been logged in.");
				} else{
					out.print("Invalid credentials.");
				}
			} else{ // This denotes the user chose Sign Up instead.
				// Insert the users username and password into the database
				String username = request.getParameter("uname");
				String password = request.getParameter("pword");
				String query = "INSERT INTO User VALUES(\"" + username + "\",\"" + password + "\",\" End User\")";
				//Run the query against the database.
				int rowsUpdated = stmt.executeUpdate(query);
				if(rowsUpdated == 1){
					out.print("You have succesfully created an account.");
				} else{
					out.print("A user with those credentials already exists.");
				}
			}
			//close the connection.
			db.closeConnection(con);
			
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>