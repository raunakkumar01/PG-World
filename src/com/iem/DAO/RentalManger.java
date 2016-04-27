package com.iem.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iem.BEAN.PG;
import com.iem.ConnectionFactory.ConnectionFact;

public class RentalManger {
	public static int  verify( String sid,String pgid){
	try{
		
		Connection con=ConnectionFact.dbConnect();
		String stquery="INSERT INTO RENTAL (STUDENT_ID,PG_ID) VALUES(?,?)";
		PreparedStatement pst1=con.prepareStatement(stquery);
		pst1.setString(1, sid);
		pst1.setString(2, pgid);
		
		int val=pst1.executeUpdate();
		if(val<1)
			return 0;
		if(val==1){
			return 1;
	}
		
	  }
	catch(Exception es){}
	return 0;
}
	public static int  delete( String sid,String pgid){
		try{
			
			Connection con=ConnectionFact.dbConnect();
			
			

			String stquery="DELETE FROM RENTAL WHERE STUDENT_ID =? AND PG_ID=?";
			PreparedStatement pst1=con.prepareStatement(stquery);
			pst1.setString(1, sid);
			pst1.setString(2, pgid);
			
			int val=pst1.executeUpdate();
			if(val<1)
				return 0;
			if(val==1){
				return 1;
		}
			
		  }
		catch(Exception es){}
		return 0;
	}
   
	/*public static int[] find_pg_id(String unm){
		int[] pgid;
		pgid=PG.get_pg_id(unm);
		
		return pgid;
	}*/
	
}
