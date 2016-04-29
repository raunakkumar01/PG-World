package com.iem.BEAN;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iem.ConnectionFactory.ConnectionFact;

public class Rental {
private String PGID;
private String username;

public Rental(String pGID, String username) {
	super();
	PGID = pGID;
	this.username = username;
}

public String getPGID() {
	return PGID;
}

public void setPGID(String pGID) {
	PGID = pGID;
}

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public static ArrayList<Rental> getRental(String pgid)
{
	ArrayList<Rental> alren=new ArrayList<Rental>();
	try{
		Connection con=ConnectionFact.dbConnect();
		String stquery = "Select * from Rental where PG_ID=?";
		PreparedStatement pst=con.prepareStatement(stquery);	
		pst.setString(1, pgid);
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			alren.add(new Rental(rs.getString("PG_ID"),rs.getString("STUDENT_ID")));
		}
	}
	catch(Exception es){}
	return alren;
}
public static int addRental(String sid,String pgid)
{
	
	try{
	
	Connection con=ConnectionFact.dbConnect();
	String stquery="INSERT INTO RENTAL (STUDENT_ID,PG_ID) VALUES(?,?)";
	PreparedStatement pst1=con.prepareStatement(stquery);
	pst1.setString(1, sid);
	pst1.setString(2, pgid);
	
	int val=pst1.executeUpdate();
	return val;
	
	}
	catch(Exception es){return 0;}
	

}
public static int  delete( String sid,String pgid){
	try{
		
		Connection con=ConnectionFact.dbConnect();
		String stquery="DELETE FROM RENTAL WHERE STUDENT_ID =? AND PG_ID=?";
		PreparedStatement pst1=con.prepareStatement(stquery);
		pst1.setString(1, sid);
		pst1.setString(2, pgid);
		
		int val=pst1.executeUpdate();
		return val;
	}
	catch(Exception es){return 0;}
}	
	
}
