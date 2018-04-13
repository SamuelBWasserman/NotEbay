//Written by Ram Patel
package com.StoreWebsite.pkg;

import java.io.*;
import java.util.*;
import java.sql.*;
import com.StoreWebsite.pkg.*;

public class AuctionHandler extends TimerTask {
	
		private String itemnum = "";
		
		// Sets the winning bid and emails winning bidder
		public AuctionHandler (String itemnum) {
			this.itemnum = itemnum;
			try {
				// make conn to DB
				ApplicationDB db =  new ApplicationDB();
				Connection con = db.getConnection();
		
				//Create a SQL statement
				Statement stmt = con.createStatement();
			
				// Find winningBid and set accordingly
				String query = "UPDATE Bid b INNER JOIN Item i ON i.itemnum=b.itemnum SET b.winningBid=1 WHERE b.itemnum=" + itemnum + " AND i.currentPrice=b.ammount";
			
				// Get the resultset of the query
				int r = stmt.executeUpdate(query);
				
				String emailBidder = "You have won the auction for item number:" + itemnum;
				String winningBidder = "";
				
				if (r==1) {
					query = "SELECT * FROM Bid FROM Bid WHERE Bid.itemnum=Item.itemnum AND Bid.itemnum=" + itemnum;
					ResultSet result = stmt.executeQuery(query);
					if(result.next()) {
						winningBidder = result.getString("bidder");
						query = "INSERT INTO Email VALUES(\"AUCTION ENDED\", \""+ emailBidder +"\", \"donotreply\",\"" + winningBidder + "\")";
						int rowsAdded = stmt.executeUpdate(query);
						if(rowsAdded==1) {
							System.out.print("Emailed user");
						} else {
							System.out.println("There was a problem emailing the user.");
						}
					}
				} else {
					System.out.println("Error: Row with id " + itemnum + " does not exist, could not be updated or there are no current bids on the item.");
				}
				
			} catch (Exception e) {
				System.out.println("A SQL error occured.");
				System.out.print(e);
			}
		}
		
		// This will run the EndAuction method
		@Override 
		public void run ( ) {
			// Put logs here?
			System.out.println("Ending Auction...");
		}
}
