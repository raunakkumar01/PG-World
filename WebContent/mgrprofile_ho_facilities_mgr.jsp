<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.iem.DAO.PGManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String unm=session.getAttribute("mail").toString();
String tv="false";
String ac="false";
String wifi= "false";
String food= "false";
System.out.println("hi");
String[] facilities;
facilities= request.getParameterValues("utility");
if (facilities!= null) 
{
  for (int i = 0; i < facilities.length; i++) 
  {
    if(facilities[i].equalsIgnoreCase("tv"))
   	 tv="true";
    if(facilities[i].equalsIgnoreCase("wifi"))
   	 wifi="true";
    if(facilities[i].equalsIgnoreCase("food"))
   	 food="true";
    if(facilities[i].equalsIgnoreCase("ac"))
   	 ac="true";
   }
}
String gender=request.getParameter("gender");
String[] utility=request.getParameterValues("utility");
String b1=request.getParameter("b1");
String b2=request.getParameter("b2");
String b3=request.getParameter("b3");
String p1=request.getParameter("p1");
String p2=request.getParameter("p2");
String p3=request.getParameter("p3");
String ad=session.getAttribute("adrs").toString();
String cat=session.getAttribute("cat").toString();
%>

<%
int val=PGManager.createPG3(ad,unm,gender, tv, ac, food, wifi, b1, p1 , b2, p2, b3, p3);
if(val==1){
	request.getSession().setAttribute("cat", cat);
	session.removeAttribute("adrs");
	request.getSession().setAttribute("mail", unm);
	response.sendRedirect("manageprofile_houseowner.jsp");
          }
else if(val==2){
	request.getSession().setAttribute("cat", cat);
	request.getSession().setAttribute("mail", unm);
	response.sendRedirect("mgrprofile_ho_facilities.jsp");	
   }
%>

</body>
</html>
