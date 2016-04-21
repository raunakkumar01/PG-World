package com.iem.DAO;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.iem.BEAN.College;
import com.iem.BEAN.PG;

public class SearchManagerTest {

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() {
		//fail("Not yet implemented");
		System.out.println("findPG");
		ArrayList<PG> alpgn=new ArrayList<PG>(),alpgf=new ArrayList<PG>();
		ArrayList<PG> alpgAn=new ArrayList<PG>(),alpgAf=new ArrayList<PG>();
		SearchManager sm=new SearchManager();
		College c=null;
		sm.findPG("IEM", "1", "1", "5000", "male","true", "false", "false", "false", alpgn, alpgf,c);		
        //boolean expResult = true;
        //boolean result = instance.doSomething(me, you);
        assertEquals(alpgn, alpgAn);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
	}

}
