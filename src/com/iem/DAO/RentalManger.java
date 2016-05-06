package com.iem.DAO;
/*
 * Author: Shailesh Kumar
 * Description: this class provides functions to perform the following operations:
 * 1. Verify a student add it to database.
 * 2. Deletes an existing student  .
 * 3. Finds details of students in a pg. 
 */
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iem.BEAN.PG;
import com.iem.BEAN.Rental;
import com.iem.ConnectionFactory.ConnectionFact;

public class RentalManger {
	public static int  verify( String sid,String pgid){
	
		return Rental.addRental(sid, pgid);
		
	  
}
	public static int  delete( String sid,String pgid){
		return Rental.delete(sid, pgid);
	}
	public static ArrayList<Rental> findStudent(String pgid){
		return Rental.getRental(pgid);
		
	}
	
	
}
