<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
		try {
			//Get the selected command
			String entity = request.getParameter("command");
			ApplicationDB db =  new ApplicationDB();
			Connection con = db.getConnection();
		
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			
			// Insert the users username and password into the database
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String passwordConfirmation = request.getParameter("passwordConfirmation");
			// Check that the passwords match.
			if(!password.equals(passwordConfirmation)){
				out.print("Passwords do not match.");
			} else{
				String query = "INSERT INTO User VALUES(\"" + username + "\",\"" + password + "\",\"End User\",\"" + email + "\")";
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
			response.sendRedirect("http://localhost:8080/StoreWebsite/userDashboard.jsp");
		} catch (Exception e) {
			out.print(e);
		}
	%>