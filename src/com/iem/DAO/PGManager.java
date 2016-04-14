package com.iem.DAO;
import java.sql.*;

import com.iem.ConnectionFactory.ConnectionFact;

public class PGManager {
	
	public static int createPG1(String unm,String address,String city,String pin, String lat, String longi)
	{
		try{
			
			Connection con=ConnectionFact.dbConnect();
			String stquery1="SELECT ADDRESS FROM PG";
			ResultSet rs;
			PreparedStatement pst=con.prepareStatement(stquery1);
			rs=pst.executeQuery();
			while(rs.next()){
			if(rs.getString("ADDRESS").equalsIgnoreCase(address))
			{
			System.out.println("pg already exists");
			return 10;
			}
			}

			String stquery="INSERT INTO PG (OWNERUNM,ADDRESS,CITY,PINCODE,LAT,LONGI) VALUES(?,?,?,?,?,?)";
			PreparedStatement pst1=con.prepareStatement(stquery);
			pst1.setString(1, unm);
			pst1.setString(2, address);
			pst1.setString(3, city);
			pst1.setString(4, pin);
			pst1.setString(5, lat);
			pst1.setString(6, longi);
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
	
	
	
public static int createPG3(String unm,String gender,String tv,String ac,String food,String wifi,String b1,String p1 ,String b2,String p2,String b3,String p3){
	try{
		Connection con=ConnectionFact.dbConnect();
		String stquery="UPDATE PG SET PG_FOR=?,TV=?,AC=?,FOOD=?,WIFI=?,B1=?,P1=?,B2=?,P2=?,B3=?,P3=? where OWNERUNM=?";
		PreparedStatement pst1=con.prepareStatement(stquery);
		System.out.println("hi from dao"+unm);
		pst1.setString(1, gender);
		pst1.setString(2, tv);
		pst1.setString(3, ac);
		pst1.setString(4, food);
		pst1.setString(5, wifi);
		pst1.setString(6, b1);
		pst1.setString(7, p1);
		pst1.setString(8, b2);
		pst1.setString(9, p2);
		pst1.setString(10, b3);
		pst1.setString(11, p3); 
		pst1.setString(12, unm);
		int val=pst1.executeUpdate();
		if(val>0)
			return 1;
		else return 2;
		
	}
	catch(Exception es){}
	return 0;
}
}
