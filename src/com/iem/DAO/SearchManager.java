package com.iem.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.iem.BEAN.College;
import com.iem.BEAN.PG;
import com.iem.BEAN.Rental;
import com.iem.BEAN.Student;
import com.iem.ConnectionFactory.ConnectionFact;
/*class Pair<L,R> {

	  private final L left;
	  private final R right;

	  public Pair(L left, R right) {
	    this.left = left;
	    this.right = right;
	  }

	  public L getLeft() { return left; }
	  public R getRight() { return right; }

	  @Override
	  public int hashCode() { return left.hashCode() ^ right.hashCode(); }

	  @Override
	  public boolean equals(Object o) {
	    if (!(o instanceof Pair)) return false;
	    Pair pairo = (Pair) o;
	    return this.left.equals(pairo.getLeft()) &&
	           this.right.equals(pairo.getRight());
	  }

	}*/

public class SearchManager {
	
	/*public static ArrayList<PG> findPG(String clgname,String numb_of_occp, String num_of_bed,String budget, String pg_for,String tv,String ac,String food,String wifi){
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
			for(int i=0;i<alpg.size();i++)
			{
				System.out.println(alpg.get(i).getPGID());
			}
		}
		catch(Exception es){}
		return alpg;
	}
	
	*/
	
	
	
	
	
	
	
	
	public static int max(int x,int y)
	{
		return x>y?x:y;
	}
	
	public HashMap<PG,HashMap<String,Integer>> pgStudentsOfCollege=new HashMap<PG,HashMap<String,Integer>>();
	//Hahmap for each pg->(Hashmap for each clgname iside it->(no of students of that particular college))
	
