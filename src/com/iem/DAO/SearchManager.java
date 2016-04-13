package com.iem.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iem.BEAN.PG;
import com.iem.ConnectionFactory.ConnectionFact;

public class SearchManager {
	
	public static ArrayList<PG> findPG(String clgname,String numb_of_occp, String num_of_bed,String budget, String pg_for,String tv,String ac,String food,String wifi){
		ArrayList<PG> alpg=new ArrayList<PG>();
		try{
			Connection con=ConnectionFact.dbConnect();
			String stquery = "Select * from PG";
			PreparedStatement pst=con.prepareStatement(stquery);			
			ResultSet rs=pst.executeQuery();
			
		
			while(rs.next())
			{
				
				if((numb_of_occp.equals("1")&&Integer.parseInt(num_of_bed)<=Integer.parseInt(rs.getString("B1"))&&Integer.parseInt(budget)>=Integer.parseInt(rs.getString("P1")))
					||(numb_of_occp.equals("2")&&Integer.parseInt(num_of_bed)<=Integer.parseInt(rs.getString("B2"))&&Integer.parseInt(budget)>=Integer.parseInt(rs.getString("P2")))
					||(numb_of_occp.equals("3")&&Integer.parseInt(num_of_bed)<=Integer.parseInt(rs.getString("B3"))&&Integer.parseInt(budget)>=Integer.parseInt(rs.getString("P3")))
						)
				if(wifi.equals(rs.getString("WIFI"))&&ac.equals(rs.getString("AC"))&&food.equals(rs.getString("FOOD"))&&tv.equals(rs.getString("TV")))
				alpg.add(new PG(Integer.parseInt(rs.getString(1)),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),rs.getString(16),rs.getString(17),rs.getString(18)));	
				
			}
			/*for(int i=0;i<alpg.size();i++)
			{
				System.out.println(alpg.get(i).getPGID());
			}*/
		}
		catch(Exception es){}
		return alpg;
	}
	
	

}
