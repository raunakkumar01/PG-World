<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import= "java.util.Collections"    import="com.iem.BEAN.*" import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
 
//int i=Integer.parseInt(request.getParameter("pgref").toString());
int pgid=Integer.parseInt(request.getParameter("pgid").substring(0,request.getParameter("pgid").indexOf(":")));


PG p=PG.getPG(pgid);
System.out.println(p.getPG_FOR());
HouseOwner h=HouseOwner.getHouseOwner(p.getOwnerUnm());
//System.out.println(h.getName());

request.getSession().setAttribute("pgdet", p);
request.getSession().setAttribute("hodet", h);
response.sendRedirect("PGDetails.jsp");


%>
</body>
</html>