package com.iem.BEAN;
/*
 * Author: Shamik Kundu
 * Description: this is a model class providing attributes corresponding to a particular database and also
 * sql queries to peroform database actions. 
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iem.ConnectionFactory.ConnectionFact;

public class Student extends User{
    
   private String gender;
   private String dob;
   private String college;
   private String address;
   private String contact_no;

  

    public Student(String username, String password, String name, String category,
		String gender, String dob, String college, String address,
		String contact_no) {
	super(username, password, name, category);
	this.gender = gender;
	this.dob = dob;
	this.college = college;
	this.address = address;
	this.contact_no = contact_no;
}

	public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact_no() {
        return contact_no;
    }

    public void setContact_no(String contact_no) {
        this.contact_no = contact_no;
    }
    public static String getCollege(String unm)
    {
    	//ArrayList<Rental> =new ArrayList<Rental>();
    	String clgnm=null;
    	try{
    		Connection con=ConnectionFact.dbConnect();
    		String stquery = "Select COLLEGE_NAME from PG_STUDENT where USERNAME=?";
    		PreparedStatement pst=con.prepareStatement(stquery);	
    		pst.setString(1, unm);
    		ResultSet rs=pst.executeQuery();
    		while(rs.next())
    		{
    			clgnm=rs.getString("COLLEGE_NAME");
    		}
    	}
    	catch(Exception es){}
    	return clgnm;
    }
   
}
