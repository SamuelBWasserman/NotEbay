//Written by Ram Patel
package com.StoreWebsite.pkg;

import java.io.*;
import java.util.*;
import java.sql.*;
import com.StoreWebsite.pkg.*;

public class AuctionHandler extends TimerTask {
	
		private final String itemnum = "";
		
		// Sets the winning bid and emails winning bidder
		public void EndAuction (String itemnum) {
			try {
				// make conn to DB
				ApplicationDB db =  new ApplicationDB();
				Connection con = db.getConnection();
		
				//Create a SQL statement
				Statement stmt = con.createStatement();
			
				// Find winningBid and set accordingly
				String query = "UPDATE Bid SET Bid.winningBid=1 WHERE Item.itemnum=" + "'" + itemnum + "'" + " AND Item.itemnum=Bid.Itemnum AND Item.currentPrice=Bid.ammount";
			
				// Get the resultset of the query
				int r = stmt.executeUpdate(query);
				
				String emailBidder = "You have won the auction for item number:" + itemnum;
				String winningBidder = "";
				
				if (r==1) {
					query = "SELECT * FROM Bid FROM Bid WHERE Bid.itemnum=Item.itemnum AND Bid.itemnum='" + itemnum + "'";
					ResultSet result = stmt.executeQuery(query);
					if(result.next()) {
						winningBidder = result.getString("bidder");
						query = "INSERT INTO Email VALUES('AUCTION ENDED', '"+ emailBidder +"', 'donotreply','" + winningBidder + "')";
						int rowsAdded = stmt.executeUpdate(query);
						if(rowsAdded==1) {
							System.out.print("Emailed user");
						} else {
							System.out.println("There was a problem emailing the user.");
						}
					}
				} else {
					System.out.println("Row with id" + itemnum + " does not exist or could not be updated.");
				}
				
			} catch (Exception e) {
				System.out.print(e);
			}
		}
		
		// This will run the EndAuction method
		public void run ( ) {
			// Put logs here?
		}
}
