package com.iem.DAO;
import com.iem.BEAN.*;
import java.sql.*;
import java.util.ArrayList;
import com.iem.ConnectionFactory.ConnectionFact;
/*
 * Author: Shamik Kundu
 * Description: this class provides functions to perform the following operations:
 * 1. Add a new PG from manageprofile page of houseowner.
 * 2. Update an existing PG.
 * 3. Get details of an already added PG. 
 */
 
public class PGManager {
	
	public static int createPG1(String unm,String address,String city,String pin, String lat, String longi)
	{
		int b=PG.addPG1(unm, address, city, pin, lat, longi);
		if(b==10)
			return 10;
		else if(b==1)
			return 1;
		else return 0;
	}
	
	
	
public static int createPG3(String address,String unm,String gender,String tv,String ac,String food,String wifi,String b1,String p1 ,String b2,String p2,String b3,String p3){
	int bb=PG.addPG2(address, unm, gender, tv, ac, food, wifi, b1, p1, b2, p2, b3, p3);
	if(bb==1)
		return 1;
	else if(bb==2)
		return 2;
	else 
		return 0;
}
 public static ArrayList<PG> getPGDetails(int id){
	 ArrayList<PG> allist=new ArrayList<PG>();
	 allist=PG.get_PGDetails(id);
	 return allist;
 }
 
 public static int updatePG(String pgg,String unm,String gender,String tv,String ac,String food,String wifi,String b1,String p1 ,String b2,String p2,String b3,String p3){
	 int ee=PG.getupdatepg(pgg, unm, gender, tv, ac, food, wifi, b1, p1, b2, p2, b3, p3);
	 if(ee==1)
		 return 1;
	 else return 2;
 }
}
