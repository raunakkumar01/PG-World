<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>
    <%@ page import="com.iem.BEAN.College"%>
    <%-- 
  - Author: Raunak Kumar
  - Description: redirects admin to  a page where he can see add details successful/unsuccessful database entry
  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String clg= request.getParameter("adrs");
String city= request.getParameter("city");
String pin= request.getParameter("pin");
String lat= request.getParameter("lt");
String lng=request.getParameter("lng");
//String unm=session.getAttribute("mail").toString();
String address=city+" "+pin;

int ww=College.add(clg,address, lat, lng);
if (ww==1)
{ 
	System.out.println("Success");
	request.getSession().setAttribute("clfail", "success");
	response.sendRedirect("addcollege.jsp");
}
else if(ww==0 || ww==10)
{   
	request.getSession().setAttribute("clfail", "fail");
	response.sendRedirect("addcollege.jsp");
}
%>
</body>
</html>