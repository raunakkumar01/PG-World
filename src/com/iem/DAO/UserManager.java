package com.iem.DAO;
import com.iem.BEAN.PGIndex;


import com.iem.ConnectionFactory.ConnectionFact;

import java.sql.*;
import java.util.ArrayList;
public class UserManager {
	/*
	 * Author: Shamik Kundu
	 * Description: this class provides functions to perform the following operations:
	 * 1. Registration
	 * 2. Login
	 */
	
	public static String authenticate(String mail,String pwd){
		String house="HOUSE";
		String stud="STUDENT";
		String fail="FAILED";
  try{
	Connection con=ConnectionFact.dbConnect();
	String stquery2="SELECT PWD,CATEGORY FROM PG_USER WHERE USERNAME=?";
	PreparedStatement pst=con.prepareStatement(stquery2);
	pst.setString(1, mail);
	ResultSet rs=pst.executeQuery();
	if(rs.next())
	{
		
		{
			if(pwd.equals(rs.getString("PWD")))
			{
									
			if(rs.getString("CATEGORY").equalsIgnoreCase("Houseowner"))
			{
				
				return house;
			}
			else if(rs.getString("CATEGORY").equalsIgnoreCase("Student"))
			{
				return stud;
			}
	        }
		}
		}
	}
	catch(Exception es){}
	return fail;
	}
	
	public static int register_gen(String mail,String pwd,String name,String cat, String contact_number)
	{
		try{
			Connection con=ConnectionFact.dbConnect();
			String stquery="INSERT INTO PG_USER (USERNAME,PWD,NAME,CATEGORY) VALUES(?,?,?,?)";
			PreparedStatement pst1=con.prepareStatement(stquery);
			pst1.setString(1, mail);
			pst1.setString(2, pwd);
			pst1.setString(3, name);
			pst1.setString(4, cat);
			int val=pst1.executeUpdate();
			if(val<1)
				return 0;
			if(val==1){
			if (cat.equals("Houseowner"))
			{
			String stquery2 = "INSERT INTO PG_HOUSE_OWNER (USERNAME,CONTACT_NO) VALUES (?,?)";
			PreparedStatement pst=con.prepareStatement(stquery2);
			pst.setString(1, mail);
			pst.setString(2, contact_number);
			val=pst.executeUpdate();
			if(val>0)
			return 1;
			else return 0;
			}
			else if(cat.equals("Student"))
			{
				String stquery2 = "INSERT INTO PG_STUDENT (USERNAME,CONTACT_NO) VALUES (?,?)";
				PreparedStatement pst=con.prepareStatement(stquery2);
				pst.setString(1, mail);
				pst.setString(2, contact_number);
				val=pst.executeUpdate();
				if(val>0)
				return 2;
				else return 0;
			}
		   }
		
		}
		catch(Exception es){}
		return 0;
	}
	
	public static int reghouse(String unm,String address,String city,String pin, String lat, String longi)
	{
		try{
			Connection con=ConnectionFact.dbConnect();
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
		}}
		catch(Exception es){}
		return 0;
	}
	
	public static int register_houseowner(String adrs,String unm,String pg_for,String tv,String ac,String food,String wifi,String b1,String p1,String b2,String p2,String b3,String p3){
		try{
			Connection con=ConnectionFact.dbConnect();
			String stquery="UPDATE PG SET PG_FOR=?,TV=?,AC=?,FOOD=?,WIFI=?,B1=?,P1=?,B2=?,P2=?,B3=?,P3=? where OWNERUNM=? AND ADDRESS=?";
			PreparedStatement pst1=con.prepareStatement(stquery);
			System.out.println("hi from dao"+unm);
			pst1.setString(1, pg_for);
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
			pst1.setString(13, adrs);
			int val=pst1.executeUpdate();
			if(val>0)
				return 1;
			else return 2;
			
		}
		catch(Exception es){}
		return 0;
	}
	
	public static int register_student(String unm,String gender,String dob,String address,String clgname){
     try{
    	 Connection con=ConnectionFact.dbConnect();
    	 String stquery="UPDATE PG_STUDENT SET GENDER=?,DOB=?,ADDRESS=?,COLLEGE_NAME=? where USERNAME=?";
    	 PreparedStatement pst=con.prepareStatement(stquery);
    	 pst.setString(1, gender);
    	 pst.setString(2, dob);
    	 pst.setString(3, address);
    	 pst.setString(4, clgname);
    	 pst.setString(5, unm);
    	 int val2=pst.executeUpdate();
    	 if (val2>0)
    		 return 1;
    	 else
    		 return 2;
		}
		catch(Exception es){}
	return 0;
	}
	
	public static ArrayList<PGIndex> getPGNames(String unm)
	{
		ArrayList<PGIndex> ne=new ArrayList<PGIndex>();
		try{
	    Connection con=ConnectionFact.dbConnect();
		String sq="Select * from PG where OWNERUNM=?";
		PreparedStatement pst2=con.prepareStatement(sq);
		pst2.setString(1, unm);
		ResultSet rs;
		rs=pst2.executeQuery();
		while(rs.next())
		{
			ne.add(new PGIndex(rs.getInt("PGID"),rs.getString("ADDRESS")));
		}
		}catch(Exception s){}
		return ne;
	}
}
		

