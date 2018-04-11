<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Rep Item Page</title>
</head>
<body>
		<h1>Customer Rep Item Page</h1>
		
		<form action = "editItem.jsp">
			<button type="submit" name="command" value="Edit">Edit Info</button>
		</form>
		<form action = "editItem.jsp">
			<button type="submit" name="command" value="Remove">Remove Auction</button>
		</form>
		
		
		<form action = "removeBid.jsp">
			Seller: <input type="text" name="seller"><br>
  			Bid: <input type="text" name="bid"><br>
		<br>
  			<button type="submit" name="command" value="Log In">Remove Bid</button>
  		<br>
	</form>
</body>
</html>