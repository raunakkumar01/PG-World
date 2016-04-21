package com.iem.DAO;

import java.util.ArrayList;

import com.iem.BEAN.Rental;

public class ReviewManager {
	
	public static boolean checkStudent(String unm,String pgid)
	{
		
		ArrayList<Rental> alren=Rental.getRental(pgid);
		
		for(Rental r: alren)
		{
			if(r.getUsername().equals(unm))return true;
			
		}
		
		return false;
	}

}
