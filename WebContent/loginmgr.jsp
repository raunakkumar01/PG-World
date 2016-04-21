<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="com.iem.DAO.UserManager" %>
<%-- 
  - Author: Shamik Kundu
  - Description: redirects houseowner and student to their respective landing pages when they are logged in
  --%>
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

String r=UserManager.authenticate(mail, pwd);

if(r.equalsIgnoreCase("HOUSE"))
{
	session.setAttribute("mail",mail);
	response.sendRedirect("manageprofile_houseowner.jsp");
}
else if(r.equalsIgnoreCase("STUDENT"))
{
	session.setAttribute("cat", "student");
    session.setAttribute("mail",mail);
	response.sendRedirect("Home.jsp");	
	//session.setAttribute("fail","");
}
else if(r.equalsIgnoreCase("FAILED"))
{
	session.setAttribute("fail","fail");
	if (mail.equalsIgnoreCase("ADMIN") && pwd.equalsIgnoreCase("ADMIN"))
	{
		session.setAttribute("mail","ADMIN");
		session.setAttribute("cat","ADMIN");
		//response.sendRedirect("Home.jsp");
		session.setAttribute("fail","");
	}
	//session.removeAttribute("mail");
	
	
	
	response.sendRedirect("Home.jsp");
	
}


%>

</body>
</html>