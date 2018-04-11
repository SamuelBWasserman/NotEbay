<!-- This page was written by Sam Wasserman -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
//Open database connection
		ApplicationDB db =  new ApplicationDB();
		Connection con = db.getConnection();
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		// Close session
		session.invalidate();
		response.sendRedirect("http://localhost:8080/StoreWebsite/index.jsp");
		
		db.closeConnection(con);
		
%>