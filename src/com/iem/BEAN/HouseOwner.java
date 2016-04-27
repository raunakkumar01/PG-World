package com.iem.BEAN;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.iem.ConnectionFactory.ConnectionFact;

public class HouseOwner extends User{
    private String contact_no;

   

    public HouseOwner(String username, String password, String name,
			String category, String contact_no) {
		super(username, password, name, category);
		this.contact_no = contact_no;
	}

	public String getContact_no() {
        return contact_no;
    }

    public void setContact_no(String contact_no) {
        this.contact_no = contact_no;
    }
    public static HouseOwner getHouseOwner(String unm)
    {
    	try{
    		
    		Connection con=ConnectionFact.dbConnect();
    		String stquery = "Select * from PG_USER where USERNAME=?";
    		PreparedStatement pst=con.prepareStatement(stquery);
    		pst.setString(1, unm);
    		ResultSet rs=pst.executeQuery();
    		
    		stquery = "Select * from PG_HOUSE_OWNER where USERNAME=?";
    		pst=con.prepareStatement(stquery);
    		pst.setString(1, unm);
    		ResultSet rs1=pst.executeQuery();
    		
    		HouseOwner h=null;
    		if(rs.next() && rs1.next()){
    		 h=new HouseOwner(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs1.getString(1));	
    		//System.out.println(h.getContact_no());
    		 }
    		return h;
    	}
    	catch(Exception es){return null;}
    }
    public static HouseOwner showDetails(String unm){
    	HouseOwner h=null;
    	try{
    	Connection con=ConnectionFact.dbConnect();
    	String stquery2="SELECT CONTACT_NO FROM PG_HOUSE_OWNER WHERE USERNAME=?";
    	String stquery3="SELECT NAME FROM PG_USER WHERE USERNAME=?";
    	PreparedStatement pst=con.prepareStatement(stquery2);
    	PreparedStatement pst1=con.prepareStatement(stquery3);
    	pst.setString(1, unm);
    	pst1.setString(1, unm);
    	ResultSet rs1=pst1.executeQuery();
    	ResultSet rs=pst.executeQuery();
    	String k="";
    	String k1="";
    	while(rs.next())
    		k=rs.getString("CONTACT_NO");
    	while(rs1.next())
    		k1=rs1.getString("NAME");
    	h=new HouseOwner(unm,"xyz",k1,"HouseOwner",k);
    	}catch(Exception es){es.printStackTrace();}
    	return h;
    }
}
