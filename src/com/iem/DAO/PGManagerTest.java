package com.iem.DAO;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class PGManagerTest {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testCreatePG1() {
		//fail("Not yet implemented");
		int result=PGManager.createPG1("rk@m.c", "FE-11/4", "kolkata", "700091", "22.2444", "23.4444");
		int expResult = 1;
        assertEquals(expResult, result);
	}

	@Test
	public void testCreatePG3() {
		//fail("Not yet implemented");
		int result=PGManager.createPG3("FE-11/4", "rk@m.c", "male","true", "true", "true", "true", "1", "1000", "1","1000", "1", "1000");
		int expResult = 1;
        assertEquals(expResult, result);	
	}

/*	@Test
	public void testGetPGDetails() {
		//fail("Not yet implemented");
		
	}

	@Test
	public void testUpdatePG() {
		fail("Not yet implemented");
	}*/

}
