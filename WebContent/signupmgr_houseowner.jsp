<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.iem.ConnectionFactory.ConnectionFact" import="java.sql.*" import="java.util.ArrayList"
import= "java.util.Collections" import="com.iem.DAO.UserManager"  %>
<%-- 
  - Author: Shamik Kundu
  - Description: this page will redirect the houseowner to either manageprofile page or to the same page 
                 based upon successful/unsuccessful entry in the database.
  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
String tv="false";
 String ac="false";
String wifi= "false";
String food= "false";
System.out.println("hi");
String pg_for=request.getParameter("audi");
int pgid=0;
String[] facilities;
facilities= request.getParameterValues("fac");
if (facilities!= null) 
{
   for (int i = 0; i < facilities.length; i++) 
   {
     if(facilities[i].equalsIgnoreCase("TV"))
    	 tv="true";
     if(facilities[i].equalsIgnoreCase("WIFI"))
    	 wifi="true";
     if(facilities[i].equalsIgnoreCase("FOOD"))
    	 food="true";
     if(facilities[i].equalsIgnoreCase("AC"))
    	 ac="true";
    }
}
String b1=request.getParameter("b1");
String p1=request.getParameter("p1");
String b2=request.getParameter("b2");
String p2=request.getParameter("p2");
String b3=request.getParameter("b3");
String p3=request.getParameter("p3");

String cat=session.getAttribute("cat").toString();
String unm=session.getAttribute("mail").toString();
String adrs=session.getAttribute("adrs").toString();


int ewd=UserManager.register_houseowner(adrs,unm,pg_for, tv, ac, food, wifi, b1, p1, b2, p2, b3, p3);
if (ewd==1)
{   request.getSession().setAttribute("cat", cat);
	request.getSession().setAttribute("mail", unm);
	System.out.println("success !");
	System.out.println("hi1");
	response.sendRedirect("manageprofile_houseowner.jsp");
	System.out.println("hi2");
}
else if(ewd==2)
{
	request.getSession().setAttribute("mail", unm);
    System.out.println("Renter Details");
    response.sendRedirect("signup_houseowner2.jsp");
	
}

%>
</body>
</html>