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
String name= request.getParameter("user_name");
String contact_number= request.getParameter("number");
String mail= request.getParameter("user_email");
String pwd= request.getParameter("user_password");
String cat=request.getParameter("user_cat");
int rs=UserManager.register_gen(mail, pwd, name, cat, contact_number);
if(rs==0)
	response.sendRedirect("Home.jsp");
else if (rs==1)
{
	request.getSession().setAttribute("mail", mail);
	response.sendRedirect("signup_houseowner.jsp");
}
else if (rs==2)
{
	request.getSession().setAttribute("mail", mail);
	response.sendRedirect("singup_student.jsp");	
}
/* Connection con=ConnectionFact.dbConnect();
String stquery="INSERT INTO PG_USER (USERNAME,PWD,NAME,CATEGORY) VALUES(?,?,?,?)";
PreparedStatement pst1=con.prepareStatement(stquery);
pst1.setString(1, mail);
pst1.setString(2, pwd);
pst1.setString(3, name);
pst1.setString(4, cat);
int val=pst1.executeUpdate();
request.getSession().setAttribute("mail", mail);
if(val==0)
	response.sendRedirect("Home.jsp");
if (cat.equals("Houseowner"))
{
String stquery2 = "INSERT INTO PG_HOUSE_OWNER (USERNAME,CONTACT_NO) VALUES (?,?)";
PreparedStatement pst=con.prepareStatement(stquery2);
pst.setString(1, mail);
pst.setString(2, contact_number);
val=pst.executeUpdate();
if(val>0)
	response.sendRedirect("signup_houseowner.jsp");
}
else
{
String stquery2 = "INSERT INTO PG_STUDENT (USERNAME,CONTACT_NO) VALUES (?,?)";
PreparedStatement pst=con.prepareStatement(stquery2);
pst.setString(1, mail);
pst.setString(2, contact_number);
val=pst.executeUpdate();
if(val>0)
	response.sendRedirect("singup_student.jsp");

} */






%>
</body>
</html>