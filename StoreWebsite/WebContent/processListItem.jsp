<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.util.Date,java.text.*"%>
<%
		try {
			//Get the selected command
			ApplicationDB db =  new ApplicationDB();
			Connection con = db.getConnection();
		
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			
			// Insert the users username and password into the database
			String itemName = request.getParameter("itemname");
			String description = request.getParameter("descrp");
			String initPrice = request.getParameter("initprice");
			String minSell = request.getParameter("minsell");
			String bidIncr = request.getParameter("bidincr");
			String category = request.getParameter("gender");
			String length =  request.getParameter("length");
			// Check that the passwords match.
			if(itemName.isEmpty()|| description.isEmpty()|| initPrice.isEmpty()|| minSell.isEmpty()||bidIncr.isEmpty()){
				session.setAttribute("listOutcome","Please Enter All Fields");
				response.sendRedirect("http://localhost:8080/StoreWebsite/listAnItem.jsp");
			}
			else{
				 SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//dd/MM/yyyy
				  Date now = new Date();
				  String strDate = sdfDate.format(now);
				String query = "INSERT INTO Item (dateadded, itemType, minsell, initprice, currentPrice, bidincrement, seller, description, length, name) VALUES(\"" +strDate + "\",\"" + category + "\",\"" + minSell + "\",\"" + initPrice + "\",\"" + initPrice + "\",\"" + bidIncr + "\",\"" +  session.getAttribute("username") + "\",\"" + description + "\",\"" + length + "\",\"" + itemName + "\")";
				//Run the query against the database
				int rowsUpdated = stmt.executeUpdate(query);
				if(rowsUpdated == 1){
					out.print("You have added and item.");
				} else{
					out.print("Please Enter All Fields");
				}
			}
			//close the connection.
			db.closeConnection(con);	
			response.sendRedirect("http://localhost:8080/StoreWebsite/userDashboard.jsp");
		} catch (Exception e) {
			out.print(e);
		}
	%>