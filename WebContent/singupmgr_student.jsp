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
String address1= request.getParameter("add1");
String address2= request.getParameter("add2");
String dob= request.getParameter("dob");
String clgname= request.getParameter("clgname");
String gender=request.getParameter("user_type");
String address=address1+address2;
//Connection con=ConnectionFact.dbConnect();
String unm=session.getAttribute("mail").toString();
request.getSession().removeAttribute("mail");
int ee=UserManager.register_student(unm, gender, dob, address, clgname);
if(ee==1)
{   
	request.getSession().setAttribute("mail", unm);
	System.out.println("success");
	response.sendRedirect("Home.jsp");
}
else if(ee==2)
{
	request.getSession().setAttribute("mail", unm);
    System.out.println("Renter Details");
    response.sendRedirect("signup_student.jsp");
	
}
// String stquery="UPDATE PG_STUDENT SET GENDER=?,DOB=?,ADDRESS=?,COLLEGE_NAME=? where USERNAME=?";
/* PreparedStatement pst=con.prepareStatement(stquery);
pst.setString(1, gender);
pst.setString(2, dob);
pst.setString(3, address);
pst.setString(4, clgname);
pst.setString(5, unm);
int val2=pst.executeUpdate();
if(val2>0)
{
	request.getSession().setAttribute("mail", unm);
	System.out.println("success");
	response.sendRedirect("Home.jsp");
}
else
{
	request.getSession().setAttribute("mail", unm);
	System.out.println("Renter Details");
	response.sendRedirect("signup_student.jsp");
}
*/

%>
</body>
</html>