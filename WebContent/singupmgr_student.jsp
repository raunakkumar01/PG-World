<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="com.iem.DAO.UserManager" %>
<%-- 
  - Author: Shamik Kundu
  - Description: this page will redirect the student to either homepage or to the same page based upon
                 successful/unsuccessful database entry.
  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String address1= request.getParameter("add1");
String address2= request.getParameter("add2");
String dob= request.getParameter("dob");
String clgname= request.getParameter("clgname");
String gender=request.getParameter("user_type");
String address=address1+address2;
String unm=session.getAttribute("mail").toString();
String cat=session.getAttribute("cat").toString();
request.getSession().removeAttribute("mail");
int ee=UserManager.register_student(unm, gender, dob, address, clgname);
if(ee==1)
{   request.getSession().setAttribute("cat", cat);
	request.getSession().setAttribute("mail", unm);
	System.out.println("success");
	response.sendRedirect("Home.jsp");
}
else if(ee==2)
{
	request.getSession().setAttribute("cat", cat);
	request.getSession().setAttribute("mail", unm);
    System.out.println("Renter Details");
    response.sendRedirect("signup_student.jsp");
	
}

%>
</body>
</html>