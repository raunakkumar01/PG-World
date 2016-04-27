package com.iem.DAO;
import com.iem.BEAN.PGIndex;
import com.iem.BEAN.User;
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
		User as=null;
	as=User.getAuth(mail, pwd);
	if(as!=null)
	{
		
		{
			if(pwd.equals(as.getPassword()))
			{
									
			if(as.getCategory().equalsIgnoreCase("Houseowner"))
			{
				
				return house;
			}
			else if(as.getCategory().equalsIgnoreCase("Student"))
			{
				return stud;
			}
	        }
		}
		}
	System.out.println("hi from usermanager: the function from user returned null");
	return fail;
	}
	
	public static int register_gen(String mail,String pwd,String name,String cat, String contact_number)
	{
		int a=User.getReg_Gen(mail, pwd, name, cat, contact_number);
			if(a<1)
				return 0;
			if(a==1){
			if (cat.equals("Houseowner"))
			{
			int b=User.getReg_House(mail, contact_number);
			if(b==1)
			return 1;
			else return 0;
			}
			else if(cat.equals("Student"))
			{
				int c=User.getReg_Student(mail, contact_number);
				if(c==2)
				return 2;
				else return 0;
			}
		   }
		return 0;
	}
	
	public static int reghouse(String unm,String address,String city,String pin, String lat, String longi)
	{
			int cc=User.getReg_House2(unm, address, city, pin, lat, longi);
			    if(cc==1)
				return 1;
			else return 0;
		
		
	}
	
	public static int register_houseowner(String adrs,String unm,String pg_for,String tv,String ac,String food,String wifi,String b1,String p1,String b2,String p2,String b3,String p3){
		 int dd=User.getReg_House3(adrs, unm, pg_for, tv, ac, food, wifi, b1, p1, b2, p2, b3, p3);
			if(dd==1)
			return 1;
			else return 2;
		
	}
	
	public static int register_student(String unm,String gender,String dob,String address,String clgname){
        int val2=User.getReg_Student2(unm, gender, dob, address, clgname);
    	 if (val2==1)
    		 return 1;
    	 else
    		 return 2;
	}
	
	public static ArrayList<PGIndex> getPGNames(String unm)
	{
		ArrayList<PGIndex> nes=new ArrayList<PGIndex>();
		nes=User.getPGName(unm);
		return nes;
	}
}
		

