package com.iem.DAO;
/*
 * Author: Raunak Kumar
 * Description: this class provides functions to perform the following operations:
 * 1.Adds review for a pg by an student if he is verified 
 */
 
import java.util.ArrayList;

import com.iem.BEAN.PGReview;
import com.iem.BEAN.Rental;

public class ReviewManager {
	public static int addPGReview(PGReview pr)
	{
		int i=0;
		//ArrayList<Rental> alren=Rental.getRental(pr.getPgid());
		ArrayList<Rental> alren=RentalManger.findStudent(pr.getPgid());
		for(Rental r: alren)
		{
			if(r.getUsername().equals(pr.getUsername())){
				i=PGReview.addReview(pr);
				return i;
			}
			
		}
		
		return i;
	}
	


}
