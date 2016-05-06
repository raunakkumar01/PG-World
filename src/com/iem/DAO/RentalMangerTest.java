package com.iem.DAO;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class RentalMangerTest {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testVerify() {
		int result=RentalManger.verify("sk@m.c","305");
		int expResult = 0;
        assertEquals(expResult, result);
		
		//fail("Not yet implemented");
	}

	@Test
	public void testDelete() {
		int result=RentalManger.delete("sghk@m.c","305");
		int expResult = 0;
        assertEquals(expResult, result);
		//fail("Not yet implemented");
	}
	
}
