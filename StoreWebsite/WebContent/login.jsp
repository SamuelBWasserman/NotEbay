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
				if(result.next() != false){
					// Set a cookie saving the username for one hour and send them to the dashboard
					Cookie cookie = new Cookie("username",username);
					cookie.setMaxAge(60*60*1);
					response.addCookie(cookie);
					
					
					
					session.setAttribute("role", result.getString("role"));
					String query2 ="SELECT max(itemnum) from Item;" ;
					ResultSet result2 = stmt.executeQuery(query2);
					if(result2.next() != false)
					{
						int newNum = result2.getInt(1) + 1;
						session.setAttribute("itemNum", newNum);
					}
					else
					{
						session.setAttribute("itemNum", 1);
					}
					
					
					String query3 = "SELECT max(emailNum) from Email;" ;
					ResultSet result3 = stmt.executeQuery(query3);
					if(result3.next() != false)
					{
						int newENum = result3.getInt(1) + 1;
						session.setAttribute("emailNum", newENum);
					}
					else
					{
						session.setAttribute("emailNum", 1);
					}
					
					session.setAttribute("AlertList","");
					
					
					// Begin a session saving the username
					// HttpSession sesh = request.getSession();
					session.setAttribute("username", username);
					

					// Begin a session saving the username
					// HttpSession sesh = request.getSession();
					session.setAttribute("username", username);

					
					response.sendRedirect("http://localhost:8080/StoreWebsite/userDashboard.jsp");
				} else{
					out.print("A user with those credentials does not exist.");
				}
			}
			//close the connection.
			db.closeConnection(con);
			
		} catch (Exception e) {
			System.out.println(e);
		}
	%>

</body>
</html>