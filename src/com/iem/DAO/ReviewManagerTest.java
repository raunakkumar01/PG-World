package com.iem.DAO;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Test;

import com.iem.BEAN.College;
import com.iem.BEAN.PG;

public class ReviewManagerTest {

	@Test
	public void testCheckStudent() {
		//fail("Not yet implemented");
		
		String unm="sk@m.c",uid="108";
		//ReviewManager rm=new ReviewManager();
		int result=ReviewManager.addPGReview(null);
		int expResult = 1;
        //boolean result = instance.doSomething(me, you);
        assertEquals(expResult, result);
	}

}
