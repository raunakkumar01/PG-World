<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="com.iem.DAO.UserManager" %>
<%-- 
  - Author: Shamik Kundu
  - Description: this page will redirect a user to appropriate next page based on his selected option(houseowner/student).
  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name= request.getParameter("user_name");
String contact_number= request.getParameter("number");
String mail= request.getParameter("user_email");
String pwd= request.getParameter("user_password");
String cat=request.getParameter("user_cat");
int rs=UserManager.register_gen(mail, pwd, name, cat, contact_number);
if(rs==0){
	request.getSession().setAttribute("snupfail", "fail");
	response.sendRedirect("SignUp.jsp");
}
else if (rs==1)
{
	request.getSession().setAttribute("cat", cat);
	request.getSession().setAttribute("mail", mail);
	response.sendRedirect("signup_houseowner.jsp");
}
else if (rs==2)
{
	request.getSession().setAttribute("cat", cat);
	request.getSession().setAttribute("mail", mail);
	response.sendRedirect("singup_student.jsp");	
}
%>
</body>
</html>