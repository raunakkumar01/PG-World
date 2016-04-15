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
}
