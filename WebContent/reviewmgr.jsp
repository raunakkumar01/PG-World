<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.iem.BEAN.PGReview"  import="com.iem.DAO.ReviewManager" import="java.util.ArrayList"%>


 <%-- 
  - Author: Raunak Kumar
  - Description: redirects user to  a page where he can see add details successful/unsuccessful database entry
  --%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String unm= session.getAttribute("mail").toString();
String pgid=(request.getParameter("pgid"));
//System.out.println("kjj"+request.getParameter("pgid"));
String rvw=request.getParameter("rvw");
String rate=request.getParameter("rate");
System.out.println(pgid+" "+unm);
//System.out.println(pgid);
int i=0;
/* if(ReviewManager.checkStudent(unm,pgid))
{
	PGReview pr=new PGReview(pgid,unm,rate,rvw);
	i=PGReview.addReview(pr);//RentalManger.verify(sid, pgid);
}*/
PGReview pr=new PGReview(pgid,unm,rate,rvw);
i=ReviewManager.addPGReview(pr);
//ArrayList<PGReview> alrev=PGReview.getReview(pgid);

//System.out.println("hi"+alrev.get(0).getReview());
//request.getSession().setAttribute("alrv", alrev);
if(i>0){
	request.getSession().setAttribute("rvfail", "success");
	response.sendRedirect("PGDetails.jsp");
}
else{
	request.getSession().setAttribute("rvfail", "fail");
	response.sendRedirect("PGDetails.jsp");
}
%>
</body>
</html>