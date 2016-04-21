package com.iem.BEAN;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iem.ConnectionFactory.ConnectionFact;

public class PGReview {
	
	private String pgid,username,rate,review;

	public PGReview(String pgid, String username, String rate, String review) {
		super();
		this.pgid = pgid;
		this.username = username;
		this.rate = rate;
		this.review = review;
	}

	public String getPgid() {
		return pgid;
	}

	public void setPgid(String pgid) {
		this.pgid = pgid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}
	
	public static int addReview(PGReview pr)
	{
		try{
			
			Connection con=ConnectionFact.dbConnect();
			
			String stquery="INSERT INTO PG_REVIEW (PGID,USERNAME,RATE,REVIEW) VALUES(?,?,?,?)";
			PreparedStatement pst1=con.prepareStatement(stquery);
			pst1.setString(1, pr.getPgid());
			pst1.setString(2, pr.getUsername());
			pst1.setString(3, pr.getRate());
			pst1.setString(4, pr.getReview());
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
	public static ArrayList<PGReview> getReview(String pgid)
	{
		ArrayList<PGReview> alrev=new ArrayList<PGReview>();
		
		System.out.println("no"+pgid);
		try{
			Connection con=ConnectionFact.dbConnect();
			String stquery = "Select * from PG_REVIEW where PGID=?";
			PreparedStatement pst=con.prepareStatement(stquery);	
			pst.setString(1, pgid);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				alrev.add(new PGReview(rs.getString("PGID"),rs.getString("USERNAME"),rs.getString("RATE"),rs.getString("REVIEW")));
			}
		}
		catch(Exception es){}
		return alrev;
	}
}
