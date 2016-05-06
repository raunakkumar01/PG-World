package com.iem.DAO;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class UserManagerTest {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testAuthenticate() {
		//fail("Not yet implemented");
		String unm="sk@m.c",uid="shamik";
		//UserManager rm=new UserManager();
		String result=UserManager.authenticate(unm, uid);
		String expResult = "STUDENT";
        //boolean result = instance.doSomething(me, you);
        assertEquals(expResult, result);
		
		
	}

	//@Test
	 public void testRegister_gen() {
		fail("Not yet implemented");
		int result=UserManager.register_gen("ska@m.c", "ssa", "munro", "HOUSEOWNER", "7059468456");
		int expResult = 0;
        assertEquals(expResult, result); 
		
		
	}

	//@Test
	public void testReghouse() {
		//fail("Not yet implemented");
		int result=UserManager.reghouse("ska@m.c", "CJ-212", "kolkata", "700091", "88.222222", "87.222222");
		int expResult = 1;
        assertEquals(expResult, result);
	}

	//@Test
	public void testRegister_houseowner() {
		//fail("Not yet implemented");
		int result=UserManager.register_houseowner("CJ-212", "ska@m.c", "male", "true", "true", "true", "true", "1", "1000", "1","1000", "1", "1000");
		int expResult = 1;
        assertEquals(expResult, result);
	}

	//@Test
	public void testRegister_student() {
		//fail("Not yet implemented");
		int result=UserManager.register_student("sk@m.c", "male","13-4-1995", "EE-141/4", "IEM");
		int expResult = 1;
        assertEquals(expResult, result);
	}

	//@Test
	/*public void testGetPGNames() {
		//fail("Not yet implemented");
	}*/

}
