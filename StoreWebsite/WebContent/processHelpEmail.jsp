<!-- This page was written by Josh and Sam -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
		try {
			//Get the selected command
			String username = session.getAttribute("username").toString();
			ApplicationDB db =  new ApplicationDB();
			Connection con = db.getConnection();
		
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			
			String emailSub = request.getParameter("subject");
			String emailBody = request.getParameter("body");
				
				if(!(emailSub.isEmpty() && emailBody.isEmpty()))
				{
					String lookForReps = "SELECT * FROM User WHERE role = \"Customer Rep\"";
					System.out.println(lookForReps);
					ResultSet result = stmt.executeQuery(lookForReps);
					if(result.next()){
						String query = "INSERT INTO Email VALUES(\"" + emailSub + "\",\"" + emailBody + "\",\"" + username + "\",\"" + result.getString("username") + "\",\"" + session.getAttribute("emailNum") + "\")";
						System.out.println(query);
						int temp  = Integer.parseInt(session.getAttribute("emailNum").toString());
						temp++;
						
						session.setAttribute("emailNum",temp);
						int rowsUpdated = stmt.executeUpdate(query);
						session.setAttribute("EmailOutcome","Email Sent!");
					}
				}
				else
				{
					session.setAttribute("EmailOutcome","Email Body or Subject Must Be Filled Out");
				}
		
			
			//close the connection.
			db.closeConnection(con);	
			response.sendRedirect("http://localhost:8080/StoreWebsite/helpPage.jsp");
		} catch (Exception e) 
		{
			out.print(e);
		}
	%>