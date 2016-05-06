<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
      pageEncoding="ISO-8859-1" import="com.iem.ConnectionFactory.ConnectionFact" import="java.sql.*" import="java.util.ArrayList"
import= "java.util.Collections"  import="com.iem.DAO.SearchManager"  import="com.iem.BEAN.PG" import="com.iem.BEAN.College"%>
	<%-- 
  - Author: Raunak Kumar
  - Description: redirects user to  a page where he can see  details of all possible PG for given specification
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
String clgname= request.getParameter("clgnm");
String numb_of_occp= request.getParameter("nofoc");
String num_of_bed= request.getParameter("nofbd");
String budget= request.getParameter("bdgt");

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

String pg_for=request.getParameter("user_type");

PG dataOfPreviousPage=new PG(0,"",pg_for,"","","",wifi,ac,food,tv,numb_of_occp,num_of_bed,budget,"","","","","");
//String unm=session.getAttribute("mail").toString();
System.out.println(clgname+"jsp now "+wifi);
ArrayList<PG> alpgn=new ArrayList<PG>(),alpgf=new ArrayList<PG>();
//SearchManager.findPG(clgname, numb_of_occp, num_of_bed, budget, pg_for, tv, ac, food, wifi);
SearchManager sm=new SearchManager();
College c=null;
sm.findPG(clgname, numb_of_occp, num_of_bed, budget, pg_for, tv, ac, food, wifi,alpgn,alpgf,c);
c=College.getCollege(clgname);
/*for(int i=0;i<alpg.size();i++)
{
	System.out.println(alpg.get(i).getPGID());
}*/
System.out.println(c.getName()+"getting it");

if (alpgn.size()>0||alpgf.size()>0||c!=null)
{
	//request.getSession().setAttribute("mail", unm);
	//request.getSession().setAttribute("alpg", alpg);
	System.out.println(alpgn.size()+","+alpgf.size());
	request.getSession().setAttribute("clg", c);
	request.getSession().setAttribute("alpgn", alpgn);
	request.getSession().setAttribute("alpgf", alpgf);
	request.getSession().setAttribute("pgStudentsOfCollege", sm.pgStudentsOfCollege);
	request.getSession().setAttribute("prvVal", dataOfPreviousPage);
	System.out.println("success");
	response.sendRedirect("searchPGN.jsp");
}
else 
{
	// request.getSession().setAttribute("mail", unm);
    System.out.println("No Pg Available");
    response.sendRedirect("searchPG.jsp");
	
}

%>
</body>
</html>