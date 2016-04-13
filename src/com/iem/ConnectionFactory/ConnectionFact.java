package com.iem.ConnectionFactory;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFact {
	static	Connection con;
	   
	   public static Connection  dbConnect()
	   {
		   try
			{
				
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","cmc");
			}catch(Exception ess)
			{
				System.out.print("Error 1" +ess.toString());
			}
		   return con;
				   
	   }
}
