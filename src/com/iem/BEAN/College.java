package com.iem.BEAN;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iem.ConnectionFactory.ConnectionFact;



public class College {
	private String name,lat,longi;

	
	
	public College(String name, String lat, String longi) {
		super();
		this.name = name;
		this.lat = lat;
		this.longi = longi;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLongi() {
		return longi;
	}

	public void setLongi(String longi) {
		this.longi = longi;
	}
	public static int add(String clg,String address,String lat, String longi)
	{
		try{
			
			Connection con=ConnectionFact.dbConnect();
			String stquery1="SELECT COLLEGE_NAME FROM PG_COLLEGE";
			ResultSet rs;
			PreparedStatement pst=con.prepareStatement(stquery1);
			rs=pst.executeQuery();
			while(rs.next()){
			if(rs.getString("COLLEGE_NAME").equalsIgnoreCase(clg))
			{
			System.out.println("College already exists");
			return 10;
			}
			}
			System.out.println("Success1"+clg+"{"+address+lat+longi);
			String stquery="INSERT INTO PG_COLLEGE (COLLEGE_NAME,LAT,LON,ADDRESS) VALUES(?,?,?,?)";
			PreparedStatement pst1=con.prepareStatement(stquery);
			pst1.setString(1, clg);
			pst1.setString(2, lat);
			pst1.setString(3, longi);
			pst1.setString(4, address);
			int val=pst1.executeUpdate();
			System.out.println("Success1"+val+"ldl");
			if(val<1)
				return 0;
			if(val==1){
				return 1;
		}
			
		  }
		catch(Exception es){}
		return 0;
	}
	public static College getCollege(String clg)
	{
		College c=null;
		try{
			
			Connection con=ConnectionFact.dbConnect();
			String stquery1="SELECT * FROM PG_COLLEGE WHERE COLLEGE_NAME=?";
			PreparedStatement pst=con.prepareStatement(stquery1);
			pst.setString(1, clg);
			ResultSet rs;
			
			rs=pst.executeQuery();
			while(rs.next())
			{
			System.out.println("College  exists");
			c=new College(rs.getString("College_Name"),rs.getString("LAT"),rs.getString("LON"));	
			}
			
			
			System.out.println("Success1"+c.getName()+"ldl");
			
		}
		catch(Exception es){}
		return c;
	}
	public static ArrayList<College> getAllCollege()
	{
		ArrayList<College> alclg=new ArrayList<College>();
		try{
			Connection con=ConnectionFact.dbConnect();
			String stquery = "Select * from PG_COLLEGE";
			PreparedStatement pst=con.prepareStatement(stquery);
			ResultSet rs=pst.executeQuery();
			
			while(rs.next())
			{
				alclg.add(new College(rs.getString("College_Name"),rs.getString("LAT"),rs.getString("LON")));
			}
			
		}
		catch(Exception es){return null;}
		return alclg;
	}

}
