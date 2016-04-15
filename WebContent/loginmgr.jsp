<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.iem.ConnectionFactory.ConnectionFact" import="java.sql.*" import="com.iem.DAO.UserManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String mail=request.getParameter("mail");
String pwd=request.getParameter("pwd");
Connection con=ConnectionFact.dbConnect();
// String stquery2="SELECT PWD,CATEGORY FROM PG_USER WHERE USERNAME=?";
//UserManager usr=new UserManager();
String r=UserManager.authenticate(mail, pwd);
if(r.equalsIgnoreCase("HOUSE"))
{
	session.setAttribute("mail",mail);
	response.sendRedirect("manageprofile_houseowner.jsp");
}
else if(r.equalsIgnoreCase("STUDENT"))
{
    session.setAttribute("mail",mail);
	response.sendRedirect("Home.jsp");	
}
else if(r.equalsIgnoreCase("FAILED"))
{
	session.removeAttribute("mail");
	response.sendRedirect("Home.jsp");
}

%>

</body>
</html>