	public void findPG(String clgname,String numb_of_occp, String num_of_bed,String budget, String pg_for,String tv,String ac,String food,String wifi,ArrayList<PG> alpgn,ArrayList<PG> alpgf,College c){
		 
		
		ArrayList<PG> alpg=new ArrayList<PG>();
		
		try{
			/*Connection con=ConnectionFact.dbConnect();
			String stquery = "Select * from PG";
			PreparedStatement pst=con.prepareStatement(stquery);			
			ResultSet rs=pst.executeQuery();*/
			
			System.out.println(clgname);
			
			for(PG p:PG.getAllPG())
			{
				
				if((numb_of_occp.equals("1")&&Integer.parseInt(num_of_bed)<=Integer.parseInt(p.getB1())&&Integer.parseInt(budget)>=Integer.parseInt(p.getP1()))
							||(numb_of_occp.equals("2")&&Integer.parseInt(num_of_bed)<=Integer.parseInt(p.getB2())&&Integer.parseInt(budget)>=Integer.parseInt(p.getP2()))
							||(numb_of_occp.equals("3")&&Integer.parseInt(num_of_bed)<=Integer.parseInt(p.getB3())&&Integer.parseInt(budget)>=Integer.parseInt(p.getP3()))
								)
						if(wifi.equals(p.getWiFi())&&ac.equals(p.getAC())&&food.equals(p.getFOOD())&&tv.equals(p.getTV()))
								alpg.add(p);
			}
			for(int i=0;i<alpg.size();i++)
			{
				System.out.println(alpg.get(i).getPGID()+"o");
				ArrayList<Rental> r=Rental.getRental(""+alpg.get(i).getPGID());
				
				for(int j=0;j<r.size();j++)
				{
					//System.out.println(r.get(j).getUsername()+"i");
					String clgnm=Student.getCollege(r.get(j).getUsername());
					//college name for each student
					//System.out.println(clgnm+"i");
					//pgStudentsOfCollege.put(alpg.get(i).getPGID(), (pgStudentsOfCollege.get(alpg.get(i).getPGID())).getRight() + 1);
					if(pgStudentsOfCollege.containsKey(alpg.get(i)))
					{
						HashMap<String,Integer> cs=pgStudentsOfCollege.get(alpg.get(i));
						if(cs.containsKey(clgnm))
						{
							cs.put(clgnm,cs.get(clgnm)+1);
						}
						else cs.put(clgnm, 1);
					}
					else {
						HashMap<String, Integer> cs=new HashMap<String, Integer>();
						cs.put(clgnm, 1);
						pgStudentsOfCollege.put(alpg.get(i),cs);
					}
					HashMap<String,Integer> cs=pgStudentsOfCollege.get(alpg.get(i)); 
					System.out.println(clgnm+" "+cs.get(clgnm));
				}
			}
		}
		catch(Exception es){}
		
		//System.out.println(c.getName());
		int x,y;
		for (Map.Entry<PG, HashMap<String, Integer>> entryO : pgStudentsOfCollege.entrySet()) {
			x=y=0;
			for (Map.Entry<String, Integer> entryI : entryO.getValue().entrySet())
			{
				if(entryI.getKey().equalsIgnoreCase(clgname))
					x+=entryI.getValue();
				else{
					if(y==0)y=entryI.getValue();
					y=max(y,entryI.getValue());
				}
			}
			System.out.println(entryO.getKey().getPGID()+" n="+x+" f="+y);
			if(x>=y)alpgn.add(entryO.getKey());
			else alpgf.add(entryO.getKey());
	    }
		//return alpg;
	}
	
	
	/*
	
	public void findPG(String clgname,String numb_of_occp, String num_of_bed,String budget, String pg_for,String tv,String ac,String food,String wifi,ArrayList<PG> alpgn,ArrayList<PG> alpgf,College c){
		 
		
		ArrayList<PG> alpg=new ArrayList<PG>();
		
		try{
			Connection con=ConnectionFact.dbConnect();
			String stquery = "Select * from PG";
			PreparedStatement pst=con.prepareStatement(stquery);			
			ResultSet rs=pst.executeQuery();
			
			System.out.println(clgname);
			while(rs.next())
			{
				
				if((numb_of_occp.equals("1")&&Integer.parseInt(num_of_bed)<=Integer.parseInt(rs.getString("B1"))&&Integer.parseInt(budget)>=Integer.parseInt(rs.getString("P1")))
					||(numb_of_occp.equals("2")&&Integer.parseInt(num_of_bed)<=Integer.parseInt(rs.getString("B2"))&&Integer.parseInt(budget)>=Integer.parseInt(rs.getString("P2")))
					||(numb_of_occp.equals("3")&&Integer.parseInt(num_of_bed)<=Integer.parseInt(rs.getString("B3"))&&Integer.parseInt(budget)>=Integer.parseInt(rs.getString("P3")))
						)
				if(wifi.equals(rs.getString("WIFI"))&&ac.equals(rs.getString("AC"))&&food.equals(rs.getString("FOOD"))&&tv.equals(rs.getString("TV")))
				alpg.add(new PG(Integer.parseInt(rs.getString(1)),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),rs.getString(16),rs.getString(17),rs.getString(18)));	
				
			}
			for(int i=0;i<alpg.size();i++)
			{
				System.out.println(alpg.get(i).getPGID()+"o");
				ArrayList<Rental> r=Rental.getRental(""+alpg.get(i).getPGID());
				
				for(int j=0;j<r.size();j++)
				{
					//System.out.println(r.get(j).getUsername()+"i");
					String clgnm=Student.getCollege(r.get(j).getUsername());
					//college name for each student
					//System.out.println(clgnm+"i");
					//pgStudentsOfCollege.put(alpg.get(i).getPGID(), (pgStudentsOfCollege.get(alpg.get(i).getPGID())).getRight() + 1);
					if(pgStudentsOfCollege.containsKey(alpg.get(i)))
					{
						HashMap<String,Integer> cs=pgStudentsOfCollege.get(alpg.get(i));
						if(cs.containsKey(clgnm))
						{
							cs.put(clgnm,cs.get(clgnm)+1);
						}
						else cs.put(clgnm, 1);
					}
					else {
						HashMap<String, Integer> cs=new HashMap<String, Integer>();
						cs.put(clgnm, 1);
						pgStudentsOfCollege.put(alpg.get(i),cs);
					}
					HashMap<String,Integer> cs=pgStudentsOfCollege.get(alpg.get(i)); 
					System.out.println(clgnm+" "+cs.get(clgnm));
				}
			}
		}
		catch(Exception es){}
		
		//System.out.println(c.getName());
		int x,y;
		for (Map.Entry<PG, HashMap<String, Integer>> entryO : pgStudentsOfCollege.entrySet()) {
			x=y=0;
			for (Map.Entry<String, Integer> entryI : entryO.getValue().entrySet())
			{
				if(entryI.getKey().equalsIgnoreCase(clgname))
					x+=entryI.getValue();
				else{
					if(y==0)y=entryI.getValue();
					y=max(y,entryI.getValue());
				}
			}
			System.out.println(entryO.getKey().getPGID()+" n="+x+" f="+y);
			if(x>=y)alpgn.add(entryO.getKey());
			else alpgf.add(entryO.getKey());
	    }
		//return alpg;
	}
	
	
	
	
	
	
	public static void main(String args[])
	{
		ArrayList<PG> alpgn=new ArrayList<PG>(),alpgf=new ArrayList<PG>();
		SearchManager sm=new SearchManager();
		College c=null;
		sm.findPGN("IEM", "1", "1", "5000", "male","true", "false", "false", "false", alpgn, alpgf,c);		
	}*/
	
	

}
