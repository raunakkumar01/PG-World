package com.iem.DAO;

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
   
	/*public static int[] find_pg_id(String unm){
		int[] pgid;
		pgid=PG.get_pg_id(unm);
		
		return pgid;
	}*/
	
}
