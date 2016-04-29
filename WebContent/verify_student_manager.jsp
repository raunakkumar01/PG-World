<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.iem.DAO.RentalManger" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String sid=request.getParameter("studentid");
String pgid=request.getParameter("pgid");
out.println(sid);
out.println(pgid);
int i=RentalManger.verify(sid, pgid);

System.out.println("ret"+i);

if(i>0){
	request.getSession().setAttribute("vsfail", "success");
	response.sendRedirect("verify_student.jsp");
}
else{
	request.getSession().setAttribute("vsfail", "fail");
	response.sendRedirect("verify_student.jsp");
}
%>
%>

</body>
</html>