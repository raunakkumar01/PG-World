package com.iem.BEAN;
/*
 * Author: Raunak Kumar and Shamik Kundu
 * Description: this is a model class providing attributes corresponding to a particular database and also
 * sql queries to peroform database actions. 
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iem.ConnectionFactory.ConnectionFact;

public class PG {
private int PGID;
private String OwnerUnm;
private String PG_FOR;
private String AddressLine;
private String City;
private String Pincode;
private String WiFi;
private String AC;
private String FOOD;
private String TV;
private String b1;
private String p1;
private String b2;
private String p2;
private String b3;
private String p3;
private String lat;
private String lon;


public PG(int pGID, String ownerUnm, String pG_FOR, String addressLine,
		String city, String pincode, String wiFi, String aC, String fOOD,
		String tV, String b1, String p1, String b2, String p2, String b3,
		String p3, String lat, String lon) {
	super();
	PGID = pGID;
	OwnerUnm = ownerUnm;
	PG_FOR = pG_FOR;
	AddressLine = addressLine;
	City = city;
	Pincode = pincode;
	WiFi = wiFi;
	AC = aC;
	FOOD = fOOD;
	TV = tV;
	this.b1 = b1;
	this.p1 = p1;
	this.b2 = b2;
	this.p2 = p2;
	this.b3 = b3;
	this.p3 = p3;
	this.lat = lat;
	this.lon = lon;
}


public String getLat() {
	return lat;
}
public void setLat(String lat) {
	this.lat = lat;
}
public String getLon() {
	return lon;
}
public void setLon(String lon) {
	this.lon = lon;
}
public int getPGID() {
	return PGID;
}
public void setPGID(int pGID) {
	PGID = pGID;
}
public String getOwnerUnm() {
	return OwnerUnm;
}
public void setOwnerUnm(String ownerUnm) {
	OwnerUnm = ownerUnm;
}
public String getPG_FOR() {
	return PG_FOR;
}
public void setPG_FOR(String pG_FOR) {
	PG_FOR = pG_FOR;
}
public String getAddressLine() {
	return AddressLine;
}
public void setAddressLine(String addressLine) {
	AddressLine = addressLine;
}
public String getCity() {
	return City;
}
public void setCity(String city) {
	City = city;
}
public String getPincode() {
	return Pincode;
}
public void setPincode(String pincode) {
	Pincode = pincode;
}
public String getWiFi() {
	return WiFi;
}
public void setWiFi(String wiFi) {
	WiFi = wiFi;
}
public String getAC() {
	return AC;
}
public void setAC(String aC) {
	AC = aC;
}
public String getFOOD() {
	return FOOD;
}
public void setFOOD(String fOOD) {
	FOOD = fOOD;
}
public String getTV() {
	return TV;
}
public void setTV(String tV) {
	TV = tV;
}
public String getB1() {
	return b1;
}
public void setB1(String b1) {
	this.b1 = b1;
}
public String getP1() {
	return p1;
}
public void setP1(String p1) {
	this.p1 = p1;
}
public String getB2() {
	return b2;
}
public void setB2(String b2) {
	this.b2 = b2;
}
public String getP2() {
	return p2;
}
public void setP2(String p2) {
	this.p2 = p2;
}
public String getB3() {
	return b3;
}
public void setB3(String b3) {
	this.b3 = b3;
}
public String getP3() {
	return p3;
}
public void setP3(String p3) {
	this.p3 = p3;
}

public static PG getPG(int pgid)
{
	try{
		Connection con=ConnectionFact.dbConnect();
		String stquery = "Select * from PG where PGID=?";
		PreparedStatement pst=con.prepareStatement(stquery);
		pst.setInt(1, pgid);
		ResultSet rs=pst.executeQuery();
		PG p=null;
		if(rs.next())
		 p=new PG(Integer.parseInt(rs.getString(1)),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),rs.getString(16),rs.getString(17),rs.getString(18));	
		return p;
	}
	catch(Exception es){return null;}
	
}
public static ArrayList<PG> getAllPG()
{
	ArrayList<PG> alpg=new ArrayList<PG>();
	try{
		Connection con=ConnectionFact.dbConnect();
		String stquery = "Select * from PG";
		PreparedStatement pst=con.prepareStatement(stquery);
		ResultSet rs=pst.executeQuery();
		
		while(rs.next())
		{
			alpg.add(new PG(Integer.parseInt(rs.getString(1)),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),rs.getString(16),rs.getString(17),rs.getString(18)));	
		}
		
	}
	catch(Exception es){return null;}
	return alpg;
}
public static int addPG1(String unm,String address,String city,String pin, String lat, String longi){
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
 public static int addPG2(String address,String unm,String gender,String tv,String ac,String food,String wifi,String b1,String p1 ,String b2,String p2,String b3,String p3){
	 try{
			Connection con=ConnectionFact.dbConnect();
			String stquery="UPDATE PG SET PG_FOR=?,TV=?,AC=?,FOOD=?,WIFI=?,B1=?,P1=?,B2=?,P2=?,B3=?,P3=? where OWNERUNM=? AND ADDRESS=?";
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
			pst1.setString(13, address);
			int val=pst1.executeUpdate();
			if(val>0)
				return 1;
			else return 2;
			
		}
		catch(Exception es){}
	 return 0;
 }
  public static int getupdatepg(String pgg,String unm,String gender,String tv,String ac,String food,String wifi,String b1,String p1 ,String b2,String p2,String b3,String p3){
	  try{
			 Connection con=ConnectionFact.dbConnect();
			 String stquery="UPDATE PG SET PG_FOR=?,TV=?,AC=?,FOOD=?,WIFI=?,B1=?,P1=?,B2=?,P2=?,B3=?,P3=? where PGID=?";
				PreparedStatement pst21=con.prepareStatement(stquery);
				pst21.setString(1, gender);
				pst21.setString(2, tv);
				pst21.setString(3, ac);
				pst21.setString(4, food);
				pst21.setString(5, wifi);
				pst21.setString(6, b1);
				pst21.setString(7, p1);
				pst21.setString(8, b2);
				pst21.setString(9, p2);
				pst21.setString(10, b3);
				pst21.setString(11, p3);
				pst21.setString(12, pgg);
				int val=pst21.executeUpdate();
				if(val>0)
					return 1;
				else return 2;
		 }catch(Exception es){}
	  return 1;
  }
  public static ArrayList<PG> get_PGDetails(int id){
		 ArrayList<PG> allist=new ArrayList<PG>();
		 try{
			 Connection con=ConnectionFact.dbConnect();
			 String qrr="SELECT * FROM PG WHERE PGID=?";
			 PreparedStatement pst12=con.prepareStatement(qrr);
			 pst12.setInt(1, id);
			 ResultSet rs12=pst12.executeQuery();
			 while(rs12.next())
				{
					allist.add(new PG(rs12.getInt("PGID"),rs12.getString("OWNERUNM"),rs12.getString("PG_FOR"),rs12.getString("ADDRESS"),rs12.getString("CITY"),rs12.getString("PINCODE"),rs12.getString("WIFI"),rs12.getString("AC"),rs12.getString("FOOD"),rs12.getString("TV"),rs12.getString("B1"),rs12.getString("P1"),rs12.getString("B2"),rs12.getString("P2"),rs12.getString("B3"),rs12.getString("P3"),rs12.getString("LAT"),rs12.getString("LONGI")));
				}
		 }catch(Exception es){}
		 return allist;
	 }
  public static ArrayList<String> get_pg_id(String unm){
	  ArrayList<String> pgid=new ArrayList<String>();
	  try{
		  Connection con=ConnectionFact.dbConnect();
			 String qrr="SELECT PGID FROM PG WHERE OWNERUNM=?";
			 PreparedStatement pst12=con.prepareStatement(qrr);
			 pst12.setString(1, unm);
			 ResultSet rs12=pst12.executeQuery();
			 System.out.println("hi");
			 
			 System.out.println("hi2");
			 int i=0;
			 while(rs12.next()){
				 //System.out.println(pgid[i]);
				 pgid.add(rs12.getString(1));
				 
			 }
			 return pgid;
	  }
	  
	  catch(Exception es){es.printStackTrace();}
	  return pgid;
  }
}
