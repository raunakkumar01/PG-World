<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="com.iem.DAO.PGManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String address= request.getParameter("adrs");
String city= request.getParameter("city");
String pin= request.getParameter("pin");
String lat= request.getParameter("lt");
String lng=request.getParameter("lng");
String unm=session.getAttribute("mail").toString();
String cat=session.getAttribute("cat").toString();
int ww=PGManager.createPG1(unm, address, city, pin, lat, lng);
if (ww==1)
{   request.getSession().setAttribute("cat", cat);
	request.getSession().setAttribute("mail", unm);
	request.getSession().setAttribute("adrs", address);
	response.sendRedirect("mgrprofile_ho_facilities.jsp");
}
else if(ww==0 || ww==10)
{   request.getSession().setAttribute("cat", cat);
	request.getSession().setAttribute("mail", unm);
	response.sendRedirect("mgrprofile_ho_address.jsp");
}
%>
</body>
</html>